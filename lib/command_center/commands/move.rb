module CommandCenter
  module Commands
    class M
      MOVEMENTS = {
        "N" => [0, 1],
        "S" => [0, -1],
        "W" => [-1, 0],
        "E" => [1, 0],
      }

      def self.call(direction)
        new_coordinate = direction.coordinate
          .with(MOVEMENTS[direction.orientation])
        new(direction: direction, new_coordinate: new_coordinate).call
      end

      def initialize(direction:, new_coordinate:)
        @new_coordinate = new_coordinate
        @direction = direction
      end

      def call
        direction.with(new_coordinate: new_coordinate)
      end

      private

      attr_reader :new_coordinate, :direction
    end
  end
end
