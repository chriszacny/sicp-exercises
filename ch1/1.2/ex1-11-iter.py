import sys
import datetime


def main():
    start = datetime.datetime.now()
    n = int(sys.argv[1])
    answer = None
    if n < 3:
        answer = n
    else:
        a = 0
        b = 1
        c = 2
        for i in range(3, n + 1):
            # f(n) = f(n - 1) + 2*f(n - 2) + 3*f(n - 3)
            prev = a
            a = b
            b = c
            c = b + 2*a + 3*prev
        answer = c
    end = datetime.datetime.now()
    print(answer)
    print(f'took: {(end - start)}')
    

if __name__ == '__main__':
    main()
