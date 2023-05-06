import "./input_field.css";
import { useState } from "react";

const InputField = (props) => {
  const [textFieldValue, setTextFieldValue] = useState("");
  
  const InputChangeHandler=(e)=> {
    props.onChange(e.target.value);
  }

  return (
      <textarea rows="30" cols="40" className="textarea" onChange={InputChangeHandler}></textarea>
  )
};

export default InputField;
