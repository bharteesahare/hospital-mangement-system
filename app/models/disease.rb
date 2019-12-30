class Disease < ApplicationRecord
  belongs_to :hosp
  belongs_to :user
  #validates :name, :presence => 'true', :uniqueness => 'true' ,
end
