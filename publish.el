(require 'ox-publish)

(setq org-html-validation-link nil)

(setq org-publish-project-alist
      '(("h-oll.github.io"
         :base-directory "/home/holl/bibliotheca/h-oll.github.io/"
         :publishing-function org-tufte-publish-to-html
         :publishing-directory "/home/holl/bibliotheca/h-oll.github.io/"

         :with-date nil
         :with-author nil           ; Don't include author name
         :with-creator nil          ; Include Emacs and Org versions in footer
         :with-toc nil              ; Include a table of contents
         :section-numbers nil       ; Don't include section numbers
         :time-stamp-file nil
         :html-head "
<link rel=\"stylesheet\" href=\"./tufte-css/tufte.css\" type=\"text/css\" />
<link rel=\"stylesheet\" href=\"./css/site.css\" type=\"text/css\" />"
         :html-preamble "
<nav class=\"navbar\">
  <ul>
    <li><a href=\"./index.html\">Home</a></li>
    <li><a href=\"./news.html\">News</a></li>
    <!--<li><a href=\"./publications.html\">Publications</a></li>-->
  </ul>
</nav>
")))

(org-publish-all t)
