import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface ButtonProps {
}

export const Button = (props: ButtonProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
