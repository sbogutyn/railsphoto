class AddGaleriaIdToZdjecia < ActiveRecord::Migration
  def self.up
    add_column :zdjecia, :galeria_id, :integer
  end

  def self.down
    remove_column :zdjecia, :galeria_id
  end
end
