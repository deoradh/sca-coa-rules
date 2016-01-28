<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml"/>

<xsl:template match="/sena">
  <fo:root>
    <fo:layout-master-set>
      <fo:simple-page-master master-name="SENA"
        page-height="11in" page-width="8.5in" margin-top="0.5in"
        margin-bottom="0.25in" margin-left="0.5in" margin-right="0.5in">
        <fo:region-body margin-top="1in" margin-bottom="1in"/>
        <fo:region-before extent="0.5in"/>
        <fo:region-after extent="0.25in"/>
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
      <fo:static-content flow-name="xsl-region-before">
        <fo:block text-align="center" font-size="14pt" space-after="28pt">
          The Standards for Evaluation of Names and Armory:<fo:block/>The Rules for Submissions
        </fo:block>
      </fo:static-content>
      <fo:static-content flow-name="xsl-region-after">
        <fo:block font-size="8pt" font-family="serif" text-align="right">
          Standards for Evaluation of Names and Armory - April 29, 2012 - Page <fo:page-number/> of <fo:page-number-citation ref-id="terminator"/>
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-family="Times" font-size="12pt">
        <xsl:apply-templates select="intro"/>
        <fo:block font-size="14pt" font-weight="bold" page-break-before="always">Table of Contents</fo:block>
        <fo:table table-layout="fixed" space-before="12pt">
          <fo:table-column column-width="5in"/>
          <fo:table-column column-width="1in"/>
          <fo:table-body>
            <fo:table-row><fo:table-cell><fo:block font-weight="bold">GP. General Principles</fo:block></fo:table-cell></fo:table-row>
            <xsl:apply-templates select="gp" mode="toc"/>
          </fo:table-body>
        </fo:table>
        <fo:table table-layout="fixed" space-before="12pt">
          <fo:table-column column-width="5in"/>
          <fo:table-column column-width="1in"/>
          <fo:table-body>
            <fo:table-row><fo:table-cell><fo:block font-weight="bold">PN. Personal Names</fo:block></fo:table-cell></fo:table-row>
            <xsl:apply-templates select="pn" mode="toc"/>
          </fo:table-body>
        </fo:table>
        <fo:block page-break-before="always" font-weight="bold">GP. General Principles</fo:block>
        <xsl:apply-templates select="gphead/*"/>
        <fo:block><fo:leader leader-pattern="rule" leader-length="6.5in"/></fo:block>
        <xsl:apply-templates select="gp" mode="content"/>
        <fo:block page-break-before="always" font-weight="bold">PN. Personal Names</fo:block>
        <xsl:apply-templates select="pnhead/*"/>
        <fo:block><fo:leader leader-pattern="rule" leader-length="6.5in"/></fo:block>
        <xsl:apply-templates select="pn" mode="content"/>
        <fo:block id="terminator"></fo:block>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<xsl:template match="intro">
  <fo:block font-weight="bold">Introduction</fo:block>
  <xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="gp|pn" mode="toc">
  <xsl:variable name="tag"><xsl:call-template name="uppercase"><xsl:with-param name="str" select="name(.)"/></xsl:call-template></xsl:variable>
  <fo:table-row>
    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="$tag"/>.<xsl:value-of select="@id"/></fo:inline><xsl:text> </xsl:text><xsl:value-of select="@name"/></fo:block></fo:table-cell>
    <fo:table-cell><fo:block text-align="right">pg <fo:page-number-citation><xsl:attribute name="ref-id"><xsl:value-of select="$tag"/><xsl:value-of select="@id"/></xsl:attribute></fo:page-number-citation></fo:block></fo:table-cell>
  </fo:table-row>
</xsl:template>

<xsl:template match="gp|pn" mode="content">
  <xsl:variable name="tag"><xsl:call-template name="uppercase"><xsl:with-param name="str" select="name(.)"/></xsl:call-template></xsl:variable>
  <fo:block font-weight="bold" space-before="12pt"><xsl:attribute name="id"><xsl:value-of select="$tag"/><xsl:value-of select="@id"/></xsl:attribute><xsl:value-of select="$tag"/>.<xsl:value-of select="@id"/>. <xsl:value-of select="@name"/></fo:block>
  <xsl:apply-templates select="*">
    <xsl:with-param name="label"><xsl:value-of select="$tag"/><xsl:value-of select="@id"/></xsl:with-param>
  </xsl:apply-templates>
  <fo:block><fo:leader leader-pattern="rule" leader-length="6.5in"/></fo:block>
</xsl:template>

<xsl:template match="gp/sub|pn/sub">
  <xsl:param name="label"/>
  <xsl:apply-templates select="*">
    <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:value-of select="@id"/></xsl:with-param>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="gp/sub/sub|pn/sub/sub|gp/sub/sub/sub/sub|pn/sub/sub/sub/sub">
  <xsl:param name="label"/>
  <fo:block margin-left="0.5in">
    <xsl:apply-templates select="*">
      <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:value-of select="@id"/></xsl:with-param>
    </xsl:apply-templates>
  </fo:block>
</xsl:template>

<xsl:template match="gp/sub/sub/sub|pn/sub/sub/sub">
  <xsl:param name="label"/>
  <fo:block margin-left="0.5in">
    <xsl:apply-templates select="*">
      <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:value-of select="@id"/></xsl:with-param>
    </xsl:apply-templates>
  </fo:block>
</xsl:template>

<xsl:template match="sub/p[1]">
  <xsl:param name="label"/>
  <xsl:variable name="name">
    <xsl:choose>
      <xsl:when test="../@name"><xsl:value-of select="../@name"/></xsl:when>
      <xsl:otherwise><xsl:apply-templates select="../name/*|../name/text()"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <fo:block space-before="12pt" space-after="12pt"><fo:inline font-weight="bold"><xsl:value-of select="substring($label,string-length($label))"/>. <xsl:copy-of select="$name"/></fo:inline>: <xsl:apply-templates select="*|text()"/></fo:block>
</xsl:template>

<xsl:template match="p">
  <fo:block space-before="12pt" space-after="12pt"><xsl:apply-templates select="*|text()"/></fo:block>
</xsl:template>

<xsl:template match="em">
  <fo:inline font-style="italic"><xsl:apply-templates select="*|text()"/></fo:inline>
</xsl:template>

<xsl:template match="ul">
  <fo:list-block provisional-distance-between-starts="18pt">
    <xsl:apply-templates select="*|text()"/>
  </fo:list-block>
</xsl:template>

<xsl:template match="li">
  <fo:list-item>
    <fo:list-item-label><fo:block>&#x2022;</fo:block></fo:list-item-label>
    <fo:list-item-body start-indent="body-start()"><fo:block><xsl:apply-templates select="*|text()"/></fo:block></fo:list-item-body>
  </fo:list-item>
</xsl:template>

<xsl:template match="blockquote">
  <fo:block margin-left="0.5in" margin-right="0.5in">
    <xsl:apply-templates select="*|text()"/>
  </fo:block>
</xsl:template>

<xsl:template match="example">
  <fo:block margin-left="0.5in" margin-right="0.5in">
    <xsl:apply-templates select="*"/>
  </fo:block>
</xsl:template>

<xsl:template match="name"/>

<xsl:template name="uppercase">
  <xsl:param name="str"/>
  <xsl:value-of select="translate($str,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
</xsl:template>

</xsl:stylesheet>

