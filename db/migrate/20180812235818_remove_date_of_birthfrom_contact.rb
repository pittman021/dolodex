class RemoveDateOfBirthfromContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :date_of_birth
  end
end
