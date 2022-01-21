
def first_anagram?(str1, str2)

    permutations(str1)

end

def permutations(str)

    (0...str.length).each do |i|
        permutations(str[0...i] + str[i+1..-1])

end

1 2 3 4

4
34 43
234 324 432
1234 3124 4312 4321

2 1 3 4

4
34 43
134 314 341
2134 3214 3421 3412

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |letter|
        index = str2.index(letter)
        return false if index == nil
        str2.slice!(index)
    end
    true
end


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2) 
    
    str1.chars.sort.join == str2.chars.sort.join
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true



def fourth_anagram?(str1, str2) 
    count_hash = Hash.new(0)
    (0...str1.length).each do |i|
        count_hash[str1[i]] += 1
        count_hash[str2[i]] -= 1
    end
    return true if count_hash.values.all?(0)
    false
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

