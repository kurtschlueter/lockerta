class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, presence: true

  has_attached_file :media, :styles => {:standard => "150x150", :medium => "300x300", :large => "600x600"}, :bucket => 'lockertalk', :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates_attachment :media, :content_type => {:content_type => /^image\/(jpeg|png|gif|tiff)$/}
end
