require_relative '../game'

describe Game do
  context 'Tests for Game class' do
    let(:game) { Game.new('23-03-2020', '02-07-1989', 'Single Player') }

    it 'Should create new game' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'Can_be_archived method should return correct value' do
      archived = game.can_be_archived?
      expect(archived).to eq true
    end

    it 'returns correct value of multiplayer' do
      expect(game.multiplayer).to eq('Single Player')
    end

    it 'returns correct date of last_played_at' do
      expected_date = '23-03-2020'
      expect(game.last_played_at).to eq(expected_date)
    end

    it 'returns correct publish_date' do
      expected_date = '02-07-1989'
      expect(game.publish_date).to eq(expected_date)
    end
  end
end
