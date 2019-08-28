module CommandCenter
  module Rovers
    def self.build_from(input)
      input.each_slice(2).map { |rover_input| Rover.for(rover_input) }
    end

    class Rover
      def self.for(input)
        direction = Direction.for(input.first)
        commands = Commands.for(input.last)
        new(
          direction: direction,
          commands: commands
        )
      end

      def initialize(direction:, commands:)
        @commands = commands
        @direction = direction
      end

      def move
        with(new_direction: commands.reduce(direction) do |attrs, cmd|
          attrs = cmd.call(attrs)
          attrs
        end)
      end

      def with(new_direction:)
        self.class.new(direction: new_direction, commands: commands)
      end

      def to_s
        direction.to_s
      end

      def coordinate
        direction.coordinate
      end

      private

      attr_reader :commands, :direction
    end
  end
end
