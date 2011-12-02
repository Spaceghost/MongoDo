def stringify_values(hash)
  hash.each { |key, val| hash[key] = val.to_s }
end

