class CreateKategorie < ActiveRecord::Migration
  def self.up
    create_table :kategorie do |t|
      t.string :nazwa
      t.timestamps
    end
    add_column :zdjecia, :kategoria_id, :integer
  end
  
  def self.down
    drop_table :kategorie
    remove_column :zdjecia, :kategoria_id
  end
end
