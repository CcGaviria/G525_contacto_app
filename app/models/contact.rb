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

    validate :must_be_at_least_18_years_old
    validate :maximum_contacts_per_city

    private

    def must_be_at_least_18_years_old
      return if birth_date.blank?
  
      if birth_date > 18.years.ago.to_date
        errors.add(:birth_date, "Debes ser mayor de 18 años para contactarnos.")
      end
    end

    def maximum_contacts_per_city
        if Contact.where(city: city).count >= 3
          errors.add(:city, "Ya hay 3 registros en esta ciudad. No se pueden registrar más.")
        end
    end
    
end
