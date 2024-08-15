class CreateEmojiCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :emoji_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :emoji, null: false, foreign_key: true

      t.timestamps
    end
  end
end
