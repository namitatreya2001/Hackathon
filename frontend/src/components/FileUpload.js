import React, { useState } from "react";
import axios from "axios";

const FileUpload = ({ onDataUpdate }) => {
  const [file, setFile] = useState(null);

  const handleFileChange = (event) => {
    setFile(event.target.files[0]);
  };

  const handleUpload = async () => {
    if (!file) {
      alert("Please select a file first!");
      return;
    }

    const formData = new FormData();
    formData.append("csvFile", file);

    try {
      const response = await axios.post(
        "http://localhost:5000/api/csv/upload",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );
      onDataUpdate(response.data.data, response.data.subscriptionPrices);
    } catch (error) {
      console.error("Error uploading the file:", error);
    }
  };

  return (
    <div className="file-upload">
      <label className="custom-file-upload">
        <input type="file" accept=".csv" onChange={handleFileChange} />
        Choose File
      </label>
      {file && <span className="file-name">{file.name}</span>}
      <button className="upload-button" onClick={handleUpload}>
        Upload
      </button>
    </div>
  );
};

export default FileUpload;
