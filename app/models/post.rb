class Post < ActiveRecord::Base
    validates :user_id, presence: true
    validates :image, presence: true
    
    has_many :comments, dependent: :destroy    
    belongs_to :user
    has_attached_file :image, styles: { medium: "150x150>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
