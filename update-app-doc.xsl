<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:str="http://exslt.org/strings"
  extension-element-prefixes="str">

  <xsl:output method="text"/>

  <xsl:param name="appName"/>
  <xsl:param name="appHead"/>
  <xsl:param name="selinuxDoc"/>
  <xsl:param name="userparamDoc"/>
  <xsl:param name="scriptDoc"/>

  <!-- add a description with a newline -->
  <xsl:template name="output-description-if-available">
    <xsl:param name="indent"></xsl:param>
    <xsl:if test="description != ''">
      <xsl:value-of select="$indent"/>
      <xsl:value-of select="description"/>
      <xsl:text>&#xa;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- add a markdown inline-code "`Code`" -->
  <xsl:template name="md-inline-code">
    <xsl:param name="code">Code</xsl:param>
    <xsl:param name="indent"></xsl:param>
    <xsl:value-of select="$indent"/>
    <xsl:text>`</xsl:text>
    <xsl:value-of select="$code"/>
    <xsl:text>`</xsl:text>
  </xsl:template>

  <!-- add a markdown code block
       ```
       Code
       ```
  -->
  <xsl:template name="md-code-block">
    <xsl:param name="code">Code</xsl:param>
    <xsl:param name="indent"></xsl:param>
    <xsl:value-of select="$indent"/><xsl:text>```&#xa;</xsl:text>
    <xsl:value-of select="$indent"/>
    <xsl:call-template name="str:replace">
      <xsl:with-param name="string" select="$code"/>
      <xsl:with-param name="search" select="'&#xa;'"/>
      <xsl:with-param name="replace" select="concat('&#xa;', $indent)"/>
    </xsl:call-template>
    <xsl:text>&#xa;</xsl:text>
    <xsl:value-of select="$indent"/><xsl:text>```&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown bullet item: "* Text" -->
  <xsl:template name="md-bullet">
    <xsl:param name="text">Text</xsl:param>
    <xsl:param name="indent"></xsl:param>
    <xsl:value-of select="$indent"/><xsl:text>* </xsl:text>
    <xsl:value-of select="$text"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown bullet with code in parentheses "* Text (`Code`)" -->
  <xsl:template name="md-bullet-with-code">
    <xsl:param name="text">Text</xsl:param>
    <xsl:param name="code">Code</xsl:param>
    <xsl:param name="indent"></xsl:param>
    <xsl:call-template name="md-bullet">
      <xsl:with-param name="text">
        <xsl:value-of select="$text"/>
        <xsl:text> (</xsl:text>
        <xsl:call-template name="md-inline-code">
          <xsl:with-param name="code" select="$code"/>
          <xsl:with-param name="indent" select="$indent"/>
        </xsl:call-template>
        <xsl:text>)  </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- add a markdown "trigger" bullet with priority "* PRIORITY: text" -->
  <xsl:template name="md-trigger-bullet">
    <xsl:param name="text">Text</xsl:param>
    <xsl:param name="priority">0</xsl:param>
    <xsl:param name="indent"></xsl:param>
    <xsl:call-template name="md-bullet">
      <xsl:with-param name="text">
        <xsl:choose>
          <xsl:when test="$priority = 0">Not classified</xsl:when>
          <xsl:when test="$priority = 1">Information</xsl:when>
          <xsl:when test="$priority = 2">Warning</xsl:when>
          <xsl:when test="$priority = 3">Average</xsl:when>
          <xsl:when test="$priority = 4">High</xsl:when>
          <xsl:when test="$priority = 5">Disaster</xsl:when>
        </xsl:choose>: <xsl:value-of select="$text"/>
      </xsl:with-param>
      <xsl:with-param name="indent" select="$indent"/>
    </xsl:call-template>
  </xsl:template>

  <!-- add a markdown heading 1 with a trailing new line -->
  <xsl:template name="md-h1">
    <xsl:param name="title">Heading 1</xsl:param>
    <xsl:text># </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown heading 2 with a trailing new line -->
  <xsl:template name="md-h2">
    <xsl:param name="title">Heading 2</xsl:param>
    <xsl:text>## </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown heading 3 with a trailing new line -->
  <xsl:template name="md-h3">
    <xsl:param name="title">Heading 3</xsl:param>
    <xsl:text>### </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown heading 4 with a trailing new line -->
  <xsl:template name="md-h4">
    <xsl:param name="title">Heading 4</xsl:param>
    <xsl:text>#### </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown heading 5 with a trailing new line -->
  <xsl:template name="md-h5">
    <xsl:param name="title">Heading 5</xsl:param>
    <xsl:text>##### </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <!-- add a markdown heading 6 with a trailing new line -->
  <xsl:template name="md-h6">
    <xsl:param name="title">Heading 6</xsl:param>
    <xsl:text>###### </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

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
  <xsl:template match="zabbix_export"># Zabbix <xsl:value-of select="$appName"/> monitoring<xsl:text>

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
    <xsl:call-template name="md-h2">
      <xsl:with-param name="title" select="name"/>
    </xsl:call-template>
    <xsl:call-template name="output-description-if-available"/>
    <xsl:apply-templates select="items"/>
    <xsl:apply-templates select="macros"/>
    <xsl:apply-templates select="discovery_rules"/>
  </xsl:template>

  <!-- trigger templates -->
  <xsl:template match="triggers">
    <xsl:if test="trigger">
      <xsl:call-template name="md-h3">
        <xsl:with-param name="title">
          <xsl:text>Triggers</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="trigger"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="trigger">
    <xsl:call-template name="md-trigger-bullet">
      <xsl:with-param name="text" select="name"/>
      <xsl:with-param name="priority" select="priority"/>
    </xsl:call-template>
    <xsl:call-template name="md-code-block">
      <xsl:with-param name="code" select="expression"/>
      <xsl:with-param name="indent" select="'  '"/>
    </xsl:call-template>
    <xsl:call-template name="output-description-if-available">
      <xsl:with-param name="indent" select="'  '"/>
    </xsl:call-template>
  </xsl:template>

  <!-- macro templates -->
  <xsl:template match="macros">
    <xsl:if test="macro">
      <xsl:call-template name="md-h3">
        <xsl:with-param name="title">
          <xsl:text>Macros</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="macro"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="macro">
    <xsl:call-template name="md-bullet">
      <xsl:with-param name="text">
        <xsl:call-template name="md-inline-code">
          <xsl:with-param name="code" select="macro"/>
        </xsl:call-template>
        <xsl:text> (default: </xsl:text>
        <xsl:value-of select="value"/>
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- item templates -->
  <xsl:template match="items">
    <xsl:if test="item">
      <xsl:call-template name="md-h3">
        <xsl:with-param name="title">
          <xsl:text>Items</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="item"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item">
    <xsl:variable name="items">
      <xsl:value-of select="str:replace(substring-before(substring-after(key, '['), ']'), ',', ', ')"/>
    </xsl:variable>
    <xsl:variable name="resolvedName">
      <!-- get name with replaced '$1', ... placeholders in a slightly hacky exslt fashion (supports up to $5 args) -->
      <xsl:value-of select="str:replace(str:replace(str:replace(str:replace(str:replace(name, '$1', normalize-space(str:split($items, ',')[1])), '$2', normalize-space(str:split($items, ',')[2])), '$3', normalize-space(str:split($items, ',')[3])), '$4', normalize-space(str:split($items, ',')[4])), '$5', normalize-space(str:split($items, ',')[5]))"/>
    </xsl:variable>
    <xsl:call-template name="md-bullet-with-code">
      <xsl:with-param name="text" select="$resolvedName"/>
      <xsl:with-param name="code" select="key"/>
    </xsl:call-template>
    <xsl:call-template name="output-description-if-available">
      <xsl:with-param name="indent" select="'  '"/>
    </xsl:call-template>
  </xsl:template>

  <!-- discovery rule templates -->
  <xsl:template match="discovery_rules">
    <xsl:if test="discovery_rule">
      <xsl:call-template name="md-h3">
        <xsl:with-param name="title">
          <xsl:text>Discovery</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="discovery_rule"/>
    </xsl:if>
 </xsl:template>

  <xsl:template match="discovery_rule">
    <xsl:call-template name="md-h4">
      <xsl:with-param name="title">
        <xsl:value-of select="name"/> (`<xsl:value-of select="key"/><xsl:text>`)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="output-description-if-available"/>
    <xsl:if test="item_prototypes">
      <xsl:apply-templates select="item_prototypes"/>
    </xsl:if>
    <xsl:if test="trigger_prototypes">
      <xsl:apply-templates select="trigger_prototypes"/>
    </xsl:if>
  </xsl:template>

  <!-- item prototypes -->
  <xsl:template match="item_prototypes">
    <xsl:if test="item_prototype">
      <xsl:call-template name="md-h5">
        <xsl:with-param name="title">
          <xsl:text>Item Prototypes</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="item_prototype"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item_prototype">
    <xsl:call-template name="md-bullet-with-code">
      <xsl:with-param name="text" select="name"/>
      <xsl:with-param name="code" select="key"/>
    </xsl:call-template>
   <xsl:call-template name="output-description-if-available">
      <xsl:with-param name="indent" select="'  '"/>
   </xsl:call-template>
  </xsl:template>

  <!-- trigger prototypes -->
  <xsl:template match="trigger_prototypes">
    <xsl:if test="trigger_prototype">
      <xsl:call-template name="md-h5">
        <xsl:with-param name="title">
          <xsl:text>Trigger Prototypes</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="trigger_prototype"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="trigger_prototype">
    <xsl:call-template name="md-trigger-bullet">
      <xsl:with-param name="text" select="name"/>
      <xsl:with-param name="priority" select="priority"/>
    </xsl:call-template>
    <xsl:call-template name="md-code-block">
      <xsl:with-param name="code" select="expression"/>
      <xsl:with-param name="indent" select="'  '"/>
    </xsl:call-template>
    <xsl:call-template name="output-description-if-available">
      <xsl:with-param name="indent" select="'  '"/>
   </xsl:call-template>
  </xsl:template>

  <!-- catch all remaining text -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
