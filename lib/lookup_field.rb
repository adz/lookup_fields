class LookupField < ActiveRecord::Base

	has_many :values, :class_name => "LookupValue", :order => :position

	validates_uniqueness_of :name

	# Only one main field, so override []
	def self.[](name)
		LookupField.find(:first, :conditions => ["name = ?", name])
	end
	
	
	def self.build_with_values(name, *values)
	  f = LookupField.create(:name => name)
	  values.each do |v|
	    f.values.create(:name => v)
	  end
	  return f
	end
	
	
	def to_s
	  self.name
	end
end
