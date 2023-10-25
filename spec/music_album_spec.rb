require_relative '../music_album'

describe MusicAlbum do
  let(:name) { 'In Rock' }
  let(:artist) { 'Deep Purple' }
  let(:publish_date) { '1978-10-25' }
  let(:on_spotify) { true }

  subject(:music_album) { MusicAlbum.new(name, artist, publish_date, on_spotify: on_spotify) }

  describe '#initialize' do
    it 'sets the name' do
      expect(music_album.name).to eq(name)
    end

    it 'sets the artist' do
      expect(music_album.artist).to eq(artist)
    end

    it 'sets the publish_date' do
      expect(music_album.publish_date).to eq(publish_date)
    end

    it 'sets the on_spotify flag' do
      expect(music_album.on_spotify).to eq(on_spotify)
    end

    it 'generates an ID' do
      expect(music_album.id).not_to be_nil
    end
  end

  describe '#can_be_archived?' do
    context 'when the album can be archived' do
      it 'returns true' do
        expect(music_album.can_be_archived?).to be(true)
      end
    end

    context 'when the album cannot be archived' do
      let(:on_spotify) { false }

      it 'returns false' do
        expect(music_album.can_be_archived?).to be(false)
      end
    end
  end
end
