<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:datacite="http://datacite.org/schema/kernel-3"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    exclude-result-prefixes="datacite">
    
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />    
    
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8" />  

    <xsl:strip-space elements="*"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*[normalize-space() = '']"/>

    <xsl:template match="datacite:identifier">
        <dc:identifier>
            <xsl:choose>
                <xsl:when test="string-length(@identifierType) &gt; 0">
                    <xsl:value-of select="translate(@identifierType,  $uppercase, $smallcase)"/>
                    <xsl:text>:</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="."/>
        </dc:identifier>
    </xsl:template>
    
    <xsl:template match="datacite:creators">
        <xsl:for-each select="datacite:creator">
            <dc:creator>
                <xsl:value-of select="./datacite:creatorName"/>
            </dc:creator>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:titles">
        <xsl:for-each select="datacite:title">
            <dc:title>
                <xsl:if test="@xml:lang">
                	<xsl:attribute name="xml:lang"><xsl:value-of select="@xml:lang"/></xsl:attribute>
                </xsl:if>
                <xsl:value-of select="."/>
            </dc:title>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:publisher">
        <xsl:for-each select=".">
            <dc:publisher>
                <xsl:value-of select="."/>
            </dc:publisher>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:publicationYear">
        <dc:date>
            <xsl:value-of select="."/>
        </dc:date>
    </xsl:template>
    
    <xsl:template match="datacite:subjects">
        <xsl:for-each select="datacite:subject">
            <dc:subject>
            	<xsl:if test="@xml:lang">
            		<xsl:attribute name="xml:lang"><xsl:value-of select="@xml:lang"/></xsl:attribute>
            	</xsl:if>
                <xsl:value-of select="."/>
            </dc:subject>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:contributors">
        <xsl:for-each select="datacite:contributor">
            <dc:contributor>
                <xsl:value-of select="./datacite:contributorName"/>
            </dc:contributor>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:dates">
        
        <xsl:for-each select="datacite:date">
            <dc:date>
                <xsl:if test="@dateType">
                    <xsl:value-of select="@dateType"/><xsl:text>: </xsl:text>                        
                </xsl:if>
                <xsl:value-of select="."/>
            </dc:date>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:language">
        <dc:language>
            <xsl:value-of select="."/>
        </dc:language>
    </xsl:template>
    
    <xsl:template match="datacite:resourceType">
        <xsl:for-each select=".">
            <xsl:if test="normalize-space(@resourceTypeGeneral)">
                <dc:type>
                    <xsl:value-of select="@resourceTypeGeneral"/>
                </dc:type>
            </xsl:if>
            <xsl:if test="normalize-space(.)">
            <dc:type>
                    <xsl:value-of select="."/>
            </dc:type>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:alternateIdentifiers">
        <xsl:for-each select="datacite:alternateIdentifier">
            <dc:identifier>
                <xsl:choose>
                    <xsl:when test="string-length(@alternateIdentifierType) &gt; 0">
                        <xsl:value-of select="translate(@alternateIdentifierType,  $uppercase, $smallcase)"/>
                        <xsl:text>:</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="."/>
            </dc:identifier>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:relatedIdentifiers">
        <xsl:for-each select="datacite:relatedIdentifier">
            <dc:relation>
                <xsl:choose>
                    <xsl:when test="string-length(@relatedIdentifierType) &gt; 0">
                        <xsl:value-of select="translate(@relatedIdentifierType,  $uppercase, $smallcase)"/>
                        <xsl:text>:</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="."/>            
            </dc:relation>
        </xsl:for-each>            
    </xsl:template>
    
    <xsl:template match="datacite:sizes">
        <xsl:for-each select="datacite:size">
            <dc:format>
                <xsl:value-of select="."/>
            </dc:format>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:formats">
        <xsl:for-each select="datacite:format">
            <dc:format>
                <xsl:value-of select="."/>
            </dc:format>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:rightsList">
        <xsl:for-each select="datacite:rights">
            <dc:rights>
                <xsl:value-of select="."/>
            </dc:rights>
            <xsl:if test="@rightsURI">
                <dc:rights>
                    <xsl:value-of select="@rightsURI"/>
                </dc:rights>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:geoLocations">
        <xsl:for-each select="datacite:geoLocation">
            <xsl:for-each select="child::node()">
                <dc:coverage>
                    <xsl:value-of select="string(.)"/>
                </dc:coverage>
            </xsl:for-each>            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="datacite:descriptions">
        <xsl:for-each select="datacite:description">
            <xsl:if test="normalize-space(@descriptionType)">
                <dc:description>
                    <xsl:value-of select="@descriptionType"/>
                </dc:description>
            </xsl:if>
            <xsl:if test="normalize-space(.)">
                <dc:description>
                    <xsl:if test="@xml:lang">
                        <xsl:attribute name="xml:lang"><xsl:value-of select="@xml:lang" /></xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="."/>
                </dc:description>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    
    <xsl:template match="datacite:resource">
        <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:dc= "http://purl.org/dc/elements/1.1/"
            xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <xsl:apply-templates select="datacite:titles"/>
            <xsl:apply-templates select="datacite:creators"/>
            <xsl:apply-templates select="datacite:publisher"/>
            <xsl:apply-templates select="datacite:publicationYear"/>
            <xsl:apply-templates select="datacite:dates"/>            
            <xsl:apply-templates select="datacite:identifier"/>
            <xsl:apply-templates select="datacite:alternateIdentifiers"/>
            <xsl:apply-templates select="datacite:relatedIdentifiers"/>
            <xsl:apply-templates select="datacite:subjects"/>
            <xsl:apply-templates select="datacite:descriptions"/>
            <xsl:apply-templates select="datacite:contributors"/>
            <xsl:apply-templates select="datacite:language"/>
            <xsl:apply-templates select="datacite:resourceType"/>
            <xsl:apply-templates select="datacite:sizes"/>
            <xsl:apply-templates select="datacite:formats"/>
            <xsl:apply-templates select="datacite:rightsList"/>
            <xsl:apply-templates select="datacite:geoLocations"/>
        </oai_dc:dc>
    </xsl:template> 
    
</xsl:stylesheet>