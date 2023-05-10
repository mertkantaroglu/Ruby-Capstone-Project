require './music/music_album'

describe 'MusicAlbum' do
  let(:album) { MusicAlbum.new(on_spotify: true, can_be_archived: true) }

  context 'testing MusicAlbum class' do
    it 'create the instance of MusicAlbum class' do
      expect(album).to be_an_instance_of(MusicAlbum)
    end

    it 'should return correct spotify status' do
      expect(album.on_spotify).to eql(true)
    end

    it 'should return the correct value for the can_be_archived attribute' do
      expect(album.can_be_archived).to eql(true)
    end
  end
end
