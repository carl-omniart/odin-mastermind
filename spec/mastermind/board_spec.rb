RSpec.describe Mastermind::Board do
  context 'when new' do
    subject(:board) { described_class.new }

    it('has no code') { expect(board.code).to be_nil }
    it('has its shield down') { expect(board.shield).to be :down }
    it('has no guesses') { expect(board.guesses).to be_empty }
    it('is not over') { expect(board.game_over?).to be false }
  end

  context 'when code is set' do
    subject(:board) { described_class.new.set_code [1, 2, 3] }

    it('hides the code') { expect(board.code).to be_nil }
    it('raises its shield') { expect(board.shield).to be :up }
    it('has no guesses') { expect(board.guesses).to be_empty }
    it('is not over') { expect(board.game_over?).to be false }
  end

  context 'when an incorrect guess is made' do
    subject(:board) { described_class.new.set_code([1, 2, 3]).guess_code [2, 3, 4] }

    it('hides the code') { expect(board.code).to be_nil }
    it('keeps its shield up') { expect(board.shield).to be :up }
    it('records the guess') { expect(board.guesses.size).to eq 1 }
    it('is not over') { expect(board.game_over?).to be false }
  end

  context 'when a correct guess is made' do
    subject(:board) { described_class.new.set_code([1, 2, 3]).guess_code [1, 2, 3] }

    it('shows the code') { expect(board.code).to eq [1, 2, 3] }
    it('lowers its shield') { expect(board.shield).to be :down }
    it('records the guess') { expect(board.guesses.size).to eq 1 }
    it('is over') { expect(board.game_over?).to be true }
  end

  context 'when the code breaker runs out of guesses' do
    subject(:board) do
      board = described_class.new.set_code [1, 2, 3]
      1.upto(board.max_guesses) { board.guess_code [2, 3, 4] }
      board
    end

    it('shows the code') { expect(board.code).to eq [1, 2, 3] }
    it('lowers its shield') { expect(board.shield).to be :down }
    it('is over') { expect(board.game_over?).to be true }
  end
end
