def cache(filename)
  File.open('db/cache', 'a') do |cache|
    cache.puts(filename)
  end
end

def in_cache?(filename)
  File.read('db/cache').match(filename)
end

Dir.foreach('db/migrate') do |filename|
  next if (filename == '.' || filename == '..')
  next if (in_cache?(filename))

  path = "db/migrate/#{filename}"
  log = system("ruby #{path}")

  cache(filename) if (log)
end
