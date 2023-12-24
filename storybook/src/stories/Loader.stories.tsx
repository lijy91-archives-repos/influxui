import { Meta, StoryObj } from "@storybook/react";
import { Loader } from "./Loader";

const meta = {
  title: "Widgets/Loader",
  component: Loader,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof Loader>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
