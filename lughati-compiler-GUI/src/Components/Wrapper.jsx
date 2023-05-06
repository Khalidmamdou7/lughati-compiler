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

  const onCompileHandler = (e) => {
    console.log("here");
    const blob = new Blob([textFieldValue], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.download = "test.txt";
    link.href = url;
    link.click();

    axios
      .get("http://localhost:8000", {
        params: {
          cmd: "./merge",
          cmd_2: "rm test.txt",
        },
      })
      .then(function (response) {
        setOutput(response);
      })
      .catch(function (error) {
        console.log(error);
      });
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
