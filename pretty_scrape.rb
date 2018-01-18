require_relative 'scraper'

File.open("pretty_output.json", "w") do |f|
    f.write("#{JOINED}")
end

