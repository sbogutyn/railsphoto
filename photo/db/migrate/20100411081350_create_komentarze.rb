class CreateKomentarze < ActiveRecord::Migration
  def self.up
    create_table :komentarze do |t|
      t.string :autor
      t.text :tresc
      t.timestamps
    end
  end
  
  def self.down
    drop_table :komentarze
  end
end
