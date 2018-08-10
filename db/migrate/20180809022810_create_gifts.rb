class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :title
      t.string :url
      t.text :image

      t.timestamps
    end
  end
end
