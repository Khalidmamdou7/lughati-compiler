import "./input_field.css";
import { useState, useRef } from "react";

const InputField = (props) => {
  const [textFieldValue, setTextFieldValue] = useState("");
  const textareaRef = useRef(null);
  const lineNumbersRef = useRef(null);

  const InputChangeHandler = (e) => {
    props.onChange(e.target.value);
  };

  const handleTextareaScroll = () => {
    lineNumbersRef.current.scrollTop = textareaRef.current.scrollTop;
  };

  const renderLineNumbers = () => {
    return textFieldValue.split("\n").map((_, index) => (
      <div key={index + 1} className="line-number">
        {index + 1}
      </div>
    ));
  };

  return (
    <div className="input-field">
      <div className="line-numbers-column" ref={lineNumbersRef}>
        {renderLineNumbers()}
      </div>
      <textarea
        rows="30"
        cols="40"
        className="textarea"
        value={textFieldValue}
        onChange={InputChangeHandler}
        onInput={(e) => setTextFieldValue(e.target.value)}
        onScroll={handleTextareaScroll}
        ref={textareaRef}
      ></textarea>
    </div>
  );
};

export default InputField;
