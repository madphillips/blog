class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, uniqueness: true, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 10 }
end
