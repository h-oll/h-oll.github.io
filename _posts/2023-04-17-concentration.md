---
layout: post
title:  "Limitations of variational quantum algorithms: a quantum optimal transport approach"
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
        displayAlign: "center",
        displayIndent: "0em",

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

<h1 id="sec:orgb97357a">Definitions</h1>
<div class="definition">
<p><strong>Definition 1</strong>. <em>The Lipschitz constant for <span
class="math inline">\(H\)</span> a self-adjoint operator is defined by:
<span class="math display">\[\|H\|_L = 2 \max_{v\in V}
\min_{H_{\setminus v}} \|H - H_{\setminus v}\otimes
\mathbb{I}_v\|_{\infty}\]</span></em></p>
</div>
<div class="definition">
<p><strong>Definition 2</strong>. <em>The sandwiched Renyi divergence of
order <span class="math inline">\(\alpha \in (1,+\infty)\)</span> is
defined for two quantum states <span class="math inline">\(\rho,
\sigma\)</span> with <span
class="math inline">\(\mathop{\mathrm{supp}}\rho \subset
\mathop{\mathrm{supp}}\sigma\)</span> as <span
class="math display">\[D_{\alpha} (\rho \| \sigma) = \frac{1}{\alpha-1}
\log \mathop{\mathrm{tr}}\left[\left(\sigma^{\frac{1-\alpha}{2\alpha}}
\rho \sigma^{\frac{1-\alpha}{2\alpha}}\right
)^\alpha\right]\]</span></em></p>
</div>
<div class="definition">
<p><strong>Definition 3</strong>. <em>A state <span
class="math inline">\(\sigma\)</span> on <span
class="math inline">\(V\)</span> qudits satisfies a Gaussian
concentration inequality of parameter <span
class="math inline">\(c\)</span> if there is a constant <span
class="math inline">\(K\)</span> such that for any <span
class="math inline">\(a\)</span> and any observable <span
class="math inline">\(O\)</span>: <span
class="math display">\[\Pr_{\sigma} (|O - \langle O\rangle_\sigma
\mathbb{I}| &gt; a |V|) \leq K \exp \left( - \frac{c a^2 |V|}{\|
\sigma^{-1/2} O \sigma^{1/2}\|_L^2}\right)\]</span></em></p>
</div>
<p>Above <span class="math inline">\(|A| = \sqrt {A^\dagger A}\)</span>.
Note that in the cases where <span class="math inline">\(\sigma\)</span>
and <span class="math inline">\(O\)</span> commute <span
class="math inline">\(\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2\)</span>
reduces to <span class="math inline">\(\| O\|_L^2\)</span>.</p>
<h1 id="sec:orgcdccd7e">Transferring inequalities</h1>
<div class="theorem">
<p><strong>Theorem 1</strong>. <em>Let <span class="math inline">\(\rho,
\sigma\)</span> be two quantum states on <span
class="math inline">\(\mathcal H_V\)</span>. Then for any POVM element
<span class="math inline">\(0 \leq E \leq \mathbb{I}\)</span> and <span
class="math inline">\(\alpha &gt;1\)</span>, <span
class="math display">\[\mathop{\mathrm{tr}}[E\rho] \leq \exp\left(
\frac{\alpha -1}{\alpha} (D_\alpha(\rho\|\sigma) +
\log(\mathop{\mathrm{tr}}[E\sigma]))\right)\]</span></em></p>
</div>
<div class="proof">
<p><em>Proof.</em> Using the circularity of the trace we have: <span
class="math display">\[\begin{aligned}
\mathop{\mathrm{tr}}[E\rho]
&amp; = \mathop{\mathrm{tr}}[\sigma^{-\frac{1-\alpha}{2\alpha}} E
\sigma^{-\frac{1-\alpha}{2\alpha}} \times
\sigma^{\frac{1-\alpha}{2\alpha}}
\rho  \sigma^{\frac{1-\alpha}{2\alpha}}] \\
&amp; \leq \mathop{\mathrm{tr}}\left[ \left(
\sigma^{-\frac{1-\alpha}{2\alpha}} E
\sigma^{-\frac{1-\alpha}{2\alpha}}\right)^\beta \right
]^{\frac{1}{\beta}} \times \mathop{\mathrm{tr}}\left[ \left(
\sigma^{\frac{1-\alpha}{2\alpha}}
\rho  \sigma^{\frac{1-\alpha}{2\alpha}} \right)^\alpha \right
]^{\frac{1}{\alpha}}\end{aligned}\]</span> where the last line is
obtained by applying Hölder inequality, which holds for <span
class="math inline">\(\frac{1}{\alpha} + \frac{1}{\beta} =
1\)</span>.</p>
<p>Using the Araki-Lieb-Thirring inequality followed by <span
class="math inline">\(E \leq \mathbb{I}\)</span> we obtain: <span
class="math display">\[\begin{aligned}
\mathop{\mathrm{tr}}\left( \sigma^{-\frac{1-\alpha}{2\alpha}} E
\sigma^{-\frac{1-\alpha}{2\alpha}}\right)^\beta
&amp; \leq \mathop{\mathrm{tr}}\left(
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E^\beta
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right) \\
&amp; \leq \mathop{\mathrm{tr}}\left(
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right).\end{aligned}\]</span>
As <span class="math inline">\(\beta = \frac{\alpha}{\alpha -1}\)</span>
we have <span class="math display">\[\mathop{\mathrm{tr}}\left(
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}} E
\sigma^{-\frac{(1-\alpha)\beta}{2\alpha}}\right)=\mathop{\mathrm{tr}}(E\sigma).\]</span></p>
<p>Additionally, note that <span
class="math display">\[\mathop{\mathrm{tr}}\left[ \left(
\sigma^{\frac{1-\alpha}{2\alpha}}
\rho  \sigma^{\frac{1-\alpha}{2\alpha}} \right)^\alpha \right
]^{\frac{1}{\alpha}} = \exp (\frac{\alpha -1}{\alpha}
D_\alpha(\rho\|\sigma)).\]</span></p>
<p>Combining the two gives: <span class="math display">\[\begin{aligned}
\mathop{\mathrm{tr}}[E\rho]
&amp; \leq (tr[E\sigma]) \times \exp\left( \frac{\alpha -1}{\alpha}
(D_\alpha(\rho\|\sigma))\right) \\
&amp; \leq \exp\left( \frac{\alpha -1}{\alpha}
(D_\alpha(\rho\|\sigma))  \log
(\mathop{\mathrm{tr}}[E\sigma])\right).\end{aligned}\]</span> ◻</p>
</div>
<p>Remark that the theorem bounds the probability of observing <span
class="math inline">\(E\)</span> on <span
class="math inline">\(\rho\)</span> based on the product of the
probability of observing <span class="math inline">\(E\)</span> on <span
class="math inline">\(\sigma\)</span> times a quantity that depends on
<span class="math inline">\(D_\alpha(\rho\|\sigma)\)</span>, which can
be seen as a measure of the distance between the two states <span
class="math inline">\(\rho\)</span> and <span
class="math inline">\(\sigma\)</span>. This will become interesting
whenever <span class="math inline">\(D_\alpha(\rho\|\sigma)\)</span>
becomes small.</p>
<div class="corollary">
<p><strong>Corollary 1</strong>. <em>If <span
class="math inline">\(\sigma\)</span> satisfies a Gaussian concentration
inequality <span class="math display">\[\Pr_{\sigma} (|O - \langle
O\rangle_\sigma \mathbb{I}| &gt; a |V|) \leq K \exp \left( - \frac{c a^2
|V|}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2}\right)\]</span> for some
constant <span class="math inline">\(c, K &gt; 0\)</span>, then for any
<span class="math inline">\(\alpha &gt; 1\)</span>: <span
class="math display">\[\Pr_{\rho} (|O - \langle O\rangle_\sigma
\mathbb{I}| &gt; a |V|) \leq \exp  \left(\frac{\alpha
-1}{\alpha}\left(D_\alpha(\rho\|\sigma) - \frac{c a^2 |V|}{\|
\sigma^{-1/2} O \sigma^{1/2}\|_L^2} +
\log(K)\right)\right)\]</span></em></p>
</div>
<div class="corollary">
<p><strong>Corollary 2</strong>. <em>For an input state <span
class="math inline">\(\rho\)</span>, a noisy circuit evolution <span
class="math inline">\(\mathcal{N}(\rho)\)</span> and a state <span
class="math inline">\(\sigma\)</span> satisfying a Gaussian
concentration inequality, whenever there is a value of <span
class="math inline">\(\alpha\)</span> and <span
class="math inline">\(a\)</span> such that <span
class="math display">\[\frac{D_{\alpha}(\mathcal N(\rho) \|
\sigma)}{|V|} &lt; \frac{c a^2}{\| \sigma^{-1/2} O \sigma^{1/2}\|_L^2} -
\frac{\log(K)}{|V|},\]</span> then the probability of observing an
outcome of <span class="math inline">\(O\)</span> outside the interval
<span class="math inline">\(\langle O \rangle_{\sigma} \pm a|V|\)</span>
decreases exponentially with <span
class="math inline">\(|V|\)</span>.</em></p>
</div>
<h1 id="sec:org9a50fc6">Bounding <span
class="math inline">\(D_{\alpha}(\mathcal N(\rho) \|
\sigma)\)</span></h1>
<p>Such bounds can be obtained for noisy circuits where each layer <span
class="math inline">\(i\)</span> is followed by a noisy channel <span
class="math inline">\(\mathcal N\)</span> with a fixed point <span
class="math inline">\(\sigma\)</span> satisfying a strong data
processing inequality: <span class="math display">\[D_\alpha(\mathcal
N(\rho) \| \sigma)\leq (1-q) D_\alpha (\rho \|\sigma), \ \forall
\rho.\]</span></p>
<p>In such cases we obtain</p>
<div class="lemma">
<p><strong>Lemma 1</strong>. <em>Let <span
class="math inline">\(\mathcal N\)</span> be a quantum channel with a
unique fixed point <span class="math inline">\(\sigma\)</span> and
satisfying a strong data processing inequality for some <span
class="math inline">\(\alpha &gt; 1\)</span>, then for any other
channels <span class="math inline">\(\{\Phi_i\}_{i\leq l}\)</span> we
have: <span class="math display">\[D_\alpha\left( \mathcal P (\rho) \|
\sigma \right) \leq (1-q)^l D_\alpha(\rho\|\sigma) + \sum_{i\leq l}
(1-q)^{l-i} D_\infty (\Phi_i(\sigma) \| \sigma)\]</span> where <span
class="math inline">\(D_\infty(\rho \| \sigma) = \log \|
\sigma^{-\frac{1}{2}} \rho \sigma^{-\frac{1}{2}}\|_\infty\)</span>, and
<span class="math inline">\(\mathcal P = \prod_{i \leq l} \Phi_i \circ
\mathcal N\)</span>.</em></p>
</div>
<div class="proof">
<p><em>Proof.</em> We proceed by induction on <span
class="math inline">\(l\)</span>. For <span
class="math inline">\(l=1\)</span>, we use the data processed triangle
inequality: <span class="math display">\[D_\alpha(\Phi_1 \circ \mathcal
N  (\rho) \|\sigma) \leq D_\alpha(\mathcal N (\rho) \| \sigma) +
D_\infty (\Phi_1 (\sigma) \| \sigma) \leq (1-q) D_\alpha(\rho \| \sigma)
+ D_\infty (\Phi_1 (\sigma) \| \sigma).\]</span> The induction is
performed in the same way, assuming the property holds for some <span
class="math inline">\(l\)</span> and then applying the data processed
triangle inequality. ◻</p>
</div>
<p>Note that for unital channels <span class="math inline">\(\mathcal
N(\sigma) = \sigma\)</span> as the fixed point of the channel is <span
class="math inline">\(\mathbb{I}\)</span>. This implies that <span
class="math inline">\(D_\alpha\left(
\mathcal P (\rho) \| \sigma \right)\)</span> will always converge to
0.</p>
<h1 id="sec:org3d74ce6">Additional notes</h1>
<h1 id="sec:orgf48bec2">Renyi entropies</h1>
<p>In the above definition of Renyi divergence, note that when <span
class="math inline">\(\alpha \rightarrow 1\)</span> we recover the usual
relative entropy: <span class="math display">\[D_1 (\rho \| \sigma)
=  \mathop{\mathrm{tr}}(\rho (\log \rho - \log \sigma))\]</span></p>
<p>This is not a surprise as these sandwiched Renyi divergences have
been introduced as a generalization of the usual relative entropy. Renyi
entropies <span class="math inline">\(\frac{1}{1-\alpha} \log
\frac{\mathop{\mathrm{tr}}\rho^\alpha}{\mathop{\mathrm{tr}}\rho}\)</span>
are also generalizations of von Neumann entropy in that they preserve
important properties:</p>
<ul>
<li><p>continuity</p></li>
<li><p>unitary invariance</p></li>
<li><p>Normalization</p></li>
<li><p>Additivity.</p></li>
</ul>
<h1 id="sec:orgeedcd18">Relative entropy and Pinsker inequality</h1>
<p>The Pinsker inequality relates the relative entropy to the trace
distance. As such it allows to bound the trace distance using
information theoretic arguments: <span
class="math display">\[D_1(\rho\|\sigma) \geq \frac{1}{2\log 2} \| \rho
-\sigma \|_{\mathop{\mathrm{tr}}}^2\]</span></p>
<h1 id="sec:orgc8d8ce5">Hölder inequality</h1>
<p>For <span class="math inline">\(A\)</span>, <span
class="math inline">\(B\)</span> operators on <span
class="math inline">\(\mathcal H\)</span> <span
class="math display">\[\|AB\|_1 \leq \|A\_p \|B\_q, \quad \frac{1}{p} +
\frac{1}{q} = 1\]</span></p>
<h1 id="sec:org7ac1d3f">Araki-Lieb-Thirring inequality</h1>
<p>For <span class="math inline">\(A,B \geq 0\)</span>, <span
class="math inline">\(q\geq 0\)</span> and <span
class="math inline">\(0\leq r \leq 1\)</span> then <span
class="math display">\[\mathop{\mathrm{tr}}(A^rB^rA^r)^q
\leq\mathop{\mathrm{tr}}(ABA)^{rq}.\]</span> When <span
class="math inline">\(r \geq 1\)</span> the inequality is reversed.</p>


