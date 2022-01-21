def windowed_max_range(array, w)
    max_range = 0
    (0..array.length-w).each do |i|
        window = array[i...i+w]
        range = window.max - window.min
        max_range = range if range > max_range
    end
    max_range
end




p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8