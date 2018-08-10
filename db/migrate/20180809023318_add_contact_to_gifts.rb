class AddContactToGifts < ActiveRecord::Migration[5.2]
  def change
    add_reference :gifts, :contact, foreign_key: true
  end
end
