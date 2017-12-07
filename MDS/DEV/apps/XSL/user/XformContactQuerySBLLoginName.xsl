<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/WSDL/generateEnterprise.wsdl"/>
      <rootElement name="retrieveResponse" namespace="urn:enterprise.soap.sforce.com"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/WSDL/ISG_SF_Contact_Service.wsdl"/>
      <rootElement name="ListOfIsgsfcontactio" namespace="http://www.siebel.com/xml/ISGSFContactIO/Query"/>
    </target>
  </mapTargets>
  <substitutions>
      <sourceSubst substPath="/tns:retrieveResponse/tns:result" substType="ens:User"/>
  </substitutions>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [MON JUN 19 10:56:50 IST 2017]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:tns1="http://siebel.com/webservices"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://siebel.com/CustomUI"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISGSFContactIO/Id"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISGSFContactIO/Query"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISGSFContactIO/Data"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                exclude-result-prefixes="xsi xsl soap tns fns xsd ens tns1 soapenc ns0 xsdLocal2 xsdLocal3 xsdLocal1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:template match="/">
   <xsl:variable name="singleQuote">'</xsl:variable>
    <xsdLocal3:ListOfIsgsfcontactio>
      <xsl:attribute name="pagesize">
        <xsl:text disable-output-escaping="no">10</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="startrownum">
        <xsl:text disable-output-escaping="no">0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="recordcountneeded">
        <xsl:text disable-output-escaping="no">true</xsl:text>
      </xsl:attribute>
      <xsdLocal3:Contact>
        <xsdLocal3:LoginName>
          <xsl:value-of select='concat("=",$singleQuote,/tns:retrieveResponse/tns:result/ens:Email,$singleQuote)'/>
        </xsdLocal3:LoginName>
      </xsdLocal3:Contact>
    </xsdLocal3:ListOfIsgsfcontactio>
  </xsl:template>
</xsl:stylesheet>
