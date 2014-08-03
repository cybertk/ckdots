#!/usr/bin/ruby

require 'optparse'

def RemoveHerokuAppsWithPattern(pattern, confirm)
  apps = []

  # Find apps to remove
  `heroku apps`.lines do |line|
    _, app = line.match(/(#{pattern}.*)/).to_a
    apps << app unless not app
  end

  if not confirm
    puts "The following apps will be removed \n#{apps.join("\n")}"
    exit
  end

  apps.each do |app|
    `heroku destroy -a #{app} --confirm #{app}`
    puts "#{app} removed"
  end
end


options = {}
optparse = OptionParser.new do |opts|
  options[:pattern] = ''
  opts.on( '-p', '--pattern PATTERN', 'App match aginst the PATTERN' ) do |pattern|
    options[:pattern] = pattern
  end

  options[:confirm] = false
  opts.on('--confirm', 'Confirm delete' ) do
    options[:confirm] = true
  end
end

optparse.parse!
RemoveHerokuAppsWithPattern(options[:pattern], options[:confirm])
