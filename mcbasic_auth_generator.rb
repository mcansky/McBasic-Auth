class Mcbasic_AuthGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      # models
      m.file "models/user.rb", "app/models/user.rb"
      m.file "models/user_session.rb", "app/models/user_session.rb"

      # controllers
      m.file "controllers/user_sessions_controller.rb", "app/controllers/user_sessions_controller.rb"
      m.file "controllers/users_controller.rb", "app/controllers/users_controller.rb"

      # views
      m.dir "app/views/users"
      m.dir "app/views/user_sessions"
      m.file "views/users/_form.erb", "app/views/users/_form.erb"
      m.file "views/users/edit.html.erb", "app/views/users/edit.html.erb"
      m.file "views/users/index.html.erb", "app/views/users/index.html.erb"
      m.file "views/users/new.html.erb", "app/views/users/new.html.erb"
      m.file "views/users/show.html.erb", "app/views/users/show.html.erb"
      m.file "views/user_sessions/new.html.erb", "app/views/user_sessions/new.html.erb"

      # migration
      m.migration_template "migrate/create_users.rb", "db/migrate"

      # some routes ?
      m.route_resources "users"
      m.route_resources "user_sessions"

      # some text
      m.readme "INSTALL"
    end
  end
end