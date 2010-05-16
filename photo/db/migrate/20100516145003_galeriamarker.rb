class Galeriamarker < ActiveRecord::Migration
  def self.up
    add_column :galerie, :marker_id, :integer
  end

  def self.down
    remove_column :galerie, :marker_id
  end
end
