
def flatten_list(given_list):
    new_list = []
    for element in given_list:
        if type(element) is int:
            new_list.append(element)
        elif isinstance(element, list):
            new_list = new_list + flatten_list(element)
        else:
            raise ValueError('list can only contain elements of type int or list')
    return new_list
