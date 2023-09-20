---
layout: post
title:  "Open Quantum Systems"
tag:    Lecture
keywords: 
  - Tufte
---

<article id="content" class="content">
<header>
<h1 class="title">Open quantum systems</h1>
</header>
<section id="outline-container-org7214cce" class="outline-2">
<h2 id="org7214cce"><span class="section-number-2">1.</span> The Church of the larger Hilbert space</h2>
<div class="outline-text-2" id="text-1">
<p>
The axioms of quantum mechanics presented earlier only refer to <i>closed quantum systems</i>. So it is only possible to describe what happens to a system completely isolated from other systems. This seems like a restriction, until you realize that indeed, it is always possible to view an <i>open quantum system</i> as a subsystem of a larger quantum system, which is itself isolated. In case of doubt, you can always throw in the full wave function of the universe! This lecture is about exploiting this ability to better understand states of open quantum systems, their dynamics and the allowed measurements. The term "Church of the larger Hilbert space" refers to this ability to enlarge the Hilbert space by adding more and sometimes fictitious subsystems in order to recover pure states and closed systems dynamics and measurements.
</p>
</div>
</section>

<section id="outline-container-org743575a" class="outline-2">
<h2 id="org743575a"><span class="section-number-2">2.</span> From pure to mixed states and back</h2>
<div class="outline-text-2" id="text-2">
</div>
<div id="outline-container-orgedc258a" class="outline-3">
<h3 id="orgedc258a"><span class="section-number-3">2.1.</span> A Toold for obtaining mixed states from pure ones</h3>
<div class="outline-text-3" id="text-2-1">
<div text="Partial trace" class="definition" id="org01bde96">
<p>
The <i>partial trace</i> is a mapping from \(End(\mathcal H_A \otimes \mathcal H_B)\) to \(End(\mathcal H_B)\). It is defined as the linear extension of the following:
\[O_A \otimes O_B \rightarrow \tr_A(O_A \otimes O_B) \coloneqq \tr(O_A) O_B.\]
</p>

</div>

<p>
Using that for an operator in \(End(\mathcal H_A)\otimes End{\mathcal H_B}\) , \(O = \sum_{i,j,k,l} O_{ij,kl}\ketbra{i}{j}_A\otimes \ketbra{k}{l}_B\), for \(\{\ket i_A\}_i\) and \(\{\ket{k}_B\}_B\) bases of \(\mathcal H_A\) and \(\mathcal H_B\), we obtain:
</p>
\begin{align}
\tr_A(O) & = \sum_{i,k,l} O_{ii,kl}\ketbra{k}{l}_B \\
& = \sum_{i,k,l} (\bra i_A \otimes \bra k_B) O (\ket i_A \otimes \ket l_B) \ketbra{k}{l}_B\\
& = \sum_{i} (\bra i \otimes \one_B) O (\ket i \otimes \one_B),
\end{align}
<p>
which is often abreviated by omitting the \(\one_B\) factor:
</p>
\begin{equation}
\tr_A(O) = \sum_i \bra i_A O \ket i_A.
\end{equation}

<div text="Marginals and Partial Trace (I)" class="remark" id="org67d7888">
<p>
The partial trace for classical composite states corresponds to marginalization of classical joint probability distributions:
Let \(\rho_{X,Y} = \sum_{x,y} \Pr(X=x, Y=y) \ketbra x_X \otimes \ketbra y_Y\), for \(\{\ket x_X\}\) and \(\{\ket y_Y\}\) two orthonormal bases for respectively a system \(X\) and a system \(Y\), then
</p>
\begin{align}
\tr_X (\rho_{X,Y})
& = \sum_{x'} \sum_{x,y} \Pr(X=x, Y=y) \bra {x'}( \ketbra x) \ket{x'} \ketbra y \\
& = \sum_y \Pr(Y = y) \ketbra y,
\end{align}
<p>
where \(\Pr(Y=y) = \sum_x Pr(X=x, Y=y)\).
</p>

</div>

<p>
A similar understanding can be build for generic quantum states: 
</p>
<div text="Marginals and Partial Trace (II)" class="remark" id="orgf3420ae">
<p>
The partial trace corresponds to measuring part of  a composite quantum system using a PVM and being struck by amnesia right after<label id='fnr.1' for='fnr-in.1.6878689' class='margin-toggle sidenote-number'><sup class='numeral'>1</sup></label><input type='checkbox' id='fnr-in.1.6878689' class='margin-toggle'><span class='sidenote'><sup class='numeral'>1</sup>This can be generalized to POVM measurements which will be introduced below.</span>. Let \(\rho\) be a density matrix on \(\mathcal H_A \otimes \mathcal H_B\), then, for \(\{M_i \}\) a PVM on \(A\), we can define the set of quantum vectors  \(\{\ket {e_{i,j}}\}_{i,j}\) such that for a given \(i\), \(\{\ket {e_{i,j}}\}_{j}\) is an orthonormal basis of the subspace stabilized by \(M_i\). Then \(\{\ket {e_{i,j}}\}_{i,j}\) is an orthonormal basis of \(\mathcal H_A\) and \(M_i = \sum_{j} \ketbra{e_i{i,j}}\).<label id='fnr.2' for='fnr-in.2.3112763' class='margin-toggle sidenote-number'><sup class='numeral'>2</sup></label><input type='checkbox' id='fnr-in.2.3112763' class='margin-toggle'><span class='sidenote'><sup class='numeral'>2</sup>Note that here \(\ket{e_{i,j}}\) are vectors on \(\mathcal H_A\), but we omit the index \(A\) to lighten the notation.</span> Hence, 
</p>
\begin{align}
\tr_A(\rho) & = \sum_{i,j} (\bra{e_{i,j}} \otimes \one_B) \rho (\ket{e_{i,j}} \otimes \one_B) \\
& = \sum_{i} \sum_{j} \bra{e_{i,j}} (M_i \otimes \one_B) \rho (M_i \otimes \one_B)\ket{e_{i,j}} \\
& = \sum_{i} \sum_{j} \bra{e_{i,j}} (M_i \otimes \one_B) \rho (M_i \otimes \one_B)\ket{e_{i,j}} \\
& = \sum_{i} \tr_A \left((M_i \otimes \one_B) \rho  (M_i \otimes \one_B) \right)\\
& = \sum_{i} p_i \frac{\tr_A \left((M_i \otimes \one_B) \rho  (M_i \otimes \one_B)\right)}{\tr \left((M_i \otimes \one_B) \rho  (M_i \otimes \one_B)\right)} \\
\end{align}
<p>
with \(p_i = \tr \left((M_i \otimes \one_B) \rho  (M_i \otimes \one_B)\right)\) is the probability of obtaining outcome \(i\) when performing the PVM \(\{M_i\}\). Hence the partial trace corresponds to the average resulting state of subsystem \(B\) after the measurement, i.e. \(A\) is measured and the outcome is forgotten. Note that the invariance of the partial trace under unitary transformations implied that the resulting state does not depend on which measurement has been chosen. That is any measurement does the job equally well, even the measurement that consist of returning always the same outcome.
</p>

</div>

<p>
In particular, if we look at a composite system \(A-B\) in a global pure state, then we see that tracing out \(A\) will in general yield a mixed state. Let \(\ket \psi \in \mathcal H_A \otimes \mathcal H_B\). The most general way to write \(\ket \psi\) given two orthonormal bases \(\{\ket i_A\}\) and \(\{\ket j_B\}\) of \(\mathcal H_A\) and \(\mathcal H_B\), is
</p>
\begin{equation}
\ket\psi = \sum_{i,j} \psi_{i,j} \ket i_A\otimes \ket j_B.
\end{equation}
<p>
Taking the partial trace we obtain:
</p>
\begin{align}
\tr_A \ketbra{\psi} & = \sum_m \bra m_A \left(\sum_{i,j,k,l} \psi_{i,k}\psi^*_{j,l} \ketbra{i}{j}_A\otimes\ketbra{k}{l}_B \right) \ket m_A \\
& = \sum_i \psi_{i,k}\psi^*_{i,l} \ketbra{k}{l}_B.
\end{align}
<p>
We see that in general this does not correspond to a pure state \(\ketbra \psi\). One way to produce a mixed state on \(B\) is thus to consider a larger system \(A-B\) and to trace out \(A\). The natural question then is to what extent any mixed state \(\rho_B\) on \(B\) can be produced in this way, and whether there is or not a single way to do this.
</p>
</div>
</div>

<div id="outline-container-orgf21efa8" class="outline-3">
<h3 id="orgf21efa8"><span class="section-number-3">2.2.</span> From mixed states to pure ones</h3>
<div class="outline-text-3" id="text-2-2">
<p>
Here we try to answer the question: given a mixted state \(\rho_B\) on \(\mathcal B\), is it always possible to view it as the partial trace of a larger system \(A-B\)? We will answer positively and constructively to this question.
</p>

<p>
First, recall that we introduced density matrices through the idea of preparations, i.e. we imagined an experimentalist \(A\) preparing a state \(\ket \psi_i\) with probability \(p_i\) and sending it to \(B\) without telling him the value of \(i\). This resulted in \(\rho_B = \sum p_i \ketbra {\psi_i}\). With the notion of partial trace seen above, it is easy to find a pure state \(\ket \psi\) on \(\mathcal H_A \otimes \mathcal H_B\)  that will produce precisely \(\ket \psi_i\) with probability \(p_i\) under an appropriate measurement on \(A\):
</p>
<div text="Purification of a Preparation" class="definition" id="org20f406b">
<p>
Given a preparation \(\{\ket {\psi_i}_B, p_i \}_i\) of a system \(B\), the puritification of the preparation is the quantum state
</p>
\begin{equation}
\ket \psi = \sum_i \sqrt{p_i} \ket i_A \otimes \ket {\psi_i}_B,
\end{equation}
<p>
Where \(\{\ket i_A\}\) is an orthonormal basis of \(\mathcal H_A\) a sufficiently large Hilbert space of an ancillary system \(A\). 
</p>

</div>

<p>
Now, starting from a generic \(\rho_B\) positive semi-definite trace 1 matrix, we can use that fact that there is a canonical preparation of \(\rho_B\). Indeed, \(\rho_B\) is hermitian and can thus be diagonalized: \(\rho_B = \sum \lambda_i \ketbra{i}_B\). Hence, we can purify this preparation and obtain:
</p>
\begin{align}
& \rho_B = \tr_A \ketbra \psi, \mbox{ with} \\
& \ket \psi = \sum_i \sqrt{\lambda_i} \ket i_A \otimes \ket i_B
\end{align}
<p>
where \(\ket i_A\) is an orthonormal basis for an ancillary system \(A\). Note that one can always perform this purification using a system \(A\) with dimension equal to that of \(B\). Such purification is usually called "the" purification of \(\rho_B\) even though it is obviously not unique as one can perform basis changes on \(A\) without affecting the obtained state.<label id='fnr.3' for='fnr-in.3.3910668' class='margin-toggle sidenote-number'><sup class='numeral'>3</sup></label><input type='checkbox' id='fnr-in.3.3910668' class='margin-toggle'><span class='sidenote'><sup class='numeral'>3</sup>Note that we cannot say all purifications are unitarily equivalent.</span>
</p>

<p>
In conclusion, pure states on composite system give density matrices when one part is traced out. Conversely, any valid density matrix can be associated to a pure state of a composite system. This is a very useful property to understand static situations, but in fact we woud be interested to understand the dynamics of quantum systems in this way. In other terms, when \(\rho\) evolves is there a corresponding evolution for the purification of \(\rho\)?
</p>
</div>
</div>
</section>

<section id="outline-container-org8fa07fc" class="outline-2">
<h2 id="org8fa07fc"><span class="section-number-2">3.</span> Evolutions</h2>
<div class="outline-text-2" id="text-3">
<p>
The topic of this subsection is to understand what are the possible evolutions for a system undergoing an open evolution starting from  \(\mathcal H\) and ending in \(\mathcal H'\). First we will seek to determine the necessary conditions imposed by quantum mechanics on transformations from \(\mathcal H\) to \(\mathcal H'\). Then we will look at sufficiency. Along the way, we will indeed see that going to the Church of the Larger Hilbert space is indeed a very powerful concept.
</p>
</div>

<div id="outline-container-org220e75c" class="outline-3">
<h3 id="org220e75c"><span class="section-number-3">3.1.</span> Choi-Jamiolkowski Isomorphism</h3>
<div class="outline-text-3" id="text-3-1">
<div text="Choi-Jamiolkowski Isomorphism" class="definition" id="orgfa4bdba">
<p>
Let \(\mathcal H_A\) and \(\mathcal H_B\) be two finite dimensional Hilbert-spaces and consider \(\mathcal H_{A'}\)  isomorphic to \(\mathcal H_A\). Consider \(\Gamma \in \mathcal H_{A'}\otimes \mathcal H_{A}\)
</p>
\begin{equation}
\Gamma = \frac{1}{\sqrt d} \sum_{i = 1}^{d} \ket{e_i}_A' \otimes \ket{e_i}_A, 
\end{equation}
<p>
for \(d = \dim(\mathcal H_A)\) and \(\{\ket{e_i}_A\}_i\) a basis of \(\mathcal H_A\) and \(\{\ket{e_i}_{A'}\}_i\) a basis of \(\mathcal H_{A'}\).<label id='fnr.4' for='fnr-in.4.7883690' class='margin-toggle sidenote-number'><sup class='numeral'>4</sup></label><input type='checkbox' id='fnr-in.4.7883690' class='margin-toggle'><span class='sidenote'><sup class='numeral'>4</sup>Because \(\mathcal H_A \simeq \mathcal H_{A'}\) the two bases have the same number of vectors.</span> The Choi-Jamiolkowski Isomorphism relative to the bases \(\{\ket{e_i}_A\}_i\) and  \(\{\ket{e_i}_{A'}\}_i\) is the linear map:
</p>
\begin{align}
\mathsf{C}\ : \
&  Hom(End(\mathcal H_A),End(\mathcal H_B)) \rightarrow End(\mathcal H_{A'} \otimes \mathcal H_B) \\
& \mathcal E \mapsto (\one_{A'} \otimes \mathcal E) [\ketbra{\Gamma}] 
\end{align}

</div>

<div class="lemma" id="org5794e01">
<p>
The Choi-Jamiolkowski Isomorphism is an isomorphism!
</p>

</div>

<div class="proof" id="orgc68b062">
<p>
Because \(\mathsf{C}\) is linear, we simply have to show that a basis of \(Hom(End(\mathcal H_A),End(\mathcal H_B))\) is transformed into a basis of \(End(\mathcal H_{A'} \otimes \mathcal H_B)\).
</p>

<p>
Indeed, using the basis \(\{\ket{e_i}_A\}_i\) for \(\mathcal H_A\) and \(\{\ket{f_k}_B\}_B\) for \(\mathcal H_B\), a basis of \(End(\mathcal H_A)\) is given by \(\{\ketbra{e_i}{e_j}_A\}_{i,j}\), while \(\{\ketbra{f_k}{f_l}_B \}_{k,l}\) is a basis for \(End(\mathcal H_B)\). A basis for \(Hom(End(\mathcal H_A),End(\mathcal H_B))\) can thereby be constructed by mapping one basis vector of \(End(\mathcal H_A)\) to one basis vector of \(End(\mathcal H_B)\) and mapping everything else to \(0\). That is,
</p>
\begin{equation}
\left \{ \mathcal E_{ij,kl}\ : \mathcal E_{ij,kl} [\ketbra{e_i}{e_j}_A] = \ketbra{f_k}{f_l}_B \mbox{ and 0 elsewhere} \right \}_{ij,kl}
\end{equation}
<p>
is a basis of \(Hom(End(\mathcal H_A),End(\mathcal H_B))\).
</p>

<p>
We then need to compute \((\one_{A'} \otimes \mathcal E_{ij,kl})[\ketbra\Gamma]\):
</p>
\begin{align}
(\one_{A'} \otimes \mathcal E_{ij,kl})[\ketbra{\Gamma}]
& = (\one_{A'} \otimes \mathcal E_{ij,kl})[\frac{1}{d}\sum_{mn}\ketbra{e_m}{e_n}_{A'}\otimes \ketbra{e_m}{e_n}_A] \\
& = \frac{1}{d}\ketbra{e_i}{e_j}_{A'}\otimes \ketbra{f_k}{f_l}_B
\end{align}
<p>
which generates a basis of  \(End(\mathcal H_{A'} \otimes \mathcal H_B)\) when \(i,j,k,l\) are varied. So we just prooved that \(\mathsf C\) is sendind a basis to a (non normalized) basis so it is an isomorphism.
</p>

</div>

<div class="remark" id="org4dca25d">
<p>
Seeing \(End(\mathcal H_A)\) as a vector space with a basis \(\ket{\ket{i}}_A\) and similarly for \(End(\mathcal H_B)\), the Choi-Jamiolkowski isomorphism is the mapping \(\ket{\ket{j}}_B \ket{\ket{i}}_A \mapsto \ket{\ket{i}}_A \otimes \ket{\ket j}_B\) up to the isomorphism between \(\mathcal H_A\) and \(\mathcal H_{A'}\).
</p>

</div>
</div>
</div>

<div id="outline-container-orgd0c923f" class="outline-3">
<h3 id="orgd0c923f"><span class="section-number-3">3.2.</span> Necessary conditions</h3>
<div class="outline-text-3" id="text-3-2">
<p>
Equipped with the Choi-Jamiolkowski isomorphism between operators on endomorphisms and endomorphisms on an enlarged Hilbert space, we can now come back to the original motivation of understanding transformations of open quantum systems, i.e. of density matrices viewed as subsets of endomorphisms.
</p>

<p>
First, we realize that for any preparation of \(\rho\) as \(\{(\rho_1, p_1), (\rho_2, p_2)\}\) then we should have
</p>
\begin{align}
\mathcal E[\rho] & = \mathcal E[p_1 \rho_1 + p_2 \rho_2] \\
& = p_1 \mathcal E[\rho_1] + p_2 \mathcal E[\rho_2].
\end{align}
<p>
This implies that \(\mathcal E\) is linear but also that \(\mathcal E[\rho]\) is a positive semi-definite operator with unit trace.
</p>

<div text="Positivity of Operators" class="definition" id="org86219a2">
<p>
\(\mathcal E \in Hom(End(\mathcal H_A), End(\mathcal H_B)\) is <i>positive</i> if
</p>
\begin{equation}
\forall \rho \geq 0, \ \mathcal E[\rho] \geq 0.
\end{equation}

</div>

<p>
But if \(\mathcal E\) is a physical operator, then so should be \(\mathcal E \otimes \one_C\) for a subsystem \(C\) with Hilbert space \(\mathcal H_C\) that is unaffected by the evolution \(\mathcal E\), but which could exhibit initial correlations with the subsystem \(A\). Hence, not only should we have the positivity of \(\mathcal E\), but we should have the positivity of \(\mathcal E \otimes \one_C\) for any \(C\). 
</p>

<div text="Complete Positivity of Operators" class="definition" id="orgbc3dc1a">
<p>
\(\mathcal E \in Hom(End(\mathcal H_A), End(\mathcal H_B)\) is <i>completely positive</i> if
</p>
\begin{equation}
\forall \mathcal H_C, \ \forall \rho \in End(\mathcal A \otimes \mathcal C), \ \rho  \geq 0, \ (\mathcal E \otimes \one_C)[\rho] \geq 0.
\end{equation}

</div>

<p>
Finally, we define
</p>
<div text="Trace Preserving Operators" class="definition" id="org6f9e62f">
<p>
\(\mathcal E \in Hom(End(\mathcal H_A), End(\mathcal H_B)\) is <i>trace preserving</i> if \(\tr(\mathcal E[\rho]) = \tr(\rho)\).
</p>

</div>

<p>
Hence, to summarize, quantum maps need to be:
</p>
<ul class="org-ul">
<li>linear maps from \(End(\mathcal H_A)\) to \(End(\mathcal H_B)\)</li>
<li>completely positive</li>
<li>trace preserving.</li>
</ul>
<p>
Such maps are called <i>Completely Positive Trace Preserving (CPTP)</i> maps.
</p>
</div>
</div>
<div id="outline-container-org1e59205" class="outline-3">
<h3 id="org1e59205"><span class="section-number-3">3.3.</span> Quantum evolution as quantum state (Choi state)</h3>
<div class="outline-text-3" id="text-3-3">
<div text="Choi state" class="definition" id="org66220f9">
<p>
For \(\mathcal E\) a quantum evolution from system \(A\) to system \(B\), given \(A'\) such that \(\mathcal H_A \simeq \mathcal H_{A'}\),
</p>
\begin{equation}
(\one_{A'} \otimes \mathcal E) [\ketbra \Gamma], 
\end{equation}
<p>
where \(\ket \Gamma_{A'A} = \frac{1}{\sqrt d} \sum_i \ket i_{A'} \otimes \ket i_A\) is the <i>Choi-state</i> of \(\mathcal E\). 
</p>

</div>

<div class="remark" id="orgd814dd3">
<p>
The Choi-state of \(\mathcal E\) contains all the information about \(\mathcal E\) as per the Choi-Jamiolkowski isomorphism.
</p>

</div>

<div class="remark" id="orgc1a265d">
<p>
If \(\mathcal E\) is a quantum evolution, then the Choi-state is a regular quantum state. It can be prepared in the lab:
</p>
<ol class="org-ol">
<li>Prepare a maximally entangled state;</li>
<li>Send half of it through \(\mathcal E\) while keeping the other one as a reference.</li>
</ol>
<p>
As a consequence, the Choi-state is a positive semi-definite trace 1 matrix. We will use this as a crucial ingredient to show that indeed all CPTP maps are legitimate evolutions for open quantum systems. 
</p>

</div>

<div class="remark" id="orgedbdf67">
<p>
Because of the previous remarks, we note that to compare two channels, one can perform the preparation of Choi-states for both an perform tomography on them. If we are only interested in knowing if the two channels are equal or not, a SWAP-test can be performed instead.
</p>

</div>
</div>
</div>

<div id="outline-container-orgd3d02b6" class="outline-3">
<h3 id="orgd3d02b6"><span class="section-number-3">3.4.</span> Sufficient conditions</h3>
<div class="outline-text-3" id="text-3-4">
<p>
Let \(\mathcal E \in Hom(End(\mathcal H_A), End(\mathcal H_B))\) that satisfies the 3 necessary conditions above. We will show that it is always possible to consider such transformation as a unitary transformation on a larger Hilbert space, so that these conditions are indeed sufficient.
</p>
</div>

<div id="outline-container-orgd81e492" class="outline-4">
<h4 id="orgd81e492"><span class="section-number-4">3.4.1.</span> Operator sum representation</h4>
<div class="outline-text-4" id="text-3-4-1">
<p>
To show that the CPTP condition is indeed sufficient, we start by constructing the operator sum representation of quantum evolutions. To this end, consider the Choi state \(\rho_{\mathcal E}\)  associated to a CPTP map \(\mathcal E\). Because \(\mathcal E\) is CPTP, the Choi-state is a positive semi-definite trace 1 matrix, i.e. it is an allowed quantum state. As a consequence, \(\rho_{\mathcal E}\) can be diagonalized:
</p>
\begin{equation}
\rho_{\mathcal E} = \sum_{k \in [1, d]} \ketbra{\Gamma^k}_{A'B},
\end{equation}
<p>
where \(d \leq d_A d_B\) and \(\ket{\Gamma^k}\) is unnormalized. Now we can expand \(\ket {\Gamma^k}_{A'B}\) over a basis of \(\mathcal H_{A'} \otimes \mathcal H_B\):
</p>
\begin{equation}
\ket{\Gamma^k}_{A'B} = \sum_{i,j} \alpha^k_{i,j} \ket i_{A'} \otimes \ket j_B,
\end{equation}
<p>
and construct operators \(V^k\) on \(Hom(End(\mathcal H_A),End(\mathcal H_B))\) defined by:
</p>
\begin{equation}
V^k = \sum_{i,j} \alpha^k_{i,j} \ket{j}_B \bra{i}_A.
\end{equation}
<p>
The definition of these \(V^k\) is such that we have \((\one_{A'} \otimes V^k) \ket{\Gamma}_{A'A} = \ket{\Gamma^k}_{A'B}\).
Combining this with the definition of \(\rho_{\mathcal E}\) we obtain:
</p>
\begin{equation}
\rho_{\mathcal E} = \sum_k (\one_{A'} \otimes V^k ) \ketbra{\Gamma}_{A'A} (\one_{A'} \otimes V^{k\dagger}),
\end{equation}
<p>
which gives \(\mathcal E[\rho_A] = \sum_k V^k \rho_A V^{k\dagger}\) using \(\mathcal E[\ketbra{i}{j}_A] = (\bra i_{A'}\otimes \one_B  )\rho_{\mathcal E}(\ket j_{A'} \otimes \one_B)\).
</p>

<p>
Additionally, because \(\mathcal E\) is trace preserving, \(\tr(\mathcal E[{\ketbra{i}{j}}_A]) = \delta_{i,j}\). But
</p>
\begin{align}
\tr(\mathcal E[{\ketbra{i}{j}}_A]) & = \tr\left (\sum_k V^k{\ketbra{i}{j}}_A V^{k\dagger} \right) \\
    & = \bra j_A \left(\sum_k{V^{k\dagger} V^k}\right) \ket i_A,
\end{align}
<p>
so that we have \(\sum_k V^{k\dagger}V^k = \one_A\).
</p>

<div text="Kraus operators" class="definition" id="orgae1503d">
<p>
The operators \(V^k\) are called <i>Kraus operators</i>. They satisfy:
</p>
<ul class="org-ul">
<li>\(V^k \in Hom(\mathcal H_A, \mathcal H_B)\),</li>
<li>\(\sum_{k\in [1,d]} V^{k\dagger}V^k = \one_A\)</li>
</ul>

</div>

<p>
As consequence of the above remark, we see that:
</p>
<div text="Operator Sum Representation" class="definition" id="orge55318b">
<p>
For any CPTP map \(\mathcal E\), there exists Kraus operators such that:
</p>
\begin{equation}
\mathcal E[\rho] = \sum_k V^k \rho V^{k\dagger}
\end{equation}

</div>

<div class="remark" id="orgacb88e5">
<p>
Any set of Kraus operators defines an admissible CPTP map. This is because:
</p>
<ol class="org-ol">
<li>The map defined by \(\sum_k V^k \rho V^{k\dagger}\) is linear;</li>
<li>Is completely positive<label id='fnr.5' for='fnr-in.5.3318223' class='margin-toggle sidenote-number'><sup class='numeral'>5</sup></label><input type='checkbox' id='fnr-in.5.3318223' class='margin-toggle'><span class='sidenote'><sup class='numeral'>5</sup>\(\langle \psi, (\one_{A'} \otimes V^k) \rho_{A'A} (\one_{A'}\otimes V^{k\dagger}) \psi \rangle = \langle \psi (\one_{A'} \otimes V^{k\dagger}),  \rho_{A'A} (\one_{A'}\otimes V^{k\dagger}) \psi \rangle \geq 0\) using \(\psi' = (\one_{A'}\otimes V^{k\dagger}) \psi\) and the positivity of \(\rho\).</span> as \((\one_{A'} \otimes V^k) \rho_{A'A} (\one_{A'}\otimes V^{k\dagger})\) is PSD for any \(k\) and any PSD \(\rho\)</li>
</ol>

</div>

<p>
As a round up remak, we have used Choi-Jamiolkowsi isomorphism in the forward direction to transport our requirements onto quantum evolutions &#x2014; i.e. complete positivity and trace preservation &#x2014; to necessary properties of the Choi state. From there, using vector spaces tools, we derived a generic form of operators defined by positive semi-definite trace 1 Choi-states. This gave the operator sum representation. And we then checked that any such operator was CPTP. Hence, we are half way to our original motivation: we have seen how to represent any CPTP map as Kraus operators. Yet, we are still missing the answer to why all of these CPTP maps are legitimate quantum operaations. The answer comes in the form of the Stinespring dilation theorem.
</p>
</div>
</div>

<div id="outline-container-org5547aa5" class="outline-4">
<h4 id="org5547aa5"><span class="section-number-4">3.4.2.</span> Stinespring dilation</h4>
<div class="outline-text-4" id="text-3-4-2">
<p>
To conclude on the sufficiency of the CPTP criterion above, we show how such maps can be constructed from a closed system evolution. To this end, consider a set of Kraus operators \(\{V^k\}_k\) implementing a CPTP map \(\mathcal E\). Then construct the map:
</p>
\begin{equation}
U = \sum_k V^k \otimes \ket k_C
\end{equation}
<p>
where \(C\) is a fiducial quantum system with sufficiently many dimensions to be able to pair each \(V^k\) with a different basis vector \(\ket k\). \(U\) is a map from \(\mathcal H_A\) to \(\mathcal B \otimes \mathcal C\) that satisfies
</p>
\begin{align}
U^\dagger U & = \left( \sum_k V^{k\dagger}\otimes \bra k \right ) \left( \sum_l V^l \otimes \ket l\right ) \\
& = sum_{kl} V^{k\dagger} V^l \braket{k,l} \\
& = \one_A. 
\end{align}
<p>
Hence \(U\) is an isometry and can be seen as a closed quantum system evolution<label id='fnr.6' for='fnr-in.6.7154385' class='margin-toggle sidenote-number'><sup class='numeral'>6</sup></label><input type='checkbox' id='fnr-in.6.7154385' class='margin-toggle'><span class='sidenote'><sup class='numeral'>6</sup>To this end, we just need to embed this evolution from \(\mathcal H_A\) to \(\mathcal H_B \otimes \mathcal H_C\) into endomorphisms of \(\mathcal H_A \otimes \mathcal H_B \otimes \mathcal H_C\) and constructing a unitary that coincides with \(U\) when a given fiducial state \(\ket 0_B \ket 0_C\) is used as inputs of \(B\) and \(C\).</span>
</p>

<p>
Now, to conclude, we simply realize that
</p>
\begin{align}
U \rho_A U^\dagger & = \sum_{kl} (V^k\otimes \ket k_C) \rho_A(V^{l\dagger}\otimes l_C) \\
& = \sum_{kl} (V^k \rho_A V^{l\dagger}) \otimes \ketbra{k}{l}_C,
\end{align}
<p>
so that \(\tr_C(U\rho U^\dagger) = \mathcal E[\rho]\).
</p>

<p>
Hence, we arrive at the final conclusion: any CPTP map can be seen as unitary evolution on a larger Hilbert space. This is known as <i>Stinespring dilation theorem</i>. And it also shows that, because all unitary transformtations are legitimate quantum operations, any CPTP map is a legal quantum evolution permitted by the axioms of closed systems quantum mechanics.
</p>
</div>
</div>
</div>
</section>
<section id="outline-container-orga43e449" class="outline-2">
<h2 id="orga43e449"><span class="section-number-2">4.</span> Measurements</h2>
<div class="outline-text-2" id="text-4">
</div>
<div id="outline-container-orgb3317c9" class="outline-3">
<h3 id="orgb3317c9"><span class="section-number-3">4.1.</span> (Detour) Post measurement state for PVM</h3>
<div class="outline-text-3" id="text-4-1">
<p>
We intoduced PVM as a collection of rank-1 projectors \(\{\Pi_i\}_i\) on the Hilbert space of the measured system \(\mathcal H\) such that they resolve the identity &#x2014; i.e. \(\sum_i \Pi_i = \one_{\mathcal H}\). For a system in state \(\rho\), the measurement outcome \(i\) associated to \(\Pi_i\) is obtained with probability \(\Pr_{\rho} (i) = \tr(\Pi_i\rho)\).
</p>

<p>
Yet, we haven't said anything about the post-measurement state. In fact, there is a variety of models for the measurements so that I chose <i>not</i> to include it in the main axioms of quantum theory. Yet, the question "what is the post-measurement state of the measured quantum system?" is legitimate. To answer it, we will nonetheless postulate that for what we will call <i>non destructive (and minimally disturbing) measurement</i> if one performs the same measurement twice in a row, without the system being able to evolve between the two rounds of measurements, then the results shoud be the same. That is, if we denote by \(\rho_i\) the post measurement state after outcome \(i\) is obtained, we should have:
\[\tr(\Pi_j \rho_i) = \delta_{i,j}.\]
Using the positivity of \(\rho_i\) and the fact that \(\tr(\rho_i)=1\), we can conclude that \(\rho_i = \Pi_i\). Hence, we can summarize this into the following formula<label id='fnr.7' for='fnr-in.7.876616' class='margin-toggle sidenote-number'><sup class='numeral'>7</sup></label><input type='checkbox' id='fnr-in.7.876616' class='margin-toggle'><span class='sidenote'><sup class='numeral'>7</sup>It is an unnecessarily complicated way of writing the update rule, but we will see that this is the correct way to generalize it to higher rank projectors, and later to generalized measurements.</span>:
</p>
\begin{equation}
\rho_i = \frac{\Pi_i \rho \Pi_i}{\tr(\Pi_i \rho)} \label{eq:update}
\end{equation}

<p>
There is another postulate that we can make about quantum theory which is <i>locality</i>. That is, if we have a composite system \(AB\) and we are interested in predicting measurement results for apparatuses acting on \(A\) only, then it should not depend on what happened to \(B\) provided there was no communication between \(A\) and \(B\). This translates into the following. Take \(\rho_{AB}\) a density matrix on \(AB\) and \(\{\Pi_{A,i}\}_i\) a PVM acting on \(A\). Then,
</p>
\begin{equation}
\Pr_{\rho_{AB}}(i) = \tr_A(\Pi_{A,i}(\tr_B(\rho_{AB}))) = \tr_{AB}((\Pi_{A,i}\otimes \one_B)\rho_{AB}),
\end{equation}

<p>
and the post-measurement state for \(A\) is
</p>

\begin{equation}
\rho_{A,i} = \frac{\Pi_i \tr_B(\rho_{AB}) \Pi_i} {\tr_{AB}((\Pi_{A,i}\otimes \one_B)\rho_{AB})}.
\end{equation}
<p>
This can be rewriten as
</p>
\begin{equation}
\rho_{A,i} = \frac{\tr_B((\Pi_i\otimes \one_B) \rho_{AB}(\Pi_i\otimes \one_B))}{\tr_{AB}((\Pi_{A,i}\otimes \one_B)\rho_{AB})}.
\end{equation}
<p>
If we define \(\rho_i = \frac{(\Pi_i\otimes \one_B) \rho_{AB}(\Pi_i\otimes \one_B)}{\tr_{AB}((\Pi_{A,i}\otimes \one_B)\rho_{AB})}\)
we have that \(\rho_{A,i} = \tr_B(\rho_i)\) and that \(\tr_A(\sum_i \rho_i) = \tr_A(\rho) = \rho_B\) so that \(\rho_i\) can be viewed as a candidate post-measurement state for the larger state \(\rho\). This can be shown to be the only possible case by extending the situation where \(\rho_{AB} = \rho_A \otimes \rho_B\) which can be deduced entirely from the locality condition. A similar argument can be made for the post-measurement state of single systems under PVM with higher rank projectors, so that we can now appreciate the fact that Eq. (\ref{eq:update}) applies to these more general situations<label id='fnr.8' for='fnr-in.8.8686614' class='margin-toggle sidenote-number'><sup class='numeral'>8</sup></label><input type='checkbox' id='fnr-in.8.8686614' class='margin-toggle'><span class='sidenote'><sup class='numeral'>8</sup>Remember that in fact, \(\Pi_{A,i}\otimes \one_B\) is also a higher-rank projector &#x2013;its rank is \(\rk(\Pi_{A,i})\times\dim(\mathcal H_B)\).</span>.
</p>
</div>
</div>
<div id="outline-container-orgeb5199c" class="outline-3">
<h3 id="orgeb5199c"><span class="section-number-3">4.2.</span> Positive Operator-Valued Measurements (POVM)</h3>
<div class="outline-text-3" id="text-4-2">
<p>
Consider a system \(A\) in an initial state \(\rho_A\) that can be coupled through a unitary \(U\) to another system \(B\) initially in a fiducial state \(\ketbra 0\) on which a PVM measurement \(\{\Pi_{B,i}\}_i\) can be made. Now we are interested in the understanding the effect on \(A\) of a measurement on \(B\), while the outcome \(i\) is known to the observer looking at \(A\). Then we have, using the same notation as before:
</p>
\begin{equation}
\rho_{i} = \frac{(\one_A \otimes \Pi_{B,i}) U (\rho_A \otimes \ketbra  0_B) U^\dagger (\one_A \otimes \Pi_{B,i})}{\tr_{AB}((\one_A \otimes \Pi_{B,i}) U (\rho_A \otimes \ketbra 0) U^\dagger)}.
\end{equation}
<p>
The density matrix \(\rho_{A,i}\) of \(A\) when \(i\) is observed is thus:
</p>
\begin{equation}
\rho_{A,i} = \tr_B(\rho_i) = \frac{M_i \rho_A M_i^\dagger}{\tr_A (M_i \rho_A M_i^\dagger)},
\end{equation}
<p>
with \(M_i = \bra i_B U \ket 0_B\). Using the circularity of the trace, we obtain that:
</p>
\begin{equation}
\Pr_{\rho_A}(i) = \tr_A (M_i \rho_A M_i^\dagger) =  \tr(E_i\rho),
\end{equation}
<p>
where \(E_i = M_i^\dagger M_i\).
</p>

<p>
Note that each \(E_i\) is positive and that \(\{E_i\}_i\) is a partition of the identity \(\sum_i E_i = \one_A\), hence the term POVM. Further, we see that the operators \(M_i\) are Kraus operators of the evolution starting with \(\rho_A\) and undergoing the measurement process &#x2014; i.e. interaction with \(\ket 0_B\) and measurement along \(\{\Pi_i\}_i\). Conversely, if one is given the operators \(\{E_i\}_i\), there are several possible ways of implementing the measurement with \(M_i' = U M_i\) as \(M_i^{'\dagger} M_i' = M_i^\dagger M_i = E_i\). This means that the post-measurement state cannot be deduced from the POVM alone. Some further details about the implementation are required. Yet, one can use the same purification techniques as before and prove that any POVN can indeed be realized through a unitary evolution and a measurement on the purifying subsystem.
</p>

<div class="definition" id="orgac1dcd2">
<p>
Using the notation defined above, the operators \(E_i\) are called <i>POVM elements</i> and the specific \(M_i\) are called instruments.
</p>

</div>
</div>
</div>
</section>

<section id="outline-container-orgf3a342e" class="outline-2">
<h2 id="orgf3a342e"><span class="section-number-2">5.</span> Other useful consequence of Choi-Jamiolkowski isomorphism</h2>
</section>

<section id="outline-container-org31e509c" class="outline-2">
<h2 id="org31e509c"><span class="section-number-2">6.</span> References</h2>
<div class="outline-text-2" id="text-6">
<ul class="org-ul">
<li>Preskill Phy219 (<a href="file:///home/holl/org/q/papers.html#MissingReference">Chapter 2 Foundations of Quantum Theory I: States and Ensembles (updated)</a>)</li>
<li><a href="file:///home/holl/org/q/papers.html#MissingReference">From classical to quantum Shannon theory</a></li>
</ul>
</div>

<div id="outline-container-org2529d65" class="outline-3">
<h3 id="org2529d65"><span class="section-number-3">6.1.</span> Op: Pauli, Pauli channels, Unitary rep</h3>
<div class="outline-text-3" id="text-6-1">
<ul class="org-ul">
<li>Preskill Phy 219 (<a href="file:///home/holl/org/q/papers.html#MissingReference">Chapter 3. Foundations of Quantum Theory II: Measurement and Evolution (updated)</a>)</li>
</ul>
</div>
</div>
<div id="outline-container-orga3c7328" class="outline-3">
<h3 id="orga3c7328"><span class="section-number-3">6.2.</span> Op: CPTP, Kraus, Choi, Channels on op. alg, subsystems, restricted classes of ops</h3>
<div class="outline-text-3" id="text-6-2">
<ul class="org-ul">
<li>Preskill Phy 219 (<a href="file:///home/holl/org/q/papers.html#MissingReference">Chapter 3. Foundations of Quantum Theory II: Measurement and Evolution (updated)</a>)</li>
<li>Watrous (<a href="file:///home/holl/org/q/papers.html#MissingReference">Theory of quantum information</a>)</li>
<li>Wilde (<a href="file:///home/holl/org/q/papers.html#MissingReference">From classical to quantum Shannon theory</a>)</li>
<li>Renner (<a href="https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf">https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf</a>)</li>
</ul>
</div>
</div>
<div id="outline-container-org06fd521" class="outline-3">
<h3 id="org06fd521"><span class="section-number-3">6.3.</span> Meas: POVM (a faire + exemples), commutation, entanglememt preview</h3>
<div class="outline-text-3" id="text-6-3">
<ul class="org-ul">
<li>Preskill Phy 219 (<a href="file:///home/holl/org/q/papers.html#MissingReference">Chapter 3. Foundations of Quantum Theory II: Measurement and Evolution (updated)</a>)</li>
<li>Renner (<a href="https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf">https://edu.itp.phys.ethz.ch/hs15/QIT/renner_lecture_notes12.pdf</a>) p54</li>
</ul>
</div>
</div>
</section>
<!-- Footnotes --><!-- 
<div class="footdef"><sup><a id="fn.1" class="footnum" href="#fnr.1" role="doc-backlink">1</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">This can be generalized to POVM measurements which will be introduced below.</p></div></div>

<div class="footdef"><sup><a id="fn.2" class="footnum" href="#fnr.2" role="doc-backlink">2</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Note that here \(\ket{e_{i,j}}\) are vectors on \(\mathcal H_A\), but we omit the index \(A\) to lighten the notation.</p></div></div>

<div class="footdef"><sup><a id="fn.3" class="footnum" href="#fnr.3" role="doc-backlink">3</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Note that we cannot say all purifications are unitarily equivalent.</p></div></div>

<div class="footdef"><sup><a id="fn.4" class="footnum" href="#fnr.4" role="doc-backlink">4</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Because \(\mathcal H_A \simeq \mathcal H_{A'}\) the two bases have the same number of vectors.</p></div></div>

<div class="footdef"><sup><a id="fn.5" class="footnum" href="#fnr.5" role="doc-backlink">5</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">\(\langle \psi, (\one_{A'} \otimes V^k) \rho_{A'A} (\one_{A'}\otimes V^{k\dagger}) \psi \rangle = \langle \psi (\one_{A'} \otimes V^{k\dagger}),  \rho_{A'A} (\one_{A'}\otimes V^{k\dagger}) \psi \rangle \geq 0\) using \(\psi' = (\one_{A'}\otimes V^{k\dagger}) \psi\) and the positivity of \(\rho\).</p></div></div>

<div class="footdef"><sup><a id="fn.6" class="footnum" href="#fnr.6" role="doc-backlink">6</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">To this end, we just need to embed this evolution from \(\mathcal H_A\) to \(\mathcal H_B \otimes \mathcal H_C\) into endomorphisms of \(\mathcal H_A \otimes \mathcal H_B \otimes \mathcal H_C\) and constructing a unitary that coincides with \(U\) when a given fiducial state \(\ket 0_B \ket 0_C\) is used as inputs of \(B\) and \(C\).</p></div></div>

<div class="footdef"><sup><a id="fn.7" class="footnum" href="#fnr.7" role="doc-backlink">7</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">It is an unnecessarily complicated way of writing the update rule, but we will see that this is the correct way to generalize it to higher rank projectors, and later to generalized measurements.</p></div></div>

<div class="footdef"><sup><a id="fn.8" class="footnum" href="#fnr.8" role="doc-backlink">8</a></sup> <div class="footpara" role="doc-footnote"><p class="footpara">Remember that in fact, \(\Pi_{A,i}\otimes \one_B\) is also a higher-rank projector &#x2013;its rank is \(\rk(\Pi_{A,i})\times\dim(\mathcal H_B)\).</p></div></div>

 --></article>
