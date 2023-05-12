require 'json'

require_relative 'movie/movie'
require_relative 'movie/source'
require_relative 'modules/movie_module'
require_relative 'modules/movie_storage'

require_relative 'modules/book_module'
require_relative 'modules/book_storage'
require_relative 'Book/book'
require_relative 'Book/label'

require_relative 'music/music_album'
require_relative 'music/genre'

class App
  include MovieModule
  include BookLabelModule

  def initialize
    @movie_list = load_movies
    @source_list = load_sources
    @book_list = load_books
    @label_list = load_labels
    @albums = []
    @genres = []
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

  def list_music_albums
    if @albums.empty?
      puts 'Please add a music album'
    else
      @albums.each do |album|
        puts "
          Title: #{album['Title']},
          Publish_date: #{album['Publish_date']},
          Is on spotify?: #{album['Is on spotify?']}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'Please add a music album'
    else
      @genres.each { |genre| puts "Genre: \"#{genre['Genre']}\"" }
    end
  end

  def save_data
    File.write('./data/albums.json', JSON.pretty_generate(@albums))
    File.write('./data/genres.json', JSON.pretty_generate(@genres))
  end

  def read_file(file)
    read_file = File.read(file)
    JSON.parse(read_file)
  end

  def load_data
    @albums = File.exist?('./data/albums.json') ? read_file('./data/albums.json') : []
    @genres = File.exist?('./data/genres.json') ? read_file('./data/genres.json') : []
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

  def add_book
    create_book
  end

  def list_books
    book_list
  end

  def list_labels
    label_list
  end
end
