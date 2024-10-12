class AddDepartmentToContacts < ActiveRecord::Migration[7.2]
  def change
    add_reference :contacts, :department, null: false, foreign_key: true
  end
end
