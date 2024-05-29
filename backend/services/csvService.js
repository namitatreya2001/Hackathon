const fs = require("fs");
const path = require("path");
const csv = require("csv-parser");
const config = require("../config");
const calculateSubscriptionPrice = require("../utils/calculateSubscriptionPrice");

exports.processCSV = (csvFile) => {
  return new Promise((resolve, reject) => {
    const uploadPath = path.join(
      __dirname,
      "../../",
      config.uploadDir,
      csvFile.name
    );

    csvFile.mv(uploadPath, (err) => {
      if (err) {
        return reject(err);
      }

      const results = [];

      fs.createReadStream(uploadPath)
        .pipe(csv())
        .on("data", (data) => results.push(data))
        .on("end", () => {
          const subscriptionPrices = results.map(calculateSubscriptionPrice);
          resolve({ data: results, subscriptionPrices });
        })
        .on("error", (error) => reject(error));
    });
  });
};
