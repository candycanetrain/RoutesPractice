class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: {scope: :user_id, message: "Duplicate contacts for user!"}

  belongs_to :owner
  has_many :contact_shares
  #through associations:
  has_many :shared_users,
    through: :contact_shares,
    source: :user

  
end
