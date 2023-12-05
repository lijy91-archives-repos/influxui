import type { Meta, StoryObj } from "@storybook/react";

import { ActionIcon } from "./ActionIcon";

const meta = {
  title: "Widgets/ActionIcon",
  component: ActionIcon,
  parameters: {
    layout: "centered",
  },
  tags: ["autodocs"],
  argTypes: {
    backgroundColor: { control: "color" },
  },
} satisfies Meta<typeof ActionIcon>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Primary: Story = {
  args: {
    primary: true,
    label: "ActionIcon",
  },
};

export const Secondary: Story = {
  args: {
    label: "ActionIcon",
  },
};

export const Large: Story = {
  args: {
    size: "large",
    label: "ActionIcon",
  },
};

export const Small: Story = {
  args: {
    size: "small",
    label: "ActionIcon",
  },
};
