def jparsedate(str)
  now = Time.now
  year = now.year
  month = now.month
  day = now.day
  hour = now.hour
  min = now.min
  sec = now.sec
  str.scan(/(上午|下午)?(\d+)(年|月|日|時|分|秒)/){
    case $3
    when "年"; year  = $2.to_i
    when "月"; month = $2.to_i
    when "日"; day   = $2.to_i
    when "時"; hour  = $2.to_i
      hour  += 12 if $1 == "下午"
    when "分"; min   = $2.to_i
    when "秒"; sec   = $2.to_i
    end
  }
  return Time.mktime(year, month, day, hour, min, sec)
end

p jparsedate("2006年12月23日下午8時17分50秒")
p jparsedate("12月23日下午8時17分50秒")
p jparsedate("上午8時17分50秒")
p jparsedate("8時17分50秒")
