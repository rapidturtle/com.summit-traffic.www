class Article < ActiveRecord::Base
  attr_accessible :title, :body, :post_date
  
  validates_presence_of :title, :body, :post_date
  
  scope :current, where('post_date < ?', Time.now.to_date.tomorrow)
end
