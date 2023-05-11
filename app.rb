require_relative 'movie/movie'
require_relative 'movie/source'
require_relative 'modules/movie_module'
require_relative 'modules/movie_storage'
require_relative 'modules/book_module'
require_relative 'modules/book_storage'


class App
  include MovieModule

  def initialize
    @movie_list = load_movies
    @source_list = load_sources
  end

  def run
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all movies'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a game'
    puts '12 - Add a movie'
    puts '0 - Exit'
  end

  OPTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_movies,
    5 => :list_genres,
    6 => :list_labels,
    7 => :list_authors,
    8 => :list_sources,
    9 => :add_book,
    10 => :add_music_album,
    11 => :add_game,
    12 => :add_movie,
    0 => :exit
  }.freeze

  def option(option)
    method_name = OPTIONS[option]
    send(method_name) if method_name
    puts 'Invalid option, please type correct number!' unless method_name
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
