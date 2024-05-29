import React from "react";

const DataTable = ({ data, subscriptionPrices }) => {
  if (data.length === 0) return <div>No data available</div>;

  return (
    <table border="1">
      <thead>
        <tr>
          {Object.keys(data[0]).map((key) => (
            <th key={key}>{key}</th>
          ))}
          <th>Subscription Price</th>
        </tr>
      </thead>
      <tbody>
        {data.map((row, index) => (
          <tr key={index}>
            {Object.values(row).map((value, idx) => (
              <td key={idx}>{value}</td>
            ))}
            <td>{subscriptionPrices[index].subscriptionPrice}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default DataTable;
