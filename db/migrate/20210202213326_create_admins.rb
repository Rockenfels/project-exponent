class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :username, default: ""
      t.string :password_digest, default: ""
      t.timestamps
    end
  end
end
