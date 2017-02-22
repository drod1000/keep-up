class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string  :url
      t.string  :title
      t.string  :author
      t.text    :body

      t.timestamps null: false
    end
  end
end
