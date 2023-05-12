require_relative '../book/book'
require_relative '../book/label'
require_relative './book_storage'
module BookLabelModule
  include SaveBookData
  include LoadBookData
  def create_book
    puts 'Please write name of the book.'
    book_name = gets.chomp
    puts 'Please write publisher of the book.'
    book_publisher = gets.chomp
    puts 'Please write date of publish of the book.'
    book_publish_date = gets.chomp
    puts 'Please write the cover state of the book? (Good/Standart/Bad)'
    book_cover_state = gets.chomp
    new_book = Book.new(book_name, book_publisher, book_publish_date, book_cover_state)
    @book_list << new_book
    save_book(@book_list)
    puts 'Please write title of the label  of the book? (e.g. Gift, New)'
    label_title = gets.chomp
    puts 'Please write the color of the label of the book?'
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @label_list << label
    save_label(@label_list)
  end

  def book_list
    if @book_list.empty?
      puts "There are no books in the list.\n"
    else
      puts "\nBook List:\n"
      @book_list.each do |book|
        puts "Name: #{book.name}\nPublisher: #{book.publisher}\nCover State: #{book.cover_state}\n\n"
      end
    end
  end

  def label_list
    if @label_list.empty?
      puts "There are no labels in the list.\n"
    else
      puts "\nLabel List:\n"
      @label_list.each do |label|
        puts "Title: #{label.title}\nColor: #{label.color}\n\n"
      end
    end
  end
end
