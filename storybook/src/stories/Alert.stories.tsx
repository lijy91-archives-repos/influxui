import { Meta, StoryObj } from "@storybook/react";
import { Alert } from "./Alert";

const meta = {
  title: "Widgets/Alert",
  component: Alert,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    title: { control: { type: "text" } },
  },
} satisfies Meta<typeof Alert>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
