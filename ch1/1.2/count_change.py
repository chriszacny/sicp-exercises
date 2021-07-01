import sys


COIN_KINDS = {
    1: 1,
    2: 5,
    3: 10,
    4: 25,
}


def main():
    amount = int(sys.argv[1])
    print(calc(amount, len(COIN_KINDS.keys())))

    
def calc(a, n):
    if a == 0:
        return 1
    if a < 0:
        return 0
    if n == 0:
        return 0
    return calc(a, n - 1) + calc(a - COIN_KINDS[n], n)


if __name__ == '__main__':
    main()

