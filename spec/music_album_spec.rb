require './music/music_album'

describe 'MusicAlbum' do
  let(:album) { MusicAlbum.new(name: 'James', on_spotify: true, publish_date: 2022) }

  context 'testing MusicAlbum class' do
    it 'create the instance of MusicAlbum class' do
      expect(album).to be_an_instance_of(MusicAlbum)
    end

    it 'should return correct name' do
      expect(album.name).to eql('James')
    end

    it 'should return correct spotify status' do
      expect(album.on_spotify).to eql(true)
    end

    it 'should return the correct date for publish date' do
      expect(album.publish_date).to eql(2022)
    end
  end
end
