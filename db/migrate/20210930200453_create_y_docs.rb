class CreateYDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :y_docs do |t|
      t.binary :ydoc
      t.text :xml
      t.references :record, null: false, polymorphic: true, index: true

      t.timestamps
    end
  end
end
