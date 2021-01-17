#! /usr/env/ruby

def usage
  "Usage: #{$0} FILE..."
end

unless __FILE__ == $0
  abort(usage())
end

ip_v4_octet = /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/
ip_v4 = /#{ip_v4_octet}\.#{ip_v4_octet}\.#{ip_v4_octet}\.#{ip_v4_octet}/
host_only = /\A#{ip_v4} (?<host>.+)/

if ARGV.empty?
  abort(usage())
end

ARGF.each_line do |line|
  line.chomp!

  if (host_only.match?(line))
    puts host_only.match(line)['host']
  else
    puts line
  end
end
