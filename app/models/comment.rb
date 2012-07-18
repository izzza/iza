class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :users
  attr_accessible :body, :commenter
  validates :commenter, :presence => true
  validates :body, :presence => true
  validates :user_id, :presence => true

end
