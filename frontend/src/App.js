import React, { useState } from "react";
import FileUpload from "./components/FileUpload";
import DataTable from "./components/DataTable";

function App() {
  const [data, setData] = useState([]);
  const [subscriptionPrices, setSubscriptionPrices] = useState([]);

  const handleDataUpdate = (newData, newSubscriptionPrices) => {
    setData(newData);
    setSubscriptionPrices(newSubscriptionPrices);
  };

  return (
    <div className="App">
      <h1>Hackathon</h1>
      <FileUpload onDataUpdate={handleDataUpdate} />
      <DataTable data={data} subscriptionPrices={subscriptionPrices} />
    </div>
  );
}

export default App;
