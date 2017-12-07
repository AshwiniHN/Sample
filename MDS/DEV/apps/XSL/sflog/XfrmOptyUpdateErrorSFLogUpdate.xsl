<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../../../../2-2%20241/ProcessSFLogEvents/ProcessSFLogEvents/pollSourceObj.wsdl"/>
      <rootElement name="SFLogObjectEvents" namespace="http://insecg-salesforce/sflogeventsobjects"/>
    </source>
    <source type="WSDL">
      <schema location="../../../../2-2%20241/ProcessSFLogEvents/ProcessSFLogEvents/populateBrokerdata.wsdl"/>
      <rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/populateBrokerdata"/>
      <param name="populateBrokerdata_InputVariable.InputParameters" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="../../../../2-2%20241/ProcessSFLogEvents/ProcessSFLogEvents/updateSFLogStatus.wsdl"/>
      <rootElement name="SflogCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/updateSFLogStatus"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [TUE FEB 02 22:03:04 MST 2016]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:ns3="http://insecg-salesforce/sflogeventsobjects"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:ns1="http://SFLogQueryStrings"
                xmlns:ns5="http://paramsvar"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:ns4="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/populateBrokerdata"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj"
                xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:ns7="http://xmlns.oracle.com/pcbpel/adapter/db/top/updateSFLogStatus"
                xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/sp/populateBrokerdata"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns6="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/updateSFLogStatus"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 ns3 ns1 ns5 plt ns4 wsdl ns0 tns top db xsd ns7 ns6 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="populateBrokerdata_InputVariable.InputParameters"/>
  <xsl:template match="/">
    <ns7:SflogCollection>
      <xsl:for-each select="/ns3:SFLogObjectEvents/ns3:optyUpdateEvents">
        <xsl:variable name="sfLogIDInSFObject" select="ns3:SFLOGID"/>
        <xsl:variable name="sfLogIDInBrokerData"
                      select="$populateBrokerdata_InputVariable.InputParameters/db:InputParameters/db:P_EVENT_DTLS/db:P_EVENT_DTLS_ITEM[db:SFLOGID = $sfLogIDInSFObject]/db:SFLOGID"/>
        <xsl:if test="not($sfLogIDInBrokerData != '')">
          <ns7:Sflog>
            <ns7:sflogid>
              <xsl:value-of select="ns3:SFLOGID"/>
            </ns7:sflogid>
            <ns7:sfeventid>
              <xsl:value-of select="ns3:SFEVENTID"/>
            </ns7:sfeventid>
            <ns7:statusid>
              <xsl:text disable-output-escaping="no">1100</xsl:text>
            </ns7:statusid>
            <ns7:errormessage>
              <xsl:text disable-output-escaping="no">ObjectForeignKey is NULL</xsl:text>
            </ns7:errormessage>
            <ns7:brokereventid>
              <xsl:text disable-output-escaping="no"></xsl:text>
            </ns7:brokereventid>
          </ns7:Sflog>
        </xsl:if>
      </xsl:for-each>
    </ns7:SflogCollection>
  </xsl:template>
</xsl:stylesheet>
