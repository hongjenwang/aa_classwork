def bad_two_sum?(arr, target_sum)
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]
new_arr = [1, 2, 4, 6, 8, 10, 12] # 20
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum)

    (0...arr.length).each do |i|
        target = target_sum - arr[i]
        return true if bsearch(arr[0...i]+arr[i+1..-1], target) != nil
    end
    false

end

def bsearch(arr, target)
    return nil if arr.empty?
    if arr.length == 1
        return 0 if arr[0] == target
        return nil
    end
    mid = arr.length/2
    return mid if arr[mid] == target
    if arr[mid] < target
        return nil if bsearch(arr[mid+1..-1], target) == nil
        return bsearch(arr[mid+1..-1], target) + mid + 1
    else
        return bsearch(arr[0...mid], target)
    end
end

def good_two_sum?(arr, target_sum)

    hash = Hash.new(false)
    (0...arr.length).each do |i|
        target = target_sum - arr[i]
        return true if hash[target]
        hash[arr[i]] = true
    end
    false

end

arr = [0, 1, 5, 7]
new_arr = [1, 2, 4, 6, 8, 10, 12]
p good_two_sum?(arr, 6)
p good_two_sum?(arr, 10 )
p good_two_sum?(new_arr, 21 )
