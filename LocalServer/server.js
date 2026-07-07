const fs = require("fs");
const https = require("https");
const express = require("express");

const app = express();

const PORT = 3000;

// Load SSL certificate and private key
const options = {
    key: fs.readFileSync("./certificates/server.key"),
    cert: fs.readFileSync("./certificates/server.crt")
};

// Home endpoint
app.get("/", (req, res) => {
    res.send("🔐 Network Security Demo - HTTPS Server");
});

// User endpoint
app.get("/user", (req, res) => {
    res.json({
        id: 1,
        name: "Rushikesh",
        balance: 25000,
        message: "SSL Pinning Demo"
    });
});

// Create HTTPS server
https.createServer(options, app).listen(PORT, () => {
    console.log(`HTTPS Server running at https://localhost:${PORT}`);
});