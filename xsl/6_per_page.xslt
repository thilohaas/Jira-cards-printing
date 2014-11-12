<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- output method -->
    <xsl:output method="html" omit-xml-declaration="yes" cdata-section-elements="" encoding="utf-8" media-type="text/xml" indent="yes" version="1.0"/>

    <!-- root template -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <title>Task cards</title>
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css' />
            <link rel="stylesheet" type="text/css" href="css/6_per_page.css" />
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js" />
            <script type="text/javascript" src="/js/color.js" />
        </head>
        <body>
            <table class="all">
                <xsl:for-each select="rss/channel/item">
                    <xsl:if test="position() mod 2 = 1">
                        <xsl:variable name="tr_open">
                            <xsl:if test="position() mod 6 = 1 and position() != 1">&lt;tr class=&quot;page-break&quot;&gt;</xsl:if>
                            <xsl:if test="position() mod 6 != 1">&lt;tr&gt;</xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="$tr_open" disable-output-escaping="yes"/>
                    </xsl:if>

                    <td>
                        <div class="card-wrapper">
                            <xsl:call-template name="card" >
                                <xsl:with-param name="data" select="." />
                            </xsl:call-template>
                        </div>
                    </td>

                    <xsl:if test="position() mod 2 = 0">
                        <xsl:variable name="tr_close">&lt;/tr&gt;</xsl:variable>
                        <xsl:value-of select="$tr_close" disable-output-escaping="yes"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="count(rss/channel/item) = 1">
                    <td><div></div></td>
                </xsl:if>
            </table>
        </body>
        </html>
    </xsl:template>

    <xsl:template name="card">
        <xsl:param name="data"/>
        <xsl:variable name="project" select="$data/project/@key"> </xsl:variable>

        <table class="card">
            <tr>
                <td>
                    <xsl:attribute name="class">colorize</xsl:attribute>
                    <xsl:attribute name="data-color-hash"><xsl:value-of select="$data/project/@key" /></xsl:attribute>
                    <h1><xsl:value-of select="$data/key" /></h1>
                </td>
                <td>
                    <xsl:attribute name="class">colorize right</xsl:attribute>

                    <xsl:choose>
                        <xsl:when test="$data/parent">
                            <xsl:attribute name="data-color-hash"><xsl:value-of select="$data/parent" /></xsl:attribute>

                            Parent: <strong><xsl:value-of select="$data/parent" /></strong>
                        </xsl:when>
                        <xsl:when test="$data/customfields/customfield[@key='com.pyxis.greenhopper.jira:gh-epic-link']/customfieldvalues[1]/customfieldvalue">
                            <xsl:attribute name="data-color-hash">
                                <xsl:value-of select="$data/customfields/customfield[@key='com.pyxis.greenhopper.jira:gh-epic-link']/customfieldvalues[1]/customfieldvalue" />
                            </xsl:attribute>

                            Epic: <strong><xsl:value-of select="$data/customfields/customfield[@key='com.pyxis.greenhopper.jira:gh-epic-link']/customfieldvalues[1]/customfieldvalue" /></strong>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="data-color-hash"><xsl:value-of select="$data/project/@key" /></xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>


            </tr>
            <tr class="meta">
                <td>
                    Priority: <img src="{$data/priority/@iconUrl}" style="position: relative; top: 3px"/> <span class="priority"><xsl:value-of select="$data/priority" /></span>
                    <xsl:if test="$data/fixVersion">
                        <br />
                        Version: <span class="version"><xsl:value-of select="$data/fixVersion" /></span>
                    </xsl:if>
                </td>
                <td>
                    Reporter: <span class="reporter"><xsl:value-of select="$data/reporter" /></span>
                    <xsl:if test="$data/timeestimate or $data/customfields/customfield[@id='customfield_10040']/customfieldvalues[1]/customfieldvalue">
                        <br />
                        Estimation:
                        <span class="estimation">
                            <xsl:choose>
                                <xsl:when test="$data/timeestimate">
                                    <xsl:value-of select="$data/timeestimate" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$data/customfields/customfield[@id='customfield_10040']/customfieldvalues[1]  /customfieldvalue" /> SP
                                </xsl:otherwise>
                            </xsl:choose>
                        </span>
                    </xsl:if>
                </td>
            </tr>

            <tr class="summary">
                <td colspan="2"><xsl:value-of select="$data/summary" /></td>
            </tr>

            <tr class="description">
                <td colspan="2"><xsl:value-of select="$data/description" disable-output-escaping="yes"/></td>
            </tr>
        </table>

    </xsl:template>

</xsl:stylesheet>
