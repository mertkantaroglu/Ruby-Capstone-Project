require_relative '../book/label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new(nil, 'label', 'red')
  end

  it 'has a title' do
    expect(@label.title).to eq('label')
  end

  it 'has a color' do
    expect(@label.color).to eq('red')
  end
  it 'takes two parameters and return a label object' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'should return true if the label has an item' do
    @item = Item.new(nil, '2002-01-01')
    @item.add_label(@label)
    expect(@label.items.length).to eq 1
  end
end
