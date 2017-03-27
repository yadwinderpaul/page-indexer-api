class CreatePageIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :page_indices do |t|
      t.string :url, index: true
      t.text :content

      t.timestamps
    end
  end
end
