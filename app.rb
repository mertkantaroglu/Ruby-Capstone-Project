require_relative 'movie/movie'
require_relative 'movie/source'
require_relative 'modules/movie_module'

class App
  include MovieModule

  def initialize
    @movie_list = load_movies
    @source_list = load_sources
  end

  def add_movie
    create_movie
  end

  def list_movies
    movie_list
  end

  def list_sources
    source_list
  end
end