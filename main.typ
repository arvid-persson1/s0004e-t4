#set heading(numbering: "1a.")
#let w = $hat(omega)$

=

==

$
y[n] &= (x[n])^2 \
     &= (A e^(i #w n + i phi))^2 \
     &= A^2 e^(2i #w n + 2i phi)
$

==

No, the frequency and phase have changed. This is because the system is not
linear.

=

==

$
cal(H)(#w) &= (1 - e^(-i #w)) (1 - 1/2 e^(-i #w + pi/3 i)) (1 - 1/2 e^(-i #w - pi/3 i)) \
           &= 1 - 1/2 e^(-i #w - pi/3 i) - 1/2 e^(-i #w + pi/3 i) + 1/4 e^(-2i #w) \
           &= 1 - 1/2 e^(-i #w) + 1/4 e^(-2i #w) \
==>      b &= {1, -1/2, 1/4} \
==>   y[n] &= x[n] - 1/2 x[n - 1] + 1/4 x[n - 2]
$

==

$
y[n] = h[n] &= delta[n] - 1/2 delta[n - 1] + 1/4 delta[n - 2] \
  &= cases(
    1    &"if" n = 0,
    -1/2 &"if" n = 1,
    1/4  &"if" n = 2,
    0    &"otherwise",
  )
$

==

$
x[n] = A e^(i #w n + i phi) &<==> y[n] = cal(H)(#w) x[n] \
x[n] != 0 & ==> cal(H)(#w) = 0 \
          &<==> e^(-i #w) = 1 or 1/2 e^(-i #w + pi/3 i) = 1 or 1/2 e^(-i #w - pi/3 i) \
          &<==> #w = 2pi k or [#w in.not RR] or [#w in.not RR] quad & k in ZZ \
          & ==> #w = 0
$

=

$
cal(H)(#w) &= (1 - e^(-i #w)) (1 - 1/2 e^(-i #w + pi/3 i)) (1 - 1/2 e^(-i #w - pi/3 i)) \
           &= (1 + e^(-2i #w)) (1 + e^(-3i #w)) \
           &= 1 + e^(-2i #w) + e^(-3i #w) + e^(-5i #w) \
==>   h[n] &= delta[n] + delta[n - 2] + delta[n - 3] + delta[n - 5]
$

Define $S: x |-> y$.

$
y[n] &= S(6 + 20cos(0.5pi n + 0.5pi) - 4delta[n - 3]) \
     &= S(6) + S(20cos(0.5pi n + 0.5pi)) - S(4delta[n - 3]) \
     &= cal(H)(0) 6 + cal(H)(0.5pi) f(n) - 4h[n - 3] \
     &= 4 dot.op 6 + 0f(n) - 4(delta[n - 3] + delta[n - 5] + delta[n - 6] + delta[n - 8]) \
     &= 24 - 4delta[n - 3] - 4delta[n - 5] - 4delta[n - 6] - 4delta[n - 8]) \
     &= cases(20 &"if" n in {3, 4, 6, 8}, 24 &"otherwise")
$

=

==

$
h[n] = 1/4 (delta[n] + delta[n - 1] + delta[n - 2] + delta[n - 3])
$

==

$
cal(H)(#w) = 1/4 (1 + e^(-i #w) + e^(-2i #w) + e^(-3i #w))
$

==

#figure(
  image("images/mag1.png"),
  caption: "Magnitude of frequency response.",
)

#figure(
  image("images/arg1.png"),
  caption: "Phase of frequency response.",
)

==

$
y[n] &= 5cal(H)(0) + 4cos(0.2pi n) cal(H)(0.2pi) + 3cos(0.5pi n) cal(H)(0.5pi) \
     &= 5/4 (1 + e^(-i 0) + e^(-2i 0) + e^(-3i 0)) \
     &+ cos(0.2pi n)(1 + e^(-i 0.2pi) + e^(-2i 0.2pi) + e^(-3i 0.2pi)) \
     &+ 3/4 cos(0.5pi n) (1 + e^(-i 0.5pi) + e^(-2i 0.5pi) + e^(-3i 0.5pi)) \
     &= 5/4 (1 + 1 + 1 + 1) + cos(0.2pi n) (1 - e^(-0.8pi i))/(1 - e^(-0.2pi i)) + 3/4 cos(0.5pi n) (1 - i - 1 + i) \
     &= 5 + (1 - e^(-0.8pi i))/(1 - e^(-0.2pi i)) cos(0.2pi n) \
$

==

$x_1[n] = x[n]$ for $n >= 0$. As $y_1[n] = ... + x_1[n - 3]$, $y_1[n] = y[n]$
for $n >= 3$.

=

==

Consider just the second system:

$
y_1[n] = (10 + x_1[n]) - (10 + x_1[n - 1]) = x_1[n] - x_1[n - 1].
$

The constant term is eliminated. This will also hold with the first system
included.

==

$
cal(H)(#w) &= cal(H)_1(#w) cal(H)_2(#w) \
           &= (1/3 (1 + e^(-i #w) + e^(-2i #w)))(1 - e^(-i #w)) \
           &= 1/3 (1 - e^(-3i #w))
$

==

$
y[n] = 1/3 (x[n] - x[n - 3])
$

==

#figure(
  grid(
    columns: 3,
    image("images/mag2.png"),
    image("images/mag3.png"),
    image("images/mag4.png"),
    image("images/arg2.png"),
    image("images/arg3.png"),
    image("images/arg4.png"),
  ),
  caption: "Magnitudes and phases of individual and cascade frequency
  responses. Enhance to see axis labels.",
)

=

$
     &h_2[n] = delta[n] - delta[n - 1] + delta[n - 2] - delta[n - 3] \
<==> &cal(H)_2(#w) = 1 - e^(-i #w) + e^(-2i #w) - e^(-3i #w)
$

==

$
cal(H)(#w) &= cal(H)_1(#w) cal(H)_2(#w) \
           &= (1 + 2e^(-i #w) + e^(-2i #w)) (1 - e^(-i #w) + e^(-2i #w) - e^(-3i #w)) \
           &= 1 + e^(-i #w) - e^(-4i #w) - e^(-5i #w)
$

==

$
h[n] = delta[n] + delta[n - 1] - delta[n - 4] - delta[n - 5]
$

#figure(
  image("images/res.png"),
  caption: "Impulse response of cascade system.",
)

==

$
y[n] = x[n] + x[n - 1] - x[n - 4] - x[n - 5]
$
