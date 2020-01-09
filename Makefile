20200109-presentation.html: presentation.md References.bib
	pandoc -s -c scrollable.css -t revealjs -V theme=white -V revealjs-url=. --mathjax --toc --toc-depth=1 -o 20200109-presentation.html --bibliography References.bib presentation.md
