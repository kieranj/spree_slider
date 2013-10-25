class Spree::Slide < ActiveRecord::Base
  # include Spree::Core::S3Support
  # supports_s3 :image
  has_attached_file :image#, :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position
end
