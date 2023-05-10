require_relative '../movie/source'

describe Source do
  context 'checking the information' do
    source = Source.new('Mert Films')
    it 'checks the name of the source' do
      expect(source.name).to eql 'Mert Films'
    end
  end

  it 'adds the item to the source and sets the item source to self' do
    source = Source.new
    item = Item.new('movie', 'Mert Films', nil, nil, nil)

    source.add_source(item)

    expect(source.items).to include(item)
    expect(item.source).to eql(source)
  end
end
