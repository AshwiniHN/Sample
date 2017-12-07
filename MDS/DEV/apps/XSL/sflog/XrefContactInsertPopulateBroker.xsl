<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ns1="http://insecg-salesforce/sflogeventsobjects" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns0="http://SFLogQueryStrings" xmlns:client="http://IsecG-SFProject/InsertProductPriceBookXREFProcess" xmlns:ns5="http://paramsvar" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/populateBrokerdata" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns3="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj" xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/sp/populateBrokerdata" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns1 ns0 client ns5 plt soap tns wsdl ns3 top plnk fns xsd ens ns4 db xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="sflog_objectevents"/>
   <xsl:param name="paramsVar"/>
   <xsl:template match="/">
      <db:InputParameters>
         <db:P_EVENT_DTLS>
            <xsl:for-each select="/tns:retrieveResponse/tns:result">
               <db:P_EVENT_DTLS_ITEM>
                  <xsl:variable name="UserId" select="ens:Id"/>
                  <db:SOURCE_TYPE>
                     <xsl:text disable-output-escaping="no">CRM_SF_To_OP</xsl:text>
                  </db:SOURCE_TYPE>
                  <db:OBJECT_TYPE>
                     <xsl:text disable-output-escaping="no">Contact</xsl:text>
                  </db:OBJECT_TYPE>
                  <db:OBJECT_FOREIGNKEY>
                     <xsl:if test="/tns:retrieveResponse/tns:result/tns:result/ens:Id/@xsi:nil">
                        <xsl:attribute name="xsi:nil">
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/tns:result/ens:Id/@xsi:nil"/>
                        </xsl:attribute>
                     </xsl:if>
                     <xsl:value-of select="ens:Id"/>
                  </db:OBJECT_FOREIGNKEY>
                  <db:DOCUMENT>
                     <xsl:value-of select="oraext:get-content-as-string(.)"/>
                  </db:DOCUMENT>
                  <db:OPERATION>
                     <xsl:text disable-output-escaping="no">insert</xsl:text>
                  </db:OPERATION>
                  <db:INT_POPULATEBROKER_FMWID>
                     <xsl:value-of select="$paramsVar/ns5:params/ns5:instanceid"/>
                  </db:INT_POPULATEBROKER_FMWID>
                  <db:POPULATEBROKER_FMWID>
                     <xsl:value-of select="$paramsVar/ns5:params/ns5:instanceid"/>
                  </db:POPULATEBROKER_FMWID>
                  <xsl:for-each select="$sflog_objectevents/ns1:SFLogObjectEvents/ns1:contactInsertEvents">
                     <xsl:if test="ns1:OBJECTID = $UserId">
                        <db:SFLOGID>
                           <xsl:value-of select="ns1:SFLOGID"/>
                        </db:SFLOGID>
						<db:PRIORITY>
                           <xsl:value-of select="ns1:PRIORITY"/>
                  </db:PRIORITY>
                     </xsl:if>
                  </xsl:for-each>
               </db:P_EVENT_DTLS_ITEM>
            </xsl:for-each>
         </db:P_EVENT_DTLS>
         <db:P_EVENT_BLOCK_DTLS>
            <xsl:for-each select="/tns:retrieveResponse/tns:result">
               <xsl:variable name="UserId" select="ens:Id"/>
               <xsl:variable name="AccountId" select="ens:AccountId"/>
               <xsl:for-each select="$sflog_objectevents/ns1:SFLogObjectEvents/ns1:contactInsertEvents">
                  <xsl:if test="ns1:OBJECTID = $UserId">
                     <xsl:variable name="SFLogId" select="ns1:SFLOGID"/>
                     <db:P_EVENT_BLOCK_DTLS_ITEM>
                        <db:SOURCE_TYPE>
                           <xsl:text disable-output-escaping="no">CRM_SF_To_OP</xsl:text>
                        </db:SOURCE_TYPE>
                        <db:OBJECT_TYPE>
                           <xsl:text disable-output-escaping="no">Account</xsl:text>
                        </db:OBJECT_TYPE>
                        <db:OBJECT_FOREIGNKEY>
                           <xsl:value-of select="$AccountId"/>
                        </db:OBJECT_FOREIGNKEY>
                        <db:OPERATION>
                           <xsl:text disable-output-escaping="no">insert</xsl:text>
                        </db:OPERATION>
                        <db:SFLOGID>
                           <xsl:value-of select="$SFLogId"/>
                        </db:SFLOGID>
                     </db:P_EVENT_BLOCK_DTLS_ITEM>
                  </xsl:if>
               </xsl:for-each>
            </xsl:for-each>
         </db:P_EVENT_BLOCK_DTLS>
      </db:InputParameters>
   </xsl:template>
</xsl:stylesheet>
