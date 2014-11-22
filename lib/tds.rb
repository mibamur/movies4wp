require 'tiny_tds'
require 'date'
require 'chronic'
require 'csv'
require 'awesome_print'
require 'smarter_csv'

client = TinyTds::Client.new(:username => 'sa', :password => '', :host => '192.168.201.21')

#~ puts client.dead?    # => false
#~ puts client.closed?  # => false
#~ puts client.active?  # => true

result = client.execute("SET NOCOUNT ON; SELECT a.FNAME, b.[FDATE], b.[FTIME], b.[FBASE_PRICE], b.[FDURATION] FROM [Harbin].[dbo].[FILM] a, [Harbin].[dbo].[REPERTOIR] b WHERE b.FFLM_NDX = a.FINDEX and b.FNOTACTIVE = 0;")

result.each do |row|
	ddate=Time.at(Chronic.parse("#{row['FDATE']} days from now", :hours24=>true, :now=> Chronic.parse('78122 days ago'))).getutc.strftime("%d.%m.%y").to_s
	ap row['FNAME']+" "+ddate+" "+Time.at(row['FTIME'].to_i/100).getutc.strftime("%H:%M").to_s+" "+row['FBASE_PRICE'].to_s+" "+row['FDURATION'].to_s
end

#~ ap result.fields # => []
#~ ap result.do
#~
#~ puts client.dead?    # => true
#~ puts client.closed?  # => false
#~ puts client.active?  # => false
#~ puts client.close
#~ puts client.closed?  # => true
#~ puts client.active?  # => false
