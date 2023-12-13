import { Meta, StoryObj } from "@storybook/react";
import { Box } from "./Box";

const meta = {
  title: "Widgets/Box",
  component: Box,
  parameters: {
    layout: "centered",
  },
  argTypes: {},
} satisfies Meta<typeof Box>;

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

export const With_Variant: Story = {
  args: {},
};
