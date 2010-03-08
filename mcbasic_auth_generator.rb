class McbasicAuthGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    @options = []
    super

  end

  def manifest
    record do |m|
      # models
      m.directory "app/models"
      m.file "models/user.rb", "app/models/user.rb"
      m.file "models/user_session.rb", "app/models/user_session.rb"

      # controllers
      m.file "controllers/user_sessions_controller.rb", "app/controllers/user_sessions_controller.rb"
      m.file "controllers/users_controller.rb", "app/controllers/users_controller.rb" unless @options[:skip_user_controller]

      # views
      m.directory "app/views/users"
      m.directory "app/views/user_sessions"
      if !@options[:skip_views]
        m.file "views/users/_form.erb", "app/views/users/_form.erb"
        m.file "views/users/edit.html.erb", "app/views/users/edit.html.erb"
        m.file "views/users/index.html.erb", "app/views/users/index.html.erb"
        m.file "views/users/new.html.erb", "app/views/users/new.html.erb"
        m.file "views/users/show.html.erb", "app/views/users/show.html.erb"
      end
      m.file "views/user_sessions/new.html.erb", "app/views/user_sessions/new.html.erb"

      # migration
      m.migration_template "migrate/create_users.rb", "db/migrate/"

      # some routes ?
      m.route_resources "users" unless @options[:skip_user_controller]
      m.route_resources "user_sessions"

      # some text
      m.readme "../INSTALL"
    end
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options: '
    opt.on("--skip-views", "doesn't generate the User Controller views.") { |v| options[:skip_views] = v }
    opt.on("--skip-user-controller", "doesn't generate the UserController.") { |v| options[:skip_user_controller] = v }
  end

  def file_name
    "create_users"
  end

end