---
layout: post
title:  "Closed Quantum Systems"
tag:    Lecture
keywords: 
  - Tufte
---

<article id="content" class="content">

Quantum information processing is using quantum mechanics as a way to encode, process and retrieve information using quantum systems. The amount of quantum theory we need to describe these tasks from a computer science perspective is remarkably shallow. It only amounts to the axioms of closed systems quantum mechanics, and in many cases to 2-dimensional systems <label id='fnr.1' for='fnr-in.1.4685317' class='margin-toggle sidenote-number'><sup class='numeral'>1</sup></label><input type='checkbox' id='fnr-in.1.4685317' class='margin-toggle'><span class='sidenote'><sup class='numeral'>1</sup>For digging into higher (discrete finite or infinite) dimensional systems, refer to lectures by U. Chabaud and F. Arzani.</span>.

<p>
The aim of this lecture is to:
</p>
<ul class="org-ul">
<li>identify which axiom of quantum mechanics relates to what information processing task;</li>
<li>recall some basic facts about linear algebra that are necessary to develop fluency and intuition.</li>
</ul>

<section id="outline-container-org223160c" class="outline-2">
<h2 id="org223160c"><span class="section-number-2">1.</span> References</h2>
<div class="outline-text-2" id="text-1">
<ul class="org-ul">
<li>Preskill's notes <a href="http://www.theory.caltech.edu/~preskill/ph219/chap2_15.pdf">Chapter 2 &#x2013; Foundations I: States and Ensembles, 52 pages (July 2015)</a> and <a href="http://www.theory.caltech.edu/~preskill/ph219/chap3_15.pdf">Chapter 3 &#x2013; Foundations II: Measurement and Evolution, 66 pages (July 2015)</a></li>
<li><a href="https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf">Quantum Information Theory, R. Renner (2013)</a></li>
<li><a href="https://arxiv.org/pdf/1106.1445.pdf">From Classical to Quantum Shannon Theory, M. Wilde (2019)</a></li>
<li><a href="https://cs.uwaterloo.ca/~watrous/TQI/TQI.pdf">The Theory of Quantum Information, J. Watrous (2018)</a></li>
</ul>
</div>
</section>
<section id="outline-container-org6b80d9e" class="outline-2">
<h2 id="org6b80d9e"><span class="section-number-2">2.</span> Axioms</h2>
<div class="outline-text-2" id="text-2">
<p>
From an operational point of view, a physical theory is a set of mathematical statements that can be combined to predict results of experiments. The crucial ingredient in this definition is the term "physical", as it makes the difference between a mathematical theory and a physical one. The connexion with experiments enforces how it can be disproven. It is unfortunately the only reality check &#x2014; or debugging tool &#x2014; available with what Nature is, and what the theory should describe<label id='fnr.2' for='fnr-in.2.2185609' class='margin-toggle sidenote-number'><sup class='numeral'>2</sup></label><input type='checkbox' id='fnr-in.2.2185609' class='margin-toggle'><span class='sidenote'><sup class='numeral'>2</sup>It will be important to remember this as a guideline towards getting to complex tasks using quantum mechanics, and as a strong limitation for how quantum programs can be checked.</span>. In contrast, most mathematical statements have the advantage of being provable from simpler ones. This is a much more desirable situation as we can check the correctness of a statement instead of holding it true until Nature shows that it does not apply for some experiment. 
</p>

<p>
The role of axioms of quantum mechanics is precisely to provide a set of mathematical rules that can be combined <i>ad infinitum</i><label id='fnr.3' for='fnr-in.3.4646706' class='margin-toggle sidenote-number'><sup class='numeral'>3</sup></label><input type='checkbox' id='fnr-in.3.4646706' class='margin-toggle'><span class='sidenote'><sup class='numeral'>3</sup>The important point is the claim that the axioms can be combined with one another and still give something meaningful physically. It is an extremely strong statement.</span> to design new experiments for which the predictions will correspond to physical reality &#x2014; unless one of the axioms is wrong. In a sense, it is trying to reduce as much as possible the gap between mathematical and physical theories by allowing to prove instead of just disprove <label id='fnr.4' for='fnr-in.4.7647783' class='margin-toggle sidenote-number'><sup class='numeral'>4</sup></label><input type='checkbox' id='fnr-in.4.7647783' class='margin-toggle'><span class='sidenote'><sup class='numeral'>4</sup>Note that this is only partially true, as doing so assumes that axioms are correct. Yet, there is an advantage of doing so as axioms are meant to be easier to check. Reversing this argument, you can see quantum information processing as a way to test these axioms and their composability with one another in an incomparably complex way.</span>.
</p>

<p>
Axioms span 3 physical concepts: 
</p>
<ol class="org-ol">
<li>States</li>
<li>Measurements</li>
<li>Evolutions</li>
</ol>
<p>
The order chosen here is non-standard<label id='fnr.5' for='fnr-in.5.6095030' class='margin-toggle sidenote-number'><sup class='numeral'>5</sup></label><input type='checkbox' id='fnr-in.5.6095030' class='margin-toggle'><span class='sidenote'><sup class='numeral'>5</sup>Usually, states are introduced first, followed by evolutions and measurement</span> but intended to emphasize the power and limitations that this axiom introduces for quantum information processing<label id='fnr.6' for='fnr-in.6.558217' class='margin-toggle sidenote-number'><sup class='numeral'>6</sup></label><input type='checkbox' id='fnr-in.6.558217' class='margin-toggle'><span class='sidenote'><sup class='numeral'>6</sup>Trying to reduce the number of or simplify axioms is an important task that interests researchers on foundations of quantum mechanics. The reason is that fewer and simpler axioms should be easier to disprove, and provide a better intuition into what can be achieved with quantum mechanics. Examples include: measurement update rule can be derived from measurement + Manzanes paper on replacing the measurement axiom with composability.</span><sup>, </sup><label id='fnr.7' for='fnr-in.7.6902627' class='margin-toggle sidenote-number'><sup class='numeral'>7</sup></label><input type='checkbox' id='fnr-in.7.6902627' class='margin-toggle'><span class='sidenote'><sup class='numeral'>7</sup>Alternate theories need to contain classical probability theory.</span><sup>, </sup><label id='fnr.8' for='fnr-in.8.6338781' class='margin-toggle sidenote-number'><sup class='numeral'>8</sup></label><input type='checkbox' id='fnr-in.8.6338781' class='margin-toggle'><span class='sidenote'><sup class='numeral'>8</sup>When we imagine disproving a theory we need to pay attention to implicit assumptions. For instance, you could imagine trying to disprove the axioms, by testing them and accumulating statistics. But as such you already use the fact that this is meaningful (i.e. the axioms do not vary in time so that statistics can be accumulated and tell you something about the future). You also imply that axioms can be combined. Mathematically they do, but do they also physically? In a sense there is a 4th axiom that says the other 3 can be combined. One approach to trying to get rid of these implicit asumptions is to use cryptography, considering that only mathematics and locality are trusted, and that Nature is malicious.</span>.
</p>
</div>
</section>

<section id="outline-container-org67c2399" class="outline-2">
<h2 id="org67c2399"><span class="section-number-2">3.</span> Linear algebra detour</h2>
<div class="outline-text-2" id="text-3">
</div>
<div id="outline-container-orgdb47119" class="outline-3">
<h3 id="orgdb47119"><span class="section-number-3">3.1.</span> Hilbert spaces and Operators</h3>
<div class="outline-text-3" id="text-3-1">
<div text="Inner product space" class="definition" id="orgc7288ba">
<p>
\(V\) is a <i>inner product space</i> over \(\mathbb C\), if it is a vector space over \(\mathbb C\) equipped with an inner product \(\langle \psi, \varphi \rangle\).
</p>

<p>
\(\langle \ , \ \rangle\) is an <i>inner-product</i> if:
</p>
\begin{align}
& \langle \psi, \psi \rangle > 0, \mbox{ for } \psi \neq 0 \\
& \langle \psi, \alpha_1 \varphi_1 + \alpha_2 \varphi_2 \rangle = \alpha_1\langle \psi,  \varphi_1 \rangle + \alpha_2 \langle \psi, \varphi_2 \rangle \\
& \langle \psi, \varphi \rangle = \langle \varphi, \psi \rangle^*
\end{align}

</div>

<div text="Hilbert space" class="definition" id="org86cf7a1">
<p>
\(V\) is a <i>complex Hilbert space</i>, if:
</p>
<ul class="org-ul">
<li>\(V\) is a inner-product space over \(\mathbb C\);</li>
<li>It is complete for the norm \(\|\psi \| = \sqrt{\langle \psi, \psi \rangle}\) (i.e. Cauchy sequences for \(\| . \|\) converge in \(V\)). This is always the case for finite dimensional \(V\).</li>
</ul>

</div>

<div text="Linear operators" class="definition" id="orgcdf35e6">
<p>
With \(\mathcal H\) and \(\mathcal H'\) being Hilbert spaces,
</p>
<ul class="org-ul">
<li>Linear operators from \(\mathcal H\) to \(\mathcal H'\) are <i>homomorphisms</i> \(Hom(\mathcal H, \mathcal H')\);</li>
<li>Linear operators where \(\mathcal H = \mathcal H'\) are <i>endomorphisms</i> \(End(\mathcal H)\);</li>
<li>The <i>adjoint</i> of \(O \in Hom(\mathcal H, \mathcal H')\) is the unique operator \(O^\dagger\) in \(Hom(\mathcal H', \mathcal H)\) such that \(\langle\psi', O \psi \rangle = \langle O^\dagger \psi', \psi\rangle\) for \(\psi \in \mathcal H, \ \psi' \in \mathcal H'\). When \(O\) is represented as a matrix, that of \(O^\dagger\) is the conjugate transpose;</li>
<li>For \(O \in End(\mathcal H)\), \(O\) is <i>normal</i> if \(OO^\dagger = O^\dagger O\);</li>
<li>For \(O \in End(\mathcal H)\), \(O\) is <i>unitary</i> if \(OO^\dagger = O^\dagger O = \one\);</li>
<li>For \(O \in End(\mathcal H)\), \(O\) is <i>Hermitian</i> if \(O = O^\dagger\);</li>
<li>For \(O \in End(\mathcal H)\), \(O\) is positive if \(\forall \psi, \ \langle \psi , O \psi\rangle \geq 0\),<label id='fnr.9' for='fnr-in.9.6063940' class='margin-toggle sidenote-number'><sup class='numeral'>9</sup></label><input type='checkbox' id='fnr-in.9.6063940' class='margin-toggle'><span class='sidenote'><sup class='numeral'>9</sup>Positive operators are Hermitian. It's usually denoted \(O \geq 0\), and for \(O\) and \(O'\), \(O \geq O' \Leftrightarrow O-O' \geq 0\).</span> and <i>positive semi-definite</i> when \(\langle \psi , O \psi\rangle > 0, \ \psi \neq 0\);</li>
<li>For \(O \in End(\mathcal H)\), \(O\) is a projector<label id='fnr.10' for='fnr-in.10.3764816' class='margin-toggle sidenote-number'><sup class='numeral'>10</sup></label><input type='checkbox' id='fnr-in.10.3764816' class='margin-toggle'><span class='sidenote'><sup class='numeral'>10</sup>Projectors are positive operators.</span> if \(O^2 = O\).</li>
</ul>

</div>

<div text="Bases" class="definition" id="orgdabc7c4">
<p>
A basis \(\{\psi_i\}_i\) of \(\mathcal H\) is <i>orthonormal</i> if \(\langle \psi_i, \psi_j \rangle = \delta_{i,j}\).
</p>

</div>

<div text="Matrix representation" class="remark" id="org2814ad4">
<p>
Given an orthonormal basis \(\{\psi_i\}_i\), the matrix representation of \(O \in End(\mathcal H)\) is \(O_{i,j} = \langle \psi_i, O \psi_j\rangle\). \(O\) is <i>diagonal wrt \(\{\psi_i\}_i\)</i> if the matrix \(O_{i,j}\) is diagonal<label id='fnr.11' for='fnr-in.11.1493979' class='margin-toggle sidenote-number'><sup class='numeral'>11</sup></label><input type='checkbox' id='fnr-in.11.1493979' class='margin-toggle'><span class='sidenote'><sup class='numeral'>11</sup>Always keep in mind that \(O_{i,j}\) is <i>not</i> \(O\), e.g. \(O_{i,j}\) depends on the chosen basis!</span>. 
</p>

</div>

<div text="Trace" class="definition" id="orgdb60279">
<p>
The trace of \(A \in End(\mathcal H)\) is a linear functional on endomorphisms such that \(f(xy) = f(yx)\) and such that \(f(\one) = n\) for \(\mathcal H\) an \(n\)-dimensional Hilbert space.
</p>

</div>
<p>
Note that \(\tr\) is invariant under conjugation by a unitary. Note also that \(\tr (A\otimes B) = \tr(A)\tr(B)\).
</p>

<div text="Froebenius inner product" class="definition" id="org35912a3">
<p>
Given \(A\) and \(B\) complex \(n\times m\) complex matrices form a vector space \(V\). The <i>Froebenius inner product</i> of \(A\) and \(B\) in \(V\) is defined by:
</p>
\begin{equation}
\langle A,B\rangle_F = \tr(A^\dagger B).
\end{equation}

</div>
<p>
Note that it corresponds to the regular inner product if we write the matrices as vectors using the basis \(e_{i,j}\) corresponding to a matrix with a \(1\) at position \((i,j)\) and \(0\) elsewhere.
</p>

<p>
It naturally defines a norm over matrices, the Froebenius norm:
</p>
<div text="Froebenius norm" class="definition" id="orge96b93a">
\begin{equation}
 \|A\|_F = \sqrt{\langle A, A \rangle_F}.
\end{equation}

</div>
<p>
\(\| A \|_F\) is also denoted \(\| A \|_2\) as it is the 2-norm of the spectral decomposition<label id='fnr.12' for='fnr-in.12.5175853' class='margin-toggle sidenote-number'><sup class='numeral'>12</sup></label><input type='checkbox' id='fnr-in.12.5175853' class='margin-toggle'><span class='sidenote'><sup class='numeral'>12</sup>See below</span> of \(A\) when the operator is normal.
</p>


<p>
Note that these definitions can be extended to the infinite-dimensional case and constitute the <i>Hilbert-Schmidt</i> inner product and norm. One important property of Froebenius / Hilbert-Schmidt inner product is that if \(A,B \geq 0\) then \(\langle A, B \rangle = \tr (A B) \geq 0\).
</p>

<p>
Hermitian matrices form a subspace of all possible matrices. With the Hilbert-Schmidt inner product, the Hermitian matrices form a real Hilbert space. A convenient basis of such space for the \(2^n\) dimensional case are tensor products of the Pauli matrices<label id='fnr.13' for='fnr-in.13.8355323' class='margin-toggle sidenote-number'><sup class='numeral'>13</sup></label><input type='checkbox' id='fnr-in.13.8355323' class='margin-toggle'><span class='sidenote'><sup class='numeral'>13</sup>Generalization to arbitrary dimensions are in section 4.1.7 of [Ren]</span>:
</p>
\begin{align}
I & =  \begin{bmatrix} 1 &  0 \\ 0 & 1 \end{bmatrix} \\
X & =  \begin{bmatrix} 0 &  1 \\ 1 & 0 \end{bmatrix} \\
Y & = i\begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix} \\
Z & =  \begin{bmatrix} 1 &  0 \\ 0 & -1 \end{bmatrix}
\end{align}
<p>
Note that these are not normalized. For the Hilbert-Schmidt norm, they need to be multiplied by \(\frac{1}{\sqrt 2}\). Additionally, all of them have vanishing trace, except the identity. 
</p>

<div text="Trace norm" class="definition" id="orgcb74e59">
<p>
The <i>trace norm</i> of an operator \(A\) is
</p>
\begin{equation}
\| A \|_1 = \tr |A|,
\end{equation}
<p>
where  \(|A| = \sqrt{A^\dagger A}\).
</p>

</div>
<p>
For \(A\) normal, \(\|A\|_1\) is the trace norm of the spectral decomposition<label id='fnr.14' for='fnr-in.14.2733231' class='margin-toggle sidenote-number'><sup class='numeral'>14</sup></label><input type='checkbox' id='fnr-in.14.2733231' class='margin-toggle'><span class='sidenote'><sup class='numeral'>14</sup>See below</span> of \(A\).
</p>

<div class="property" id="orgbe5d1aa">
<p>
The trace norm satisfies:
</p>
\begin{equation}
 \| A \|_1 = \max_U |\tr(UA)| 
\end{equation}
<p>
where \(U\) are unitaries.
</p>

</div>
</div>
</div>

<div id="outline-container-org4383c72" class="outline-3">
<h3 id="org4383c72"><span class="section-number-3">3.2.</span> Braket notation</h3>
<div class="outline-text-3" id="text-3-2">
<div text="Braket notation" class="definition" id="orgbb6ad30">
<p>
A vector \(\vec \psi \in \mathcal H\) can be seen as an homomorphism \(\ket \psi \in Hom(\mathbb C, \mathcal H)\):
</p>
\begin{equation}
\alpha \in \mathbb C \xrightarrow{\ket \psi} \alpha \vec \psi \in \mathcal H
\end{equation}
<p>
The adjoint \(\ket \psi^\dagger\) is denoted \(\bra \psi\) and is defined as<label id='fnr.15' for='fnr-in.15.7896120' class='margin-toggle sidenote-number'><sup class='numeral'>15</sup></label><input type='checkbox' id='fnr-in.15.7896120' class='margin-toggle'><span class='sidenote'><sup class='numeral'>15</sup>\(\ket\psi: \mathbb C \rightarrow \mathcal H\), \(\ket\psi^\dagger: \mathcal H \rightarrow \mathbb C\), \(\langle \vec\psi \alpha, \vec \varphi\rangle = \alpha^* \langle \vec \psi, \vec \varphi \rangle  = \alpha^*.\braket{\psi}{\varphi}\). Simplifying by \(\alpha^*\) gives the result.</span>:
\[\bra \psi: \ \vec \varphi \rightarrow  \langle \vec \psi, \vec \varphi\rangle.\]
</p>

</div>
</div>
</div>
</section>

<section id="outline-container-org3880d8c" class="outline-2">
<h2 id="org3880d8c"><span class="section-number-2">4.</span> States of quantum systems</h2>
<div class="outline-text-2" id="text-4">
</div>
<div id="outline-container-org6895ff9" class="outline-3">
<h3 id="org6895ff9"><span class="section-number-3">4.1.</span> Pure states</h3>
<div class="outline-text-3" id="text-4-1">
<p>
The state of a system is its complete description. Concretely, if you can write the state of a system on a piece of paper, you can predict, through mathematical calculations, the result of any physical experiments that you could perform on the system. Here, the notion of complete description means that there is no uncertainty or no ignorance in the system that could be reduced. In such case, the state \(\ket \psi\) of a system is a ray in a Hilbert space \(\mathcal H\). That is:
</p>
\begin{align}
& \|\ket \psi \| = \sqrt{\braket{\psi}{\psi}} = 1 \\
& \ket \varphi \in \overline{\ket \psi} \Leftrightarrow \, \exists \alpha \neq 0, \ \ket \varphi = \alpha \ket \psi.
\end{align}
<p>
Note that usually we simply identify the equivalence class \(\overline{\ket \psi}\) with one of its representative normalized vector, here \(\ket \psi\). The reason why global phases can be ignored and why there is a strong motivation for taking the norm of the vector equal to one will become apparent when considering the prediction of experimental results.
</p>
</div>
</div>

<div id="outline-container-org42ffd88" class="outline-3">
<h3 id="org42ffd88"><span class="section-number-3">4.2.</span> Mixed states</h3>
<div class="outline-text-3" id="text-4-2">
<p>
Although the presentation above is standard in many textbooks, in practice, it is often replaced by a subtly different one. The state of a system is then defined as the mathematical representation of what knowledge an observer has about it. In this definition, states become relative to each observer<label id='fnr.16' for='fnr-in.16.9454099' class='margin-toggle sidenote-number'><sup class='numeral'>16</sup></label><input type='checkbox' id='fnr-in.16.9454099' class='margin-toggle'><span class='sidenote'><sup class='numeral'>16</sup>One might question here what kind of status the observer has from within quantum mechanics. Very rapidly, this should lead to questionning how systems are defined. You might end up being forced to consider the whole universe as the only physical system that makes sense. But then, what do you do with special relativity? What do you mean by the state of the universe when it is not accessible to you? These foundational questions will not be addressed here. Quantum mechanics will be taken from a purely operational view. Yet, it does not mean that Quantum Information Processing cannot be used to address them. One of the most celebrated example is the result \(MIP^* = RE\) from complexity theory that has implications into the structure of Hilbert spaces for infinite-dimensional composite systems.</span><sup>, </sup><label id='fnr.17' for='fnr-in.17.2442226' class='margin-toggle sidenote-number'><sup class='numeral'>17</sup></label><input type='checkbox' id='fnr-in.17.2442226' class='margin-toggle'><span class='sidenote'><sup class='numeral'>17</sup>The additional reason for preferring a definition where states are explicitely observer-dependent is that it emphasizes the nature of states: they are the consequence of the observer's relation to a system, rather than representing a pre-existing property of the system itself without reference to an observer. This epistemic vs ontic view of quantum mechanics has been a heated debate since the early days of quantum mechanics. See for instance <a href="https://doi.org/10.1016/j.shpsb.2006.10.007">https://doi.org/10.1016/j.shpsb.2006.10.007</a>.</span>. Yet, they retain their operational property of allowing the observer to predict the results of any experiment it could perfom. The interest of such definition is that it naturally incorporates the lack of knowledge an observer might have about the system. Its predictions will be worse than for a well-informed one. This interpretation of quantum states will be convenient to represent the views two parties with different knowledge about the same system. In such case, a state \(\rho\) is best represented by a density matrix acting on a Hilbert space \(\mathcal H\) &#x2014; the same as the one used before. That is:
</p>
\begin{align}
\rho & = \rho^\dagger \\
\rho & \geq 0 \\
\tr \rho & = 1.
\end{align}

<p>
The obvious question is how does this different representation of states connect to the state vector. One way of making this link is by explicitely working out the predictions on measurements they give and recognizing when they should be identical (see below).
</p>

<p>
An important class of mixed states is:
</p>
<div text="Classical states" class="definition" id="org1538ce3">
<p>
For a chosen orthonormal basis \(\{\ket i\}\), <i>classical states</i> are defined as linear combinations of the corresponding projectors \(\{\ketbra i\}\):
\[\sum_i p_i \ketbra i, \]
where \(p_i\) is a probability distribution. 
</p>

</div>
<p>
The reason why these states are called classical will be justified by what can be predicted about them.<label id='fnr.18' for='fnr-in.18.1005898' class='margin-toggle sidenote-number'><sup class='numeral'>18</sup></label><input type='checkbox' id='fnr-in.18.1005898' class='margin-toggle'><span class='sidenote'><sup class='numeral'>18</sup>Spoiler: they are perfectly distinguishable as it would be expected for classical random variables. As a consequence, it is easy to embed a discrete classical probability distribution within a quantum state.</span>
</p>
</div>
</div>

<div id="outline-container-org0cbef3c" class="outline-3">
<h3 id="org0cbef3c"><span class="section-number-3">4.3.</span> Composite systems</h3>
<div class="outline-text-3" id="text-4-3">
<p>
Lastly, we will often need to consider composite systems, i.e. systems with subparts. Here, quantum mechanics says that the state of a composite quantum system \(\mathcal A - \mathcal B\) is a ray (resp. density matrix) in the tensor product of the Hilbert spaces of each subsystem, i.e. \(\mathcal H_{\mathcal A} \otimes \mathcal H_{\mathcal B}\).
</p>

<p>
This axiom plays a crucial role in quantum information processing:
</p>
<ul class="org-ul">
<li>It is an essential ingredient for complexity theory as it defines elementary resources that will be counted to assess the complexity / efficiency of a given algorithm or protocol for resolving a task. In particular, it states that although \(n\) 2-dimensional subsystems span a \(2^n\)p-dimensional Hilbert space, they are only corresponding to a linear number of resources used<label id='fnr.19' for='fnr-in.19.3092161' class='margin-toggle sidenote-number'><sup class='numeral'>19</sup></label><input type='checkbox' id='fnr-in.19.3092161' class='margin-toggle'><span class='sidenote'><sup class='numeral'>19</sup>This is in complete analogy with classical complexity theory, where bits a resources allowing access to exponentially many bit-string values.</span>.</li>
<li>It creates a very rich structure if one associates to each subsystem a notion of locality. In such case, one can wonder what are the set of bipartite states that can be accessed through local operations and classical operations, and what kind of states require non-local operations to be created from independent subsystems.</li>
</ul>
</div>
</div>
</section>

<section id="outline-container-org3f9ff95" class="outline-2">
<h2 id="org3f9ff95"><span class="section-number-2">5.</span> Predicting results from experiments</h2>
<div class="outline-text-2" id="text-5">
<p>
An experiment is a physical setup that interacts with a quantum system and has several outcomes. The goal of the measurement axiom is to (1) specify mathematically how these physical setups are represented, (2) what can be predicted about these outcomes, and (3) how to do so.
</p>

<ol class="org-ol">
<li>A (projector-valued) measurement (PVM) \(\mathcal M\) is a set of orthogonal projectors summing to \(\one\): \[\mathcal M = \{M_i\}_i, \ M_i M_j = \delta_{i,j} M_i, \ \sum_i M_i = \one.\] The projector \(M_i\) is said to correspond to <i>outcome</i> \(i\).</li>
<li>Given the state of a quantum system defined on the same Hilbert space as \(\mathcal M\), it is possible to compute the probability of getting outcome \(i\).</li>
<li>if the state is in state \(\ket \psi\)<label id='fnr.20' for='fnr-in.20.9843329' class='margin-toggle sidenote-number'><sup class='numeral'>20</sup></label><input type='checkbox' id='fnr-in.20.9843329' class='margin-toggle'><span class='sidenote'><sup class='numeral'>20</sup>Remember the state needs to be normalized.</span> (resp. \(\rho\)) the probability of getting \(i\) is:</li>
</ol>
\begin{equation}
\Pr(i|\ket \psi) = \bra \psi M_i \ket \psi, \mbox{ resp. } \Pr(i|\rho) = \tr(\rho M_i).
\end{equation}

<p>
The presentation adopted here focuses on PVM instead of observables &#x2014; i.e. hermitian matrices. The reason is that several observables lead to the same measurement by just changing the eigenvalues of the operator. The observables \(\sum_i \lambda_i M_i\) and \(\sum_i \lambda'_i M_i\) contain the same amount of information as long as the \(\lambda\) coefficients do not create spurious degeneracies. As for states, we can think of PVM as normalized representatives for all the possible observables acting on \(\mathcal H\). 
</p>

<p>
Additionally, it emphasizes that there is no such thing as the measurement of the expectation value of an observable. There are only detector clicks that give one of the discrete outcomes \(i\). The measurement of an expectation value is the act of repeating such measurement many times for the same reprepared state and accumulating the statistics for each of the outcomes. In other words, expectation values are averages, while quantum mechanics &#x2014; through this postulate &#x2014; gives us the ability to sample from a probability distribution. This is of course much more information than just the average value of the probability distribution. Such distinction will become crucial when counting resources for performing discrimination or estimation tasks, and of course when evaluating the complexity of an algorithm.
</p>

<p>
It is customary to introduce thet post-measurement state at this stage. It is in fact not necessary &#x2014; see for instance <a href="https://cs.uwaterloo.ca/~watrous/TQI/TQI.pdf">The Theory of Quantum Information, J. Watrous (2018)</a>. Yet, it is useful to understand what is indeed meant by post-measurement state. Indeed, in the lab, physicists have observed that when measurements are very carefully implemented, they can be non destructive in the sense that once a measurement has been done, not only does the quantum system survive to it, but an immediate subsequent measurement gives the same result. Applying this to PVMs shows that when they are implemented in such non destructive way, the state of the system just after the measurement outcome \(i\) has been observed must be \(M_i \ket \psi / \| M_i \ket \psi\|\) &#x2014; where \(M_i\) is the corresponding projector and \(\ket \psi\) is the state of the system. More generally, for a density matrix \(\rho\), the post-measurement state for a non-destructive PVM \(\{M_i\}_i\) where \(i\) is observed is given by
</p>
\begin{equation}
\frac{M_i \rho M_i }{\frac \tr (M_i \rho)}.
\end{equation}
<p>
Nonetheless, one needs to remember that this is <i>only</i> if the measurement is implemented in a non-destructive way. It is a lot of efforts to do it, and most often than not, the quantum system either does not survive or is experiencing additional transformations that yield to further evolutions. 
</p>
</div>
</section>

<section id="outline-container-orgbadf71b" class="outline-2">
<h2 id="orgbadf71b"><span class="section-number-2">6.</span> Evolving states</h2>
<div class="outline-text-2" id="text-6">
<p>
The axiom governing the evolution of quantum systems can be summarized as:
</p>
<ul class="org-ul">
<li>allowed evolutions for a system with Hilbert space \(\mathcal H\) are linear: \(\mathcal U[\ket \psi + \ket \varphi] = \mathcal U[\ket\psi] + U[\ket \varphi]\)</li>
<li>allowed evolutions should map states to states, i.e. a normalized representative of a ray should map to another normalized representative of a ray:</li>
</ul>
\begin{align}
& \forall \ket \psi, \ket \varphi, \ \exists \mathcal U, \ \mathcal U[\ket \psi] = \ket \varphi \\
& \forall \mbox{ allowed } \mathcal U, \forall \ket \psi, \ \langle \mathcal U[\ket\psi], \mathcal U[\ket\psi]\rangle = 1
\end{align}
<p>
This means that the allowed evolutions are the whole unitary group acting on \(\mathcal H\).
</p>

<p>
In most aspects of quantum information processing from a computer science perspective, it will suffice to consider such discrete evolutions. Yet, implementing these evolutions using real physical systems requires to describe continuous time control and evolutions. Schroedinger's equation can be recovered by considering a parametrization of the unitary group in terms of continuous paths using infinitesimal transformation generators. This would lead to construct the associated Lie algebra, and the exponential function that appears in the solution to Schroedinger's equation. 
</p>
</div>
</section>

<section id="outline-container-org0537eb8" class="outline-2">
<h2 id="org0537eb8"><span class="section-number-2">7.</span> More on state vectors and density matrices</h2>
<div class="outline-text-2" id="text-7">
</div>
<div id="outline-container-org2e115d1" class="outline-3">
<h3 id="org2e115d1"><span class="section-number-3">7.1.</span> Decomposing density matrices</h3>
<div class="outline-text-3" id="text-7-1">
<p>
Because density matrices in the \(2^n\)-dimensional setting are positive semi-definite and have trace 1, they can be conveniently expressed using the Pauli matrices. For a 2-dimensional system (qubit) we have:
</p>
\begin{equation}
\rho = \frac{1}{2}(I + x X + y Y + z Z)
\end{equation}
<p>
Note that here, the normalization factor<label id='fnr.21' for='fnr-in.21.1693503' class='margin-toggle sidenote-number'><sup class='numeral'>21</sup></label><input type='checkbox' id='fnr-in.21.1693503' class='margin-toggle'><span class='sidenote'><sup class='numeral'>21</sup>Always pay attention to the definition of Pauli matrices when reading a research paper, as it might not be consistent throughout the whole paper! 3 normalization conventions co-exist: \(\tr I = 1\), \(\tr I = 2\) and \(\tr I = 2/\sqrt 2\).</span> of the Pauli matrices is implicitely defined to be 1, i.e. \(\tr \rho = 1\). The positivity criterion imposes that \(x^2+y^2+z^2\leq 1\). This is the usual Bloch sphere representation of qubits.
</p>

<p>
Note that using the generalization of the Pauli matrices to decompose Hermitian matrices, this representation can be generalized to arbitrary dimensions.
</p>
</div>
</div>

<div id="outline-container-org144986c" class="outline-3">
<h3 id="org144986c"><span class="section-number-3">7.2.</span> State vectors and density matrices</h3>
<div class="outline-text-3" id="text-7-2">
<p>
The correspondence between state vectors and density matrices can be established from an operational point of view. Given a state vector, we seek what density matrix it corresponds to by requiring that they give the same predictions for the same PVMs.
</p>

<p>
Let \(\ket \psi\) be a state vector. Consider the binary PVM \(\mathcal M = \{M_0, M_1\} \coloneqq  \{\Pi_{\ket \psi}, \one - \Pi_{\ket \psi}\}\). Then, the measurement postulate gives that the distribution of outcomes will be:
</p>
\begin{align}
\Pr_{\ket \psi}(0) & = 1 \\
\Pr_{\ket \psi}(1) & = 0.
\end{align}
<p>
Now, taking the density matrix approach, we should have
</p>
\begin{align}
\tr(\rho M_0) & = 1 \\
\tr(\rho M_1) & = 0.
\end{align}
<p>
Using the fact that \(\rho = \rho^\dagger\) we recognize that \(\tr(\rho M_0) = \langle \rho, M_0 \rangle_F\), which imposes together with the trace 1 condition that \(\rho = M_0 = \ketbra \psi\).
</p>

<p>
Hence, state vectors correspond to density matrices that are rank-one projectors. The converse is also true. Using the fact that \(\Pi^2 = \Pi\) for projectors and the fact that \(\mathrm{rk} (\Pi) = \tr (\Pi)\) we obtain the <i>purity</i> criterion:
\[\tr \rho^2 = 1 \Leftrightarrow \ \exists \ket \psi, \rho = \ketbra \psi.\]
</p>

<p>
This identification being done, we can derive the evolution postulate for density matrices from the one on states:
</p>
\begin{equation}
\rho \rightarrow U\rho U^\dagger.
\end{equation}
</div>
</div>

<div id="outline-container-orge3cd094" class="outline-3">
<h3 id="orge3cd094"><span class="section-number-3">7.3.</span> Density matrices as ensemble preparations</h3>
<div class="outline-text-3" id="text-7-3">
<p>
To further understand what are density matrices, we can consider a scenario where a source can prepare one of many pure states \(\ket{\psi_i}\)  with probability \(p_i\). If one state prepared by the source is given to you (without you knowing the index \(i\)), what is your description of the state of the received quantum system?
</p>

<p>
One way to approach the question is to ask yourself what can we predict about the system. Take \(\mathcal M \coloneqq \{M_j\}_j = \{\ketbra {\varphi_j}\}_j\) a PVM, then:
</p>
\begin{equation}
\Pr(\mbox{outcome }j) = \sum_i p_i \braket{\varphi_j}{\psi_i}.
\end{equation}
<p>
But as we have seen this is the same as \(\sum_i p_i \tr(M_j \ketbra{\psi_i}{\psi_i})\). Using the linearity of the trace we have:
</p>
\begin{align}
\Pr(\mbox{outcome }j) & = \tr (M_j \rho) \\
\rho & = \sum_i p_i \ketbra{\psi_i}{\psi_i}.
\end{align}
<p>
Because this holds for \(\mathcal M\) an arbitrary PVM, it is possible to choose several of them so that this \(\rho\) is unique.
</p>

<p>
Note however, that while \(\rho\) is unique, each \(\rho\) can correspond to many ensemble preparations. 
</p>
</div>
</div>
</section>

<section id="outline-container-org7e8cdfc" class="outline-2">
<h2 id="org7e8cdfc"><span class="section-number-2">8.</span> More on operators</h2>
<div class="outline-text-2" id="text-8">
</div>
<div id="outline-container-org66ec768" class="outline-3">
<h3 id="org66ec768"><span class="section-number-3">8.1.</span> Schur decomposition</h3>
<div class="outline-text-3" id="text-8-1">
<p>
Let \(A\in End(\mathcal H)\), then
</p>
\begin{equation}
A = U T U^\dagger,
\end{equation}
<p>
where \(U\) is unitary and \(T\) is upper triangular.
</p>

<p>
This decomposition is obtained by picking up an eigenvalue of \(A\) and considering the direct sum of the eigenspace associated to this eigenvalue and its orthogonal complement. Then, the decomposition is repeated on the complement.
</p>
</div>
</div>

<div id="outline-container-orga8e2dbd" class="outline-3">
<h3 id="orga8e2dbd"><span class="section-number-3">8.2.</span> Spectral decomposition</h3>
<div class="outline-text-3" id="text-8-2">
<p>
Let \(A\) be a normal operator in \(End(\mathcal H)\). Then
</p>
\begin{equation}
 A = U D U^\dagger, 
\end{equation}
<p>
for \(U\) a unitary and \(D\) a diagonal matrix.
</p>

<p>
The proof follows from Schur's decomposition, where normality implies that \(T\) is also normal. Using that \(T\) is upper triangular, a direct inspection shows that normality imposes that \(T\) is diagonal.
</p>
</div>
</div>

<div id="outline-container-orgd1a759f" class="outline-3">
<h3 id="orgd1a759f"><span class="section-number-3">8.3.</span> Singular value decomposition</h3>
<div class="outline-text-3" id="text-8-3">
<p>
Let \(A \in Hom(\mathcal H, \mathcal H')\), then
</p>
\begin{equation}
A = V D U,
\end{equation}
<p>
where \(U\) and \(V\) are unitaries.
</p>

<p>
The proof is obtained by applying the spectral theorem to \(A^\dagger A\).
</p>
</div>
</div>

<div id="outline-container-orgafe4009" class="outline-3">
<h3 id="orgafe4009"><span class="section-number-3">8.4.</span> Polar decomposition</h3>
<div class="outline-text-3" id="text-8-4">
<p>
Let \(A \in End(\mathcal H)\), then
</p>
\begin{equation}
 A =  \sqrt{AA^\dagger} U = U \sqrt{A^\dagger A}, 
\end{equation}
<p>
For \(U\) a unitary. Note that \(\sqrt{AA^\dagger}\) is positive semi-definite.
</p>

<p>
The proof is obtained by using the SVD for \(A\), and inserting either \(V^{'\dagger} V'\) or \(U' U^{'\dagger}\) from the SVD to obtain \(V'DV^{'\dagger}\) or \(U^{'\dagger} D U\) terms that correspond to \(\sqrt{AA^\dagger}\) and \(\sqrt{A^\dagger A}\).
</p>
</div>
</div>
</section>

<section id="outline-container-orge856e80" class="outline-2">
<h2 id="orge856e80"><span class="section-number-2">9.</span> More on composite systems</h2>
<div class="outline-text-2" id="text-9">
</div>
<div id="outline-container-org5ac39f9" class="outline-3">
<h3 id="org5ac39f9"><span class="section-number-3">9.1.</span> Schmidt decomposition</h3>
<div class="outline-text-3" id="text-9-1">
<p>
When we have a pure state for a composite system on \(\mathcal H \otimes \mathcal H'\), we might want to pickup a separable basis<label id='fnr.22' for='fnr-in.22.9322620' class='margin-toggle sidenote-number'><sup class='numeral'>22</sup></label><input type='checkbox' id='fnr-in.22.9322620' class='margin-toggle'><span class='sidenote'><sup class='numeral'>22</sup>A basis of the form \(\ket {\psi_i} \otimes \ket{\psi'_j}\) to express the state.</span>. Are all these bases equivalent or is one better than the others? In fact there is a family of bases that stands out and which is defined using Schmidt decomposition
</p>

<div text="Schmidt decomposition" class="theorem" id="org92f07d2">
<p>
For \(\ket\Psi \in \mathcal H \otimes \mathcal H'\), there exists \(\{\ket {\psi_i}\}_i\) and \(\{\ket {\psi'_i}\}_i\) orthonormal sets of \(\mathcal H\) and \(\mathcal H'\) respectively such that
</p>
\begin{equation}
 \ket \Psi = \sum_i \lambda_i \ket{\psi_i} \otimes \ket{\psi'_i}. 
\end{equation}

</div>
<p>
Note that there is a <i>single</i> summation index.
</p>

<div class="proof" id="org877ef8b">
<p>
Pick two bases of \(\mathcal H\) and \(\mathcal H'\). Then
</p>
\begin{equation}
 \ket \Psi = \sum_{i,j} \gamma_{i,j} \ket{\varphi_i} \otimes \ket{\varphi'_j}.
\end{equation}
<p>
By identifying \(\ket{\varphi_i} \otimes \ket{\varphi'_j}\) and \(\ketbra{\varphi_i}{\varphi'_j}\), \(\ket \Psi\) can be identified with a matrix \(P\)<label id='fnr.23' for='fnr-in.23.1048760' class='margin-toggle sidenote-number'><sup class='numeral'>23</sup></label><input type='checkbox' id='fnr-in.23.1048760' class='margin-toggle'><span class='sidenote'><sup class='numeral'>23</sup>This same trick will be used to derive the Choi-Jamiolkowski isomorphism representation of Completely Positive Trace Preserving maps.</span>. This matrix can be decomposed using the SVD, that is:
</p>
\begin{equation}
P = U \Pi V^\dagger,
\end{equation}
<p>
where \(\Pi\) is positive semi-definite. Taking the column vectors \(\ket{\psi_i}\) and \(\ket{\psi'_i}\) of \(U\) and \(V\) corresponding to the non-zero entries \(\lambda_i\) of \(\Pi\) we can now write
</p>
\begin{equation}
 P = \sum_i \lambda_i \ketbra{\psi_i}{\psi'_i},
\end{equation}
<p>
which translates back to
</p>
\begin{equation}
 \ket \Psi = \sum_i \lambda_i \ket{\psi_i} \otimes \ket{\psi'_i}. 
\end{equation}

</div>

<p>
As a result, the number of components of the state vector for a composite system written in a separable basis can always be brought back to \(\min (\dim \mathcal H, \dim\mathcal H')\).
</p>
</div>
</div>
<div id="outline-container-orga835bb6" class="outline-3">
<h3 id="orga835bb6"><span class="section-number-3">9.2.</span> Entanglement</h3>
<div class="outline-text-3" id="text-9-2">
<p>
For pure states, an entangled state corresponds to a state with <i>Schmidt number</i> &#x2014; the number of non-zero coefficient in its Schmidt decomposition &#x2014; strictly greater than 1.
</p>
</div>
</div>
</section>
<!-- Footnotes --><!-- 
<div class="footdef"><sup><a id="fn.1" class="footnum" href="#fnr.1" role="doc-backlink">1</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">For digging into higher (discrete finite or infinite) dimensional systems, refer to lectures by U. Chabaud and F. Arzani.</p></div></div>

<div class="footdef"><sup><a id="fn.2" class="footnum" href="#fnr.2" role="doc-backlink">2</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">It will be important to remember this as a guideline towards getting to complex tasks using quantum mechanics, and as a strong limitation for how quantum programs can be checked.</p></div></div>

<div class="footdef"><sup><a id="fn.3" class="footnum" href="#fnr.3" role="doc-backlink">3</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">The important point is the claim that the axioms can be combined with one another and still give something meaningful physically. It is an extremely strong statement.</p></div></div>

<div class="footdef"><sup><a id="fn.4" class="footnum" href="#fnr.4" role="doc-backlink">4</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Note that this is only partially true, as doing so assumes that axioms are correct. Yet, there is an advantage of doing so as axioms are meant to be easier to check. Reversing this argument, you can see quantum information processing as a way to test these axioms and their composability with one another in an incomparably complex way.</p></div></div>

<div class="footdef"><sup><a id="fn.5" class="footnum" href="#fnr.5" role="doc-backlink">5</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Usually, states are introduced first, followed by evolutions and measurement</p></div></div>

<div class="footdef"><sup><a id="fn.6" class="footnum" href="#fnr.6" role="doc-backlink">6</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Trying to reduce the number of or simplify axioms is an important task that interests researchers on foundations of quantum mechanics. The reason is that fewer and simpler axioms should be easier to disprove, and provide a better intuition into what can be achieved with quantum mechanics. Examples include: measurement update rule can be derived from measurement + Manzanes paper on replacing the measurement axiom with composability.</p></div></div>

<div class="footdef"><sup><a id="fn.7" class="footnum" href="#fnr.7" role="doc-backlink">7</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Alternate theories need to contain classical probability theory.</p></div></div>

<div class="footdef"><sup><a id="fn.8" class="footnum" href="#fnr.8" role="doc-backlink">8</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">When we imagine disproving a theory we need to pay attention to implicit assumptions. For instance, you could imagine trying to disprove the axioms, by testing them and accumulating statistics. But as such you already use the fact that this is meaningful (i.e. the axioms do not vary in time so that statistics can be accumulated and tell you something about the future). You also imply that axioms can be combined. Mathematically they do, but do they also physically? In a sense there is a 4th axiom that says the other 3 can be combined. One approach to trying to get rid of these implicit asumptions is to use cryptography, considering that only mathematics and locality are trusted, and that Nature is malicious.</p></div></div>

<div class="footdef"><sup><a id="fn.9" class="footnum" href="#fnr.9" role="doc-backlink">9</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Positive operators are Hermitian. It's usually denoted \(O \geq 0\), and for \(O\) and \(O'\), \(O \geq O' \Leftrightarrow O-O' \geq 0\).</p></div></div>

<div class="footdef"><sup><a id="fn.10" class="footnum" href="#fnr.10" role="doc-backlink">10</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Projectors are positive operators.</p></div></div>

<div class="footdef"><sup><a id="fn.11" class="footnum" href="#fnr.11" role="doc-backlink">11</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Always keep in mind that \(O_{i,j}\) is <i>not</i> \(O\), e.g. \(O_{i,j}\) depends on the chosen basis!</p></div></div>

<div class="footdef"><sup><a id="fn.12" class="footnum" href="#fnr.12" role="doc-backlink">12</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">See below</p></div></div>

<div class="footdef"><sup><a id="fn.13" class="footnum" href="#fnr.13" role="doc-backlink">13</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Generalization to arbitrary dimensions are in section 4.1.7 of [Ren]</p></div></div>

<div class="footdef"><sup><a id="fn.14" class="footnum" href="#fnr.14" role="doc-backlink">14</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">See below</p></div></div>

<div class="footdef"><sup><a id="fn.15" class="footnum" href="#fnr.15" role="doc-backlink">15</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">\(\ket\psi: \mathbb C \rightarrow \mathcal H\), \(\ket\psi^\dagger: \mathcal H \rightarrow \mathbb C\), \(\langle \vec\psi \alpha, \vec \varphi\rangle = \alpha^* \langle \vec \psi, \vec \varphi \rangle  = \alpha^*.\braket{\psi}{\varphi}\). Simplifying by \(\alpha^*\) gives the result.</p></div></div>

<div class="footdef"><sup><a id="fn.16" class="footnum" href="#fnr.16" role="doc-backlink">16</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">One might question here what kind of status the observer has from within quantum mechanics. Very rapidly, this should lead to questionning how systems are defined. You might end up being forced to consider the whole universe as the only physical system that makes sense. But then, what do you do with special relativity? What do you mean by the state of the universe when it is not accessible to you? These foundational questions will not be addressed here. Quantum mechanics will be taken from a purely operational view. Yet, it does not mean that Quantum Information Processing cannot be used to address them. One of the most celebrated example is the result \(MIP^* = RE\) from complexity theory that has implications into the structure of Hilbert spaces for infinite-dimensional composite systems.</p></div></div>

<div class="footdef"><sup><a id="fn.17" class="footnum" href="#fnr.17" role="doc-backlink">17</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">The additional reason for preferring a definition where states are explicitely observer-dependent is that it emphasizes the nature of states: they are the consequence of the observer's relation to a system, rather than representing a pre-existing property of the system itself without reference to an observer. This epistemic vs ontic view of quantum mechanics has been a heated debate since the early days of quantum mechanics. See for instance <a href="https://doi.org/10.1016/j.shpsb.2006.10.007">https://doi.org/10.1016/j.shpsb.2006.10.007</a>.</p></div></div>

<div class="footdef"><sup><a id="fn.18" class="footnum" href="#fnr.18" role="doc-backlink">18</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Spoiler: they are perfectly distinguishable as it would be expected for classical random variables. As a consequence, it is easy to embed a discrete classical probability distribution within a quantum state.</p></div></div>

<div class="footdef"><sup><a id="fn.19" class="footnum" href="#fnr.19" role="doc-backlink">19</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">This is in complete analogy with classical complexity theory, where bits a resources allowing access to exponentially many bit-string values.</p></div></div>

<div class="footdef"><sup><a id="fn.20" class="footnum" href="#fnr.20" role="doc-backlink">20</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Remember the state needs to be normalized.</p></div></div>

<div class="footdef"><sup><a id="fn.21" class="footnum" href="#fnr.21" role="doc-backlink">21</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Always pay attention to the definition of Pauli matrices when reading a research paper, as it might not be consistent throughout the whole paper! 3 normalization conventions co-exist: \(\tr I = 1\), \(\tr I = 2\) and \(\tr I = 2/\sqrt 2\).</p></div></div>

<div class="footdef"><sup><a id="fn.22" class="footnum" href="#fnr.22" role="doc-backlink">22</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">A basis of the form \(\ket {\psi_i} \otimes \ket{\psi'_j}\) to express the state.</p></div></div>

<div class="footdef"><sup><a id="fn.23" class="footnum" href="#fnr.23" role="doc-backlink">23</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">This same trick will be used to derive the Choi-Jamiolkowski isomorphism representation of Completely Positive Trace Preserving maps.</p></div></div>

 --></article>