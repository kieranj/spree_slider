class Spree::Slide < ActiveRecord::Base
  has_attached_file :image,
                    :url => 'spree/images/:id/:style/:basename.:extension',
                    :path => 'spree/images/:id/:style/:basename.:extension'
  include Spree::Core::S3Support
  supports_s3 :image
  
  #, :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position
  
  default_scope order(:position)
  
  def initialize(attrs = nil)
    attrs ||= {:published => true}
    super
  end
  
end
