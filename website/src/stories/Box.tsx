import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface BoxProps {}

export const Box = (props: BoxProps) => {
  return <FlutterRenderer storyId="widgets-box--default" />;
};
