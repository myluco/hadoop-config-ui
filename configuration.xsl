<?xml version="1.0"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="configuration">
    <html>
      <head>
	<meta charset="utf-8"></meta>
	<title>Apache Hadoop Configuration Properties</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
	<meta name="description" content=""></meta>
	<meta name="author" content=""></meta>
	
	<!-- Le styles -->
	<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
	</link>
	<style>
	  body {
	  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
	  }
	</style>
	<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet"></link>
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	
	<style>
	  th {
	    text-align:right;
	  }
	  td.value {
	    white-space:nowrap;
	  }

	  td.value div {
	    font-family:monospace;
	    width:20em;
	    overflow:hidden;
	  }

	  td.value div:hover {
	    z-index:3;
	    opacity:1;
	    background:white;
	    text-overflow:inherit;
	    overflow:visible;
          }

	  td.description {
  	    z-index:0;
	    text-align:right;
	    line-height:1.35em;
	  }

	  div.properties {
	    margin-left:1em;
	    width:90%;
	  }
	</style>
	
      </head>
      
    <body>
      <div class="properties">
        <table class="table table-striped table-condensed table-bordered">
          <tr>
            <th>name</th>
            <th>value</th>
            <th>description</th>
          </tr>
          <xsl:for-each select="property">
            <tr>
              <td>
                <a name="{name}">
                  <xsl:value-of select="name"/>
                </a>
              </td>
              <td class="value">
		<xsl:apply-templates select="value"/>
              </td>
              <td class="description">
		<xsl:apply-templates select="description"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </div>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="value">

      <xsl:choose>
	<xsl:when test="substring-before(., ',') = ''">
	  <div style="text-overflow:ellipsis">
	    <xsl:value-of select="."/>
	  </div>
	</xsl:when>
	<xsl:otherwise>
	  The set of:
	  <div style="text-overflow:ellipsis">
	    <ul>
	      <xsl:call-template name="split">
		<xsl:with-param name="string" select="."/>
	      </xsl:call-template>
	    </ul>
	  </div>
	</xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <xsl:template match="description">
    <div class="description">
      <xsl:value-of select="."/> <!-- maybe use copy-of if embedded html is allowed in description -->
    </div>
  </xsl:template>

  <xsl:template name="split">
    <xsl:param name="string"/>
    <xsl:variable name="first" select="substring-before($string, ',')" /> 
    <xsl:variable name="rest" select="substring-after($string, ',')" /> 
    <xsl:if test="$first != ''">
      <li>
	<xsl:value-of select="$first"/>
      </li>
      <xsl:call-template name="split">
	<xsl:with-param name="string"><xsl:value-of select="$rest"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>


</xsl:stylesheet>
