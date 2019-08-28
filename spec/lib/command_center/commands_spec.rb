require "spec_helper"

describe CommandCenter::Commands do
  subject(:commands) { described_class }

  let(:direction) { CommandCenter::Direction.for("1 1 E") }

  describe ".for" do
    context "when a command does not exist" do
      it "does not raise error" do
        expect(commands.for("U").first.call(direction)).to eql direction
      end
    end
  end
end
