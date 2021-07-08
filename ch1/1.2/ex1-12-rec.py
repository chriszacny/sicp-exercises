import sys


def main():
    rows = int(sys.argv[1])
    for r in range(1, rows + 1):
        for i in range(0, r):
            print(f'{compute(r, i)} ', end='')
        print('')


def compute(r, i):
    if i == 0 or i == r - 1:
        return 1
    else:
        return compute(r - 1, i - 1) + compute(r - 1, i)

            
if __name__ == '__main__':
    main()
