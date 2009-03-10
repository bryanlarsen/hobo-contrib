HOBO_CONTRIB_HOME = File.dirname(__FILE__)

open("#{RAILS_ROOT}/public/javascripts/hobo-contrib.javascript", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/javascripts/*.javascript"].map {|fn| open(fn).read}.join("\n"))
open("#{RAILS_ROOT}/public/stylesheets/hobo-contrib.css", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/stylesheets/*.css"].map {|fn| open(fn).read}.join("\n"))
