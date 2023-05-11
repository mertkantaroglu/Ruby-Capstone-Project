require 'json'

module BookStorage
  DATA_FOLDER = './data'.freeze

  def self.save_books(books)
    save_books = []
    books.each do |book|
      save_books << {
        'id' => book.id,
        'name' => book.name,
        'publisher' => book.publisher,
        'publish_date' => book.publish_date,
        'cover_state' => book.cover_state,
        'label_ids' => book.label_ids
      }
    end

    File.write("#{DATA_FOLDER}/books.json", JSON.generate(save_books))
  end

  def self.save_labels(labels)
    save_labels = []
    labels.each do |label|
      save_labels << {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color,
        'item_ids' => label.item_ids
      }
    end

    File.write("#{DATA_FOLDER}/labels.json", JSON.generate(save_labels))
  end

  def self.load_books
    if File.exist?("#{DATA_FOLDER}/books.json")
      books_json = File.read("#{DATA_FOLDER}/books.json")
      books_hash = JSON.parse(books_json)
      books_hash.map do |book_hash|
        Book.new(
          book_hash['id'], book_hash['name'], book_hash['publisher'],
          book_hash['publish_date'], book_hash['cover_state'], book_hash['label_ids']
        )
      end
    else
      []
    end
  end

  def self.load_labels
    if File.exist?("#{DATA_FOLDER}/labels.json")
      labels_json = File.read("#{DATA_FOLDER}/labels.json")
      labels_hash = JSON.parse(labels_json)
      labels_hash.map do |label_hash|
        Label.new(
          label_hash['id'], label_hash['title'], label_hash['color'], label_hash['item_ids']
        )
      end
    else
      []
    end
  end
end
