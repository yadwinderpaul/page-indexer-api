class CreateHeadings < ActiveRecord::Migration[5.0]
  def change
    create_table :headings do |t|
      t.string :text, index: true
      t.string :name, index: true
      t.references :page_index, index: true, foreign_key: true

      t.timestamps
    end
  end
end
