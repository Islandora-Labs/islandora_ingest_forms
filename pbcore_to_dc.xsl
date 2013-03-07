<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/dc/" 
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="text()" />
    <xsl:template match="/">
        <oai_dc:dc>
            <xsl:attribute name="xmlns:xsi">http://www.w3.org/2001/XMLSchema-instance</xsl:attribute>
            <xsl:attribute name="xsi:schemaLocation">http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd</xsl:attribute>
            <xsl:apply-templates />
        </oai_dc:dc>
    </xsl:template>
    
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreIdentifier">
        <dc:identifier>
            <xsl:value-of select="." />
        </dc:identifier>
    </xsl:template>
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreTitle">
        <dc:title>
            <xsl:value-of select="." />
        </dc:title>
    </xsl:template>
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreSubject">
        <dc:subject>
            <xsl:value-of select="." />
        </dc:subject>
    </xsl:template>
    
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreDescription[@descriptionType = 'Abstract']">
        <dc:description>
            <xsl:value-of select="." />
        </dc:description>
    </xsl:template>
    
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreGenre">
        <dc:subject><xsl:value-of select="." /></dc:subject>
    </xsl:template>
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreCoverage/pbcore:coverage">
        <dc:coverage>
       <xsl:value-of select="." />
        </dc:coverage>
    </xsl:template>
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreCreator">
        <dc:creator>
            <xsl:value-of select="pbcore:creator" /> - <xsl:value-of select="pbcore:creatorRole" />
        </dc:creator>
    </xsl:template>
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreContributor[1]">
        <dc:contributor>
            <xsl:value-of select="pbcore:contributor" /> - <xsl:value-of select="pbcore:contributorRole" />
        </dc:contributor>
    </xsl:template>

    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreRightsSummary">
        <dc:rights><xsl:value-of select="pbcore:rightsSummary" /></dc:rights>
    </xsl:template>
    
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreInstantiation[1]/pbcore:instantiationDate">
        <dc:date><xsl:value-of select="." /></dc:date>
    </xsl:template>
    <xsl:template
        match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreInstantiation[1]/pbcore:instantiationGenerations">
        <dc:type><xsl:value-of select="." /></dc:type>
    </xsl:template>
    <xsl:template
        match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreInstantiation[1]/pbcore:instantiationMediaType">
        <dc:type><xsl:value-of select="." /></dc:type>
    </xsl:template>
    <xsl:template
        match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreInstantiation[1]/pbcore:instantiationDuration">
        <dc:format><xsl:value-of select="." /></dc:format>
    </xsl:template>
    
    <xsl:template match="/pbcore:pbcoreDescriptionDocument/pbcore:pbcoreInstantiation[1]/pbcore:instantiationLanguage">
        <dc:language><xsl:value-of select="." /></dc:language>
    </xsl:template>
        
</xsl:stylesheet>

