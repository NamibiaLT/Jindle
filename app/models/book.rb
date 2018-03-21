class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :author, type: String
  field :description, type: String
  field :summary, type: String
  field :published_at, type: Time

  validates :title, :author, :description, :summary, presence: true

  def self.published
    where(:published_at.lt => Date.tomorrow).order_by(published_at: :desc)
  end
end
