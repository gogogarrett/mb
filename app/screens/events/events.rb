class Events < PM::TableScreen
  title "Event Feed"

  refreshable callback: :on_refresh,
              pull_message: "Pull to resfresh",
              refreshing: "Refresing data…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"

  def on_load
    set_nav_bar_button :right, system_item: :add, action: :open_add_event_form
  end

  def will_appear
    update_table_data
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end

  def open_add_event_form
    open_modal AddEventForm.new(nav_bar: true)
  end

  def open_event(args)
    open EventScreen.new(event_id: args[:event_id])
  end

  def table_data
    [{
      cells: app_delegate.events.map do |event|
        {
          title: event[:title],
          subtitle: event[:content],
          action: :open_event,
          editing_style: :delete,
          arguments: { event_id: app_delegate.events.index(event) }
        }
      end
    }]
  end

  def on_cell_deleted(cell)
    app_delegate.events.delete_at(cell[:arguments][:event_id])
  end

  def on_refresh
    end_refreshing
  end
end
