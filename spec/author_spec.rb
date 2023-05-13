require './game/author'
require_relative '../item'
require './Book/book'

RSpec.describe Author do
  subject(:author) { described_class.new('Lugard', 'Agu') }

  it 'returns the correct value for the first_name attribute' do
    expect(author.first_name).to eq('Lugard')
  end

  it 'returns the correct value for the last_name attribute' do
    expect(author.last_name).to eq('Agu')
  end

  it 'is an instance of Author class' do
    expect(author).to be_an_instance_of(described_class)
  end
end

RSpec.describe Item do
  subject(:item) { described_class.new(nil, nil, nil, nil, '2010-01-01') }

  let(:author) { Author.new('Lugard', 'Agu') }
  let(:book) { Book.new(nil, '2010-01-01', 'publisher', true) }

  it 'is an instance of Item class' do
    expect(Item.new(nil, nil, nil, nil, '2010-01-01')).to be_an_instance_of(described_class)
  end

  it 'returns the correct value for the publish_date attribute' do
    expect(item.publish_date).to eq('2010-01-01')
  end

  it 'adds an item to author' do
    author.add_author(book)
    expect(author.items).to eq([book])
  end
end
