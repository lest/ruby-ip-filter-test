require './ip_filter'

ip_filter = IpFilter.new File.open('ranges.txt')

ip_filter.check('127.0.0.1')
