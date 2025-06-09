---
layout: post
title: Comments on the Quantum Software Manifesto
---

EQSI has published the [Quantum Software
Manifesto](https://www.eqsi.org/about/quantum-software-manifesto/). It
aims to reach out to policy makers and the wider public to emphasize
the role of software in the development of quantum information
processing capabilities.

It does a good job at showing that the scientific community working on
quantum software is well aware of the associate challenges and tries
to address them in a way that is most beneficial for the economic
development of the field.

While I'm very happy that such initiative exists, I think parts could
be improved an dclarified. Here is a list of my main comments:

# Comments on "Introduction"

**"Quantum computers have the potential to solve important problems much faster"**

I would not say much faster, but much more efficiently. This is more
accurate in my opinion and also could possibly point toward advantages
other than speed — think about precision or energy.

**"quantum software"**

Indeed, but we could also point out that it needs both quantum and
classical software. And maybe we could mention a renewedd algorithmics
effort to create this software. In a sense, software might not reflect
fully what we need, wich is quite beyond creating a piece of software
like you would create a website. We need more quantum and classical
algorithms and turn them into software afterwards.

Writing this, I'm getting convinced that this is quite crucial for
stakeholders — policy makers and funding agencies in the first place —
to realize that this challenges are challenges we won't just be able
to solve by hiring standard software engineers. We need more
algorithmics oriented people coding; a need that we share with many
more advanced fields such as AI.

**"The broad and multidisciplinary field of quantum software"**

I think this is still too restrictive as creating a quantum programming
language or findindg good decoding algorithms for quantum error
correction might not feel covered by this.

# Comments on "New Quantum Algorithms"

**"quantum advantage on small and noisy quantum devices."**

While I of course fully agree with the start of the sentence stating
that the most challenging part is to find algorithms, I'm not sure I
would end it in a way that implicitely conditions the survival of
quantum information processing to our ability to find short term
advantage on small noisy devices.

The reason is that as academics our goal is to find new algorithms and
ways to characterize them. We can of course help the industry in their
quest to applications of quantum technologies in their field. This is
what makes this field so attractive to most of us: being able to do good
science while also creating real-world value. Yet, yielding an advantage
in the sense we usually use it in the field is well outside the realm of
algorithm design, as what will drive the development of quantum
technology is economics, not complexity-, precision-, etc- advantage.
Simply look at GPUs and their thriving development. Do they yield
advantage in terms of complexity? no, but they do yield a economic gain
to their users as they are cheaper to operate per operation than
traditional CPUs.

I would feel more comfortable in saying that throughout our algorithmic
efforts we dedicate to finding new applications both in the long term
and also the short term to quantum machines that will help motivate
further investments in the field yielding better and cheaper harder
hardware.

# Comments on "Verification and Testing"

**"verification and testing protocols will be essential"**

This seems to be part of a broader difficulty with programming quantum
computers: the fact that quantum commputers cannot be simulated
efficiently by classical means *and* that we cannot halt the computation
mid-way to inspect the state of the quantum systems is a double
challenge. This renders our two most powerful classical debugging tools
useless, thereby calling for new methods.

