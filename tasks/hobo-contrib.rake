namespace :hobo_contrib do

  desc "Update the hobo_contrib assets"
  task :update_assets => :environment do

    HOBO_CONTRIB_HOME = File.dirname(__FILE__)+"/.."
    
    open("#{RAILS_ROOT}/public/javascripts/hobo-contrib.js", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/javascripts/*.js"].map {|fn| open(fn).read}.join("\n"))
    open("#{RAILS_ROOT}/public/stylesheets/hobo-contrib.css", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/stylesheets/*.css"].map {|fn| open(fn).read}.join("\n"))
  end

end
