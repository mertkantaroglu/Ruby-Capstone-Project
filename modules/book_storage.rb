require 'json'

module SaveBookData
  def save_book(books)
    save_data(books) do |book|
      {
        'name' => book.name,
        'publisher' => book.publisher,
        'publish_date' => book.publish_date,
        'cover_state' => book.cover_state
      }
    end
  end

  def save_label(labels)
    save_data(labels) do |label|
      {
        'title' => label.title,
        'color' => label.color
      }
    end
  end

  private

  def save_data(data)
    save_data = data.map { |item| yield(item) }
    write_to_file(save_data)
  end

  def write_to_file(data)
    File.write(file_path, JSON.generate(data))
  end

  def file_path
    './data/books.json'
  end
end

module LoadBookData
  def load_books
    load_data('./data/books.json') do |book_hash|
      Book.new(
        book_hash['name'],
        book_hash['publisher'],
        book_hash['publish_date'],
        book_hash['cover_state']
      )
    end
  end

  def load_labels
    load_data('./data/labels.json') do |label_hash|
      Label.new(label_hash['title'], label_hash['color'])
    end
  end

  private

  def load_data(file_path)
    if File.exist?(file_path)
      json_data = File.read(file_path)
      data_hash = JSON.parse(json_data)
      data_hash.map { |item| yield(item) }
    else
      []
    end
  end
end
