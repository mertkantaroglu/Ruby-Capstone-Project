require './game/game'
require 'date'
require 'time'

RSpec.describe Game do
  subject(:game) { described_class.new(name, last_played_at, publish_date, multiplayer) }
  let(:name) { 'Lugard' }
  let(:last_played_at) { '2012-04-03' }
  let(:publish_date) { '2021-01-01' }
  let(:multiplayer) { true }

  describe '#last_played_at' do
    it 'returns the last played date' do
      expect(game.last_played_at).to eq(last_played_at)
    end
  end

  describe '#multiplayer' do
    it 'returns the multiplayer status' do
      expect(game.multiplayer).to eq(multiplayer)
    end
  end

  describe '#can_be_archived?' do
    it 'returns false when the game cannot be archived' do
      last_played_at = Time.now - (1 * 365 * 24 * 60 * 60)
      game = Game.new('Lugard', true, last_played_at, Time.parse('2021-01-01'))

      expect(game.can_be_archived?).to eq(false)
    end
  end

  it 'is an instance of Game class' do
    expect(game).to be_instance_of(Game)
  end

  it 'is a kind of Item' do
    expect(game).to be_kind_of(Item)
  end
end
