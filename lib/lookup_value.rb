class LookupValue < ActiveRecord::Base

  belongs_to :lookup_field
  acts_as_list :scope => :lookup_field_id

  validates_uniqueness_of :name, :scope => :lookup_field_id
  validates_presence_of :name, :lookup_field_id


  def to_s
    self.name
  end
end

