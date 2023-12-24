import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface LoaderProps {
}

export const Loader = (props: LoaderProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
