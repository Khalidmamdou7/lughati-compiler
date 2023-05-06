import "./wrapper.css";
import OptionsBar from "./OptionsBar";
import InputField from "./InputField";
import ErrorPanel from "./ErrorPanel";
import { useState } from "react";
import axios from 'axios';


const Wrapper = () => {
const [textFieldValue, setTextFieldValue] = useState("");
const [output, setOutput] = useState("");


  const InputChangeHandler = (e) => {
    setTextFieldValue(e);
  };

  const onCompileHandler = async (e) => {
    // Add the text to the requestBody with the key 'inputString'
    const requestBody = {
      inputString: textFieldValue,
    };
    let api_host = process.env.API_HOST || "localhost:8000";
    const res = await axios.post(`http://${api_host}/parse`, requestBody);
    console.log(res);
    setOutput(res.data);
  }

  return (
    <div className="wrapper">
      <OptionsBar onCompile={onCompileHandler}/>
      <InputField onChange={InputChangeHandler} />
      <ErrorPanel parseOutput ={output} />
    </div>
  );
};

export default Wrapper;
