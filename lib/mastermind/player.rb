module Mastermind
  # Mastermind::Player is the parent class to various code makers and breakers.
  class Player
    class << self
      def default_name
        name.split('::').last.gsub(/([^A-Z])([A-Z])/, '\1 \2')
      end
    end

    def initialize
      @name = self.class.default_name
    end

    attr_accessor :name

    def make_code holes, *pegs
      Array.new(holes) { pegs.sample }
    end
  end
end
