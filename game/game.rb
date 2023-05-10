require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.iso8601(last_played_at)
  end

  def can_be_archived?
    super || @last_played_at < 2.years.ago
  end
end
