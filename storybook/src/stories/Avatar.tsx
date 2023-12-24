import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface AvatarProps {
}

export const Avatar = (props: AvatarProps) => {
  return (
    <FlutterRenderer {...props} />
  );
};
