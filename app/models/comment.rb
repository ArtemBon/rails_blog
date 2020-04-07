class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 1 }
  validates :user_id, presence: true
  belongs_to :article
  belongs_to :user
end
