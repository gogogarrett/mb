class AppDelegate < PM::Delegate
  attr_accessor :events

  status_bar true, animation: :none

  def on_load(app, options)
    self.events = []
    open HomeScreen.new
    # open ClientFeed.new(nav_bar: true)
  end

end
