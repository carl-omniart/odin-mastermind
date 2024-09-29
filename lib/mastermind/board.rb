module Mastermind
  class Board
    def initialize
      @code        = nil
      @shield      = :down
      @guesses     = []
      @max_guesses = 10
    end

    attr_accessor :max_guesses

    attr_reader :shield, :guesses

    def code
      return @code if shield == :down

      nil
    end

    def code?
      !!@code
    end

    def game_over?
      (code? && @code == guesses.last) || guesses.size == max_guesses
    end

    def set_code(code)
      @code   = code
      @shield = :up
      self
    end

    def guess_code(guess)
      return self if guesses.size == max_guesses

      guesses << guess
      @shield = :down if game_over?
      self
    end
  end
end
