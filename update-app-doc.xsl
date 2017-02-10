<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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

  <!-- xsl 1.0 string replace (http://stackoverflow.com/a/3067130) -->
  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="$text = '' or $replace = ''or not($replace)" >
        <!-- Prevent this routine from hanging -->
        <xsl:value-of select="$text" />
      </xsl:when>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
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
  <xsl:variable name="fileName">
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="name" />
        <xsl:with-param name="replace" select="' '" />
        <xsl:with-param name="by" select="'_'" />
    </xsl:call-template>
  </xsl:variable>
## [<xsl:value-of select="name" />](<xsl:value-of select="$fileName"/>.xml)
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
  </xsl:choose>: <xsl:value-of select="name"/> (`<xsl:value-of select="expression"/>`)<xsl:call-template name="output-description-if-available"/></xsl:template>

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
* <xsl:value-of select="name"/> (`<xsl:value-of select="key"/>`)<xsl:call-template name="output-description-if-available"/></xsl:template>

  <!-- discovery rule templates -->
  <xsl:template match="discovery_rules"><xsl:if test="discovery_rule"><xsl:text>### Discovery
</xsl:text><xsl:apply-templates select="discovery_rule"/></xsl:if></xsl:template>
  <xsl:template match="dicovery_rule"><xsl:text>#### </xsl:text><xsl:value-of select="name"/> (`<xsl:value-of select="key"/><xsl:text>`)
</xsl:text><xsl:if test="item_prototypes"><xsl:apply-templates select="item_prototypes"/></xsl:if>
<xsl:if test="trigger_prototypes"><xsl:apply-templates select="trigger_prototypes"/></xsl:if>
</xsl:template>

  <!-- item prototypes -->
  <xsl:template match="item_prototypes"><xsl:if test="item_prototype"><xsl:text>
#### Discovery Items</xsl:text><xsl:apply-templates select="item_prototype"/>
</xsl:if></xsl:template>
  <xsl:template match="item_prototype">
* <xsl:value-of select="name"/> (`<xsl:value-of select="key"/>`)<xsl:call-template name="output-description-if-available"/>
</xsl:template>

  <!-- trigger prototypes -->
  <xsl:template match="trigger_prototypes"><xsl:if test="trigger_prototype"><xsl:text>
#### Discovery Triggers</xsl:text><xsl:apply-templates select="trigger_prototype"/>
</xsl:if></xsl:template>
  <xsl:template match="trigger_prototype">
* <xsl:value-of select="name"/> (`<xsl:value-of select="expression"/>`)<xsl:call-template name="output-description-if-available"/>
</xsl:template>

  <!-- catch all remaining text -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
