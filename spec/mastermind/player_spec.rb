RSpec.describe Mastermind::Player do
  describe '::default_name' do
    it "returns 'Player'" do
      expect(described_class.default_name).to eq 'Player'
    end
  end

  describe '#name=(string) and #name' do
    let(:player) { described_class.new }

    it 'sets and gets name' do
      expect { player.name = 'Mr. Ed' }.to change(player, :name).to 'Mr. Ed'
    end

    it("has a default name of 'Player'") { expect(player.name).to eq 'Player' }
  end

  describe '#make_code(holes, *pegs)' do
    let(:player) { described_class.new }
    let(:holes) { 6 }
    let(:pegs) { %i[red orange yellow green blue purple] }

    it 'returns an array' do
      expect(player.make_code(holes, *pegs)).to be_an Array
    end

    it 'returns an array with size equal to holes' do
      expect(player.make_code(holes, *pegs).size).to eq holes
    end

    it 'returns an array with items from pegs' do
      10.times { expect(pegs).to include(*player.make_code(holes, *pegs)) }
    end
  end
end
