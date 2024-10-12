json.extract! contact, :id, :sex, :birth_date, :first_name, :last_name, :email, :address, :address_details, :country, :department, :city, :information, :created_at, :updated_at
json.url contact_url(contact, format: :json)
