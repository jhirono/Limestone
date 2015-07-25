class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer    :indoor_id
      t.integer    :indoorkadai_id
      t.integer    :user_id
      t.integer    :trial
      t.string     :type
      t.text       :review
      t.timestamps null: false
    end
  end
end
