# write a function to test if two strings are anagrams


def create_dict_from_string(my_string):
    my_string_dict = {}
    for char in my_string:
        if char not in my_string_dict:
            my_string_dict[char] = 1
        else:
            my_string_dict[char] = my_string_dict[char] + 1
    return my_string_dict


def anagram(string1, string2):
    string1_dict = create_dict_from_string(string1)
    string2_dict = create_dict_from_string(string2)
    if string1_dict == string2_dict:
        return True
    else:
        return False
