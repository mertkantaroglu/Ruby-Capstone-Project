require_relative 'app'

def list_options
  'Please choose an option by entering a number:
    1 - List all books
    2 - List all music albums
    3 - List all games
    4 - List all movies
    5 - List all genres
    6 - List all labels
    7 - List all authors
    8 - List all sources
    9 - Add a book
    10 - Add a music album
    11 - Add a game
    12 - Add a movie
    0 - Exit'
end

def option(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_music_albums
  when 3
    app.list_games
  when 4
    app.list_movies
  when 5
    app.list_genres
  when 6
    app.list_labels
  when 7
    app.list_authors
  when 8
    app.list_sources
  when 9
    app.add_book
  when 10
    app.add_music_album
  when 11
    app.add_game
  when 12
    app.add_movie
  when 0
    app.save_data
    exit
  else
    puts 'Invalid option, please type correct number!'
  end
end

def main
  app = App.new
  app.load_data

  loop do
    puts list_options
    puts
    print 'Please select an option:'
    option = gets.chomp.to_i
    option(option, app)
  end
end

main
