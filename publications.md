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
$('.publications').append("Title: " + data[i].title + "<br />Authors: " + data[i].authors.join(', ') + "<br />Date: " + (new Date(data[i].date)).getFullYear() + "<br />URL: <a href='" + data[i].link + "'>" + data[i].link + "</a><br /><br />");
}
});
}


</script>

</head>

List obtained from arXiv.

<script>search('"Harold Ollivier"')</script>

<div class="publications"></div>
