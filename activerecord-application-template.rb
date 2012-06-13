run "rm public/index.html"
run "rm public/images/rails.png"
run "touch tmp/.gitignore log/.gitignore"

run "rm -f .gitignore"
file ".gitignore", <<-END.gsub(/  /, '')
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  db/*.sqlite3
  vendor/ruby
END

git :init
git :add => '.'
git :commit => "-m 'Initial commit: Clean application'"


puts
say_status  "Rubygems", "Adding Rubygems into Gemfile...\n", :yellow
puts        '-'*80, ''; sleep 1

local_cancan_path = ask("If you want to use local checked out repository for CanCan, then please enter the path to it, else leave blank?")

if local_cancan_path == ""
  gem "cancan"
else
  gem "cancan", path: "#{local_cancan_path}"
end

git :add => '.'
git :commit => "-m 'Added gems'"


puts
say_status  "Rubygems", "Installing Rubygems...", :yellow
puts        '-'*80, ''

run "bundle install --path=vendor"


puts
say_status  "Model", "Adding the User resource...", :yellow
puts        '-'*80, ''; sleep 1

generate :scaffold, "User username:string password:string"
rake  "db:migrate"

git :add => '.'
git :commit => "-m 'Added the User resource'"


puts
say_status  "Model", "Adding the Company resource...", :yellow
puts        '-'*80, ''; sleep 1

generate :scaffold, "Company name:string"
rake  "db:migrate"

git :add => '.'
git :commit => "-m 'Added the Company resource'"


puts
say_status  "Ability", "Adding the ability model...", :yellow
puts        '-'*80, ''; sleep 1

generate 'cancan:ability'
