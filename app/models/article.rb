class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:title, :text]

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 20 }

  belongs_to :user
  validates :user_id, presence: true
end
