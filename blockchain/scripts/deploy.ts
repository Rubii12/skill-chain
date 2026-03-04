import { network } from "hardhat";

const { viem } = await network.connect();
const contract = await viem.deployContract("SkillChainSBT");
console.log("SkillChainSBT deployed to:", contract.address);