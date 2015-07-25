class AddHolidayToIndoors < ActiveRecord::Migration
  def change
    add_column :indoors, :holiday, :string
  end
end
