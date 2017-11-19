# write a function to determine if a string has all unique characters


def unique_characters(myString):
    if len(myString) == 1:
        return True
    if myString[0] in myString[1:]:
        return False
    else:
        return unique_characters(myString[1:])


def unique_characters_set(myString):
    mySet = set()
    for char in myString:
        if char in mySet:
            return False
        else:
            mySet.add(char)
    return True
