module AdminHelper

  def url_for_page page
    if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end
  end
  
  def object_name(object)
    if object.is_a?(ActiveRecord::Relation)
      return object.model.name.underscore
    else
      return object.class.name.underscore
    end
  end

  def admin_form_arguments_builder(object, namespace=nil)
    if namespace
      namespace = namespace.tr('_','')
      return [:admin, namespace.to_sym, object]
    else
      return [:admin, object]
    end
  end

  def nav_link(link_path, &block)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_path, &block
    end
  end

  def custom_field(field, options = {})
    return send("text_field", field, options)
  end

  def breadcrumbs
    # Session breadcrumbs is defines in the admin_controller via a before_action filter
    begin
      bc = session[:breadcrumbs]
      @content = content_tag("h2", bc.last)
      @content << content_tag(:ol, class: "breadcrumb") do
          bc.collect do |crumb|
            if crumb.equal? bc.last
              content_tag(:li, "<strong>#{crumb}</strong>".html_safe, class: "active")
            else
              content_tag(:li, crumb)
            end
          end.join.html_safe
        end

      # End result should look like this:
      #  %h2 Static Tables
      #  %ol.breadcrumb
      #   %li
      #    %a{:href => "index.html"} Home
      #   %li
      #    %a Tables
      #   %li.active
      #    %strong Static Tables

      return @content
    rescue NoMethodError => e
      logger.debug "Error encountered: #{e.message}"
      return ""
    end
  end

  def link_to_add_fields(name, f, association, partial_path=nil, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      if partial_path
        render(partial_path, f: builder)
      else
        render(association.to_s.singularize + "_fields", f: builder)
      end
    end
    link_to(name, '#', class: 'add_fields ' + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

end
