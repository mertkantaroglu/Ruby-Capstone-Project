require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, can_be_archived)
    super(on_spotify)
    @on_spotify = on_spotify
    @can_be_archived = can_be_archived
  end
end