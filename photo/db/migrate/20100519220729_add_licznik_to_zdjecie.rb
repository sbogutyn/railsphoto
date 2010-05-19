class AddLicznikToZdjecie < ActiveRecord::Migration
  def self.up
    add_column :zdjecia, :licznik, :integer
  end

  def self.down
    remove_column :zdjecia, :licznik
  end
end
