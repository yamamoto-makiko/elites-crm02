class Comment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user

  validates :body,        presence: true, length: {maximum: 200}
  validates :customer_id, presence: true
end
