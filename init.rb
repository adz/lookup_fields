# Give models class method 'lookup_fields'
require 'active_record_lookup_fields'

# Give views 'lookup_field' select-box generator
ActionView::Base.send :include,  LookupFieldHelper