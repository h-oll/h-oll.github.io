---
layout: post
title:  "Foundation and tools (of quantum information theory)"
tag:    Lecture
keywords: 
  - Tufte
---

<article id="content" class="content">
<header>
<h1 class="title">Foundations and tools</h1>
</header><p>
In this lecture, we introduce the foundational questions of information theory, both in the classical and quantum setting. This serves to emphasize the fact that quantum information theory is really information theory specialized to information carriers that abide by the axioms of quantum mechanics, and as a motivation to develop a set of tools that are useful to tackle more complex tasks.
</p>

<section id="outline-container-org5fd69c8" class="outline-2">
<h2 id="org5fd69c8"><span class="section-number-2">1.</span> State discrimination</h2>
<div class="outline-text-2" id="text-1">
<p>
State discrimination is the task of distinguishing between two known states given a system prepared in one of the two states. More precisely, we consider a setup where there is a sender and a receiver. The sender can prepare one of two states that are also known to the receiver. The receiver gets one such state and decides which of the two states was prepared by the sender.
</p>
</div>
<div id="outline-container-org51428eb" class="outline-3">
<h3 id="org51428eb"><span class="section-number-3">1.1.</span> Classical setting</h3>
<div class="outline-text-3" id="text-1-1">
<p>
In the classical setting, the state can be thought of a one-bit register that is prepared in \(0\) with some probability \(p\) or \(q\) depending whether the sender is preparing one of the two states \(P\) or \(Q\).<label id='fnr.1' for='fnr-in.1.1064233' class='margin-toggle sidenote-number'><sup class='numeral'>1</sup></label><input type='checkbox' id='fnr-in.1.1064233' class='margin-toggle'><span class='sidenote'><sup class='numeral'>1</sup>The interest of such task should be clear: the receiver is trying to recover the information about which state was prepared &#x2014; that could be one bit of a message for instance &#x2014; from the signal that he receives.</span> An extreme situation is when \(p = 1\) and \(q = 0\), that is \(P\) is a register with value 0, and \(Q\) is a register with value \(1\). Then it is easy to discriminate between the two upon reading the value of the register itself. Things get a bit more interesting whenever \(p,q \in (0,1)\). What is then the best guess that can be made about the state chosen by the sender?
</p>

<p>
The answer is given by applying Bayes rule after stating our prior on the behavior of the sender. Here, we assume that our initial knowledge about the behavior of the sender is that he can choose to prepare \(P\) or \(Q\) with equal probability, i.e. \(\frac 1 2\). If we denote by \(R\) the random variable that corresponds to the choice of \(P\) or \(Q\), then we have:
</p>
\begin{align}
\Pr(b = 0, R = P) = p/2, & \ \Pr(b = 1, R = P) = (1-p)/2  \\
\Pr(b = 0, R = Q) = q/2, & \ \Pr(b = 1, R = Q) = (1-q)/2.
\end{align}
<p>
This in turn gives<label id='fnr.2' for='fnr-in.2.3788092' class='margin-toggle sidenote-number'><sup class='numeral'>2</sup></label><input type='checkbox' id='fnr-in.2.3788092' class='margin-toggle'><span class='sidenote'><sup class='numeral'>2</sup>Remember that \(b \in \{0,1\}\) so that \(\Pr(b|R=P) = (1-b)p + b(1-p)\).</span>:
</p>
\begin{align}
\Pr(R = P | b) & = \frac{\Pr(b, R = P) }{\Pr(b)} = \frac{(1-b)\frac p 2 + b \frac{1-p}{2}}{(1-b)\frac{p+q}{2} + b (1-\frac{p+q}{2})} \\
\Pr(R = Q | b) & = \frac{\Pr(b, R = Q) }{\Pr(b)} = \frac{(1-b)\frac q 2 + b \frac{1-q}{2}}{(1-b)\frac{p+q}{2} + b (1-\frac{p+q}{2})}.
\end{align}
<p>
Given this, upon observing \(b\), the receiver should decide that \(R = P\) whenever \(\Pr(R = P | b) \geq \Pr(R = Q | b)\), i.e. whenever:
</p>
\begin{align}
p-q & \geq 0 \mbox{ for } b = 0\\
 q-p & \geq 0 \mbox{ for } b = 1.
\end{align}
<p>
By denoting \(\hat R\) the random variable that represents the choice of the receiver, we can now assess the success probability \(\Pr(\hat R = R)\). This probability is equal to:
</p>
\begin{align}
Pr(\hat R = R ) & = \Pr(b=0, R = P) \one_{p\geq q} + \Pr(b=1, R = P) \one_{p\leq q} \nonumber \\
& \qquad + \Pr(b=0, R = Q) \one_{q\geq p} + \Pr(b=1, R = Q) \one_{q\leq p} \\
& = \frac{p + 1 - q}{2} \one_{p\geq q} + \frac{1-p + q}{2} \one_{p\leq q}\\
& = \frac 1 2 + \frac 1 2 |p - q|.
\end{align}

<div text="Trace distance for classical probabilities" class="definition" id="org28169bf">
<p>
The trace distance<label id='fnr.3' for='fnr-in.3.9132099' class='margin-toggle sidenote-number'><sup class='numeral'>3</sup></label><input type='checkbox' id='fnr-in.3.9132099' class='margin-toggle'><span class='sidenote'><sup class='numeral'>3</sup>The normalization of the trace distance varies depending on authors. It is often normalized using an additional \(\frac{1}{2}\) factor so that the trace distance is between 0 and 1 for probability distributions.</span> between two probability distributions \(P\) and \(Q\) over some event space \(\Gamma\) is:
</p>
\begin{equation}
\| P - Q \|_1 = \sum_{\gamma \in \Gamma} |\Pr(P = \gamma) - \Pr(Q =\gamma)|.
\end{equation}
<p>
For binary variables \(P\) and \(Q\) parametrized by \(p \coloneqq \Pr(P=0)\) and \(q\coloneqq \Pr(Q=0)\) we have \(\|P-Q\|_1 = 2 |p-q|\).
</p>

</div>

<p>
Using this definition, the above success probability for the classical state discrimination is \(\frac{1}{2}(1 + \frac{1}{2}\| P - Q\|_1)\). This means that the trace-distance is an operational measure of similarity between probability distributions. It characterizes how well a receiver can perform the discrimination task presented above, and one recovers the usual intuition that when \(p = 1\) and \(q = 0\), \(\|P - Q \|_1 = 2\) so that the probability of success is 1, while for \(p = q\), both probability distributions are identical so that \(\|P - Q\|_1 = 0\), and the receiver needs to randomly guess the value of \(R\). This intuition can be made more formal by noticing that \(\| \cdot \|_1\) defines a metric over the space of probability distributions:
</p>
<ul class="org-ul">
<li>it is symmetric \(\| P - Q \|_1 = \| Q - P \|_1\)</li>
<li>it is non negative \(\| P-Q \|_1 \geq 0\)</li>
<li>it is definite \(\| P - Q \|_1 = 0 \Rightarrow P = Q\)</li>
<li>and it satisfies the triangle inequality \(\|P - R\|_1 \leq \|P - Q\|_1 + \|Q - R \|_1\).</li>
</ul>
</div>
</div>

<div id="outline-container-org5aac8e0" class="outline-3">
<h3 id="org5aac8e0"><span class="section-number-3">1.2.</span> Quantum setting</h3>
<div class="outline-text-3" id="text-1-2">
</div>
<div id="outline-container-org89f9259" class="outline-4">
<h4 id="org89f9259"><span class="section-number-4">1.2.1.</span> Trace norm and trace distance for operators</h4>
<div class="outline-text-4" id="text-1-2-1">
<div text="Trace norm for operators" class="definition" id="org5b03d51">
<p>
The <i>trace norm</i> of \(A \in Hom(\mathcal H, \mathcal H')\) is:
</p>
\begin{equation}
\|A\|_1 = \tr(|A|),
\end{equation}
<p>
with \(|A| = \sqrt{A^\dagger A}\).
</p>

</div>

<div class="property" id="org0a7362b">
<p>
The trace norm of \(A\) is the sum of its singular values.
</p>

</div>

<div class="proof" id="org06c8f9a">
<p>
Decompose \(A = U \Delta V\) where \(U\) and \(V\) are unitary matrices and \(\Delta\) is a rectangular diagonal matrix with non-negative (singular) values. Then expanding \(A^\dagger A = V \Delta^\dagger\Delta V\) shows that \(A^\dagger A\) is a Hermitian matrix with singular values equal to the squares of those in \(\Delta\).
</p>

</div>

<p>
It is also easy to show that:
</p>

<div class="property" id="org2d406c2">
<ul class="org-ul">
<li>\(\|A\|_1 \geq 0\) and \(\|A\|_1 = 0 \Leftrightarrow A = 0\);</li>
<li>\(\| \alpha A \|_1 = |\alpha| \| A \|_1\) for \(\alpha \in \mathbb C\);</li>
<li>\(\| U A V^\dagger \|_1 = \| A \|_1\) for \(U\) and \(V\) isometries.</li>
</ul>

</div>

<div class="property" id="orga84f596">
<p>
For \(A \in End(\mathcal H)\),
</p>
\begin{equation} \|A\|_1 = \max_U |\tr(UA)|,\end{equation}
<p>
where \(U\) is a unitary.
</p>

</div>

<div class="proof" id="org24f91be">
<p>
We use the SVD of \(A = V \Delta W\) and write:
</p>
\begin{align}
|\tr(UA) |
& = |\tr(UV\Delta W)| = \tr((\sqrt{\Delta})(\sqrt \Delta W UV)) \\
& \leq \sqrt{\tr(\sqrt \Delta \sqrt \Delta)} \sqrt{\tr ((\sqrt \Delta W UV)^\dagger (\sqrt \Delta W UV))} \\
& = \tr(\Delta) \\
& = \| A \|_1
\end{align}
<p>
where we have used Cauchy-Schwartz inequality<label id='fnr.4' for='fnr-in.4.7315089' class='margin-toggle sidenote-number'><sup class='numeral'>4</sup></label><input type='checkbox' id='fnr-in.4.7315089' class='margin-toggle'><span class='sidenote'><sup class='numeral'>4</sup>\(|\langle A,B\rangle| \leq \|A\| \|B\|\) and equality if \(A \propto B\).</span> for the HS inner product. The equality is obtained for \(W U V = \one_{\mathcal H}\).
</p>

</div>

<p>
From there we obtain the triangle inequality:
</p>
<div text="Triangle inequality for the Trace norm" class="property" id="orgcb235c5">
<p>
For \(A,B \in End(\mathcal H)\),
</p>
\begin{equation}
\|A + B \|_1 \leq \|A\|_1 + \|B \|_1.
\end{equation}

</div>
<p>
Note that this holds indeed for \(A,B \in Hom(\mathcal H, \mathcal H')\).
</p>

<div class="proof" id="orga70f8e4">
<p>
We use the variational characterization of the Trace-norm
</p>
\begin{align}
\|A + B\|_1 & = \max_U |\tr(U(A+B))| \\
& = |\tr(\hat U (A+B))| \\
& = |\tr(\hat U A) + \tr(\hat UB)| \\
& \leq |\tr(\hat U A)| + |\tr(\hat UB)| \\
& \leq \max_U |\tr(UA)| + \max_U |\tr(UB)| \\
& = \|A\|_1 + \|B\|_1,
\end{align}
<p>
Where \(\hat U\) is the maximizing \(U\) of the first line.
</p>

</div>

<p>
Using the triangle inequality, we then get the convexity of the trace norm:
</p>
<div class="property" id="org772c2c4">
<p>
For \(A,B \in End(\mathcal H, \mathcal H')\) and \(\lambda \in [0,1]\)
</p>
\begin{equation}
\| \lambda A + (1-\lambda) B \|_1 \leq \lambda \|A\|_1 + (1-\lambda) \|B\|_1.
\end{equation}

</div>

<div text="Trace distance" class="definition" id="orgec9f0c2">
<p>
For \(A,B \in Hom(\mathcal H, \mathcal H')\) the <i>trace-distance</i> between \(A\) and \(B\) is
</p>
\begin{equation}
\|A-B\|_1.
\end{equation}
<p>
For \(\rho\) and \(\sigma\) density matrices we have \(0\leq \|\rho-\sigma\|_1 \leq 2\) &#x2014; which often motivates the use of the <i>normalized</i> trace-distance equal to \(\frac 1 2 \| \rho - \sigma \|_1\).
</p>

</div>
</div>
</div>

<div id="outline-container-org7769943" class="outline-4">
<h4 id="org7769943"><span class="section-number-4">1.2.2.</span> Trace distance as an operational measure of distinguishability</h4>
<div class="outline-text-4" id="text-1-2-2">
<p>
The interest of the trace distance for density matrices is its operational interpretation as a measure of the ability to discriminate <i>quantum states</i>.
</p>

<div class="property" id="org991e4e3">
<p>
For \(\rho, \sigma\) density matrices , we have
</p>
\begin{equation}
\frac{1}{2} \|\rho -\sigma\|_1 = \max_{0 \leq K \leq \one} \tr(K(\rho-\sigma))
\end{equation}

</div>

<div class="proof" id="org94b1c41">
<p>
Diagonalize \(\rho-\sigma\) and consider \(\Pi_{>0}\) the projector onto the subspaces with positive eigenvalues and \(\Pi_{<0}\) the projector onto the subspace with negative eigenvalues. Then define \(R\coloneqq \Pi_{>0} (\rho - \sigma) \Pi_{>0}\) and \(S\coloneqq \Pi_{<0} (\sigma - \rho) \Pi_{<0}\) so that \(R,S\) are PSD and \(|\rho-\sigma| = R + S\). Now because the positive and negative eigenvalue subspaces are orthogonal we have
</p>
\begin{equation}
\| \rho - \sigma\|_1 = \tr(|\rho - \sigma|) = \tr(R) + \tr(S).
\end{equation}
<p>
But we also have \(\tr(\rho - \sigma) = 0 = \tr(R) - \tr(S)\) so that \(\| \rho - \sigma\|_1 = 2 \tr(R)\).
</p>

<p>
Now by construction \(\tr(R) = \tr(\Pi_{>0} (\rho - \sigma) \Pi_{>0}) = \tr(\Pi_{>0} (\rho-\sigma))\). Finally, for any \(0 \leq K \leq \one\), we have
</p>
\begin{align}
\tr(K(\rho-\sigma)) & = \tr(K(R-S)) \\
& \leq \tr(K R) \\
& \leq \tr(R) \\
& = \frac{1}{2} \| \rho - \sigma\|_1.
\end{align}
<p>
So that \(R\) is the maximizing \(K\).
</p>

</div>


<p>
The above property states that the trace-distance corresponds to the biggest probability difference for obtaining an outcome in a measurement of \(\rho\) and \(\sigma\). In our state discrimination setting the sender now has the possibility of randomly sending \(\rho\) or \(\sigma\) with equal probability to the receiver. The receiver in turn performs a measurement with POVM elements \(K_0,K_1\) such that if it gets \(K_0\), he declares to have received \(\rho\) and if he gets \(K_1\) he declares \(\sigma\). In such case, the success probability is:
</p>
\begin{equation}
\frac 1 2 \tr(K_0 \rho) + \frac 1 2 \tr(K_1 \sigma).
\end{equation}
<p>
Using \(K_0 + K_1 = \one\), we obtain that the success probability is
</p>
\begin{equation}
\frac 1 2 (1 + \tr (K_0 (\rho-\sigma)))
\end{equation}
<p>
Optimizing over \(K_0\) can be done using the above property, and the maximizing \(K_0\) is the projection onto the positive eigenvalue subspace of \(\rho - \sigma\). In such case, we then obtain a success probability of
</p>
\begin{equation}
\frac 1 2 \left( 1 + \frac 1 2 \| \rho - \sigma \|_1\right),
\end{equation}
<p>
which corresponds to the generalization of the previous result for classical probability distributions.
</p>
</div>
</div>
</div>
</section>

<section id="outline-container-orgee4d209" class="outline-2">
<h2 id="orgee4d209"><span class="section-number-2">2.</span> Channel discrimination</h2>
<div class="outline-text-2" id="text-2">
<p>
Channel discrimination is another foundational information theoretic task that enlights some of the differences between quantum and classical information. There, we again have two parties, but in a slightly different setting: the first one, say Alice, is preparing a quantum system in state \(\rho\), the second one, say Bob, applies to it a CPTP map at random from a set \(\{\mathcal E, \mathcal F\}\) and gives back the quantum system to Alice, which then measures it. The task of Alice is to discriminate between \(\mathcal E\) and \(\mathcal F\).
</p>
</div>

<div id="outline-container-orgf38c759" class="outline-3">
<h3 id="orgf38c759"><span class="section-number-3">2.1.</span> Naive approach</h3>
<div class="outline-text-3" id="text-2-1">
<p>
Channel discrimination can be cast into state discrimination. After all, Alice could consider that she receives at random either \(\mathcal E(\rho)\) or \(\mathcal F(\rho)\) which she can discriminate using the optimal strategy seen above. The maximum success probability in this case is:
</p>
\begin{equation}
\frac 1 2 \left ( 1 + \frac 1 2 \| \mathcal E(\rho) - \mathcal F(\rho) \|_1 \right).
\end{equation}
<p>
Because Alice can optimize over \(\rho\), we would naturally be interested in
</p>
\begin{equation}
\max_{\rho} \frac 1 2 \left ( 1 + \frac 1 2 \| \mathcal E(\rho) - \mathcal F(\rho) \|_1 \right),
\end{equation}
<p>
which points at \(\max_\rho \| \mathcal E(\rho) - \mathcal F(\rho) \|_1\) as a measure of distinguishability between \(\mathcal E\) and \(\mathcal F\).
</p>
</div>
</div>

<div id="outline-container-org8bf8b55" class="outline-3">
<h3 id="org8bf8b55"><span class="section-number-3">2.2.</span> Super-dense coding</h3>
<div class="outline-text-3" id="text-2-2">
<p>
In fact, there is more that can be done in order to discriminate channels.
</p>

<p>
To get an intuition we will consider the following channels: \(\mathcal E(\cdot) \coloneqq I(\cdot)I\) and \(\mathcal F(\cdot) \coloneqq X(\cdot) X\), One can perform the optimization above very easily and obtain that the optimal state to construct is \(\ket 0\) and the measurement is \(\{\ketbra 0, \ketbra 1\}\). The success probability is 1 as the resulting state is \(\ket 0\) for \(\mathcal E\) and \(ket 1\) for \(\mathcal F\), which are perfectly distinguishabel.
</p>

<p>
In a similar fashion, if \(\mathcal F(\cdot) \coloneqq Z(\cdot)Z\), then the optimal state is \(\ket +\) and the measurement is \(\{\ketbra +, \ketbra - \}\). The second case can actually be seen as the first one rotated by a Hadamard gate<label id='fnr.5' for='fnr-in.5.3271361' class='margin-toggle sidenote-number'><sup class='numeral'>5</sup></label><input type='checkbox' id='fnr-in.5.3271361' class='margin-toggle'><span class='sidenote'><sup class='numeral'>5</sup>\(H\ket 0 = \ket +\) and \(H\ket 1 = \ket -\).</span>, and from there it is clear that using the naïve approach there is no single initial state and optimal measurement that can distinguish the 3 channels \(I, X, Z\) &#x2014; and a fortiori \(I, X, Y, Z\) &#x2014; with probability of success equal to 1.
</p>

<p>
Yet, there is a situation where discriminating between \(I,X,Y,Z\) is possible with success probability 1, which can be derived from the existence of the super dense coding protocol.
</p>

<div text="Super dense coding" class="definition" id="orgd4ece8e">
<p>
Super dense coding is a protocol allowing a sender (Alice) to send a 2-bit message \(m \in \{0,1,2,3\}\) to a receiver (Bob) by sending half a pre-established EPR-pair through a perfect quantum channel.
</p>

<ol class="org-ol">
<li>Alice and Bob share an EPR pair \(\frac 1 {\sqrt 2} \left(\ket{00} + \ket{11}\right)\);</li>
<li>Alice chooses \(m\) and depending on its value she applies \(I,X,Y,Z\) to her half of the EPR-pair, and sends it to Bob</li>
<li>Bob performs a Bell State Measurement on the two qubits (the received half and his own half)</li>
<li>He sets the received message \(\hat m\) depending on the observed Bell state:</li>
</ol>
\begin{align}
\frac{1}{\sqrt 2}\left(\ket{00} + \ket{11}\right) & \rightarrow \hat m = 0 \\
\frac{1}{\sqrt 2}\left(\ket{00} - \ket{11}\right) & \rightarrow \hat m = 3 \\
\frac{1}{\sqrt 2}\left(\ket{10} + \ket{01}\right) & \rightarrow \hat m = 1 \\
\frac{1}{\sqrt 2}\left(\ket{10} - \ket{10}\right) & \rightarrow \hat m = 2
\end{align}

</div>

<p>
The interest of this protocol for channel discrimination comes from the fact that we can imagine that Alice chooses one of the \(I,X,Y,Z\) channel to apply to half an EPR-pair prepared by Bob, who then performs a measurement that perfectly distinguishes the 4 possibilities. This obviously violates the conclusion we drew from the naïve approach. What is the special ingredient that allows this? The use of EPR-pair, i.e. a maximally entangled state, for which one half acts as a reference. The naïve approach didn't allow this as the channel was implicitely applied to the whole state, while here it is only applied partially. In fact, this shouldn't come too much as a surprise as we have seen that a channel is characterized by its Choi state, obtained by applying the channel onto half a maximally entangled state.
</p>
</div>
</div>

<div id="outline-container-org33f350b" class="outline-3">
<h3 id="org33f350b"><span class="section-number-3">2.3.</span> Diamond norm</h3>
<div class="outline-text-3" id="text-2-3">
<p>
Given the intuition built through the previous example, we realize that the optimization over \(\rho\) is not enough. It should be supplemented by an optimization over the size of the Hilbert-space so that the success probability can be written:
</p>
\begin{equation}
\frac 1 2 \left ( 1 + \frac 1 2 \sup_{\mathcal H_R} \max_{\rho} \| (\mathcal E \otimes \one_{\mathcal H_R})(\rho) - (\mathcal F \otimes \one_{\mathcal H_R})(\rho) \|_1\right ),
\end{equation}
<p>
where \(\mathcal E, \mathcal F\) are CPTP maps from \(\mathcal H\) to \(\mathcal H'\) and \(\rho\) is a density matrix over \(\mathcal H \otimes \mathcal H_R\).
</p>

<p>
This defines an induced<label id='fnr.6' for='fnr-in.6.8629263' class='margin-toggle sidenote-number'><sup class='numeral'>6</sup></label><input type='checkbox' id='fnr-in.6.8629263' class='margin-toggle'><span class='sidenote'><sup class='numeral'>6</sup>This means a norm over states is used to define a norm over operators using some optimization procedure</span> norm over channels:
</p>
<div text="Diamond norm" class="definition" id="orged06e9f">
<p>
For \(\mathcal E\) a CPTP map from \(\mathcal H\),
</p>
\begin{equation}
\| \mathcal E \|_{\diamond} \coloneqq \max_{\ket \psi \in \mathcal H \otimes \mathcal H} \| (\mathcal E \otimes \one_{\mathcal H})(\ketbra \psi) \|_1
\end{equation}

</div>

<div class="remark" id="org98a0196">
<p>
Note that above it is enough to optimize over pure states &#x2014; using the convexity of the trace distance. Additionally, the optimization over \(\mathcal H_R\) that was expected is omitted in the above definition as it is indeed sufficient to consider \(\mathcal H_R= \mathcal H\) using the fact that the Schmidt rank of a state over \(\mathcal H \otimes \mathcal H_R\) is bounded by \(\dim \mathcal H\).
</p>

</div>

<p>
Finally, and similarly to the trace-distance, one can define the <i>diamond distance</i> between CPTP maps:
</p>
<div text="Diamond distance" class="definition" id="orgb0d0a2b">
<p>
For \(\mathcal E, \mathcal F\) two CPTP maps from \(\mathcal H\) to \(\mathcal H'\), the <i>diamond distance</i> between them is
</p>
\begin{equation}
\| \mathcal E - \mathcal F \|_\diamond
\end{equation}

</div>
</div>
</div>
</section>

<section id="outline-container-org6dd3e6e" class="outline-2">
<h2 id="org6dd3e6e"><span class="section-number-2">3.</span> Other measures of distance</h2>
<div class="outline-text-2" id="text-3">
</div>
<div id="outline-container-org1b2788f" class="outline-3">
<h3 id="org1b2788f"><span class="section-number-3">3.1.</span> Fidelity</h3>
<div class="outline-text-3" id="text-3-1">
<p>
We have seen that the trace-distance arises quite naturally from the state discrimination task. One might also argue that another well motivated notion of distance between two pure quantum states \(\ket \psi, \ket \varphi\) is the squared overlap between the states: \(|\braket{\psi}{\varphi}|^2\). It arises from the following protocol. Again a sender prepares either \(\ket \psi\) or \(\ket \varphi\), and the receiver tries to distinguish one from the other. To do that, instead of using the optimal measurement seen earlier, he could decide to perform the measurement \(\{\ketbra \psi, \one - \ketbra \psi\}\). If the first outcome is obtained, it will decide that \(\ket \psi\) was send, and \(\ket \varphi\) otherwise. The probability of error given \(\ket \varphi\) is sent is therefore \(\tr(\ketbra \psi \ketbra \varphi) = |\braket{\psi}{\varphi}|^2\). Hence, the higher the fidelity, the harder to discriminate \(\ket \psi\) from \(\ket \varphi\) in this test.
</p>

<div text="Pure state fidelity" class="definition" id="orgf11cecf">
<p>
The <i>pure state fidelity</i> for \(\ket \psi, \ket \varphi \in \mathcal H\) is defined as:
</p>
\begin{equation}
F(\ket \psi, \ket \varphi) \coloneqq |\braket{\psi}{\varphi}|^2
\end{equation}

</div>

<div class="property" id="org0309529">
\begin{align}
& F(\ket\psi, \ket \varphi) = F(\ket \varphi, \ket\psi) \\
& 0\leq F(\ket\psi,\ket\varphi) \leq 1
\end{align}

</div>

<div class="remark" id="orgd963aaf">
<p>
There is a notion of classical fidelity for probability distributions \(p(x), q(x)\) called <i>Bhattacharyya overlap</i><label id='fnr.7' for='fnr-in.7.6606673' class='margin-toggle sidenote-number'><sup class='numeral'>7</sup></label><input type='checkbox' id='fnr-in.7.6606673' class='margin-toggle'><span class='sidenote'><sup class='numeral'>7</sup>Show that for classical states expressed using quantum systems, the two correspond</span>:
</p>
\begin{equation}
F(p,q) = \left(\sum_x \sqrt{p(x)q(x)}\right)^2.
\end{equation}

</div>

<p>
Using this definition for pure states, it would be useful to extend it to mixed states. As we will see this is not so easy in the general case, so we can build some intuition first. So we start for the pure-mixed case, i.e. the fidelity \(F(\ket\psi,\rho)\). In such case, one way to recover the pure-state fidelity is to consider \(\rho\) as a statistical mixture of the states appearing in its spectral decomposition. More precisely, we define the <i>expected fidelity</i> of \(\rho\) against \(\ket\psi\) as the expectation value of the pure state fidelity considering that \(\rho\) is prepared from its spectral decomposition:
</p>
\begin{equation}
F(\ket\psi,\rho) \coloneqq \sum_\lambda p_\lambda |\braket{\psi}{\varphi_\lambda}|^2 = \bra \psi \rho \ket \psi,
\end{equation}
<p>
where \(\rho = \sum_\lambda p_\lambda \ketbra{\varphi_\lambda}\) with \(\{\ket{\varphi_\lambda}\}_\lambda\) an orthonormal set.
</p>

<p>
The crucial ingredient in the above generalization is that the spectral decomposition offers a natural way to recover pure states fidelity only, and a way to recombine each of the individual fidelities. With this in mind, a possibility &#x2014; that is actually correct &#x2014; would be to rely on the purification of mixed states to recover the pure state situation. This defined the (Uhlmann) fidelity, tht works for mixed states and coincide with the pure state and expected fidelity whenever we are in a pure-pure or pure-mixed setting:
</p>
<div text="Uhlmann Fidelity" class="definition" id="org237f3bb">
<p>
For \(\rho, \sigma\) density matrices over \(\mathcal H_A\) and \(\ket \psi, \ket \varphi \in \mathcal H_A \otimes \mathcal H_R\) such that \(\tr_R (\ketbra \psi) = \rho\) and \(\tr_R( \ketbra \varphi) = \sigma\), the Uhlmann fidelity is<label id='fnr.8' for='fnr-in.8.7668349' class='margin-toggle sidenote-number'><sup class='numeral'>8</sup></label><input type='checkbox' id='fnr-in.8.7668349' class='margin-toggle'><span class='sidenote'><sup class='numeral'>8</sup>Remember that (i) purifications are equivalent up to a unitary on the reference system part &#x2014; hence starting from \(\ket \psi\) and \(\ket \varphi\) one can obtain all of them by applying \(U\) for \(\ket \psi\) and \(V\) for \(\ket \varphi\) &#x2014; and (ii) that maximizing over \(U\) and \(V\) is overkill as they impact the value to optimize through  \(U^\dagger V\) which is a unitary itself.</span>
</p>
\begin{equation}
F(\rho,\sigma) = \max_{U}|\bra\psi (\one_A \otimes U) \ket \varphi|^2.
\end{equation}

</div>

<p>
Fortunately, Uhlmann's theorem allows for a closed-form expression of the fidelity:
</p>
<div text="Uhlmann's theorem" class="theorem" id="org18db6a3">
<p>
For \(\rho,\sigma\) density matrices over \(\mathcal H_A\),
</p>
\begin{equation}
F(\rho,\sigma) = \| \sqrt \rho \sqrt \sigma \|_1^2 = \left (\tr(\sqrt{\sqrt\sigma \rho \sqrt \sigma})\right)^2
\end{equation}

</div>

<div class="proof" id="org329b3d6">
<p>
Given \(\rho\) we can take the purification \(\ket \psi = (\sqrt{\rho} \otimes \one_R) \ket\Gamma\) where \(\ket\Gamma = \sum_i \ket{i}_A\otimes \ket{i}_R\) is a unnormalized maximally entangled state over \(\mathcal H_A \otimes \mathcal H_R\), and similarly for \(\sigma\). Then<label id='fnr.9' for='fnr-in.9.8429835' class='margin-toggle sidenote-number'><sup class='numeral'>9</sup></label><input type='checkbox' id='fnr-in.9.8429835' class='margin-toggle'><span class='sidenote'><sup class='numeral'>9</sup>It is easy to show that for any \(A\in End(\mathcal H)\), \((A\otimes\one) \ket\Gamma = (\one\otimes A^T)\ket\Gamma\) with \(\ket\Gamma\) the maximally entangled state on \(\mathcal H \otimes \mathcal H\) by directly expressing the matrix elements \(\ketbra{i}{j}\). It is also straightforward using the same appraoch to show that \(\tr(A) = \bra\Gamma (A\otimes \one) \ket \Gamma\).</span> we have for any \(U\):
</p>
\begin{align}
|\bra \psi (\one_A \otimes U) \ket \varphi |^2 & = |\bra{\Gamma} (\sqrt{\rho}\sqrt{\sigma} \otimes U) \ket \Gamma|^2 \\
& |\bra \Gamma (\sqrt{\rho}\sqrt{\sigma}U^T \otimes \one_R \ket \Gamma\|^2 \\
& = |\tr(\sqrt\rho \sqrt\sigma U^T)|^2.
\end{align}
<p>
Now maximizing \(U\) and using the variational characterization of the trace-distance we get:
</p>
\begin{equation}
\max_U |\tr(\sqrt\rho \sqrt\sigma U^T)|^2 = \|\sqrt\rho\sqrt\sigma\|_1^2.
\end{equation}

</div>

<div class="property" id="org2d17c75">
<ul class="org-ul">
<li>\(F\) is symmetric</li>
<li>\(F\) is multiplicative with respect to tensor products: \(F(\rho_A\otimes \rho_B, \sigma_A\otimes \sigma_B) = F(\rho_A, \sigma_A)F(\rho_B, \sigma_B)\)</li>
<li>\(F\) is invariant under isometries</li>
<li>\(F\) is non-decreasing over partial trace<label id='fnr.10' for='fnr-in.10.9070986' class='margin-toggle sidenote-number'><sup class='numeral'>10</sup></label><input type='checkbox' id='fnr-in.10.9070986' class='margin-toggle'><span class='sidenote'><sup class='numeral'>10</sup>The idea is to use the variational characterization of \(F\) and realize that the lhs optimizes over unitaries on the reference system, while the rhs optimizes over unitaries on the reference system and \(B\). This means that forgetting about one part of the system makes it easier to take one state for the other. This is generalized in the next property. There, if you see \(\mathcal E\) as a possibly noisy evolution, it will improve the fidelity between the states. This kind of inequality is also referred to as <i>Data processing inequality</i>. Such inequality apply to various kind of quantities and are very useful in characterizing the evolution of soem quantities under noisy processes.</span>: \(F(\rho_{AB}, \sigma_{AB}) \leq F(\rho_A, \sigma_A)\)</li>
<li>\(F\) is monotone under CPTP maps: \(F(\rho,\sigma) \leq F(\mathcal E (\rho), \mathcal E(\sigma))\)</li>
<li>\(\sqrt F\) is jointly concave with respect to its arguments: \(\sqrt F(\lambda \rho + (1-\lambda) \rho', \lambda \sigma + (1-\lambda) \sigma') \geq \lambda\sqrt F(\rho,\sigma) + (1-\lambda) \sqrt F(\rho',\sigma')\)</li>
<li>\(F\) is concave wrt one of its arguments: \(F(\lambda \rho + (1-\lambda)\rho',\sigma) \geq \lambda F(\rho, \
  \sigma) + (1-\lambda) F(\rho', \sigma)\)</li>
</ul>

</div>
</div>
</div>
</section>
<section id="outline-container-org50cab28" class="outline-2">
<h2 id="org50cab28"><span class="section-number-2">4.</span> Classical entropies and information</h2>
<div class="outline-text-2" id="text-4">
</div>
<div id="outline-container-org8f592e8" class="outline-3">
<h3 id="org8f592e8"><span class="section-number-3">4.1.</span> Overview of the operational definition of information and entropy</h3>
<div class="outline-text-3" id="text-4-1">
<p>
Information is a concept that was quantified by Shannon in 1948. As for distance measures, it stems out of a simple foundational task involving sending messages from Alice to Bob. This task is called <i>source coding</i> and corresponds to Alice sending messages seen as random bit strings picked at random from a given distribution &#x2014; it could be for instance random words from the dictionary, random sentences from a book, or random paragraphs from a corpus of texts <label id='fnr.11' for='fnr-in.11.6529356' class='margin-toggle sidenote-number'><sup class='numeral'>11</sup></label><input type='checkbox' id='fnr-in.11.6529356' class='margin-toggle'><span class='sidenote'><sup class='numeral'>11</sup>Think about chatGPT like situations where the entire web was scraped to gain knowledge about correlations between sentences.</span>. The objective of this task is to encode the message in such a way so that Alice sends the minimum number of bits to Bob, while still allowing Bob to decode the message perfectly. That is we want to find the best possible compression for the source emitting the messages.
</p>

<p>
Shannon's source coding theorem states the following.  Let a source emit words out of an alphabet \(\Sigma\) &#x2014; say \(\{A,B,C,\ldots\}\). Consider \(f\) an encoding of these words into words over an alphabet \(\Pi\) &#x2014; say \(\{0, 1\}\) &#x2014; that is uniquely decodable<label id='fnr.12' for='fnr-in.12.9014515' class='margin-toggle sidenote-number'><sup class='numeral'>12</sup></label><input type='checkbox' id='fnr-in.12.9014515' class='margin-toggle'><span class='sidenote'><sup class='numeral'>12</sup>This means that any input word is mapped to a single output codeword</span>. Then we can consider an optimal \(f\) that is such that when \(X\) is drawn at random from the words on \(\Sigma\) according to a known probability distribution, the expected length of the encoding \(|f(X)|\) is minimal &#x2014; i.e. we consider \(f\) such that \(\mathbb E(|f(X)|)\) is miminum. Then
</p>
\begin{equation}
\frac{H(X)}{\log_2(|\Pi|)} \leq \mathbb{E}[|f(X)|]  < \frac{H(X)}{\log_2(|\Pi|)} + 1,
\end{equation}
<p>
where \(H(X) \coloneqq - \sum_x \Pr(X=x)\log_2(\Pr(X=x))\) is the entropy of \(X\). In other words, this theorem states that the best encoding \(f\) will produce codewords whose expected length is given by \(H(X)/\log_2(|\Pi|)\). If \(\Pi\) is taken to be bits, then \(H(X)\) directly measures the expected length of the codewords. This means that the average information content of \(X\) is \(H(X)\) bits as it is not possible to reduce the length of the codewords any further<label id='fnr.13' for='fnr-in.13.9959021' class='margin-toggle sidenote-number'><sup class='numeral'>13</sup></label><input type='checkbox' id='fnr-in.13.9959021' class='margin-toggle'><span class='sidenote'><sup class='numeral'>13</sup>Lets beat that bound! Consider meassages made out of the 26 letters and 10 numerals, chosen uniformly at random. Consider the <a href="https://en.wikipedia.org/wiki/Morse_code#/media/File:International_Morse_Code.svg">Morse encoding</a>. We have \(H(X) = - \log_2(1/36) = 5.16\), while we see that all letters are encoded using at most 4 symbols and numerals exactly 5. Hence, we have \(\mathbb{E}(|f(X)|) \leq 4 \times \frac{26}{36} + 5 \times \frac{10}{36} = 4.22\). What's wrong?</span>
</p>

<p>
A second important task put forth by Shannon is called <i>channel coding</i>. It corresponds to Alice sending messages to Bob, but this time through a noisy channel. The goal is then to find out how to encode the message, possibly adding some redundancy, so that Bob can perfectly retreive the message of Alice with very high probability.
The important quantity that is highlighted by this task is the mutual information, which is derived from entropy (see below).
</p>

<p>
Here, instead of going through the proofs of Shannon's theorems &#x2014; i.e. source and channel coding &#x2014; we will take an axiomatic approach to defining entropy, yet I encourage you to read Shannon's paper and see the concept of entropy and mutual information emerge from these operational tasks.
</p>
</div>
</div>

<div id="outline-container-orgf647f8d" class="outline-3">
<h3 id="orgf647f8d"><span class="section-number-3">4.2.</span> Axiomatic definition</h3>
<div class="outline-text-3" id="text-4-2">
</div>
<div id="outline-container-org5ab3bfe" class="outline-4">
<h4 id="org5ab3bfe"><span class="section-number-4">4.2.1.</span> Entropy of events</h4>
<div class="outline-text-4" id="text-4-2-1">
<p>
We consider  \((\Omega, \mathcal E, P)\) a probability space<label id='fnr.14' for='fnr-in.14.1111253' class='margin-toggle sidenote-number'><sup class='numeral'>14</sup></label><input type='checkbox' id='fnr-in.14.1111253' class='margin-toggle'><span class='sidenote'><sup class='numeral'>14</sup>\(\Omega\) is the sample space &#x2014; the set of possible outcomes &#x2014; \(\mathcal E\) is the event space &#x2014; each event is a set of outcomes &#x2014; and \(P\) a probability function which assigns a probability to each element in \(\mathcal E\)</span>. The entropy of an event \(E\) is a function over \(\mathcal E\):
</p>
\begin{align}
H:\
&  \mathcal E \rightarrow \mathbb R \cup \{\infty\} \nonumber \\
& E \mapsto H(E) \nonumber
\end{align}
<p>
that satisfies:
</p>
<ol class="org-ol">
<li><i>independence</i> of representation: \(H(E)\) only depends on \(P(E)\)</li>
<li><i>continuity</i> (relative to the topology induced by the trace distance)</li>
<li><i>additivity</i> for two independent events \(E\) and \(E'\): \(H(E \cap E') = H(E) + H(E')\)</li>
<li><i>normalization</i> such that \(H(E) = 1\) for \(P(E) = \frac 1 2\)</li>
</ol>

<p>
With these constraints, the entropy of \(E\) is unique:
</p>
<div class="theorem" id="orgf40f74a">
<p>
Any fonction \(H\) satisfying 1-4 above has the form \(H(E) = -\log_2(P(E))\)
</p>

</div>

<div class="proof" id="org72a8faa">
<p>
Clearly \(-\log_2(P(E))\) satisfies 1-4. Because \(-\log_2\) is bijective from \([0,1]\) to \(\mathbb R^+ \cup \{+\infty\}\), the condition 1 allows to write \(H(E) = f(-\log_2(P(E)))\), where \(f\) is from \(\mathbb R^+ \cup \{+\infty\}\) to \(\mathbb R \cup \{+\infty\}\). 2 implies that \(f\) is continuous and additivity implies that \(f(x) + f(y) = f(x + y)\) by considering two events \(E\) and \(E'\) such that \(-\log_2(P(E)) = x\) and \(-\log_2(P(E')) = y\). This in turn implies that \(f\) is linear, and the normalization implies the claimed result.
</p>

</div>
</div>
</div>

<div id="outline-container-org99e6c41" class="outline-4">
<h4 id="org99e6c41"><span class="section-number-4">4.2.2.</span> Entropies for random variables</h4>
<div class="outline-text-4" id="text-4-2-2">
<p>
The most obvious way to go from events to random variables is to consider the expected entropy for each event defining the random variable, i.e.
</p>
<div text="Shannon Entropy" class="definition" id="org794f9c9">
<p>
Shannon entropy of a random variable \(X\) with alphabet \(\Sigma\) is the expected entropy of the events \(\{X = \sigma\}\) for \(\sigma \in \Sigma\):
</p>
\begin{equation}
H(X) = - \sum_{\sigma\in \Sigma} \Pr(X=\sigma) \log_2(\Pr(X=\sigma)).
\end{equation}

</div>

<p>
But this is not the only possible way of combining the various probabilities of the events \(\{X=\sigma\}\):
</p>
<div text="Min-Entropy" class="definition" id="orgb116a98">
<p>
The Min-entropy of a random variable \(X\) with alphabet \(\Sigma\) is
</p>
\begin{equation}
H_{\min}(X) = \min_\sigma - \log_2(\Pr(X=\sigma)).
\end{equation}

</div>

<p>
It is also possible to define the Max-entropy, that is related to the number of events with non-zero probability<label id='fnr.15' for='fnr-in.15.2045346' class='margin-toggle sidenote-number'><sup class='numeral'>15</sup></label><input type='checkbox' id='fnr-in.15.2045346' class='margin-toggle'><span class='sidenote'><sup class='numeral'>15</sup>This measures the maximum entropy a random variable with the same support as \(X\) could have.</span>:
</p>

<div text="Max-Entropy" class="definition" id="org2792c62">
<p>
The Max-entropy of a random variable \(X\) with alphabet \(\Sigma\) is
</p>
\begin{equation}
H_{\max}(X) = \log_2(|\{X=\sigma \ : \ \Pr(X=\sigma) > 0\}|).
\end{equation}

</div>

<div class="property" id="org719db20">
\begin{equation}
H_{\min}(X) \leq H(X) \leq H_{\max}(X).
\end{equation}

</div>

<div class="property" id="orgb19e067">
<p>
For all entropies (min, max, Shannon), we have
</p>
<ul class="org-ul">
<li>Permutation invariance: \(H(X) = H(\pi(X))\) where \(\pi\) permutes the elements of \(X\);</li>
<li>Non negativity;</li>
<li>Equality to \(0\) is equivalent to having exactly one element with probability 1;</li>
<li>Upper bound equal to \(\log_2|\Sigma|\) where \(\Sigma\) is the alphabet.</li>
</ul>

</div>
</div>
</div>

<div id="outline-container-orgf582d6f" class="outline-4">
<h4 id="orgf582d6f"><span class="section-number-4">4.2.3.</span> More entropies</h4>
<div class="outline-text-4" id="text-4-2-3">
<p>
Whenever there are correlated random variables \(X\) and \(Y\), one can define a conditional random variables when a say specific value of \(Y=y\) is known. We write this random variable as \(X|Y=y\) and its probability distribution is \(\Pr(X|Y=y) = \frac{\Pr(X,Y=y)}{\Pr(Y=y)}\). The associated Shannon entropy is \(H(X|Y=y) = -\sum_{x} \Pr(X=x|Y=y) \log_2(\Pr(X=x|Y=y)\). This represents the entropy of \(X\) when \(Y=y\). The conditional Shannon entropy of \(X\) given \(Y\) is defined as this quantity averaged over the possible values of \(y\) and thus represents the expected remaining uncertainty about \(X\) when \(Y\) is known:
</p>
<div text="Conditional Shannon Entropy" class="definition" id="org6c02028">
<p>
The <i>conditional Shannon entropy</i> of \(X\) given \(Y\) is
</p>
\begin{equation}
H(X|Y) = \sum_y \Pr(Y=y) H(X|Y=y).
\end{equation}

</div>

<div text="Chain Rule" class="property" id="orgae591c0">
<p>
The Shannon entropy satisfies the <i>chain rule</i><label id='fnr.16' for='fnr-in.16.5359844' class='margin-toggle sidenote-number'><sup class='numeral'>16</sup></label><input type='checkbox' id='fnr-in.16.5359844' class='margin-toggle'><span class='sidenote'><sup class='numeral'>16</sup>This allows to draw Venn diagrams for entropies.</span>:
</p>
\begin{equation}
H(X|YZ) = H(XY|Z) - H(Y|Z)
\end{equation}

</div>

<p>
Conditional entropies can be defined for the min and max entropy as well. For the min entropy we simply minimize over all possible realizations of \(Y\), while for the max entropy, we maximize over the possible values of \(Y\):
</p>
<div text="Conditional Min Entropy" class="definition" id="org63bae89">
\begin{equation}
H_{\min}(X|Y) = \min_y H_{\min}(X|Y=y).
\end{equation}

</div>

<div text="Conditional Max Entropy" class="definition" id="orge1ed7ab">
\begin{equation}
H_{\max}(X|Y) = \max_y \log_2 |\{x: \Pr(X=x|Y=y) \neq 0\}|.
\end{equation}

</div>

<p>
All three entropies satisfy an important and powerful inequality stating that conditional entropies can only decrease when they are conditioned on an additional random variable:
</p>
<div text="Strong Subadditivity" class="property" id="org2802d63">
<p>
H(X|Y) &ge; H(X|YZ).
</p>

</div>
<p>
While such property is expected &#x2014; the entropy of \(X\) decreases when we add more conditioning &#x2014; it is important to mention it here, as the quantum analogue to it  is non-trivial.
</p>
</div>
</div>

<div id="outline-container-orgc49e945" class="outline-4">
<h4 id="orgc49e945"><span class="section-number-4">4.2.4.</span> Mutual information</h4>
<div class="outline-text-4" id="text-4-2-4">
<p>
Mutual information is a concept that closely follows our everyday experience. When we get information, we get it through something about something else: We receive a message telling us that some event happened. It is not directly the event itself, but it is correlated to it in the sense that if the event would have been different so would have been the message.
</p>

<p>
Formally, the Shannon mutual information between \(X\) and \(Y\) is the average amount of uncertainty about \(X\) that \(Y\) removes when it is observed:
</p>
<div text="Mutual Information" class="definition" id="orga8fb369">
\begin{equation}
I(X:Y) = H(X) - H(X|Y) = H(X) + H(Y) - H(XY).
\end{equation}

</div>

<div class="property" id="orga8f7bb6">
<p>
The mutual information is non-negative.<label id='fnr.17' for='fnr-in.17.2863221' class='margin-toggle sidenote-number'><sup class='numeral'>17</sup></label><input type='checkbox' id='fnr-in.17.2863221' class='margin-toggle'><span class='sidenote'><sup class='numeral'>17</sup>Use the strong subadditivity.</span>
</p>

</div>
</div>
</div>
</div>
</section>

<section id="outline-container-org7ad72e6" class="outline-2">
<h2 id="org7ad72e6"><span class="section-number-2">5.</span> Quantum entropies</h2>
<div class="outline-text-2" id="text-5">
</div>
<div id="outline-container-orgdf59019" class="outline-3">
<h3 id="orgdf59019"><span class="section-number-3">5.1.</span> Generalizing classical entropies</h3>
<div class="outline-text-3" id="text-5-1">
<p>
Surely, it is possible to encode classical information &#x2014; i.e. classical probability distributions &#x2014; inside quantum systems. This holds for single systems as well as for correlated ones. Because we could also perform all classical processing within quantum systens, it is ultimately desirable that the definition of quantum entropy as well as conditional entropy, mutual information and relative entropy match those of random variables whenever the quantum states correspond to random variables.
</p>

<p>
This leads to the following definitions:
</p>
<div text="Von Neuman Entropy" class="definition" id="org0fc33df">
<p>
The von Neuman entropy for a system \(A\) in state \(\rho\) is<label id='fnr.18' for='fnr-in.18.1012379' class='margin-toggle sidenote-number'><sup class='numeral'>18</sup></label><input type='checkbox' id='fnr-in.18.1012379' class='margin-toggle'><span class='sidenote'><sup class='numeral'>18</sup>Show that is matches the classical definition for classical states.</span>:
</p>
\begin{equation}
H(A)_\rho = - \tr(\rho \log_2 \rho).
\end{equation}

</div>

<div text="quantum min Entropy" class="definition" id="org6810240">
<p>
The min entropy is defined using the $&infin;$-norm &#x2013; equating the largest eigenvalue of \(\rho\), by:
</p>
\begin{equation}
H_{\min}(A)_\rho = -\log_2 \|\rho\|_{\infty}
\end{equation}

</div>

<div text="quantum max Entropy" class="definition" id="org02002f7">
<p>
The max entropy is defined by
</p>
\begin{equation}
H_{\max}(A)_\rho = -\log_2 |\mathrm{supp}(\rho)|,
\end{equation}
<p>
where \(\mathrm{supp}(\rho)\) is the orthogonal complement to the \(0\) eigenspace value of \(\rho\).
</p>

</div>

<p>
Entropies satisfy useful properties:
</p>
<div class="property" id="org83152f7">
<ul class="org-ul">
<li>Unitary invariance: \(H(A)_\rho = H(A)_{U\rho U^\dagger}\).</li>
<li>Positivity: \(H(A)_\rho \geq 0\).</li>
<li>Additivity for uncorrelated states: \(H(AB)_{\rho_A\otimes\rho_B} = H(A)_{\rho_A} + H(B)_{\rho_B}\).</li>
<li>For \(\rho_{AB}\) a quantum-classical state \(\rho_{AB} = \sum_b \Pr(B=b) \rho_{A,b} \ketbra b\) then \(H(AB)_{\rho_{AB}} = H(\Pr(B=b)) + \sum_b \Pr(B=b) H(A)_{\rho_{A,b}})\).</li>
</ul>

</div>

<p>
and specifically for the von Neumann entropy
</p>
<div class="property" id="org3a768ef">
<p>
\(H(A)_\rho \leq \log_2 d\), where \(d\) is the dimension of the Hilbert space of \(A\).
</p>

</div>
</div>
</div>

<div id="outline-container-orgad9cf59" class="outline-3">
<h3 id="orgad9cf59"><span class="section-number-3">5.2.</span> Conditional entropy</h3>
<div class="outline-text-3" id="text-5-2">
<p>
There could a priori be several ways of defining conditional von Neumann entropy for a density matrix \(\rho_{AB}\) with respect to the \(A\), \(B\) cut. The most tempting would be to define it through a measurement on \(B\) that gives a different reduced density matrix on \(A\) for each of the possible outcomes &#x2014; this would be reminiscent of the computation for quantum-classical states above. The problem is that such conditional entropy would involve some optimization over the possible measurements and would not necessarily satisfy some of the other properties expected from conditional entropy. In fact the right way to define the conditional entropy is through the classical identity \(H(X|Y) = H(X,Y) - H(Y)\).
</p>

<div text="Conditional Entropy" class="definition" id="orgfa92034">
<p>
The quantum conditional entropy for a state \(\rho_{AB}\) for subsystems \(A\), \(B\) is
</p>
\begin{equation}
H(A|B)_{\rho_{AB}} = H(AB)_{\rho_{AB}} - H(B)_{\rho_{AB}},
\end{equation}
<p>
where \(H(B)_{\rho_{AB}} = H(B)_{\rho_B}\) for \(\rho_B = \tr_A \rho_{AB}\).
</p>

</div>

<div text="Chain Rule" class="property" id="org87bedb0">
<p>
Reversing the definition of \(H(A|B)\) we obtain the chain rule for quantum entropies:
</p>
\begin{equation}
H(AB)_\rho = H(A|B)_\rho + H(B)_\rho.
\end{equation}

</div>

<div class="remark" id="org91cd62a">
<p>
Whereas conditional entropy of random variables is positive, it is not necessary the case for quantum conditional entropy. E.g. take a pure bi-partite state \(\rho\) over \(A\) and \(B\), then \(H(AB)_\rho = 0\) and \(H(A)_\rho = H(B)_\rho \geq 0\), which implies \(H(A|B)_\rho = H(B|A)_\rho \leq 0\).
</p>

</div>

<div class="property" id="org7244068">
<p>
For a quantum-classical state \(\rho_{AB} = \sum_b p(b) \rho_{A,b}\otimes \ketbra b\) over \(A\) and \(B\), we have
</p>
\begin{equation}
H(A|B)_{\rho_{AB}} = \sum_b p(b) H(A)_{\rho_{A,b}},
\end{equation}
<p>
and consequently, \(H(A|B) \geq 0\).
</p>

</div>

<div text="Strong subadditivity" class="property" id="org9f380d8">
<p>
For \(\rho_{ABC}\) a state for the 3 subsystems \(A\), \(B\) and \(C\), then
</p>
\begin{equation}
H(A|B)_{\rho_{ABC}} \geq H(A|BC)_{\rho_{ABC}}.
\end{equation}

</div>

<p>
This inequality is fundamental in quantum theory as many other properties derive from it. We will see one consequence in the next paragraph.
</p>
</div>
</div>

<div id="outline-container-org697bdc6" class="outline-3">
<h3 id="org697bdc6"><span class="section-number-3">5.3.</span> Mutual information</h3>
<div class="outline-text-3" id="text-5-3">
<p>
Mutual information, once conditional entropy is defined, follows from the same definition as in the classical case:
</p>
<div text="Quantum mutual information" class="definition" id="org25ca7be">
<p>
For a state \(\rho\) over subsystems \(A\) and \(B\), the quantum mutual information is defined as:
</p>
\begin{equation}
I(A:B)_\rho = H(A)_\rho - H(A|B)_\rho = H(B)_\rho - H(B|A)_\rho = H(A)_\rho + H(B)_\rho - H(AB)_\rho.
\end{equation}

</div>

<div class="property" id="orgf8d2746">
\begin{equation}
I(A:B)_\rho \geq 0.
\end{equation}

</div>

<div class="proof" id="org2a90b04">
<p>
Apply the strong subadditivity for \(H(X|Y)_{\rho_{XYZ}}\) with \(\rho_{XYZ} = \rho_{XZ} \otimes \ketbra 0_Y\) taking \(X=A\), \(Y=B\) and \(Z=C\). Note that the general case (not setting up \(Y\) in state \(\ketbra 0\) gives that the conditional mutual information is positive.
</p>

</div>

<p>
Another interesting property of quantum mutual information states that quantum post processing subsystem \(B\) does not increase the quantum mutual information with \(A\). More precisely:
</p>
<div class="property" id="orgb257d78">
<p>
Let three subsystems \(A\), \(B\), \(C\), \(\rho_{AB}\) a state over \(AB\) and \(\mathcal E\) a CPTP map from \(B\) to \(C\). Then:
</p>
\begin{equation}
I(A:B)_{\rho_{AB}} \geq I(A:C)_{(\one_A\otimes \mathcal E)(\rho_{AB})}.
\end{equation}

</div>

<div class="proof" id="orgb5e54f3">
<p>
We prove that \(H(A|B)_{\rho_{AB}} \leq H(A|C)_{(\one_A\otimes \mathcal E)(\rho_{AB})}\). This is a direct application of the fact that \(\mathcal E\) can be implemented by considering an auxiliary quantum system \(D\) and a joint isometry from \(BD\) to \(CD\), and the strong subadditivity.
</p>

</div>
</div>
</div>
</section>

<section id="outline-container-org017c8b4" class="outline-2">
<h2 id="org017c8b4"><span class="section-number-2">6.</span> References</h2>
<div class="outline-text-2" id="text-6">
<ul class="org-ul">
<li><a href="https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf">Quantum Information Theory, R. Renner (2013)</a></li>
<li><a href="https://arxiv.org/pdf/1106.1445.pdf">From Classical to Quantum Shannon Theory, M. Wilde (2019)</a></li>
</ul>
</div>
</section>
</article>