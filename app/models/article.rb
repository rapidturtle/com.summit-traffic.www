class Article < ActiveRecord::Base
  
  named_scope :current, :conditions => ['post_date <= ?', Time.now.to_date.tomorrow], :order => 'post_date DESC'
  
  validates_presence_of :title, :body, :post_date
  
end
