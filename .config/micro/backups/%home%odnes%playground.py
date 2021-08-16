# ipython -i for interactive mode
maxsize = 10


def array_size(first, last):
    if last == 0:
        count = 0
    else:
        count = (last-first)+1
    print(count)


array_size(0, 5)
array_size(2, 9)
