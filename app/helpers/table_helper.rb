module TableHelper

  def display_table(options = {})
    options = merge_options(options)

    if options[:collection].present?
      table = content_tag :table, :class => options[:class] do
        table_head(options[:head]) +
            table_body(options[:body]) +
            table_footer(options[:footer])
      end
      table_pagination table, options
    else
      content_tag :h3, :class => options[:title_class] do
        options[:empty_collection_text].html_safe
      end
    end
  end

  private

    def merge_options(options = {})
      options = default_options.deep_merge(options)

      options[:body].merge!({:collection => options[:collection]}) unless options[:body][:collection]
      options[:footer].merge!({:column_classes => options[:head][:column_classes]}) unless options[:footer][:column_classes]

      options
    end

    def default_options
      {
          :collection            => [],
          :title_class           => 'alert',
          :class                 => 'table table-striped',
          :head                  => {:columns => [], :column_classes => [], :sort_column => {}},
          :body                  => {:partial => ''},
          :associations          => {},
          :footer                => {:columns => []},
          :paginate              => {:top => false, :bottom => false},
          :empty_collection_text => 'No items',

      }
    end

    def table_head(options = {})
      content_tag :thead do
        content_tag :tr do
          options[:columns].each_with_index do |column, i|
            concat content_tag(:th, options[:sort_columns][i]? build_link(column,i, options[:sort_columns]) : column,  :class => options[:column_classes][i])
          end.join
        end
      end
    end

    def build_link(column, i, options = {})
      direction = 'asc'
      c_column = options[i]

      if c_column == params[:column]
        direction = 'desc' if params[:direction] == 'asc'
      end

      link_to(column, collection_path(:column => c_column, :direction => direction))
    end

    def table_body(options = {})
      unless options[:partial].empty?
        content_tag :tbody do
          render options
        end
      end
    end

    def table_footer(options = {})
      content_tag :tfoot do
        content_tag :tr do
          options[:columns].each_with_index{ |column, i| concat content_tag(:th, column, :class => options[:column_classes][i])}.join
        end
      end
    end

    def table_pagination(table, options = {})
      if options[:paginate][:top] || options[:paginate][:bottom]
        pagination = content_tag(:div, paginate(options[:collection], :theme => options[:paginate][:theme]))

        table = table.prepend(pagination)  if options[:paginate][:top]
        table = table.concat(pagination)   if options[:paginate][:bottom]
      end

      table.html_safe
    end

end
