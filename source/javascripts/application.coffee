#= require 'moment'
#= require 'prism'
#= require_tree './templates/.'

window.get = (url, callback)->
  xhr = new XMLHttpRequest()
  xhr.open "GET", url, true
  xhr.onreadystatechange = ->
    return if xhr.readyState != 4 || xhr.status != 200
    callback.call(xhr, xhr.responseText)
  xhr.send()

window.formatTweet = (html)->
  html = html.replace /(https?:\/\/[^ ]+)/gi, '<a href="$1">$1</a>'
  html = html.replace /@([a-z0-9_]+)/gi, '<a href="http://twitter.com/$1">@$1</a>'

  html