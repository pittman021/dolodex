class AddWeddingDateAndGiftIdeasToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :wedding_anniversary, :date
    add_column :contacts, :gift_ideas, :jsonb
  end
end
