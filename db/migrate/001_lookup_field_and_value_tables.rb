# Install hook code here
#
class LookupFieldAndValueTables < ActiveRecord::Migration
  def self.up

    # lookup_fields - one for each field you reference
    create_table "lookup_fields", :force => true do |t|
      t.column "name", :string
    end
    add_index "lookup_fields", ["name"], :name => "lookup_fields_name_index"


    # lookup_values - each possible value of a lookup_field
    create_table "lookup_values", :force => true do |t|
      t.column "name", :string
      t.column "lookup_field_id", :integer
      t.column "position", :integer
    end
    add_index "lookup_values", ["name"], :name => "lookup_values_name_index"
    add_index "lookup_values", ["lookup_field_id", "position"], :name => "lookup_values_lookup_field_id_index"
  end

  def self.down
    drop_table :lookup_fields
    drop_table :lookup_values
  end
end
