import sys


m = {0: 0, 1: 1, 2: 2}


def main():
    n = int(sys.argv[1])
    answer = None
    if n < 3:
        answer = n
    else:
        for i in range(3, n + 1):
            m[i] = m[i - 1] + 2 * m[i - 2] + 3 * m[i - 3]
        answer = m[n]
    print(answer)

    
if __name__ == '__main__':
    main()
