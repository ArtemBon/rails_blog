class Comment < ApplicationRecord
  validates :commenter, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 1 }
  belongs_to :article
end
