#!/usr/bin/env ruby

require 'open3'

def install_foreman
  unless system('foreman version > /dev/null 2>&1')
    puts "Installing foreman..."
    system('gem install foreman')
  end
end

def start_foreman
  install_foreman
  system('foreman start -f Procfile.dev ' + ARGV.join(' '))
end

start_foreman