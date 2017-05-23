class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  field :original_url,        :type => String

  has_mongoid_attached_file :attachment,
    :url            => '/images/:attachment/:id/:style_:filename',
    :styles => {
        :original => ['800x600', :jpg],
        :small    => ['320x240', :jpg],
        :medium   => ['384x288', :jpg],
        :large    => ['640x480', :jpg]
    }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

end
