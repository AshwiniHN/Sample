<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../UpsertOpportunityRevenueSFProvABCSImpl.wsdl"/>
      <rootElement name="OptyLineItem_ids" namespace="http://SalesforceIntegration/Opty_SFIds"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/WSDL/ISG_SF_Opportunity_WS.wsdl"/>
      <rootElement name="ListOfIsg_Sf_Opportunity_Io" namespace="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [FRI DEC 18 14:55:22 MST 2015]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:tns1="http://siebel.com/webservices"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns2="http://SalesforceIntegration/Opty_SFIds"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:tns="http://siebel.com/CustomUI"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:client="http://Isecg-SalesforceProject/UpsertOpportunityRevenueSFProvABCSImpl"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 wsdl ns1 plnk xsd client xsdLocal1 xsdLocal2 tns1 soapenc soap tns xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:template match="/">
    <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
      <xsdLocal1:Opportunity>
        <xsdLocal1:Id>
          <xsl:text disable-output-escaping="no"></xsl:text>
        </xsdLocal1:Id>
        <xsdLocal1:ListOfRevenue>
          <xsl:for-each select="/ns2:OptyLineItem_ids/ns2:Lineitem_ids">
            <xsdLocal1:Revenue>
              <xsdLocal1:Id>
                <xsl:value-of select="ns2:SiebelRevenueId"/>
              </xsdLocal1:Id>
              <xsl:choose>
                <xsl:when test="(ns2:SFRevenueId != '')">
                  <xsdLocal1:ISGSFId>
                    <xsl:value-of select="ns2:SFRevenueId"/>
                  </xsdLocal1:ISGSFId>
                </xsl:when>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="ns2:status = 'Success'">
                  <xsdLocal1:ISGSFSyncStatus>
                    <xsl:text disable-output-escaping="no">SyncOn</xsl:text>
                  </xsdLocal1:ISGSFSyncStatus>
                </xsl:when>
                <xsl:otherwise>
                  <xsdLocal1:ISGSFSyncStatus>
                    <xsl:text disable-output-escaping="no">SyncFailed</xsl:text>
                  </xsdLocal1:ISGSFSyncStatus>
                </xsl:otherwise>
              </xsl:choose>
            </xsdLocal1:Revenue>
          </xsl:for-each>
        </xsdLocal1:ListOfRevenue>
      </xsdLocal1:Opportunity>
    </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
  </xsl:template>
</xsl:stylesheet>
