const express = require("express");
const cors = require("cors");
const fileUpload = require("express-fileupload");
const csvRoutes = require("./routes/csvRoutes");

const app = express();

app.use(cors());
app.use(express.json());
app.use(fileUpload());

app.use("/api/csv", csvRoutes);

module.exports = app;
