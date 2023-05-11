require './game/game'
require 'date'
RSpec.describe Game do
  subject(:game) { described_class.new(multiplayer, last_played_at, archived_at) }
  let(:multiplayer) { 3 }
  let(:last_played_at) { '2012-04-03' }
  let(:archived_at) { '2012-04-03' }

  describe '#last_played_at' do
    it 'returns the correct value' do
      expect(game.last_played_at).to eq(last_played_at)
    end
  end

  describe '#multiplayer' do
    it 'returns the correct value' do
      expect(game.multiplayer).to eq(multiplayer)
    end
  end

  # describe '#can_be_archived?' do
  #   it 'returns true' do
  #     expect(game.send(:can_be_archived?)).to be_truthy
  #   end
  # end

    describe '#can_be_archived?' do
      it 'returns true' do
        date_string = '2012-04-03'
        date_object = Date.parse(date_string)
        year = date_object.year
  
        game = Game.new(true, Date.new(2000, 1, 1), Date.new(2000, 1, 1))
        expect(game.send(:can_be_archived?)).to be_truthy
      end
    end

  it 'is an instance of Game class' do
    expect(game).to be_instance_of(Game)
  end

  it 'is a kind of Item' do
    expect(game).to be_kind_of(Item)
  end
end