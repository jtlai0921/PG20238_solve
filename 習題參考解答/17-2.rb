def ls_t(path)
  entries = Dir.entries(path)               #取得entry
  entries.reject!{|name| /^\./ =~ name }  # 刪除"."出現的部份

  mtimes = Hash.new 
  entries = entries.sort_by{|name|
    mtimes[name] = File.mtime(File.join(path, name))
  }

# 顯示檔名與mtime
  entries.each{|name|
    printf("%-40s %s\n", name, mtimes[name])  }
rescue => ex
  puts ex.message
end

ls_t(ARGV[0] || ".")
