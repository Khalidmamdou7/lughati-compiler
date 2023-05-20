import "./wrapper.css";
import OptionsBar from "./OptionsBar";
import InputField from "./InputField";
import ErrorPanel from "./ErrorPanel";
import SymbolTable from "./SymbolTable";
import { useState } from "react";
import axios from "axios";

const Wrapper = () => {
  const [textFieldValue, setTextFieldValue] = useState("");
  const [output, setOutput] = useState("");
  const [tohighlight, setToHighlight] = useState(-1);
  const [fetchAgain, setFetchAgain] = useState(false);

  const InputChangeHandler = (e) => {
    setTextFieldValue(e);
  };

  const onClearHandler = () => {
    setTextFieldValue("");
    setOutput("");
    setToHighlight(-1);
  };

  const onCompileHandler = async (e) => {
    // Add the text to the requestBody with the key 'inputString'
    setFetchAgain(!fetchAgain);
    const requestBody = {
      inputString: textFieldValue,
    };
    let api_host = process.env.API_HOST || "localhost:8000";
    const res = await axios.post(`http://${api_host}/parse`, requestBody);
    console.log(res.data.error[0]);
    //This means it's a real error becase it begins with "e" for encounterd
    if (res.data.error[0] == "e") {
      setOutput(res.data.data + res.data.error);
      // if the element before the last element is a number between 0 to 9, then it's a line number
      if (
        res.data.error[res.data.error.length - 4] >= "0" &&
        res.data.error[res.data.error.length - 4] <= "9"
      ) {
        setToHighlight(res.data.error[res.data.error.length - 4] + res.data.error[res.data.error.length - 3]);
      } else {
        setToHighlight(res.data.error[res.data.error.length - 3]);
      }
    } else {
      setOutput(res.data.data);
      setToHighlight(-1);
    }
  };

  return (
    <div className="wrapper">
      <OptionsBar onCompile={onCompileHandler} onClear={onClearHandler} />
      <InputField
        onChange={InputChangeHandler}
        textFieldValue={textFieldValue}
        highlight={tohighlight}
      />
      <ErrorPanel parseOutput={output} />
      <SymbolTable 
        fetchAgain={fetchAgain}
      />
    </div>
  );
};

export default Wrapper;
