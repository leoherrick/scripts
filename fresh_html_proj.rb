require 'net/http'

## Index Page
index_text = '<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Index</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" title="no title" charset="utf-8">
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/script.js" type="text/javascript" charset="utf-8"></script>
  </head>
  <body id="index">
    <h1>Sample Page</h1>
  </body>
</html>'

## css text 
css_text = '
html {
  background : #4B7399;
  font-family: Verdana, Helvetica, Arial;
  font-size: 14px;
}
  
body {
  width : 980px;
  margin: 0 auto;
  background-color: #FFF;
  padding: 20px 40px;
  border: solid 1px black;
  margin-top: 20px;  
  min-height : 600px;  
  border : 1px solid black;
  -moz-box-shadow: 2px 2px 5px #000;
  -webkit-box-shadow: 2px 2px 5px #000;
  box-shadow: 2px 2px 5px #000;
}
'

## Exceptions
raise ArgumentError, 'You must add a single command-line argument matching the target project directory' if (ARGV.length == 0)
raise ArgumentError, 'Too many command-line arguments! This script takes a single argument for the target directory' if (ARGV.length > 1)

## if no directory currently exists, create one
if !File.directory?(ARGV.first)
  raise StandardError, 'A file already exists by that name. Please use a unique name for your new project.' if File.file?(ARGV.first)
  Dir.mkdir(ARGV.first)
end

## Change project home to target directory
Dir.chdir(ARGV.first)

## set project_home variable
proj_dir = Dir.new(Dir.pwd)

raise StandardError, 'The target directory is not empty. You can only use an empty directory or a a different name.' if (proj_dir.entries.length > 2)

File.open("index.html", "w") do |f|
  f.puts index_text
end

## create directories
Dir.mkdir("css")
Dir.mkdir("js")
Dir.mkdir("img")
Dir.mkdir("test")
Dir.mkdir("test/js")

## create css file
File.open("css/style.css", "w") do |f|
  f.puts css_text
end

## create javascript files
# empty file for the app's js
File.open("js/script.js", "w")

# the latestest minified jquery
Net::HTTP.start("ajax.googleapis.com") do |http|
    resp = http.get("/ajax/libs/jquery/1/jquery.min.js")
    open("js/jquery.min.js", "wb") do |file|
        file.write(resp.body)
    end
end

## create js test file
File.open("test/js/test.js", "w")

puts 'created all files successfully!

  css/
    style.css
  img/
  index.html
  js/
    jquery.min.js
    script.js
  test/
    js/
      test.js  
';

