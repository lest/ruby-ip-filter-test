require 'benchmark'
require './ip_filter'

ip_filter = IpFilter.new File.open('ranges.txt')

input = File.read('input.txt').lines.map do |line|
  [line.strip[1..-1], line[0].chr == '+']
end

input.each do |ip, expected|
  puts "#{ip} should#{expected ? '' : ' not'} be matched" if ip_filter.check(ip) != expected
end

Benchmark.bm do |x|
  x.report do
    10_000.times do
      input.each do |ip, expected|
        ip_filter.check(ip)
      end
    end
  end
end
