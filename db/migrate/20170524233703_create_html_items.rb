class CreateHtmlItems < ActiveRecord::Migration[5.0]
  def change
    create_table :html_items do |t|
      t.string :tag
      t.text :content
      t.references :website, null: false

      t.timestamps(null: false)
    end
  end
end
