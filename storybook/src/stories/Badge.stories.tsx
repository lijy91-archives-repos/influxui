import { Meta, StoryObj } from "@storybook/react";
import { Badge } from "./Badge";

const meta = {
  title: "Widgets/Badge",
  component: Badge,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    label: { control: { type: "text" } },
  },
} satisfies Meta<typeof Badge>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
