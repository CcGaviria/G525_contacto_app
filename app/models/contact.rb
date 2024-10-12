class Contact < ApplicationRecord
    validates :sex, presence: true
    validates :birth_date, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :address, presence: true
    validates :country, presence: true
    validates :department, presence: true
    validates :city, presence: true
    validates :information, presence: true
end
