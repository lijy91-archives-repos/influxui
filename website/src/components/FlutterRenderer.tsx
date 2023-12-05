import React from "react";

export interface FlutterRendererProps {
  storyId: string;
  storyArgs?: Record<string, any>;
}

const FlutterRenderer = (props: FlutterRendererProps): React.ReactElement => {
  const { storyId } = props;
  const iframeRef = React.useRef<HTMLIFrameElement>(null);
  const url = `https://rise-ui-gallery.vercel.app/storypreview?id=${storyId}`;
  return (
    <iframe
      title="flutter-app-embed"
      src={url}
      ref={iframeRef}
      style={{ border: "0", width: "100vw", height: "100vh" }}
      scrolling="no"
      id="flutter-app-iframe"
    />
  );
};

FlutterRenderer.displayName = "FlutterRenderer";
export default FlutterRenderer;
