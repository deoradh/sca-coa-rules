all: sena.html sena.pdf sena.rtf

sena.html: sena2html.xsl sena.xml
	xsltproc sena2html.xsl sena.xml > $@

sena.pdf: sena.fo
	fop sena.fo -pdf $@

sena.rtf: sena.fo
	fop sena.fo -rtf $@ 

sena.fo: sena2fo.xsl sena.xml
	xsltproc sena2fo.xsl sena.xml > $@

clean:
	rm sena.pdf sena.rtf sena.fo sena.html
