from cmath import exp, phase, pi

import matplotlib.pyplot as plt
from numpy import linspace

# 4c
# def fr(omega):
#     return 1 / 4 * (1 + exp(-1j * omega) + exp(-2j * omega) + exp(-3j * omega))


# 5di
# def fr(omega):
#     return 1 / 3 * (1 + exp(-1j * omega) + exp(-2j * omega))


# 5dii
# def fr(omega):
#     return 1 - exp(-1j * omega)


# 5diii
def fr(omega):
    return 1 / 3 * (1 - exp(-3j * omega))


omegas = linspace(-pi, pi, 1000)
frs = [fr(omega) for omega in omegas]
ms = [abs(fr) for fr in frs]
ps = [phase(fr) for fr in frs]

plt.plot(omegas, ms)
plt.xlabel("ω", fontsize=20)
plt.ylabel("|H(ω)|", fontsize=20)
plt.grid(True)
plt.show()

plt.plot(omegas, ps)
plt.xlabel("ω", fontsize=20)
plt.ylabel("Arg(H(ω))", fontsize=20)
plt.grid(True)
plt.show()
