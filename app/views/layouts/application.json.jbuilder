if @errors.nil?
  json.data JSON.parse(yield)
  json.errors ([])
else
  json.data ({})
  json.errors @errors
end
