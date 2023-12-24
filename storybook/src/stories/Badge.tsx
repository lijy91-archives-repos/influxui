import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface BadgeProps {
}

export const Badge = (props: BadgeProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
