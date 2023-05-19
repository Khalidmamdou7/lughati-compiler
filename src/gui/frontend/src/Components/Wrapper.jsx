import "./wrapper.css";
import OptionsBar from "./OptionsBar";
import InputField from "./InputField";
import ErrorPanel from "./ErrorPanel";
import { useState } from "react";
import axios from "axios";

const Wrapper = () => {
  const [textFieldValue, setTextFieldValue] = useState("");
  const [output, setOutput] = useState("");

  const InputChangeHandler = (e) => {
    setTextFieldValue(e);
  };

  const onClearHandler = () => {
    setTextFieldValue("");
    setOutput("");
  };

  const onCompileHandler = async (e) => {
    // Add the text to the requestBody with the key 'inputString'
    const requestBody = {
      inputString: textFieldValue,
    };
    let api_host = process.env.API_HOST || "localhost:8000";
    const res = await axios.post(`http://${api_host}/parse`, requestBody);
    console.log(res.data.error[0]);
    //This means it's a real error becase it begins with "e" for encounterd
    if (res.data.error[0] == "e") setOutput(res.data.data + res.data.error);
    else setOutput(res.data.data);
  };

  return (
    <div className="wrapper">
      <OptionsBar onCompile={onCompileHandler} onClear={onClearHandler}/>
      <InputField onChange={InputChangeHandler} textFieldValue={textFieldValue} />
      <ErrorPanel parseOutput={output} />
    </div>
  );
};

export default Wrapper;
