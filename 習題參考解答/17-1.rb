def jparsedate(str)
  now = Time.now
  year = now.year
  month = now.month
  day = now.day
  hour = now.hour
  min = now.min
  sec = now.sec
  str.scan(/(�W��|�U��)?(\d+)(�~|��|��|��|��|��)/){
    case $3
    when "�~"; year  = $2.to_i
    when "��"; month = $2.to_i
    when "��"; day   = $2.to_i
    when "��"; hour  = $2.to_i
      hour  += 12 if $1 == "�U��"
    when "��"; min   = $2.to_i
    when "��"; sec   = $2.to_i
    end
  }
  return Time.mktime(year, month, day, hour, min, sec)
end

p jparsedate("2006�~12��23��U��8��17��50��")
p jparsedate("12��23��U��8��17��50��")
p jparsedate("�W��8��17��50��")
p jparsedate("8��17��50��")
