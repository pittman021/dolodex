class ChangeBirthdayMonthToBeIntegerInContacts < ActiveRecord::Migration[5.2]
  def up
    change_column :contacts, :birthday_month, 'integer USING CAST(birthday_month AS integer)'
  end

  def down
    change_column :contacts, :birthday_month, :string
  end
end
