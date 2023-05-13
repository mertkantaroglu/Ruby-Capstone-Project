require './music/genre'
require './music/music_album'

describe 'genre' do
  before(:each) do
    @genre = Genre.new('Pop')
  end

  context 'testing Genre class' do
    it 'create the instance of Genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end
    it 'should return the length of items' do
      album = MusicAlbum.new(name: 'Ahmad', on_spotify: true, publish_date: 2022)
      @genre.add_item(album)
      expect(@genre.items.length).to eql 1
    end
  end
end
