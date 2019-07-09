def source_paths
	[__dir__]
end

def add_gems
  gem 'webpacker'
  gem 'foreman'
end

def copy_necessary_files
  %w[package.json
     Procfile
     app/javascript/app.vue
     app/helpers/vue_helper.rb
     app/views/layouts/vue.html.erb
     app/controllers/application_controller.rb
     app/controllers/root_controller.rb
    ].each do |file|
    copy_file file, force: true
  end
  copy_file "gitignore", ".gitignore", force: true
  directory "app/javascript/src", force: true
end

def install_webpack
  rails_command "webpacker:install"
  rails_command "webpacker:install:vue"
end

def install_node_modules
	run "rm yarn.lock"
	run "yarn install --ignore-engines"
  run "yarn add axios qs vue-axios --ignore-engines"
end

def copy_application_js_file
  if yes?("Install with bootstrap?")
    run "yarn add bootstrap bootstrap-vue --ignore-engines"
    copy_file "app/javascript/packs/application_with_bstrap.js", "app/javascript/packs/application.js", force: true
  else
    copy_file "app/javascript/packs/application_without_bstrap.js", "app/javascript/packs/application.js", force: true
  end
end

def commit
  git :init
  git add: "."
  git commit: "-a -m 'Initial commit'"
end

def create_database
	rails_command "db:migrate"
end

def add_root_route
  route "root to: 'root#index'"
end

source_paths
add_gems

after_bundle do
	install_webpack
	copy_necessary_files
	install_node_modules
  copy_application_js_file
  add_root_route
	create_database
end
