require 'date'
require_relative '../movie/movie'

describe Movie do
  describe '#initialize' do
    movie = Movie.new('Matrix', '2020, 02, 02', true)
    it 'sets the attributes correctly' do
      expect(movie.silent).to eql true
      expect(movie.publish_date).to eql '2020, 02, 02'
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when the movie is silent or released more than 10 years ago' do
      movie_silent = Movie.new('Inception', Date.new(2000, 1, 1), true)
      expect(movie_silent.can_be_archived?).to eq(true)
    end

    it 'returns false when the movie is not silent or not released more than 10 years ago' do
      movie_non_silent = Movie.new('Inception', Date.new(2020, 1, 1), false)
      expect(movie_non_silent.can_be_archived?).to eq(false)
    end
  end
end
