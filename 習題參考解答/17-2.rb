def ls_t(path)
  entries = Dir.entries(path)               #���oentry
  entries.reject!{|name| /^\./ =~ name }  # �R��"."�X�{������

  mtimes = Hash.new 
  entries = entries.sort_by{|name|
    mtimes[name] = File.mtime(File.join(path, name))
  }

# ����ɦW�Pmtime
  entries.each{|name|
    printf("%-40s %s\n", name, mtimes[name])  }
rescue => ex
  puts ex.message
end

ls_t(ARGV[0] || ".")
