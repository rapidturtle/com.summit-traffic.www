default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

# login credentials
set :user, "deploy"
# set :password, "password"
set :use_sudo, false

# application details
set :application, "summit-traffic"
set :deploy_to, "/usr/deploy/#{application}"

# git info
set :scm, :git
set :repository,  "git@home.eyequeue.us:Repositories/summit-traffic.git"
set :branch, "master"
set :deploy_via, :remote_cache

# servers
role :web, "ve.eyequeue.us"
role :app, "ve.eyequeue.us"
role :db,  "internal-db.s8898.gridserver.com", :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
