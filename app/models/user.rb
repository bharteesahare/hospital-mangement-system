class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  enum role: [:patient, :doctor]
  after_initialize :set_default_role, :if => :new_record?
  has_many :appoinments
  has_many :hosps
  has_many :diseases
  def set_default_role
    self.role ? self.role :  self.role = "patient"
  end 

  def self.doctor?
    self.role == "doctor"
  end
  def self.patient?
    self.role == "patient"
  end

end
