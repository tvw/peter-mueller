#!/usr/bin/env rake
require "bundler/gem_tasks"

task :default do
  sh %Q{bundle install}
  sh %Q{rake build}
  sh %Q{rake install}
  rm_rf "pkg"
end
