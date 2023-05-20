import React, { useState, useEffect } from "react";

import "./SymbolTable.css";

const SymbolTable = (props) => {
  const [lineCounter, setLineCounter] = useState(0);
  const [tableData, setTableData] = useState([]);

  useEffect(() => {
    // Fetch table data from the backend
    fetchTableData();
  }, []);

  const fetchTableData = async () => {
    try {
      // Make an API call to fetch table data from the backend
      const response = await fetch("/api/symbol-table");
      const data = await response.json();
      
      // Update the table data in the component state
      setTableData(data);
    } catch (error) {
      console.error("Failed to fetch table data from the backend:", error);
    }
  };

  const onStepNextLine = () => {
    setLineCounter(lineCounter + 1);
  };

  return (
    <div className="symbol_table">
      <div className="symbol_table_label">Symbol Table:</div>
      <div className="symbol_table_output">
        <table>
          <thead>
            <tr>
              <th>Identifier</th>
              <th>Type</th>
              <th>Value</th>
            </tr>
          </thead>
          <tbody>
            {tableData.map((row, index) => (
              <tr key={index}>
                <td>{row.identifier}</td>
                <td>{row.type}</td>
                <td>{row.value}</td>
              </tr>
            ))}
          </tbody>
        </table>
        <div className="symbol_table_btnandcounter">
          <button className="symbol_table_button" onClick={onStepNextLine}>
            Step next line
          </button>
          <div className="symbol_table_counter">Line: {lineCounter}</div>
        </div>
      </div>
      <br />
    </div>
  );
};

export default SymbolTable;
