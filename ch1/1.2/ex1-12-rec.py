"""
Note that this is a very inefficient way to compute Pascal's triangle.
For example, an iterative solution using loops and memoizing arrays would be much simpler.
However, this is the method the SICP book asks for. This should allow for a simple
translation to Scheme.
"""


import sys


def rows_loop(row, total_rows):
    if row < total_rows:
        # Notice that the row number equals the len of the row
        elements_loop(0, row)
        row += 1
        print('')
        rows_loop(row, total_rows)


def elements_loop(index, row_len):
    if index < row_len:
        print(f'{compute(row_len, index)} ', end='')
        index += 1
        elements_loop(index, row_len)


def compute(r, i):
    if i == 0 or i == r - 1:
        return 1
    else:
        return compute(r - 1, i - 1) + compute(r - 1, i)


def main():
    rows = int(sys.argv[1])
    rows_loop(1, rows + 1)

            
if __name__ == '__main__':
    main()
