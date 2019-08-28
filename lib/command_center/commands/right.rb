module CommandCenter
  module Commands
    class R
      ROTATION = {
        "N" => "E",
        "E" => "S",
        "S" => "W",
        "W" => "N",
      }

      def self.call(direction)
        new_orientation = ROTATION[direction.orientation]
        new(direction: direction, new_orientation: new_orientation).call
      end

      def initialize(direction:, new_orientation:)
        @new_orientation = new_orientation
        @direction = direction
      end

      def call
        direction.with(new_orientation: new_orientation)
      end

      private

      attr_reader :new_orientation, :direction
    end
  end
end
