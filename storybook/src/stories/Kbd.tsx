import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface KbdProps {
}

export const Kbd = (props: KbdProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
