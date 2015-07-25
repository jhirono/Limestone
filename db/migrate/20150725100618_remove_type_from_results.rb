class RemoveTypeFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :type, :string
    add_column    :results, :climbtype, :string
  end
end
