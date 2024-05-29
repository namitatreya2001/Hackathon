const express = require("express");
const csvController = require("../controllers/csvController");

const router = express.Router();

router.post("/upload", csvController.uploadCSV);

module.exports = router;
