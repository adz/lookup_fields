class ActiveRecord::Base

  class << self
    def lookup_fields(*fields)
      fields.each do |f|
        belongs_to f.to_sym,  # eg :sex
                   :class_name  => "LookupValue", 
                   :foreign_key => "#{f}_id",
                   :conditions  => "lookup_field_id = " +
                                   "   (select id " +
                                   "    from lookup_fields " +
                                   "    where name = '#{f}')"

        # Validate the lookup belongs to the appropriate lookup_field                                   
        validates_each f.to_sym do |record, attr, value|
          if !value.nil? and LookupField[f.to_s] != value.lookup_field        
            puts LookupField[f.to_s]
            puts value.lookup_field    
            record.errors.add attr, "is not a #{f} lookup field." 
          end
        end
      end
    end
  end
end