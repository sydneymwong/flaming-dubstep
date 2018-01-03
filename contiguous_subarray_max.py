def gen_sub_arrays(given_array):
    for begin_index in range(len(given_array)):
        for end_index in range(begin_index+1, len(given_array)+1):
            yield given_array[begin_index:end_index]
            
def max_contiguous(given_array):
    sub_arrays_generator = gen_sub_arrays(given_array)
    current_max = 0
    current_array = []
    for sub_array in sub_arrays_generator:
        amount = sum(sub_array)
        if amount > current_max:
            current_max = amount
            current_array = sub_array
    return [current_max, current_array]
