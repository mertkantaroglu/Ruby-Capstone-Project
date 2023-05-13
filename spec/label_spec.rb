require_relative '../book/label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('label', 'red')
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

  it 'sets the item label to the label object' do
    label = Label.new('Label Title', 'Label Color')
    item = Item.new(nil, nil, nil, 'book', '2022-01-01')

    label.add_label(item)

    expect(label.items).to include(item)
    expect(item.label).to eq(label)
  end
end
