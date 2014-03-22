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

exports.csv = (req, res) ->
  str = addLineBreak req.body.csvtext
  fs.unlink "name.csv"
  fs.writeFile "name.csv", str, {encoding: 'utf8', mode: 438, flag: 'a'}
  return