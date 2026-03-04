/**
 * SkillChain — Node.js / Express User Management API
 */
const express = require('express');
const cors    = require('cors');
const app     = express();

app.use(cors());
app.use(express.json());

// ---- Mock data store (replace with MongoDB) ----
const students = [
  { id: 'rubika-a',   name: 'Rubika A',   score: 87, sbt: 3, verified: true },
  { id: 'niranjan-s', name: 'Niranjan S', score: 84, sbt: 2, verified: true },
  { id: 'jitendar-s', name: 'Jitendar S', score: 80, sbt: 1, verified: true },
];

// ---- Routes ----

/** GET /api/students — list all verified students */
app.get('/api/students', (req, res) => {
  const { stack, minScore } = req.query;
  let result = students.filter(s => s.verified);
  if (minScore) result = result.filter(s => s.score >= Number(minScore));
  res.json(result);
});

/** GET /api/students/:id — single student profile */
app.get('/api/students/:id', (req, res) => {
  const s = students.find(s => s.id === req.params.id);
  if (!s) return res.status(404).json({ error: 'Student not found' });
  res.json(s);
});

/** POST /api/analyze — trigger AI analysis via FastAPI */
app.post('/api/analyze', async (req, res) => {
  const { githubUrl, studentId } = req.body;
  if (!githubUrl || !studentId)
    return res.status(400).json({ error: 'githubUrl and studentId required' });

  // Forward to FastAPI engine
  try {
    const response = await fetch('http://localhost:8000/analyze', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ github_url: githubUrl, student_id: studentId }),
    });
    const data = await response.json();
    res.json(data);
  } catch (err) {
    res.status(503).json({ error: 'AI engine unavailable', detail: err.message });
  }
});

/** GET /api/verify/:hash — verify a skill claim by hash */
app.get('/api/verify/:hash', (req, res) => {
  // TODO: query blockchain via Ethers.js
  res.json({
    verified: true,
    studentId: 'rubika-a',
    repo: 'mern-ecommerce',
    score: 87,
    timestamp: '2026-03-02T14:22:08Z',
    block: 22041337,
  });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`SkillChain API running on port ${PORT}`));
