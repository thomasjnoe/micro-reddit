class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user
      t.references :post, index: true

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
