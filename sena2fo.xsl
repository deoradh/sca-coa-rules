<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml"/>

<xsl:template match="/sena">
  <fo:root>
    <fo:layout-master-set>
      <fo:simple-page-master master-name="SENA"
        page-height="11in" page-width="8.5in" margin-top="1in"
        margin-bottom="0in" margin-left="1in" margin-right="1in">
        <fo:region-body margin-bottom="1in"/>
        <fo:region-after extent="1in"/>
      </fo:simple-page-master>
      <fo:simple-page-master master-name="cover"
        page-height="11in" page-width="8.5in" margin-top="4.5in"
        margin-left="1in" margin-right="1in">
        <fo:region-body/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="cover" force-page-count="no-force">
      <fo:flow flow-name="xsl-region-body" font-family="Times">
        <fo:block text-align="center" font-size="18pt" font-weight="bold" line-height="200%">
          The Standards for Evaluation of Names and Armory:
        </fo:block>
        <fo:block text-align="center" font-size="18pt" font-weight="bold" line-height="200%">
          The Rules for Submissions
        </fo:block>
        <fo:block text-align="center" font-size="14pt" line-height="200%">
          As approved April 29, 2012 and updated <xsl:value-of select="updated"/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="SENA" initial-page-number="1">
      <fo:static-content flow-name="xsl-region-after">
        <fo:block font-size="8pt" font-family="serif" text-align="right">
          Standards for Evaluation of Names and Armory - April 29, 2012 - Page <fo:page-number/> of <fo:page-number-citation ref-id="terminator"/>
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-family="Times" font-size="12pt">
				<fo:block text-align="center" font-size="14pt" space-after="28pt">
					The Standards for Evaluation of Names and Armory:<fo:block/>The Rules for Submissions
				</fo:block>
				<fo:block><xsl:apply-templates select="intro"/></fo:block>
        <fo:block id="terminator"></fo:block>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<xsl:template match="intro">
	<fo:block font-weight="bold">Introduction</fo:block>
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="p">
	<fo:block space-before="12pt" space-after="12pt"><xsl:apply-templates select="*|text()"/></fo:block>
</xsl:template>

</xsl:stylesheet>
