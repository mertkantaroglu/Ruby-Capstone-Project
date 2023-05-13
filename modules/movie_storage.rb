require 'json'

module SaveData
  def save_movie(movies)
    save_movie = []
    movies.each do |movie|
      save_movie << { 'name' => movie.name, 'silent' => movie.silent, 'publish_date' => movie.publish_date }
    end

    File.write('./data/movies.json', JSON.generate(save_movie))
  end

  def save_source(sources)
    save_source = []
    sources.each do |source|
      save_source << { 'name' => source.name }
    end

    File.write('./data/sources.json', JSON.generate(save_source))
  end
end

module LoadData
  def load_movies
    if File.exist?('./data/movies.json')
      movies_json = File.read('./data/movies.json')
      movies_hash = JSON.parse(movies_json)
      movies_hash.map do |movie_hash|
        Movie.new(movie_hash['name'], movie_hash['silent'], movie_hash['publish_date'])
      end
    else
      []
    end
  end

  def load_sources
    if File.exist?('./data/sources.json')
      sources_json = File.read('./data/sources.json')
      sources_hash = JSON.parse(sources_json)
      sources_hash.map do |source_hash|
        Source.new(source_hash['name'])
      end
    else
      []
    end
  end
end
