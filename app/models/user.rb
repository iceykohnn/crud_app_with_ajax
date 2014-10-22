class User < ActiveRecord::Base
  attr_reader :entered_password

  validates :entered_password, :length => { :minimum => 8 }
  VALID_EMAIL_REGEX = /.+@.+\..+/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness:  { case_sensitive: false }
  

  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :user
  has_many :created_events, class_name: "Event"

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil 
  end

end

