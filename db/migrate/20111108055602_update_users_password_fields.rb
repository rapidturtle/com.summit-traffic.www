class UpdateUsersPasswordFields < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.rename :password_hash, :password_digest
      t.remove :password_salt
    end
  end

  def down
    change_table :users do |t|
      t.string :password_salt
      t.rename :password_digest, :password_hash
    end
  end
end
