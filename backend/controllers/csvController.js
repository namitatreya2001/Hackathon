const csvService = require("../services/csvService");

exports.uploadCSV = async (req, res) => {
  try {
    if (!req.files || !req.files.csvFile) {
      return res.status(400).json({ message: "No file uploaded" });
    }

    const csvFile = req.files.csvFile;
    const result = await csvService.processCSV(csvFile);
    res.status(200).json(result);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
