$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'

require 'bundler/capistrano'

set :rvm_ruby_string, '1.9.2-p180'

## Configuration
set :application, "jazzity"

set :scm, :git
set :repository, "git@github.com:rubiety/#{application}.git"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm_verbose, true
set :ssh_options, {:forward_agent => true}
ssh_options[:port] = 2234

task :staging do
  role :app, "stage.jazzity.com"
  role :web, "stage.jazzity.com"
  role :db,  "stage.jazzity.com", :primary => true
    
  set :rails_env, "staging"
  set :branch, "master"
  set :deploy_to, "/var/www/stage.jazzity.com"
  set :user, "apps"
end

set :shared_paths, %w(
  config/database.yml
)

after "deploy:symlink", "deploy:shared"
after "deploy:symlink", "deploy:migrate_database"

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :start do
  end
  
  task :stop do
  end
    
  task :shared, :roles => [:app, :web] do
    shared_paths.each do |path|
      run "ln -nfs #{shared_path}/#{path} #{release_path}/#{path}"
    end
  end
  
  task :migrate_database, :roles => [:db] do
    run "cd #{release_path} && export RAILS_ENV=#{rails_env} && rake db:drop && rake db:create && rake db:migrate --trace && rake db:seed --trace"
  end
end
