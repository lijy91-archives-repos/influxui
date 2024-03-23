import { Meta, StoryObj } from "@storybook/react";
import { IconButton } from "./IconButton";

const meta = {
  title: "Widgets/IconButton",
  component: IconButton,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    icon: { control: { type: "text" } },
  },
} satisfies Meta<typeof IconButton>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};

export const With_Variant: Story = {
  args: {},
};

export const With_Size: Story = {
  args: {},
};

export const With_Color: Story = {
  args: {},
};
