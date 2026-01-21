const express = require("express");
const app = express();

app.use(express.json());

// Simple GET endpoint
app.get("/", (req, res) => {
  res.json({ message: "Small API is working 🚀" });
});

// Simple POST endpoint
app.post("/echo", (req, res) => {
  res.json({
    received: req.body,
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`API running on http://localhost:${PORT}`);
});
