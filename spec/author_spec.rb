require_relative '../author'
require_relative '../game'

describe Author do
  context 'Tests for Author class' do
    let(:author) { Author.new('Vikas', 'Chib') }
    let(:game) { Game.new('23-03-2020', '02-07-1989', 'single-player') }

    it 'Should create new author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'Should add item to its item array' do
      author.add_item(game)
      expect(author.items).to include(game)
    end

    it 'should return correct first name of author' do
      expect(author.first_name).to eq('Vikas')
    end

    it 'should return correct last name of author' do
      expect(author.last_name).to eq('Chib')
    end
  end
end
