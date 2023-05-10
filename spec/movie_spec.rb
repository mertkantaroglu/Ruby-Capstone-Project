require 'date'
require_relative '../movie/movie'

describe Movie do
  describe '#initialize' do
    movie = Movie.new(true, '2020, 02, 02')
    it 'sets the attributes correctly' do
      expect(movie.silent).to eql true
      expect(movie.publish_date).to eql '2020, 02, 02'
    end
  end
end
