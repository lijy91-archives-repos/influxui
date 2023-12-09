import { Meta, StoryObj } from "@storybook/react";
import { Kbd } from "./Kbd";

const meta = {
  title: "Widgets/Kbd",
  component: Kbd,
  parameters: {
    layout: "centered",
  },
  tags: ["autodocs"],
  argTypes: {},
} satisfies Meta<typeof Kbd>;

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
