import { Meta, StoryObj } from "@storybook/react";
import { ActionIcon } from "./ActionIcon";

const meta = {
  title: "Widgets/ActionIcon",
  component: ActionIcon,
  parameters: {
    layout: "centered",
  },
  argTypes: {},
} satisfies Meta<typeof ActionIcon>;

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
