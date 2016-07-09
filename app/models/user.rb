class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }  
  #username은 한글로만 가능
  validates_format_of :user_name, { :with => /^[A-Za-z0-9 ]*$/, :message => "은 영어로만 가능해요!",  :multiline => true}  
  #m:n관계
  has_many :posts, dependent: :destroy  
  has_many :comments, dependent: :destroy
  
end
