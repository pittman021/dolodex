class AddMonthDayToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :birthday_month, :string
    add_column :contacts, :birthday_day, :integer
  end
end
