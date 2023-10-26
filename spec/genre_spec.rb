require_relative '../genre'

describe Genre do
  let(:name) { 'Rock' }
  let(:id) { 42 }

  subject(:genre) { Genre.new(name, id: id) }

  describe '#initialize' do
    it 'sets the name' do
      expect(genre.name).to eq(name)
    end

    it 'sets the ID if provided' do
      expect(genre.id).to eq(id)
    end

    it 'generates an ID if not provided' do
      genre_without_id = Genre.new(name)
      expect(genre_without_id.id).not_to be_nil
    end

    it 'initializes an empty items array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('item') }

    it 'adds the item to the genre' do
      expect(item).to receive(:add_genre).with(genre)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
