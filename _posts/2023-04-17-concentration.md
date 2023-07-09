---
layout: post
title:  "Highlights from \"Limitations of variational quantum algorithms: a quantum optimal transport approach\""
tag:    Qatalyze
---

<style>
  #content { max-width: 60em; margin: auto; }
  .title  { text-align: center;
             margin-bottom: .2em; }
  .subtitle { text-align: center;
              font-size: medium;
              font-weight: bold;
              margin-top:0; }
  .todo   { font-family: monospace; color: red; }
  .done   { font-family: monospace; color: green; }
  .priority { font-family: monospace; color: orange; }
  .tag    { background-color: #eee; font-family: monospace;
            padding: 2px; font-size: 80%; font-weight: normal; }
  .timestamp { color: #bebebe; }
  .timestamp-kwd { color: #5f9ea0; }
  .org-right  { margin-left: auto; margin-right: 0px;  text-align: right; }
  .org-left   { margin-left: 0px;  margin-right: auto; text-align: left; }
  .org-center { margin-left: auto; margin-right: auto; text-align: center; }
  .underline { text-decoration: underline; }
  #postamble p, #preamble p { font-size: 90%; margin: .2em; }
  p.verse { margin-left: 3%; }
  pre {
    border: 1px solid #e6e6e6;
    border-radius: 3px;
    background-color: #f2f2f2;
    padding: 8pt;
    font-family: monospace;
    overflow: auto;
    margin: 1.2em;
  }
  pre.src {
    position: relative;
    overflow: auto;
  }
  pre.src:before {
    display: none;
    position: absolute;
    top: -8px;
    right: 12px;
    padding: 3px;
    color: #555;
    background-color: #f2f2f299;
  }
  pre.src:hover:before { display: inline; margin-top: 14px;}
  /* Languages per Org manual */
  pre.src-asymptote:before { content: 'Asymptote'; }
  pre.src-awk:before { content: 'Awk'; }
  pre.src-authinfo::before { content: 'Authinfo'; }
  pre.src-C:before { content: 'C'; }
  /* pre.src-C++ doesn't work in CSS */
  pre.src-clojure:before { content: 'Clojure'; }
  pre.src-css:before { content: 'CSS'; }
  pre.src-D:before { content: 'D'; }
  pre.src-ditaa:before { content: 'ditaa'; }
  pre.src-dot:before { content: 'Graphviz'; }
  pre.src-calc:before { content: 'Emacs Calc'; }
  pre.src-emacs-lisp:before { content: 'Emacs Lisp'; }
  pre.src-fortran:before { content: 'Fortran'; }
  pre.src-gnuplot:before { content: 'gnuplot'; }
  pre.src-haskell:before { content: 'Haskell'; }
  pre.src-hledger:before { content: 'hledger'; }
  pre.src-java:before { content: 'Java'; }
  pre.src-js:before { content: 'Javascript'; }
  pre.src-latex:before { content: 'LaTeX'; }
  pre.src-ledger:before { content: 'Ledger'; }
  pre.src-lisp:before { content: 'Lisp'; }
  pre.src-lilypond:before { content: 'Lilypond'; }
  pre.src-lua:before { content: 'Lua'; }
  pre.src-matlab:before { content: 'MATLAB'; }
  pre.src-mscgen:before { content: 'Mscgen'; }
  pre.src-ocaml:before { content: 'Objective Caml'; }
  pre.src-octave:before { content: 'Octave'; }
  pre.src-org:before { content: 'Org mode'; }
  pre.src-oz:before { content: 'OZ'; }
  pre.src-plantuml:before { content: 'Plantuml'; }
  pre.src-processing:before { content: 'Processing.js'; }
  pre.src-python:before { content: 'Python'; }
  pre.src-R:before { content: 'R'; }
  pre.src-ruby:before { content: 'Ruby'; }
  pre.src-sass:before { content: 'Sass'; }
  pre.src-scheme:before { content: 'Scheme'; }
  pre.src-screen:before { content: 'Gnu Screen'; }
  pre.src-sed:before { content: 'Sed'; }
  pre.src-sh:before { content: 'shell'; }
  pre.src-sql:before { content: 'SQL'; }
  pre.src-sqlite:before { content: 'SQLite'; }
  /* additional languages in org.el's org-babel-load-languages alist */
  pre.src-forth:before { content: 'Forth'; }
  pre.src-io:before { content: 'IO'; }
  pre.src-J:before { content: 'J'; }
  pre.src-makefile:before { content: 'Makefile'; }
  pre.src-maxima:before { content: 'Maxima'; }
  pre.src-perl:before { content: 'Perl'; }
  pre.src-picolisp:before { content: 'Pico Lisp'; }
  pre.src-scala:before { content: 'Scala'; }
  pre.src-shell:before { content: 'Shell Script'; }
  pre.src-ebnf2ps:before { content: 'ebfn2ps'; }
  /* additional language identifiers per "defun org-babel-execute"
       in ob-*.el */
  pre.src-cpp:before  { content: 'C++'; }
  pre.src-abc:before  { content: 'ABC'; }
  pre.src-coq:before  { content: 'Coq'; }
  pre.src-groovy:before  { content: 'Groovy'; }
  /* additional language identifiers from org-babel-shell-names in
     ob-shell.el: ob-shell is the only babel language using a lambda to put
     the execution function name together. */
  pre.src-bash:before  { content: 'bash'; }
  pre.src-csh:before  { content: 'csh'; }
  pre.src-ash:before  { content: 'ash'; }
  pre.src-dash:before  { content: 'dash'; }
  pre.src-ksh:before  { content: 'ksh'; }
  pre.src-mksh:before  { content: 'mksh'; }
  pre.src-posh:before  { content: 'posh'; }
  /* Additional Emacs modes also supported by the LaTeX listings package */
  pre.src-ada:before { content: 'Ada'; }
  pre.src-asm:before { content: 'Assembler'; }
  pre.src-caml:before { content: 'Caml'; }
  pre.src-delphi:before { content: 'Delphi'; }
  pre.src-html:before { content: 'HTML'; }
  pre.src-idl:before { content: 'IDL'; }
  pre.src-mercury:before { content: 'Mercury'; }
  pre.src-metapost:before { content: 'MetaPost'; }
  pre.src-modula-2:before { content: 'Modula-2'; }
  pre.src-pascal:before { content: 'Pascal'; }
  pre.src-ps:before { content: 'PostScript'; }
  pre.src-prolog:before { content: 'Prolog'; }
  pre.src-simula:before { content: 'Simula'; }
  pre.src-tcl:before { content: 'tcl'; }
  pre.src-tex:before { content: 'TeX'; }
  pre.src-plain-tex:before { content: 'Plain TeX'; }
  pre.src-verilog:before { content: 'Verilog'; }
  pre.src-vhdl:before { content: 'VHDL'; }
  pre.src-xml:before { content: 'XML'; }
  pre.src-nxml:before { content: 'XML'; }
  /* add a generic configuration mode; LaTeX export needs an additional
     (add-to-list 'org-latex-listings-langs '(conf " ")) in .emacs */
  pre.src-conf:before { content: 'Configuration File'; }

  table { border-collapse:collapse; }
  caption.t-above { caption-side: top; }
  caption.t-bottom { caption-side: bottom; }
  td, th { vertical-align:top;  }
  th.org-right  { text-align: center;  }
  th.org-left   { text-align: center;   }
  th.org-center { text-align: center; }
  td.org-right  { text-align: right;  }
  td.org-left   { text-align: left;   }
  td.org-center { text-align: center; }
  dt { font-weight: bold; }
  .footpara { display: inline; }
  .footdef  { margin-bottom: 1em; }
  .figure { padding: 1em; }
  .figure p { text-align: center; }
  .equation-container {
    display: table;
    text-align: center;
    width: 100%;
  }
  .equation {
    vertical-align: middle;
  }
  .equation-label {
    display: table-cell;
    text-align: right;
    vertical-align: middle;
  }
  .inlinetask {
    padding: 10px;
    border: 2px solid gray;
    margin: 10px;
    background: #ffffcc;
  }
  #org-div-home-and-up
   { text-align: right; font-size: 70%; white-space: nowrap; }
  textarea { overflow-x: auto; }
  .linenr { font-size: smaller }
  .code-highlighted { background-color: #ffff00; }
  .org-info-js_info-navigation { border-style: none; }
  #org-info-js_console-label
    { font-size: 10px; font-weight: bold; white-space: nowrap; }
  .org-info-js_search-highlight
    { background-color: #ffff00; color: #000000; font-weight: bold; }
  .org-svg { }
</style>
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        displayAlign: "left",
        displayIndent: "5em",

        extensions: ["[Contrib]/physics/physics.js"],

        "HTML-CSS": { scale: 100,
                        linebreaks: { automatic: "false" },
                        webFont: "TeX"
                       },
        SVG: {scale: 100,
              linebreaks: { automatic: "false" },
              font: "TeX"},
        NativeMML: {scale: 100},
        TeX: { equationNumbers: {autoNumber: "AMS"},
               MultLineWidth: "85%",
               TagSide: "right",
               TagIndent: ".8em"
             }
});
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML"></script>

<div id="content" class="content">

Highlights from <a href="https://arxiv.org/abs/2204.03455">arXiv:2204.03455</a>.

<p>
\[
\newcommand{\one}{\mathbb{1}}
\newcommand{\Id}{\mathbb{I}}
\newcommand\supp{\mathrm{supp}}
\newcommand\tr{\mathrm{tr}}
\]
</p>

<div id="outline-container-orge810043" class="outline-2">
<h2 id="orge810043"><span class="section-number-2">1.</span> Definitions</h2>
<div class="outline-text-2" id="text-1">
<div class="definition" id="org1f2f8ba">
<p>
The Lipschitz constant for \(H\) a self-adjoint operator is defined by:
</p>
\begin{equation}
\|H\|_L = 2 \max_{v\in V} \min_{H_{\setminus v}} \|H - H_{\setminus v}\otimes \Id_v\|_{\infty}
\end{equation}

</div>

<div class="definition" id="orgd654d67">
<p>
The sandwiched Renyi divergence of order \(\alpha \in (1,+\infty)\) is defined for two quantum states \(\rho, \sigma\) with \(\supp \rho \subset \supp \sigma\) as
</p>
\begin{equation}
D_{\alpha} (\rho \| \sigma) = \frac{1}{\alpha-1} \log \tr \left[\left(\sigma^{\frac{1-\alpha}{2\alpha}} \rho \sigma^{\frac{1-\alpha}{2\alpha}}\right )^\alpha\right]
\end{equation}

</div>

<div class="definition" id="org3661770">
<p>
A state \(\sigma\) on \(V\) qudits satisfies a Gaussian concentration inequality of parameter \(c\) if there is a constant \(K\) such that for any \(a\) and any observable \(O\):
</p>
\begin{equation}
\Pr_{\sigma} (|O - \langle O\rangle_\sigma \Id| > a |V|) \leq K \exp \left( - \frac{c a^2 |V|}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2}\right)
\end{equation}

</div>
<p>
Above \(|A| = \sqrt {A^\dagger A}\), and \(\Pr_\sigma(|O-\langle
O\rangle_\sigma \Id > a|V|)\) means that for \(E\) the positive part of
\(|O-\langle O\rangle_{\sigma}\Id|-a|V|\Id\), we have \(\tr(E\sigma)\)
bounded by the right hand side of the equation. Note that in the cases
where \(\sigma\) and \(O\) commute \(\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2\)
reduces to \(\| O\|_L^2\).
</p>
</div>
</div>

<div id="outline-container-org283c48c" class="outline-2">
<h2 id="org283c48c"><span class="section-number-2">2.</span> Transferring inequalities</h2>
<div class="outline-text-2" id="text-2">
<div class="theorem" id="orgbdcac30">
<p>
Let \(\rho, \sigma\) be two quantum states on \(\mathcal H_V\). Then for any POVM element \(0 \leq E \leq \Id\) and \(\alpha >1\),
</p>
\begin{equation}
\tr[E\rho] \leq \exp\left( \frac{\alpha -1}{\alpha} (D_\alpha(\rho\|\sigma) + \log(\tr[E\sigma]))\right)
\end{equation}

</div>

<div class="proof" id="org7e0e1fd">
<p>
Using the circularity of the trace we have:
</p>
\begin{align}
\tr[E\rho]
& = \tr[\sigma^{-\frac{1-\alpha}{2\alpha}} E \sigma^{-\frac{1-\alpha}{2\alpha}} \times \sigma^{\frac{1-\alpha}{2\alpha}} \rho  \sigma^{\frac{1-\alpha}{2\alpha}}] \\
& \leq \left\{\tr \left[ \left( \sigma^{-\frac{1-\alpha}{2\alpha}} E \sigma^{-\frac{1-\alpha}{2\alpha}}\right)^\beta \right ]\right\}^{\frac{1}{\beta}} \times \left\{\tr \left[ \left( \sigma^{\frac{1-\alpha}{2\alpha}} \rho \sigma^{\frac{1-\alpha}{2\alpha}} \right)^\alpha \right ]\right\}^{\frac{1}{\alpha}}
\end{align}
<p>
where the last line is obtained by applying H\"older inequality, which holds for \(\frac{1}{\alpha} + \frac{1}{\beta} = 1\).
</p>

<p>
Using the Araki-Lieb-Thirring inequality followed by \(E \leq \Id\) we obtain:
</p>
\begin{align}
\tr \left( \sigma^{-\frac{1-\alpha}{2\alpha}} E \sigma^{-\frac{1-\alpha}{2\alpha}}\right)^\beta
& \leq \tr \left( \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E^\beta \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right) \\
& \leq \tr \left( \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right).
\end{align}
<p>
As \(\beta = \frac{\alpha}{\alpha -1}\) we have
</p>
\begin{equation}
\tr \left( \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E \sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right)=\tr(E\sigma).
\end{equation}

<p>
Additionally, note that
</p>
\begin{equation}
\left \{ \tr \left[ \left( \sigma^{\frac{1-\alpha}{2\alpha}} \rho  \sigma^{\frac{1-\alpha}{2\alpha}} \right)^\alpha \right ]\right\}^{\frac{1}{\alpha}} = \exp (\frac{\alpha -1}{\alpha} D_\alpha(\rho\|\sigma)).
\end{equation}

<p>
Combining the two gives:
</p>
\begin{align}
\tr[E\rho]
& \leq (tr[E\sigma]) \times \exp\left( \frac{\alpha -1}{\alpha} (D_\alpha(\rho\|\sigma))\right) \\
& \leq \exp\left( \frac{\alpha -1}{\alpha} (D_\alpha(\rho\|\sigma))  \log (\tr[E\sigma])\right).
\end{align}

</div>

<p>
Remark that the theorem bounds the probability of observing \(E\) on
\(\rho\) based on the product of the probability of observing \(E\) on
\(\sigma\) times a quantity that depends on \(D_\alpha(\rho\|\sigma)\),
which can be seen as a measure of the distance between the two states
\(\rho\) and \(\sigma\). This will become interesting whenever
\(D_\alpha(\rho\|\sigma)\) becomes small.
</p>

<div class="corollary" id="org4695ae0">
<p>
If \(\sigma\) satisfies a Gaussian concentration inequality 
</p>
\begin{equation}
\Pr_{\sigma} (|O - \langle O\rangle_\sigma \Id| > a |V|) \leq K \exp \left( - \frac{c a^2 |V|}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2}\right)
\end{equation}
<p>
for some constant \(c, K > 0\), then for any \(\alpha > 1\): 
</p>
\begin{equation}
\Pr_{\rho} (|O - \langle O\rangle_\sigma \Id| > a |V|) \leq \exp  \left(\frac{\alpha -1}{\alpha}\left(D_\alpha(\rho\|\sigma) - \frac{c a^2 |V|}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2} + \log(K)\right)\right)
\end{equation}

</div>

<div class="corollary" id="org57fda40">
<p>
For an input state \(\rho\), a noisy circuit evolution \(\mathcal{N}(\rho)\) and a state \(\sigma\) satisfying a Gaussian concentration inequality, whenever there is a value of \(\alpha\) and \(a\) such that
</p>
\begin{equation}
\frac{D_{\alpha}(\mathcal N(\rho) \| \sigma)}{|V|} < \frac{c a^2}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2} - \frac{\log(K)}{|V|},
\end{equation}
<p>
then the probability of observing an outcome of \(O\) outside the interval \(\langle O \rangle_{\sigma} \pm a|V|\) decreases exponentially with \(|V|\).
</p>

</div>
</div>
</div>

<div id="outline-container-orgcb0f66f" class="outline-2">
<h2 id="orgcb0f66f"><span class="section-number-2">3.</span> Bounding \(D_{\alpha}(\mathcal N(\rho) \| \sigma)\)</h2>
<div class="outline-text-2" id="text-3">
<p>
Such bounds can be obtained for noisy circuits where each layer \(i\) is followed by a noisy channel \(\mathcal N\) with a fixed point \(\sigma\) satisfying a strong data processing inequality:
</p>
\begin{equation}
D_\alpha(\mathcal N(\rho) \| \sigma)\leq (1-q) D_\alpha (\rho \|\sigma), \ \forall \rho.
\end{equation}

<p>
In such cases we obtain
</p>
<div class="lemma" id="org7432983">
<p>
Let \(\mathcal N\) be a quantum channel with a unique fixed point \(\sigma\) and satisfying a strong data processing inequality for some \(\alpha > 1\), then for any other channels \(\{\Phi_i\}_{i\leq l}\) we have:
</p>
\begin{equation}
D_\alpha\left( \mathcal P (\rho) \| \sigma \right) \leq (1-q)^l D_\alpha(\rho\|\sigma) + \sum_{i\leq l} (1-q)^{l-i} D_\infty (\Phi_i(\sigma) \| \sigma)
\end{equation}
<p>
where \(D_\infty(\rho \| \sigma) = \log \| \sigma^{-\frac{1}{2}} \rho \sigma^{-\frac{1}{2}}\|_\infty\), and \(\mathcal P = \prod_{i \leq l} \Phi_i \circ \mathcal N\).
</p>

</div>

<div class="proof" id="org4062ecd">
<p>
We proceed by induction on \(l\). For \(l=1\), we use the data processed triangle inequality:
</p>
\begin{equation}
D_\alpha(\Phi_1 \circ \mathcal N  (\rho) \|\sigma) \leq D_\alpha(\mathcal N (\rho) \| \sigma) + D_\infty (\Phi_1 (\sigma) \| \sigma) \leq (1-q) D_\alpha(\rho \| \sigma) + D_\infty (\Phi_1 (\sigma) \| \sigma).
\end{equation}
<p>
The induction is performed in the same way, assuming the property holds for some \(l\) and then applying the data processed triangle inequality.
</p>

</div>
<p>
Note that for unital channels \(\mathcal N(\sigma) = \sigma\) as the
fixed point of the channel is \(\Id\). This implies that \(D_\alpha\left(
\mathcal P (\rho) \| \sigma \right)\) will always converge to 0.
</p>
</div>
</div>

<div id="outline-container-org637fc60" class="outline-2">
<h2 id="org637fc60"><span class="section-number-2">4.</span> Additional notes</h2>
<div class="outline-text-2" id="text-4">
</div>
<div id="outline-container-org9373a48" class="outline-3">
<h3 id="org9373a48"><span class="section-number-3">4.1.</span> Renyi entropies</h3>
<div class="outline-text-3" id="text-4-1">
<p>
In the above definition of Renyi divergence, note that when \(\alpha \rightarrow 1\) we recover the usual relative entropy: 
</p>
\begin{equation}
D_1 (\rho \| \sigma) =  \tr(\rho (\log \rho - \log \sigma)) 
\end{equation}

<p>
This is not a surprise as these sandwiched Renyi divergences have been introduced as a generalization of the usual relative entropy. Renyi entropies \(\frac{1}{1-\alpha} \log \frac{\tr \rho^\alpha}{\tr \rho}\) are also generalizations of von Neumann entropy in that they preserve important properties:
</p>
<ul class="org-ul">
<li>Continuity</li>
<li>Unitary invariance</li>
<li>Normalization</li>
<li>Additivity.</li>
</ul>
</div>
</div>

<div id="outline-container-org1f276fc" class="outline-3">
<h3 id="org1f276fc"><span class="section-number-3">4.2.</span> Relative entropy and Pinsker inequality</h3>
<div class="outline-text-3" id="text-4-2">
<p>
The Pinsker inequality relates the relative entropy to the trace distance. As such it allows to bound the trace distance using information theoretic arguments:
</p>
\begin{equation}
D_1(\rho\|\sigma) \geq \frac{1}{2\log 2} \| \rho -\sigma \|_{\tr}^2
\end{equation}
</div>
</div>
<div id="outline-container-orgc5c639a" class="outline-3">
<h3 id="orgc5c639a"><span class="section-number-3">4.3.</span> Hölder inequality</h3>
<div class="outline-text-3" id="text-4-3">
<p>
For \(A\), \(B\) operators on \(\mathcal H\)
</p>
\begin{equation}
\|AB\|_1 \leq \|A\|_p \|B\|_q, \quad \frac{1}{p} + \frac{1}{q} = 1
\end{equation}
<p>
which translates for matrices into
</p>
\begin{equation}
\tr(|AB|) \leq [\tr(|A|^{p})]^{1/p} \times [\tr(|B|^{q})]^{1/q}, \quad \frac{1}{p} + \frac{1}{q} = 1.
\end{equation}
</div>
</div>
<div id="outline-container-orgc11c70e" class="outline-3">
<h3 id="orgc11c70e"><span class="section-number-3">4.4.</span> Araki-Lieb-Thirring inequality</h3>
<div class="outline-text-3" id="text-4-4">
<p>
For \(A,B \geq 0\), \(q\geq 0\) and \(0\leq r \leq 1\) then
</p>
\begin{equation}
\tr[(A^rB^rA^r)^q] \leq\tr[(ABA)^{rq}].
\end{equation}
<p>
When \(r \geq 1\) the inequality is reversed.
</p>
</div>
</div>
</div>
</div>
