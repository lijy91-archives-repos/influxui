import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface MenuProps {
}

export const Menu = (props: MenuProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
