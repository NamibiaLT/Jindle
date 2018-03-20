require 'rails_helper'
require 'book.rb'

RSpec.describe Book, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:summary) }
  end

  describe '.published' do
    it 'returns books that were published in the past' do
      Book.create(
        title: 'Something',
        author: 'Ryan Bigg',
        description: 'abc',
        body: 'blah blah blah',
        published_at: 1.month.from_now
      )
      past_post = Book.create(
        title: 'Something',
        author: 'Ryan Bigg',
        description: 'abc',
        body: 'blah blah blah',
        published_at: 1.week.ago
      )
      todays_post = Book.create(
        title: 'Something',
        author: 'Ryan Bigg',
        description: 'abc',
        body: 'blah blah blah',
        published_at: Date.today
      )

      expect(Book.published.size).to eq 2
      expect(Book.published.to_a).to eq [todays_post, past_post]
    end

    it 'does not include books where published_at is nil' do
      Book.create(
        title: 'Something',
        author: 'Ryan Bigg',
        description: 'abc',
        body: 'blah blah blah',
        published_at: nil
      )

      expect(Book.published).to eq []
    end
  end
end
