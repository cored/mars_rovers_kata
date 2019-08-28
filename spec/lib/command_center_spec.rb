require_relative "../../lib/command_center"
require "spec_helper"

describe CommandCenter do
  describe "#move_rovers" do
    it "returns the final position for both rovers" do
      expect(
        CommandCenter.move_rovers(["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"])
      ).to match(["1 3 N", "5 1 E"])
    end

    it "returns an error when movement is beyond the boundaries of the plateu" do
      expect {
        CommandCenter.move_rovers(["1 1", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"])
      }.to raise_error(CommandCenter::Plateau::OutOfBound)
    end
  end
end
