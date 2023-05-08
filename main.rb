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
  puts '12 - Add a movies'
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

# def option(option)
#   method_name = OPTIONS[option]
#   if method_name
#     send(method_name)
#   else
#     puts 'Invalid option, please type correct number!'
#   end
# end

def option(option)
  method_name = OPTIONS[option]
  send(method_name) if method_name
  puts 'Invalid option, please type correct number!' unless method_name
end

def main
  loop do
    run
    option = gets.chomp.to_i
    option(option)
  end
end

main
