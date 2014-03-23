# * GET home page.
#
fs = require('fs')

exports.index = (req, res) ->
  res.render "index",
    title: "CSV Converter"
  return

###"/Mg9Nfp" is our substring used to identify where a new line should be placed.###
addLineBreak = (str) ->
  str.replace(/Mg9Nfp/g,"\r\n")

addHTMLLineBreak = (str) ->
  str.replace(/Mg9Nfp/g,"<br />\n")

secondPageOne = "<!DOCTYPE html>\n
<html>\n
<head>\n
    <title></title>\n
</head>\n
<body>\n
<h1>Your CSV: </h1>\n
<div style='border: 1px solid; border-color: dimgray; background-color: lightgray'>"

secondPageTwo =
"\n
</div>
</body>\n
</html>"

exports.csv = (req, res) ->
  CSVstr = addLineBreak req.body.csvtext
  HTMLstr = addHTMLLineBreak req.body.csvtext
  fs.unlink "name.csv"
  fs.writeFile "name.csv", CSVstr, {encoding: 'utf8', mode: 438, flag: 'a'}
  res.send secondPageOne + HTMLstr + secondPageTwo
  return