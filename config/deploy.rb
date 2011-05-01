$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require 'rvm/capistrano'
require 'bundler/capistrano'

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

# user settings
set :user, "deploy"
# set :password, "password"
set :use_sudo, false

# application details
set :rvm_ruby_string, '1.9.2'
set :application, "summit-traffic"
set :deploy_to, "/home/deploy/#{application}"

# git info
set :scm, :git
set :repository,  "git@home.eyequeue.us:Repositories/summit-traffic.git"
set :branch, "rel1.1"
set :deploy_via, :remote_cache

# servers
role :web, "ve.eyequeue.us"
role :app, "ve.eyequeue.us"
# role :db,  "external-db.s8898.gridserver.com", :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Create symlink to shared files and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:update_code", "deploy:symlink_shared"
end
