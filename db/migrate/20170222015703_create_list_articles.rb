class CreateListArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :list_articles do |t|
      t.references :list, foreign_key: true, index: true
      t.references :article, foreign_key: true, index: true

      t.timestamps
    end
  end
end
