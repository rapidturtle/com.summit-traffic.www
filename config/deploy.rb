require 'rt_capistrano'

set :site,         "8898"
set :application,  "summit_traffic"
set :webpath,      "summit-traffic.com"
set :domain,       "eyequeue.us"
set :user,         "serveradmin@eyequeue.us"
set :password,     "moly8}oohing"
set :use_sudo,      false

# repository elsewhere
set :scm, :git
set :repository, "git@home.eyequeue.us:Repositories/summit-traffic.git"
set :ssh_options, {:forward_agent => true}
set :branch, "master"
set :deploy_via, :remote_cache

# these shouldn't be changed
role :web, "#{domain}"
role :app, "#{domain}"
role :db,  "#{domain}", :primary => true
set :deploy_to,    "/home/#{site}/containers/rails/#{application}"

namespace :deploy do
  desc "Create symlink to shared files and folders on each release."
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:update_code", "deploy:symlink_shared"
  
  namespace :web do
    desc "Serve up a custom maintenance page."
    task :disable, :roles => :web do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }
      
      reason = ENV['REASON']
      deadline = ENV['UNTIL']
      template = File.read("app/views/admin/maintenance.html.erb")
      page = ERB.new(template).result(binding)
      
      put page, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end
