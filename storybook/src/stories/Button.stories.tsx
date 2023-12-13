import { Meta, StoryObj } from "@storybook/react";
import { Button } from "./Button";

const meta = {
  title: "Widgets/Button",
  component: Button,
  parameters: {
    layout: "centered",
  },
  argTypes: {},
} satisfies Meta<typeof Button>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};

export const With_Size: Story = {
  args: {},
};

export const With_Color: Story = {
  args: {},
};
