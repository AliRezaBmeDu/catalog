# item_spec.rb
require 'date'
require_relative '../item' # Adjust the path as needed
require 'rspec'

describe Item do
  describe '#initialize' do
    it 'should set the publish date and archived state' do
      item = Item.new('2000-01-01', archived: true)
      expect(item.publish_date).to eq('2000-01-01')
      expect(item.archived).to be true
    end

    it 'should have default values for genre, author, source, and label' do
      item = Item.new('2000-01-01')
      expect(item.genre).to be_nil
      expect(item.author).to be_nil
      expect(item.source).to be_nil
      expect(item.label).to be_nil
    end
  end

  describe '#add_label' do
    it 'should set the label of the item' do
      item = Item.new('2000-01-01')
      item.add_label('Book Label')
      expect(item.label).to eq('Book Label')
    end
  end

  describe '#add_genre' do
    it 'should set the genre of the item' do
      item = Item.new('2000-01-01')
      item.add_genre('Rock')
      expect(item.genre).to eq('Rock')
    end
  end

  describe '#can_be_archived?' do
    it 'should return true for items older than 10 years' do
      item = Item.new('2000-01-01')
      expect(item.can_be_archived?).to be true
    end

    it 'should return false for items 10 years old or newer' do
      item = Item.new((Time.now - (10 * 365 * 24 * 60 * 60)).strftime('%Y-%m-%d'))
      expect(item.can_be_archived?).to be false
    end
  end

  describe '#move_to_archive' do
    it 'should update the archived state based on can_be_archived?' do
      item = Item.new('2000-01-01')
      expect(item.can_be_archived?).to be true
      item.move_to_archive
      expect(item.archived).to be true

      new_item = Item.new((Time.now - (10 * 365 * 24 * 60 * 60)).strftime('%Y-%m-%d'))
      expect(new_item.can_be_archived?).to be false
      new_item.move_to_archive
      expect(new_item.archived).to be false
    end
  end
end
