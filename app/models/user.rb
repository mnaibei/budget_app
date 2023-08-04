class User < ApplicationRecord
  has_many :actions, foreign_key: :author_id
  has_many :groups
end
