class AddNewToApplyRecord < ActiveRecord::Migration
  def change
    add_column :apply_records, :shenqingfuhe, :string
    add_column :apply_records, :jianding, :string
    add_column :apply_records, :jiandingfuhe, :string
    add_column :apply_records, :zhengshucaoli, :string
    add_column :apply_records, :zhengshufafang, :string
    add_column :apply_records, :zhengshubangding, :string
  end
end
