require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Mongoid document' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:summary) }
  end

  describe '.published' do
    it 'returns books that were published in the past' do
      create(:book, title: 'a', published_at: 1.month.from_now)
      past_book = create(:book, title: 'b', published_at: 1.week.ago)

      expect(Book.published.to_a).to eq [past_book]
    end

    it 'does not include books where published_at is nil' do
      create(:book, published_at: nil)

      expect(Book.published).to eq []
    end
  end
end
