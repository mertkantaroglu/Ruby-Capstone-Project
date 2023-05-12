require 'json'

module SaveData
  def save_game(games)
    save_game = []
    games.each do |game|
      save_game << { 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at, 'publish_date' => game.publish_date }
    end

    File.write('./data/games.json', JSON.generate(save_game))
  end

  def save_author(authors)
    save_author = []
    authors.each do |author|
      save_author << { 'name' => author.name }
    end

    File.write('./data/authors.json', JSON.generate(save_author))
  end
end

module LoadData
  def load_games
    if File.exist?('./data/games.json')
      games_json = File.read('./data/games.json')
      games_hash = JSON.parse(games_json)
      games_hash.map do |game_hash|
        Game.new(game_hash['multiplayer'], game_hash['last_played_at'], game_hash['publish_date'])
      end
    else
      []
    end
  end

  def load_authors
    if File.exist?('./data/authors.json')
      authors_json = File.read('./data/authors.json')
      authors_hash = JSON.parse(authors_json)
      authors_hash.map do |author_hash|
        Author.new(author_hash['id'], author_hash['first_name'], author_hash['last_name'])
      end
    else
      []
    end
  end
end
