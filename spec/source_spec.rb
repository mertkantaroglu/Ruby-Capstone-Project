require_relative '../movie/source'

describe Source do
  context 'checking the information' do
    source = Source.new('Mert Films')
    it 'checks the name of the source' do
      expect(source.name).to eql 'Mert Films'
    end
  end
end