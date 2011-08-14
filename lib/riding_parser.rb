class RidingParser
  
  list = File.open('')
  province 
  list.each do |line|
    if line.starts_with?('*')
      province_name = line.to_s.strip
      province = Province.create(name: province_name)
    else
      riding_name = line.to_s.strip
      Province.find(i).ridings << Riding.create(name: riding_name)
    end
  end
  
  list.close
end