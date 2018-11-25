class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :count
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
