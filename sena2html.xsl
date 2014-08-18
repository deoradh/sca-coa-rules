<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="iso-8859-1"/>

<xsl:template match="/sena">
  <xsl:text disable-output-escaping="yes">
    &lt;?php $title="The Standards for Evaluation of Names and Armory"; ?&gt;
    &lt;?php $jquery=1; ?&gt;
    &lt;?php include($_SERVER['DOCUMENT_ROOT'].'/inc/top.html'); ?&gt;
  </xsl:text>
  <h1 align="center">The Standards for Evaluation of Names and Armory:<br/>The Rules for Submissions</h1>
  <xsl:apply-templates select="updated"/>
  <xsl:apply-templates select="intro"/>
  <h2><strong>Table of Contents</strong></h2>
  <p><strong>GP. <a href="#GP">General Principles</a></strong><br/>
  <xsl:apply-templates select="gp" mode="toc"/></p>
  <p><strong>PN. <a href="#PN">Personal Names</a></strong><br/>
  <xsl:apply-templates select="pn" mode="toc"/></p>
  <hr size="2" width="100%" align="center"/>
  <p><span title="GP"><strong><a name="GP"></a>GP. General Principles</strong></span></p>
  <xsl:copy-of select="gphead/*"/>
  <hr size="2" width="100%" align="center"/>
  <xsl:apply-templates select="gp" mode="content"/>
  <p><span title="PN"><strong><a name="PN"></a>PN. Personal Name Registration</strong></span></p>
  <xsl:copy-of select="pnhead/*"/>
  <hr size="2" width="100%" align="center"/>
  <xsl:apply-templates select="pn" mode="content"/>
</xsl:template>

<xsl:template match="updated">
  <p align="center"><strong>As approved April 29, 2012 and updated <xsl:value-of select="."/></strong></p>
</xsl:template>

<xsl:template match="intro">
  <h2><strong>Introduction</strong></h2>
  <xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="gp|pn" mode="toc">
  <xsl:variable name="tag"><xsl:call-template name="uppercase"><xsl:with-param name="str" select="name(.)"/></xsl:call-template></xsl:variable>
  <strong><xsl:value-of select="$tag"/>.<xsl:number/></strong><xsl:text> </xsl:text><a><xsl:attribute name="href">#<xsl:value-of select="$tag"/><xsl:number/></xsl:attribute> <xsl:value-of select="@name"/></a><br/>
</xsl:template>

<xsl:template match="gp|pn" mode="content">
  <xsl:variable name="tag"><xsl:call-template name="uppercase"><xsl:with-param name="str" select="name(.)"/></xsl:call-template></xsl:variable>
  <p><span><xsl:attribute name="title"><xsl:value-of select="$tag"/><xsl:number/></xsl:attribute><strong><a><xsl:attribute name="name"><xsl:value-of select="$tag"/><xsl:number/></xsl:attribute></a><xsl:value-of select="$tag"/>.<xsl:number/>. <xsl:value-of select="@name"/></strong></span></p>
  <xsl:apply-templates select="*">
    <xsl:with-param name="label"><xsl:value-of select="$tag"/><xsl:number/></xsl:with-param>
  </xsl:apply-templates>
  <hr size="2" width="100%" align="center"/>
</xsl:template>

<xsl:template match="gp/sub|pn/sub">
  <xsl:param name="label"/>
  <xsl:apply-templates select="*">
    <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:number format="A"/></xsl:with-param>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="gp/sub/sub|pn/sub/sub|gp/sub/sub/sub/sub|pn/sub/sub/sub/sub">
  <xsl:param name="label"/>
  <blockquote>
    <xsl:apply-templates select="*">
      <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:number/></xsl:with-param>
    </xsl:apply-templates>
  </blockquote>
</xsl:template>

<xsl:template match="gp/sub/sub/sub|pn/sub/sub/sub">
  <xsl:param name="label"/>
  <blockquote>
    <xsl:apply-templates select="*">
      <xsl:with-param name="label"><xsl:value-of select="$label"/><xsl:number format="a"/></xsl:with-param>
    </xsl:apply-templates>
  </blockquote>
</xsl:template>

<xsl:template match="sub/p[1]">
  <xsl:param name="label"/>
  <xsl:variable name="name">
		<xsl:choose>
			<xsl:when test="../@name"><xsl:value-of select="../@name"/></xsl:when>
			<xsl:otherwise><xsl:copy-of select="../name/*|../name/text()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
  <p><span><xsl:attribute name="title"><xsl:value-of select="$label"/></xsl:attribute><strong><a><xsl:attribute name="name"><xsl:value-of select="$label"/></xsl:attribute></a><xsl:value-of select="substring($label,string-length($label))"/>. <xsl:copy-of select="$name"/></strong></span>: <xsl:copy-of select="*|text()"/></p>
</xsl:template>

<xsl:template match="example">
  <blockquote>
    <xsl:apply-templates select="*"/>
  </blockquote>
</xsl:template>

<xsl:template match="p|blockquote|em|ul|li">
  <xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="name"/>

<xsl:template name="uppercase">
  <xsl:param name="str"/>
  <xsl:value-of select="translate($str,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
</xsl:template>

</xsl:stylesheet>
