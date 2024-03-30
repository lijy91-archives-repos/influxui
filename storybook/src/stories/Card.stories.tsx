import { Meta, StoryObj } from "@storybook/react";
import { Card } from "./Card";

const meta = {
  title: "Widgets/Card",
  component: Card,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    icon: { control: { type: "text" } },
  },
} satisfies Meta<typeof Card>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
