class AddColorToIndoorkadais < ActiveRecord::Migration
  def change
    add_column :indoorkadais, :color, :string
  end
end
