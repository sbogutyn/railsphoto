class ZmianaKomentarzy < ActiveRecord::Migration
  def self.up
    add_column :komentarze, :zdjecie_id, :integer
  end

  def self.down
    remove_column :komentarze, :zdjecie_id
  end
end
