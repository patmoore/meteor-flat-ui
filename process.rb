#!/usr/bin/ruby

# Changes all the references to ../something to ../packages/meteor-flat-ui/blah
def rewrite_css_paths
  ["fonts", "images"].each do |folder|
    pattern = %Q{url("..\\/#{folder}\\/}
    replacement = %Q{url("\\/packages\\/meteor-flat-ui\\/assets\\/#{folder}\\/}
    `sed -e 's/#{pattern}/#{replacement}/g' -i '' assets/css\/flat-ui.css`
  end
end

# All of the paths to include in the package
IGNORE = %w{. .. .DS_Store demo favicon.ico footer illustrations}
def paths(path)
  return [path] unless File.directory? path

  Dir.entries(path).inject([]) do |all,item|
    if IGNORE.include? item
      all
    else
      all + paths("#{path}/#{item}")
    end
  end
end

# Sorted with jquery first and then jquery-ui (cuz other files depend on them)
def sorted_paths
  paths("assets").sort_by do |path|
    case path
    when /jquery-[0-9]/ then 1
    when /jquery-ui-[0-9]/ then 2
    else 3
    end
  end
end

# The list of files to add to package.js, quoted and comma separated
def files_to_add
  sorted_paths.map do |path|
    "    '#{path}'"
  end.join ",\n"
end

# The new package.js with all the files added
def new_package_js
  text = ""
  IO.readlines("package.js").each do |line|
    if %r{// FILES}.match(line)
      $skipping = true
      text << line
    elsif %r{// END FILES}.match(line)
      $skipping = false
      text << files_to_add << "\n" << line
    elsif !$skipping
      text << line
    end
  end
  text
end

# Saves the new package.js
def write_package_js(text)
  File.open "package.js", "w" do |f| 
    f.write text
  end
end  


#################
## Do the work ##
#################

print "processing...."
write_package_js new_package_js
rewrite_css_paths
print "DONE\n"


