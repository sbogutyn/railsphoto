class CreateZdjecia < ActiveRecord::Migration
  def self.up
    create_table :zdjecia do |t|
      t.string :opis
      t.timestamps
    end
  end
  
  def self.down
    drop_table :zdjecia
  end
end
