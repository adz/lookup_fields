module LookupFieldHelper

  # Renders a select box with options of name/id from LookupValue
  def lookup_select(object, lookup_name)
    collection_select(object, "#{lookup_name}_id",
                      LookupField.find_by_name(lookup_name, :include => [:values]).values,
                      :id, :name)
  end

end