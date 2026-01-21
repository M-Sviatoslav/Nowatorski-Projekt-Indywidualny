const request = require("supertest");
const express = require("express");

const app = express();
app.get("/", (req, res) => {
  res.json({ message: "Small API is working 🚀" });
});

describe("GET /", () => {
  it("returns API message", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBeDefined();
  });
});
