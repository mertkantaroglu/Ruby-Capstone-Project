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

  def add_music_album
    puts 'Album title: '
    name = gets.chomp.to_s
    puts 'Publish date: '
    date = gets.chomp.to_s
    puts 'Genre: '
    genre_name = gets.chomp.to_s
    puts 'Is on spotify? [Y/N]: '
    answer = gets.chomp
    on_spotify = true if %w[Y y].include?(answer)
    on_spotify = false if %w[N n].include?(answer)
    puts 'New Music Album created! '
    album = MusicAlbum.new(name: name, on_spotify: on_spotify, publish_date: date)
    genre = Genre.new(genre_name)
    genre.add_item(album)
    @albums.push({'Title' => album.name, 'Publish_date' => album.publish_date, 'Is on spotify?' => album.on_spotify, 'Genre' => genre.name})
    @genres.push({ 'Genre' => genre.name })
  end

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
