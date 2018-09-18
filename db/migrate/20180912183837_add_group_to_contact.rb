class AddGroupToContact < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :group, foreign_key: true
  end
end
