class AddAttachmentKadaipicToIndoorkadais < ActiveRecord::Migration
  def self.up
    change_table :indoorkadais do |t|
      t.attachment :kadaipic
    end
  end

  def self.down
    remove_attachment :indoorkadais, :kadaipic
  end
end
