require "spec_helper"

describe CommandCenter::Commands::R do
  subject(:right) { described_class }

  let(:coordinate) { CommandCenter::Coordinate.new(x: 5, y: 5) }
  let(:direction) do
    CommandCenter::Direction.new(coordinate: coordinate,
                                 orientation: orientation)
  end

  describe "#call" do
    context "when orientation is N" do
      let(:orientation) { "N" }

      it { expect(right.call(direction).to_s).to eql "5 5 E" }
    end

    context "when orientation is S" do
      let(:orientation) { "S" }

      it { expect(right.call(direction).to_s).to eql "5 5 W" }
    end

    context "when orientation is W" do
      let(:orientation) { "W" }

      it { expect(right.call(direction).to_s).to eql "5 5 N" }
    end

    context "when orientation is E" do
      let(:orientation) { "E" }

      it { expect(right.call(direction).to_s).to eql "5 5 S" }
    end
  end
end
