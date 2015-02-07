class CreateApplyRecords < ActiveRecord::Migration
  def change
    create_table :apply_records do |t|
      t.string :personcategory
      t.string :item
      t.string :timelimit
      t.string :artcategory
      t.string :organization
      t.string :state

      t.timestamps null: false
    end
  end
end
