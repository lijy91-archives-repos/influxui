import { Meta, StoryObj } from "@storybook/react";
import { Avatar } from "./Avatar";

const meta = {
  title: "Widgets/Avatar",
  component: Avatar,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof Avatar>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
