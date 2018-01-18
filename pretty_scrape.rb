require_relative 'scraper'

# Write to file so we can `pretty_generate` the JSON format in the terminal
File.open("pretty_output.json", "w") do |f|
    f.write("#{JOINED}")
end

