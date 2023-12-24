import { Meta, StoryObj } from "@storybook/react";
import { CloseButton } from "./CloseButton";

const meta = {
  title: "Widgets/CloseButton",
  component: CloseButton,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof CloseButton>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
