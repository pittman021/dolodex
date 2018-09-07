class AddUserToGifts < ActiveRecord::Migration[5.2]
  def change
    add_reference :gifts, :user, foreign_key: true
  end
end
