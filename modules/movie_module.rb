require_relative '../movie/movie'
require_relative '../movie/source'
require_relative 'movie_storage'

module MovieModule
  include SaveData
  include LoadData

  def create_movie
    puts 'Please enter the name of the movie:'
    movie_name = gets.chomp

    puts 'Please enter the publish date for the movie:'
    movie_publish_date = gets.chomp

    puts 'Is it a silent movie? [y/n]'
    silent_movie = gets.chomp.downcase == 'y'

    @movie_list.push Movie.new(movie_name, movie_publish_date, silent_movie)

    save_movie(@movie_list)
    puts 'New movie created successfully'
  end

  def create_source
    puts 'Please enter the source of the movie (e.g. "From a friend", "Online shop")'
    source_name = gets.chomp

    @source_list.push Source.new(source_name)

    save_source(@source_list)
    puts 'Source created successfully'
  end

  def movie_list
    puts 'There are no movies in the list' if @movie_list.empty?
    @movie_list.each_with_index do |movie, index|
      puts "#{index} - Name: #{movie.movie_name.capitalize}, Silent Movie: #{movie.silent_movie}"
    end
  end

  def source_list
    puts 'There are no movies in the list' if @source_list.empty?
    @source_list.each_with_index do |source, index|
      puts "#{index} - Source name: #{source.source_name.capitalize}"
    end
  end
end