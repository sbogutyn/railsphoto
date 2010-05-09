class CreateGalerie < ActiveRecord::Migration
  def self.up
    create_table :galerie do |t|
      t.string :nazwa
      t.string :autor
      t.text :opis
      t.timestamps
    end
  end
  
  def self.down
    drop_table :galerie
  end
end
