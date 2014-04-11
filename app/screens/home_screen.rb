class HomeScreen < PM::FormotionScreen

  title "Login"

  def on_submit(_form)
    p _form.render

    open Events.new(nav_bar: true)
  end

  def table_data
    {
      sections: [{
        title: "Credentials",
        rows: [{
          title: "Email",
          key: :email,
          placeholder: "example@mb.com",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        },
        {
          title: "Password",
          key: :password,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        },

        {
          title: "Submit",
          type: :submit,
        }
      ]
      }]
    }
  end
end
