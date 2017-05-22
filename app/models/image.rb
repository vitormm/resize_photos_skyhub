class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  field :original_url,        :type => String

  has_mongoid_attached_file :attachment,
    #:path           => ':attachment/:id/:style.:extension',
    #:storage        => :s3,
    #:url            => '/:class/:attachment/:id/:style_:filename',
    #:s3_host_alias  => 'something.cloudfront.net',
    #:s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
    :styles => {
        :original => ['800x600', :jpg],
        :small    => ['320x240', :jpg],
        :medium   => ['384x288', :jpg],
        :large    => ['640x480', :jpg]
    }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
