class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :link

      t.timestamps(null: false)
    end
  end
end
