HOBO_CONTRIB_HOME = File.dirname(__FILE__)

RAILS_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..")) unless defined?(RAILS_ROOT)

open("#{RAILS_ROOT}/public/javascripts/hobo-contrib.js", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/javascripts/*.js"].map {|fn| open(fn).read}.join("\n"))
open("#{RAILS_ROOT}/public/stylesheets/hobo-contrib.css", "w").write(Dir["#{HOBO_CONTRIB_HOME}/public/stylesheets/*.css"].map {|fn| open(fn).read}.join("\n"))
