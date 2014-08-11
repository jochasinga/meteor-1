UI.registerHelper 'pluralize', (n, thing) ->
  # fairly stupid pluralizer
  if n is 1
    "1 #{thing}"
  else if n is 0
    "0 #{thing}"
  else
    "#{n} #{thing}s"
