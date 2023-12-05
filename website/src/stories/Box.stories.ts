import type { Meta, StoryObj } from "@storybook/react";

import { Box } from "./Box";

const meta = {
  title: "Widgets/Box",
  component: Box,
  parameters: {
    layout: "centered",
  },
  tags: ["autodocs"],
  argTypes: {
    backgroundColor: { control: "color" },
  },
} satisfies Meta<typeof Box>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Primary: Story = {
  args: {
    primary: true,
    label: "Box",
  },
};

export const Secondary: Story = {
  args: {
    label: "Box",
  },
};

export const Large: Story = {
  args: {
    size: "large",
    label: "Box",
  },
};

export const Small: Story = {
  args: {
    size: "small",
    label: "Box",
  },
};
