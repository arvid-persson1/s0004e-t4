import matplotlib.pyplot as plt


def h(n):
    match n:
        case 0 | 1:
            return 1
        case 4 | 5:
            return -1
        case _:
            return 0


ns = list(range(-2, 8))
hs = [h(n) for n in ns]

plt.plot(ns, hs, "o")
plt.xlabel("n", fontsize=20)
plt.ylabel("h[n]", fontsize=20)
plt.grid(True)
plt.show()
