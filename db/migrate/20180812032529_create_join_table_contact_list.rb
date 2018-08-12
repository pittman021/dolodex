class CreateJoinTableContactList < ActiveRecord::Migration[5.2]
  def change
    create_join_table :contacts, :lists do |t|
      # t.index [:contact_id, :list_id]
      # t.index [:list_id, :contact_id]
    end
  end
end
