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
	<link href="bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
	</link>
	<style>
	  body {
	  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
	  }
	</style>
	<link href="bootstrap/docs/assets/css/bootstrap-responsive.css" rel="stylesheet"></link>
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	
	<style>
	  th {
	  text-align:left;
	  }
	  td.value {
	  font-family:monospace;
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
                <xsl:value-of select="value"/>
              </td>
              <td>
                <xsl:value-of select="description"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </div>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
