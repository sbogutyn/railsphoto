class AddLicznikToZdjecie < ActiveRecord::Migration
  def self.up
    add_column :zdjecia, :licznik, :integer, :default => 0
  end

  def self.down
    remove_column :zdjecia, :licznik
  end
end
