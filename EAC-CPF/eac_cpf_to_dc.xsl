<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:eac="urn:isbn:1-931666-33-4"
    xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0" exclude-result-prefixes="eac">
    <xsl:template match="/">
        <oai_dc:dc xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <xsl:apply-templates select="eac:eac-cpf"/>
        </oai_dc:dc>
    </xsl:template>
    <xsl:template match="eac:eac-cpf">
        <xsl:apply-templates select="eac:cpfDescription"/>
    </xsl:template>
    <xsl:template match="eac:cpfDescription">
        <dc:title>
            <xsl:apply-templates select="eac:identity"/>
            <xsl:apply-templates select="eac:description"/>
        </dc:title>
    </xsl:template>
    <xsl:template match="eac:identity">
        <xsl:choose>
            <xsl:when test="eac:nameEntry[@localType='primary']">
                <xsl:apply-templates select="eac:nameEntry[@localType='primary']/eac:part"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="eac:nameEntry[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="eac:nameEntry[not(@localType='primary')]">
        <xsl:apply-templates select="eac:part[@localType='lastName']"/>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="eac:part[@localType='firstName']"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="eac:part[@localType='middleName']"/>
    </xsl:template>
    <xsl:template match="eac:part">
        <xsl:value-of select="."/>
        <xsl:text>, </xsl:text>
    </xsl:template>
    <xsl:template match="eac:description">
        <xsl:apply-templates select="eac:existDates"/>
    </xsl:template>
    <xsl:template match="eac:existDates">
        <xsl:apply-templates select="eac:dateRange"/>
    </xsl:template>
    <xsl:template match="eac:dateRange">
        <xsl:apply-templates select="eac:fromDate"/>
        <xsl:text>-</xsl:text>
        <xsl:apply-templates select="eac:toDate"/>
    </xsl:template>
</xsl:stylesheet>
