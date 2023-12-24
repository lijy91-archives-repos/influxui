import { Meta, StoryObj } from "@storybook/react";
import { NavigationRail } from "./NavigationRail";

const meta = {
  title: "Widgets/NavigationRail",
  component: NavigationRail,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof NavigationRail>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
