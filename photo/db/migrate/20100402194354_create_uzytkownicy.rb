class CreateUzytkownicy < ActiveRecord::Migration
  def self.up
    create_table :uzytkownicy do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.timestamps
    end
  end

  def self.down
    drop_table :uzytkownicy
  end
end
