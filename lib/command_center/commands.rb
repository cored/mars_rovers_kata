require_relative "commands/move"
require_relative "commands/right"
require_relative "commands/left"

module CommandCenter
  # Commands: Factory of commands
  #
  module Commands
    COMMANDS = {
      "L" => L,
      "R" => R,
      "M" => M,
    }

    NoCommand = Struct.new(:direction, keyword_init: true) do
      def self.call(direction)
        direction
      end
    end

    # Builds commands
    #
    # input - List of commands
    #
    # Returns [Commands::Command]
    def self.for(input)
      input.chars.map do |cmd|
        COMMANDS.fetch(cmd, NoCommand)
      end
    end
  end
end
