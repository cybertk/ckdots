#!/usr/bin/ruby

# Download from https://gist.github.com/cybertk/ff72d68e592966b11c23#file-unzip-rb

require 'optparse'
require 'zip'
require 'rchardet'

def GuessEncoding(zipfile_name)
  enc = {}

  # Find encoding
  Zip::File.open(zipfile_name) do |zip_file|
    # Handle entries one by one
    zip_file.each do |entry|
      cd = CharDet.detect(entry.name)
      if not enc.has_key?(cd['encoding'])
        enc[cd['encoding']] = 0.0
      else
        enc[cd['encoding']] += cd['confidence']
      end
    end
  end

  # Sort and return most confidence encoding name
  return Hash[enc.sort_by{|k,v| v}].keys.last
end

def Unzip(zipfile_name, enc)
  Zip::File.open(zipfile_name) do |zip_file|
    # Handle entries one by one
    zip_file.each do |entry|
      # Extract to file/directory/symlink
      name = entry.name.encode!('utf-8', enc)
      puts "Extracting #{name}"
      entry.extract(name)
    end
  end
end

options = {}
optparse = OptionParser.new do |opts|
  options[:list] = false
  opts.on('-l', 'List only' ) do
    options[:list] = true
  end
end

optparse.parse!

enc = GuessEncoding(ARGV[0])
puts "Zip encoding is #{enc}"
Unzip(ARGV[0], enc)
