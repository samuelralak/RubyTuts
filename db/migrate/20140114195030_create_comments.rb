class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
    
    remove_index :comments, :post_id
    add_index :comments, :post_id
  end
end
