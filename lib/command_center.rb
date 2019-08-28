require_relative "command_center/coordinate"
require_relative "command_center/direction"
require_relative "command_center/commands"
require_relative "command_center/plateau"
require_relative "command_center/rovers"

# CommandCenter: Manager of rovers
#
module CommandCenter
  def self.move_rovers(input)
    plateau_limits = input.shift
    rovers = Rovers.build_from(input).map(&:move)
    Plateau.with(plateau_limits, rovers).to_s
  end
end
