class CreateIndoorkadais < ActiveRecord::Migration
  def change
    create_table :indoorkadais do |t|
      t.integer :indoor_id
      t.string  :wallname
      t.string  :routename
      t.string  :grade
      t.boolean  :newflag, default: true, null: false
      t.timestamps null: false
    end
  end
end
