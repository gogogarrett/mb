class EventScreen < PM::Screen
  attr_accessor :event_id

  def on_load
    set_nav_bar_button :right, title: "Edit", action: :open_edit_event_form
  end

  def open_edit_event_form
    open_modal EditEventForm.new(event_id: self.event_id, nav_bar: true)
  end

  def view_did_load
    @label = add UILabel.new, {
      font: UIFont.systemFontOfSize(32),
      left: 20,
      top: 200,
      width: 280,
      height: 50,
      text_alignment: NSTextAlignmentCenter
    }
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    @label.text = app_delegate.events[self.event_id][:content]
    self.title = app_delegate.events[self.event_id][:title]
  end
end
