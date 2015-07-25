class AddPrefectureToIndoors < ActiveRecord::Migration
  def change
    add_column :indoors, :prefecture, :string
  end
end
