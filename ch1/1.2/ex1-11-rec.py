import sys
import datetime


def main():
    start = datetime.datetime.now()
    n = int(sys.argv[1])
    if n < 3:
        answer = n
    else:
        answer = compute(n)
    end = datetime.datetime.now()
    print(answer)
    print(f'took: {(end - start)}')
    

def compute(n):
    if n < 3:
        return n
    else:
        return compute(n - 1) + 2 * compute(n - 2) + 3 * compute(n - 3)
    

if __name__ == '__main__':
    main()
