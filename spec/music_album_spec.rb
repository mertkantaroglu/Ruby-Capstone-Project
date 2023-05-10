require './music/music_album.rb'

describe 'MusicAlbum' do
  before(:each) do
    @album = MusicAlbum.new(on_spotify: true, can_be_archived: true)
  end

  context 'testing MusicAlbum class' do
    it 'create the instance of MusicAlbum class' do
      expect(@album).to be_an_instance_of(MusicAlbum)
    end

    it 'should return correct spotify status' do
      expect(@album.on_spotify).to eql(true)
    end

    it 'should return the correct date' do
      expect(@album.can_be_archived).to eql(true)
    end
  end
end