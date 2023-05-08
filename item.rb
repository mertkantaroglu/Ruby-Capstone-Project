class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    age_in_years = Time.now.year - @publish_date.year
    age_in_years >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
