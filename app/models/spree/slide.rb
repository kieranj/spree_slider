class Spree::Slide < ActiveRecord::Base
  has_attached_file :image, :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position
end
