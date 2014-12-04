class PolymorphicSelectInput < Formtastic::Inputs::SelectInput

  def select_html
    builder.select(input_name, polymorphic_collection, input_options, input_html_options) <<
      polymorphic_hidden_html
  end

  def polymorphic_hidden_html
    builder.hidden_field(polymorphic_hidden_field_name, :'data-polymorphic' => polymorphic_marker)
  end

  def polymorphic_collection
    selected_record = object.send(polymorphic_relationship)

    groups = ''

    options[:grouped_options].each do |klass, records|
      groups << template.content_tag(:optgroup, :label => klass.model_name.human, :'data-polymorphic-type' => klass.name) do
        opts = ''

        records.each do |record|
          opts << template.content_tag(:option,
                                       record.to_s,
                                       :value    => record.id,
                                       :selected => selected_record == record ? 'selected' : nil)
        end

        opts.html_safe
      end
    end
    
    groups.html_safe
  end

  def polymorphic_hidden_field_name
    type_field_name = association_primary_key.to_s.gsub(/_id$/, '_type')

    input_name.to_s.gsub(association_primary_key.to_s, type_field_name)
  end

  def polymorphic_relationship
    input_name.to_s.gsub(/_id$/, '')
  end

  def input_html_options
    super.merge(:'data-polymorphic' => polymorphic_marker)
  end

  def polymorphic_marker
    "#{object.object_id}-#{input_name}"
  end

end
