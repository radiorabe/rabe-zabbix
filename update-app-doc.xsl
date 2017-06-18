<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings" version="1.0" extension-element-prefixes="str">
  <xsl:output method="text"/>

  <xsl:param name="appName"/>
  <xsl:param name="appHead"/>
  <xsl:param name="selinuxDoc"/>
  <xsl:param name="userparamDoc"/>
  <xsl:param name="scriptDoc"/>

  <!-- add a description to a * list of items -->
  <xsl:template name="output-description-if-available"><xsl:if test="description != ''"><xsl:text>

</xsl:text><xsl:value-of select="description"/><xsl:text>
</xsl:text>
</xsl:if></xsl:template>

  <!-- str:split template from http://exslt.org/ -->
  <xsl:template name="str:split">
  	<xsl:param name="string" select="''" />
    <xsl:param name="pattern" select="' '" />
    <xsl:choose>
      <xsl:when test="not($string)" />
      <xsl:when test="not($pattern)">
        <xsl:call-template name="str:_split-characters">
          <xsl:with-param name="string" select="$string" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="str:_split-pattern">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="pattern" select="$pattern" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="str:_split-characters">
    <xsl:param name="string" />
    <xsl:if test="$string">
      <token><xsl:value-of select="substring($string, 1, 1)" /></token>
      <xsl:call-template name="str:_split-characters">
        <xsl:with-param name="string" select="substring($string, 2)" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="str:_split-pattern">
    <xsl:param name="string" />
    <xsl:param name="pattern" />
    <xsl:choose>
      <xsl:when test="contains($string, $pattern)">
        <xsl:if test="not(starts-with($string, $pattern))">
          <token><xsl:value-of select="substring-before($string, $pattern)" /></token>
        </xsl:if>
        <xsl:call-template name="str:_split-pattern">
          <xsl:with-param name="string" select="substring-after($string, $pattern)" />
          <xsl:with-param name="pattern" select="$pattern" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <token><xsl:value-of select="$string" /></token>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- str:replace template from http://exslt.org/ -->
  <xsl:template name="str:replace">
  	<xsl:param name="string" select="''" />
     <xsl:param name="search" select="/.." />
     <xsl:param name="replace" select="/.." />
     <xsl:choose>
        <xsl:when test="not($string)" />
        <xsl:when test="not($search)">
          <xsl:value-of select="$string" />
        </xsl:when>
        <xsl:when test="function-available('exsl:node-set')">
           <!-- this converts the search and replace arguments to node sets
                if they are one of the other XPath types -->
           <xsl:variable name="search-nodes-rtf">
             <xsl:copy-of select="$search" />
           </xsl:variable>
           <xsl:variable name="replace-nodes-rtf">
             <xsl:copy-of select="$replace" />
           </xsl:variable>
           <xsl:variable name="replacements-rtf">
              <xsl:for-each select="exsl:node-set($search-nodes-rtf)/node()">
                 <xsl:variable name="pos" select="position()" />
                 <replace search="{.}">
                    <xsl:copy-of select="exsl:node-set($replace-nodes-rtf)/node()[$pos]" />
                 </replace>
              </xsl:for-each>
           </xsl:variable>
           <xsl:variable name="sorted-replacements-rtf">
              <xsl:for-each select="exsl:node-set($replacements-rtf)/replace">
                 <xsl:sort select="string-length(@search)" data-type="number" order="descending" />
                 <xsl:copy-of select="." />
              </xsl:for-each>
           </xsl:variable>
           <xsl:call-template name="str:_replace">
              <xsl:with-param name="string" select="$string" />
              <xsl:with-param name="replacements" select="exsl:node-set($sorted-replacements-rtf)/replace" />
           </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
           <xsl:message terminate="yes">
              ERROR: template implementation of str:replace relies on exsl:node-set().
           </xsl:message>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:template>
  
  <xsl:template name="str:_replace">
    <xsl:param name="string" select="''" />
    <xsl:param name="replacements" select="/.." />
    <xsl:choose>
      <xsl:when test="not($string)" />
      <xsl:when test="not($replacements)">
        <xsl:value-of select="$string" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="replacement" select="$replacements[1]" />
        <xsl:variable name="search" select="$replacement/@search" />
        <xsl:choose>
          <xsl:when test="not(string($search))">
            <xsl:value-of select="substring($string, 1, 1)" />
            <xsl:copy-of select="$replacement/node()" />
            <xsl:call-template name="str:_replace">
              <xsl:with-param name="string" select="substring($string, 2)" />
              <xsl:with-param name="replacements" select="$replacements" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="contains($string, $search)">
            <xsl:call-template name="str:_replace">
              <xsl:with-param name="string" select="substring-before($string, $search)" />
              <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
            </xsl:call-template>      
            <xsl:copy-of select="$replacement/node()" />
            <xsl:call-template name="str:_replace">
              <xsl:with-param name="string" select="substring-after($string, $search)" />
              <xsl:with-param name="replacements" select="$replacements" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="str:_replace">
              <xsl:with-param name="string" select="$string" />
              <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- toplevel boilerplate -->
  <xsl:template match="zabbix_export"># <xsl:value-of select="$appName"/><xsl:text>

</xsl:text>
<xsl:value-of select="$appHead"/>

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
<xsl:apply-templates select="templates"/>
<xsl:if test="triggers"><xsl:apply-templates select="triggers"/></xsl:if>
<xsl:if test="$selinuxDoc"><xsl:value-of select="$selinuxDoc"/><xsl:text>
</xsl:text></xsl:if>
<xsl:if test="$userparamDoc"><xsl:value-of select="$userparamDoc"/><xsl:text>
</xsl:text></xsl:if>
<xsl:if test="$scriptDoc"><xsl:value-of select="$scriptDoc"/><xsl:text>
</xsl:text></xsl:if>
## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
</xsl:template>

  <xsl:template match="templates"><xsl:apply-templates select="template"/></xsl:template>

  <!-- per template template -->
  <xsl:template match="template">
## <xsl:value-of select="name" /><xsl:text>
</xsl:text>
<xsl:apply-templates select="items"/>
<xsl:apply-templates select="macros"/>
<xsl:apply-templates select="discovery_rules"/>
  </xsl:template>

  <!-- trigger templates -->
  <xsl:template match="triggers"><xsl:if test="trigger">
### Triggers
<xsl:apply-templates select="trigger"/></xsl:if></xsl:template>
  <xsl:template match="trigger">
* <xsl:choose>
    <xsl:when test="priority = 0">Not classified</xsl:when>
    <xsl:when test="priority = 1">Information</xsl:when>
    <xsl:when test="priority = 2">Warning</xsl:when>
    <xsl:when test="priority = 3">Average</xsl:when>
    <xsl:when test="priority = 4">High</xsl:when>
    <xsl:when test="priority = 5">Disaster</xsl:when>
  </xsl:choose>: <xsl:value-of select="name"/> (`<xsl:value-of select="expression"/>`)<xsl:call-template name="output-description-if-available"/><xsl:text>
</xsl:text></xsl:template>

  <!-- macro templates -->
  <xsl:template match="macros"><xsl:if test="macro">
### Macros
<xsl:apply-templates select="macro"/></xsl:if></xsl:template>
  <xsl:template match="macro">
* `<xsl:value-of select="macro"/>` (default: <xsl:value-of select="value"/>)</xsl:template>

  <!-- item templates -->
  <xsl:template match="items"><xsl:if test="item">
### Items <xsl:apply-templates select="item"/></xsl:if></xsl:template>
  <xsl:template match="item">
    <xsl:variable name="items">
      <xsl:value-of select="str:replace(substring-before(substring-after(key, '['), ']'), ',', ', ')"/>
    </xsl:variable>
    <xsl:variable name="resolvedName">
      <!-- get name with replaced '$1', ... placeholders in a slightly hacky exslt fashion (supports up to $5 args) -->
      <xsl:value-of select="str:replace(str:replace(str:replace(str:replace(str:replace(name, '$1', normalize-space(str:split($items, ',')[1])), '$2', normalize-space(str:split($items, ',')[2])), '$3', normalize-space(str:split($items, ',')[3])), '$4', normalize-space(str:split($items, ',')[4])), '$5', normalize-space(str:split($items, ',')[5]))"/>
    </xsl:variable>
* <xsl:value-of select="$resolvedName"/> (`<xsl:value-of select="key"/>`)<xsl:call-template name="output-description-if-available"/></xsl:template>

  <!-- discovery rule templates -->
  <xsl:template match="discovery_rules"><xsl:if test="discovery_rule"><xsl:text>### Discovery
</xsl:text><xsl:apply-templates select="discovery_rule"/></xsl:if></xsl:template>
  <xsl:template match="discovery_rule"><xsl:text>#### </xsl:text><xsl:value-of select="name"/> (`<xsl:value-of select="key"/><xsl:text>`)
</xsl:text><xsl:if test="item_prototypes"><xsl:apply-templates select="item_prototypes"/></xsl:if>
<xsl:if test="trigger_prototypes"><xsl:apply-templates select="trigger_prototypes"/></xsl:if>
</xsl:template>

  <!-- item prototypes -->
  <xsl:template match="item_prototypes"><xsl:if test="item_prototype"><xsl:text>
##### Discovery Items</xsl:text><xsl:apply-templates select="item_prototype"/>
</xsl:if></xsl:template>
  <xsl:template match="item_prototype">
* <xsl:value-of select="name"/> (`<xsl:value-of select="key"/>`)<xsl:call-template name="output-description-if-available"/>
</xsl:template>

  <!-- trigger prototypes -->
  <xsl:template match="trigger_prototypes"><xsl:if test="trigger_prototype"><xsl:text>
##### Discovery Triggers</xsl:text><xsl:apply-templates select="trigger_prototype"/>
</xsl:if></xsl:template>
  <xsl:template match="trigger_prototype">
* <xsl:value-of select="name"/> (`<xsl:value-of select="expression"/>`)<xsl:call-template name="output-description-if-available"/>
</xsl:template>

  <!-- catch all remaining text -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
