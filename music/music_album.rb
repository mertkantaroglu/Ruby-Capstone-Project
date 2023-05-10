require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :can_be_archived

  def initialize(on_spotify, can_be_archived)
    super(on_spotify)
    @on_spotify = on_spotify
    @can_be_archived = can_be_archived
  end

  private

  def can_be_archived?
    super || (@on_spotify == true && @can_be_archived == true)
  end
end
