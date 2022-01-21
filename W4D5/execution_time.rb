
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(list) 
    (0...list.length-1).each do |i|
        smallest = true
        (i+1...list.length).each do |j|
            if list[i] > list[j]
                smallest = false
                break
            end
        end
        return list[i] if smallest == true
    end
end

#p my_min(list)

def my_min_two(list)
    sm = list.first
    (1...list.length).each do |i|
        sm = list[i] if list[i] < sm
    end
    sm
end

# p my_min_two(list)

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

def largest_contiguous_subsum(list)
    sum = list[0]
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            sum = list[i..j].sum if list[i..j].sum > sum
        end
    end
    sum
end

# p largest_contiguous_subsum(list1)
# p largest_contiguous_subsum(list2)
# p largest_contiguous_subsum(list3)

def largest_contiguous_subsum_two(list)
    max_sum = list[0]
    curr_sum = 0
    (0...list.length).each do |i|
        curr_sum += list[i]
        max_sum = curr_sum if curr_sum > max_sum
        if curr_sum < 0
            curr_sum = 0
        end
    end
    max_sum
end

p largest_contiguous_subsum_two(list1)
p largest_contiguous_subsum_two(list2)
p largest_contiguous_subsum_two(list3)