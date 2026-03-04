// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SkillChain Soulbound Token (SBT)
 * @notice Issues non-transferable skill badges anchored to verified GitHub work.
 * @dev Soulbound = no transfer, no approval. Once minted, permanent.
 */
contract SkillChainSBT {

    struct SkillBadge {
        address owner;
        string studentId;
        string repoName;
        uint8  compositeScore;
        string verificationHash;
        uint256 timestamp;
        bool    aiDetected;
    }

    uint256 private _tokenIdCounter;
    mapping(uint256 => SkillBadge) public badges;
    mapping(address => uint256[]) public studentBadges;

    address public owner;

    event BadgeMinted(
        uint256 indexed tokenId,
        address indexed student,
        string repoName,
        uint8 score,
        string verificationHash
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Mint a Soulbound skill badge. Called by the SkillChain backend
     *         after AI analysis is complete.
     */
    function mintSkillBadge(
        address student,
        string calldata studentId,
        string calldata repoName,
        uint8 compositeScore,
        string calldata verificationHash,
        bool aiDetected
    ) external onlyOwner returns (uint256) {
        require(!aiDetected, "AI-generated code detected: badge denied");
        require(compositeScore <= 100, "Invalid score");

        uint256 tokenId = ++_tokenIdCounter;

        badges[tokenId] = SkillBadge({
            owner:            student,
            studentId:        studentId,
            repoName:         repoName,
            compositeScore:   compositeScore,
            verificationHash: verificationHash,
            timestamp:        block.timestamp,
            aiDetected:       aiDetected
        });

        studentBadges[student].push(tokenId);

        emit BadgeMinted(tokenId, student, repoName, compositeScore, verificationHash);
        return tokenId;
    }

    /**
     * @notice Verify a skill claim by hash. Used by recruiters.
     */
    function verifyByHash(string calldata verificationHash)
        external view returns (SkillBadge memory)
    {
        for (uint256 i = 1; i <= _tokenIdCounter; i++) {
            if (keccak256(bytes(badges[i].verificationHash)) ==
                keccak256(bytes(verificationHash))) {
                return badges[i];
            }
        }
        revert("Hash not found on chain");
    }

    /// @dev Soulbound: block all transfers
    function transfer(address, uint256) external pure {
        revert("Soulbound: non-transferable");
    }

    function getBadgeCount() external view returns (uint256) {
        return _tokenIdCounter;
    }
}
