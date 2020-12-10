class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic
  delegate :email, to: :user, prefix: true #-> @comment.user_name
end
