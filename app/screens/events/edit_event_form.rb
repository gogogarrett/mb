class EditEventForm < PM::FormotionScreen
  attr_accessor :event_id

  title "Edit Client"

  def on_load
    set_nav_bar_button :left, title: "Cancel", action: :close_screen
  end

  def on_submit(form)
    data = form.render

    [['Title', :title], ['Content', :content]].each do |field|
      if data[field[1]].length > 20
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    app_delegate.events[self.event_id] = data
    close
  end

  def close_screen
    close
  end

  def table_data
    {
      sections: [{
        rows: [{
          title: "Title",
          key: :title,
          placeholder: "20 characters max",
          type: :string,
          value: app_delegate.events[self.event_id][:title]
        }, {
          title: "Content",
          key: :content,
          placeholder: "20 characters max",
          type: :string,
          value: app_delegate.events[self.event_id][:content]
        },{
          title: "Time",
          key: :date_time_short,
          type: :date,
          picker_mode: :date,
          format: :short,
          min_day_range: 1,
          max_day_range: 1,
        }
      ]
      }, {
        rows: [{
          title: "Update",
          type: :submit
        }]
      }]
    }
  end
end
