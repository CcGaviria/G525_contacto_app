class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :sex
      t.date :birth_date
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :address_details
      t.string :country
      t.string :department
      t.string :city
      t.text :information

      t.timestamps
    end
  end
end
