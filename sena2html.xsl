<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>

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
	<strong>GP. <a href="#GP">General Principles</a></strong><br/>
	<p><xsl:apply-templates select="gp" mode="toc"/></p>
	<hr size="2" width="100%" align="center"/>
	<p><span title="GP"><strong><a name="GP"></a>GP. General Principles</strong></span></p>
	<p>This section of the Standards for Evaluation of Names and Armory discusses general principles for considering submissions, including definitions of some terms used in multiple sections of the Standards for Evaluation of Names and Armory.</p>
	<hr size="2" width="100%" align="center"/>
	<xsl:apply-templates select="gp" mode="content"/>
</xsl:template>

<xsl:template match="updated">
	<p align="center"><strong>As approved April 29, 2012 and updated <xsl:value-of select="."/></strong></p>
</xsl:template>

<xsl:template match="intro">
	<h2><strong>Introduction</strong></h2>
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="gp" mode="toc">
	<strong>GP.<xsl:number/></strong><xsl:text> </xsl:text><a><xsl:attribute name="href">#GP<xsl:number/></xsl:attribute> <xsl:value-of select="@name"/></a><br/>
</xsl:template>

<xsl:template match="gp" mode="content">
	<p><span><xsl:attribute name="title">GP<xsl:number/></xsl:attribute><strong><a><xsl:attribute name="name">GP<xsl:number/></xsl:attribute></a>GP.<xsl:number/>. <xsl:value-of select="@name"/></strong></span></p>
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="gp/sub|gp/sub/sub">
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="gp/sub/p">
	<xsl:choose>
		<xsl:when test="position()=1">
			<p><span><xsl:attribute name="title">GP<xsl:number count="gp"/><xsl:number count="gp/sub" format="A"/></xsl:attribute><strong><a><xsl:attribute name="name">GP<xsl:number count="gp"/><xsl:number count="gp/sub" format="A"/></xsl:attribute></a><xsl:number count="gp/sub" format="A"/>. <xsl:value-of select="../@name"/></strong></span>: <xsl:copy-of select="*|text()"/></p>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gp/sub/sub/p">
	<xsl:choose>
		<xsl:when test="position()=1">
			<p><span><xsl:attribute name="title">GP<xsl:number count="gp"/><xsl:number count="gp/sub" format="A"/><xsl:number count="gp/sub/sub"/></xsl:attribute><strong><a><xsl:attribute name="name">GP<xsl:number count="gp"/><xsl:number count="gp/sub" format="A"/><xsl:number count="gp/sub/sub"/></xsl:attribute></a><xsl:number count="gp/sub/sub"/>. <xsl:value-of select="../@name"/></strong></span>: <xsl:copy-of select="*|text()"/></p>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="p|blockquote">
	<xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>
