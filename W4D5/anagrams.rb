
def first_anagram?(str1, str2)

    permutations(str1).include?(str2)

end

def permutations(str)
    return [str] if str.length < 2
    perms = permutations(str[0...-1])

    arr_perm = []
    perms.each do |perm|
        (0...str.length).each do |i|
            temp_perm = perm.dup
            arr_perm << temp_perm.insert(i, str[-1])
        end
    end
    arr_perm
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

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

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

