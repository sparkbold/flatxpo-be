class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.string :image
      t.string :github_url
      t.string :demo_url
      t.integer :views
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
