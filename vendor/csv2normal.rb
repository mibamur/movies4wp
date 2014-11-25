require 'date'
require 'chronic'

require 'csv'
require 'awesome_print'
#~ require 'modelize'

require 'smarter_csv'
#~ `cat 1.csv | sed 's#  ##g' | sed -e 's# ;#;#g' | sed -e 's#; #;#g' > 2.csv`

`echo 'film;date;time;price;len;' > 2.csv`
`cat 1.csv | sed 's#  ##g' | sed -e 's# ;#;#g' | sed -e 's#; #;#g' >> 2.csv`

filename='2.csv'

f = File.open(filename, "r:bom|utf-8");
data = SmarterCSV.process(f, {:col_sep => ';', :quote_char => '', :force_simple_split => true});
f.close


DATE_START = Time.now   # Текущее время
DATE_SEEK = '2011-04-01'
DATE_SEEK_NUMBER = 76795

data.each do |d|
  #~ p d[:date].to_s
  p d[:film].to_s+" "+d[:date].to_s+" "+Time.at(d[:time].to_i/100).getutc.strftime("%H:%M").to_s+" "+d[:price].to_s+"руб."
  #~ +" "+d[:len]

  p Chronic.parse( d[:date].to_i.to_s+" day ago", :now=> Chronic.parse('76795 days from now')).getutc.strftime("%d.%m.%Y")
  #~ p Chronic.parse('78117 days ago', :hours24=>true, :now=> Chronic.parse('76795 days from now')).to_time.to_i

end


def en1(date,time)
  date2 = Chronic.parse( "#{DATE_SEEK}-".to_s+(Chronic.parse((date.to_i-DATE_SEEK_NUMBER.to_i).to_s).to_s+" day ago").to_s)
  #~ @date = strtotime(DATE_SEEK.' - '.(@date - DATE_SEEK_NUMBER).' day ago');
  #~ date("Y-m-d",mktime(0,0,0,2,3+@date,1937));
  startDate=-1038510000
  time2=time.to_i / 100
  return date2.to_i+time2.to_i
end

def en2(date,time)
  date2 = Chronic.parse( "#{DATE_SEEK}-".to_s+(Chronic.parse((date.to_i-DATE_SEEK_NUMBER.to_i).to_s).to_s+" day ago").to_s)
  #~ @date = strtotime(DATE_SEEK.' - '.(@date - DATE_SEEK_NUMBER).' day ago');
  #~ date("Y-m-d",mktime(0,0,0,2,3+@date,1937));

  date2 = date

  startDate=-1038510000
  time2=time.to_i / 100
  return date2.to_i
end

#~ puts(en1("78117","4320001"))
#~
#~ p Time.at(en1("78117","4320001"))
#~
#~ puts Time.at(en1("78117","4320001"))
#~ puts en2("78117","4320001")
#~
#~ c_date  = Chronic.parse('78117 days ago', :hours24=>true, :now=> Chronic.parse('76795 days from now')).to_time.to_i
#~ c_today = Date.today.to_time.to_i-c_date
#~ Time.at(c_date+c_today).getutc
#~
#~
#~ c_date  = Time.at Chronic.parse('78117 days ago', :hours24=>true, :now=> Chronic.parse('76795 days from now')).to_time.to_i
#~ c_today = Date.today.to_time.to_i-c_date
#~ Time.at(Date.today.to_time.to_i).getutc
