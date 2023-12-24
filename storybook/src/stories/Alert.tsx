import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface AlertProps {
}

export const Alert = (props: AlertProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
