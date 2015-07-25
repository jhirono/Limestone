class CreateIndoors < ActiveRecord::Migration
  def change
    create_table :indoors do |t|
      t.string :name
      t.text   :image_url
      t.string :address
      t.string :access
      t.string :tele
      t.string :open_hour
      t.text   :price
      t.text   :rental
      t.text   :parking
      t.text   :lesson
      t.text   :kid
      t.text   :homepage
      t.timestamps null: false
    end
  end
end
