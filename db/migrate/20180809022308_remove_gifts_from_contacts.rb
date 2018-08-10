class RemoveGiftsFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :gift_ideas, :string
  end
end
