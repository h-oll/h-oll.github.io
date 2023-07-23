---
title: Publications
layout: page
---

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
/**
 * Searches arXiv for papers/documents that match the supplied parameters
 * @param {string} all
 * @param {string} author
 * @param {string} title
 * @param {string} abstrct
 * @param {string} journal_ref
 * @returns {Promise}
 */
function arxiv_search({all, author, title, abstrct, journal_ref}) {
    var baseUrl = "https://export.arxiv.org/api/query?search_query=";
    var first = true;
    
    if (author) {
	if (!first) {
	    baseUrl += '+AND+';
	}
	baseUrl += "au:" + author;
	first = false;
    }
    
    if (title) {
	if (!first) {
	    baseUrl += '+AND+';
	}
	baseUrl += "ti:" + title;
	first = false;
    }
    
    if (abstrct) {
	if (!first) {
	    baseUrl += '+AND+';
	}
	baseUrl += "abs:" + abstrct;
	first = false;
    }
    
    if (all) {
	if (!first) {
	    baseUrl += '+AND+';
	}
	baseUrl += "all:" + all;
    }

    baseUrl += "&max_results=1000&sortBy=submittedDate&sortOrder=descending";
    
    var deferred = $.Deferred();
    $.ajax({
        url: baseUrl,
        type: "get",
        dataType: "xml",
        success: function(xml) {
	    var entry = [];
	    $(xml).find('entry').each(function (index) {
		var id = $(this).find('id').text();
		var pub_date = $(this).find('published').text();
		var title = $(this).find('title').text();
		var summary = $(this).find('summary').text();
		var authors = [];
		$(this).find('name').each(function (index) {
		    authors.push($(this).text());
		});

		entry.push({'title': title,
			    'link': id,
			    'summary': summary,
			    'date': pub_date,
			    'authors': authors,
			   });
	    });
	    
	    deferred.resolve(entry);
        },
        error: function(status) {
            console.log("request error " + status + " for url: "+baseUrl);
        }
    });
    return deferred.promise();
}

function search(title) {
$.when(arxiv_search({author: title})).then( function(data) { 
$('.results').empty();
for (var i = 0; i < data.length; ++i) {
$('.results').append("Title: " + data[i].title + "<br />Authors: " + data[i].authors.join(', ') + "<br />Date: " + (new Date(data[i].date)).getFullYear() + "<br />URL: <a href='" + data[i].link + "'>" + data[i].link + "</a><br /><br />");
}
});
}


</script>


</head>

This page shows all public GitHub repos which are owned by me.

<div id="repos">
    <!-- <div class="container"> -->
    <!--     <\!-- Filter controls -\-> -->
    <!--     <div class="field"> -->
    <!--         <p class="control has-icons-left"> -->
    <!--             <input class="search input" type="text" placeholder="Search repo names"> -->
    <!--             <span class="icon is-left"> -->
    <!--                 <i class="fas fa-search" aria-hidden="true"></i> -->
    <!--             </span> -->
    <!--         </p> -->
    <!--     </div> -->
    <!-- </div> -->

    <!-- <br> -->
    <!-- <br> -->

    <!-- <div class="container"> -->
    <!--     <div id="repo-cards" class="columns is-multiline list"> -->
    <!--         {% for repo_data in site.data.all_repos %} -->
    <!--             {% assign repo = repo_data[1] %} -->
    <!--             <div class="column is-3-widescreen is-4-desktop is-6-tablet is-8-mobile"> -->
    <!--                 {% include repo-card.html %} -->
    <!--             </div> -->
    <!--         {% endfor %} -->
    <!--     </div> -->
    <!-- </div> -->

    <form>
      Title
      <br />
      <input type='text' name='doc_title'>
      <br />
      <input type="button" value="Search" onclick="search(document.getElementsByName('doc_title')[0].value)">
    </form>
    <div class='results'>
    </div>



</div>

