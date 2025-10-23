---
layout: post
title: "Exciting Advances in Quantum Verification: A Step Forward by Google Quantum AI"
---

On October 22, 2025, Google Quantum AI published a
[paper](https://www.nature.com/articles/s41586-025-09526-6)
demonstrating the ability to efficiently probe the dynamics of highly
entangled many-body systems—something that classical computers have
struggled with. They achieved this by using time-reversal techniques,
similar to the Loschmidt echo in NMR systems, combined with Randomized
Benchmarking. While this isn't directly related to my own work, the
techniques they developed are quite impressive.

What is particularly interesting to me is their accompanying [blog
post](https://research.google/blog/a-verifiable-quantum-advantage),
titled "A Verifiable Quantum Advantage," which discusses the
**importance of verification** in quantum computing.

In classical computing, we can always check the result of a
computation using smaller, trusted devices, or ultimately by hand. But
in the quantum world, this is impossible because a quantum advantage
inherently means a situation where classical computers cannot handle
the problem. If we didn’t find a way to verify the result, it would
imply that we would have to blindly trust the quantum computer.
Fortunately, this isn't the case.

Google suggests a simple method for verification: because the task is
to estimate the expectation value of an observable, and not a random
sample, the same computation can be repeated on a different quantum
computer, with the expectation that the results should match. While
this is a significant step forward, it oversimplifies the challenge.

The reason is that quantum circuits on different machines are not
identical. For example, Google's circuits are specifically tailored
with error mitigation strategies that are unique to its hardware.
Running the same circuit on a different chip, which has a different
error mitigation approach, will likely produce slightly different
results. So, the question remains: how close do the results need to be
in order to claim reproducibility?

This is where more advanced verification techniques come in. One such
technique is detailed in our paper, [Verifiable Blind Observable
Estimation: A Composably Secure Protocol for Near-Term Quantum
Advantage Tasks](https://arxiv.org/abs/2510.08548), which I
co-authored with [Bo
Yang](https://fr.linkedin.com/in/bo-yang-aa773419a) and [Elham
Kashefi](https://uk.linkedin.com/in/elham-kashefi-76b9286). While
Google’s machines can’t fully implement these protocols yet&#x2014;due
to their need for mid-circuit measurements&#x2014;our approach
provides a concrete way to guarantee the accuracy of quantum
computation results. By repeating computations and using advanced
error-handling techniques, we can provide a confidence level for the
results, ensuring that the quantum advantage can be verified in a
robust and reproducible way.

This is an exciting time for the quantum community, and it’s
encouraging to see verification gaining more attention. We still have
a long way to go, but this work marks a significant milestone in
establishing trust in quantum computation.
