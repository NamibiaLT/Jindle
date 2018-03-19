class Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :description, type: String
  field :summary, type: String
  field :published_at, type: Time
end
