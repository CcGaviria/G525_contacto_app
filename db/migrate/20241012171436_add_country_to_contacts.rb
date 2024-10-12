class AddCountryToContacts < ActiveRecord::Migration[7.2]
  def change
    add_reference :contacts, :country, null: false, foreign_key: true
  end
end
