require_relative 'game_storage'

module GameModule
  include SaveData
  include LoadData

  def create_game
    puts 'Please enter the name of the game:'
    game_last_played_at = gets.chomp

    puts 'Please enter the publish date for the game:'
    game_publish_date = gets.chomp

    puts 'Is it a multiplayer game? [y/n]'
    game_multiplayer = gets.chomp.downcase == 'y'

    @game_list.push Game.new(game_multiplayer, game_last_played_at, game_publish_date)

    save_game(@game_list)

    puts 'Please enter the author of the game (e.g. "Stephen King")'
    author_name = gets.chomp

    @author_list.push Author.new(id, first_name, last_name)

    save_author(@author_list)
    puts ''
    puts 'New game created successfully'
    puts ''
  end

  def game_list
    puts ''
    if @game_list.empty?
      puts 'There are no games in the list'
    else
      puts 'Game List:'
      @game_list.each_with_index do |game, index|
        puts "#{index} - Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at}, Publish Date: #{game.publish_date}"
      end
    end
    puts ''
  end

  def game_list
    puts ''
    if @game_list.empty?
      puts 'There are no authors in the list'
    else
      puts 'Author List:'
      @author_list.each_with_index do |author, index|
        puts "#{index} - Author name: #{author.name.capitalize}"
      end
    end
    puts ''
  end
end
