class CreateShortStories < ActiveRecord::Migration[6.0]
  def change
    create_table :short_stories do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
