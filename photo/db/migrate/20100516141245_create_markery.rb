class CreateMarkery < ActiveRecord::Migration
  def self.up
    create_table :markery do |t|
      t.float :wysokosc
      t.float :szerokosc

      t.timestamps
    end
  end

  def self.down
    drop_table :markery
  end
end
