<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:ns3="http://insecg-salesforce/sflogeventsobjects"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:ns1="http://SFLogQueryStrings"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns5="http://paramsvar"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/populateBrokerdata"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj"
                xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:secure="http://www.oracle.com/XSL/Transform/java/com.Securedata"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/sp/populateBrokerdata"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 ns3 ns1 plt soap tns wsdl ns0 top fns xsd ens ns4 db bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf secure med ids xdk xref bpmn ldap">
   <xsl:variable name="count" select="2"/>
   <xsl:variable name="i" select="2"/>
   <xsl:param name="sflog_objectevents"/>
   <xsl:param name="paramsVar"/>
   <xsl:template match="/">
      <db:InputParameters>
         <db:P_EVENT_DTLS>
            <xsl:for-each select="/tns:retrieveResponse/tns:result">
             <xsl:variable name="OptyPartnerId" select="ens:Id"/>
           <xsl:if test="$OptyPartnerId != ''">
               <db:P_EVENT_DTLS_ITEM>
                 
                  <db:SOURCE_TYPE>
                     <xsl:text disable-output-escaping="no">CRM_SF_To_OP</xsl:text>
                  </db:SOURCE_TYPE>
                  <db:OBJECT_TYPE>
                     <xsl:text disable-output-escaping="no">OpportunityPartner</xsl:text>
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
                     <xsl:text disable-output-escaping="no">upsert</xsl:text>
                  </db:OPERATION>
                  <db:INT_POPULATEBROKER_FMWID>
                     <xsl:value-of select="$paramsVar/ns5:params/ns5:instanceid"/>
                  </db:INT_POPULATEBROKER_FMWID>
                  <db:POPULATEBROKER_FMWID>
                     <xsl:value-of select="$paramsVar/ns5:params/ns5:instanceid"/>
                  </db:POPULATEBROKER_FMWID>
                  <xsl:for-each select="$sflog_objectevents/ns3:SFLogObjectEvents/ns3:OpportunityPartnerUpsert">
                     <xsl:if test="ns3:OBJECTID = $OptyPartnerId">
                        <db:SFLOGID>
                           <xsl:value-of select="ns3:SFLOGID"/>
                        </db:SFLOGID>
						<db:PRIORITY>
                           <xsl:value-of select="ns3:PRIORITY"/>
                  </db:PRIORITY>
                     </xsl:if>
                  </xsl:for-each>
                  <!-- 
                   <db:SFLOGID>
                           <xsl:value-of select=" $sflog_objectevents/ns3:SFLogObjectEvents/ns3:OpportunityPartnerUpsert[ns3:OBJECTID = $OptyPartnerId]/ns3:SFLOGID"/>
                        </db:SFLOGID>
                  -->
               </db:P_EVENT_DTLS_ITEM>
           </xsl:if>
            </xsl:for-each>
         </db:P_EVENT_DTLS>
         <db:P_EVENT_BLOCK_DTLS>
            <xsl:for-each select="/tns:retrieveResponse/tns:result">
               <xsl:variable name="OptyPartnerId1" select="ens:Id"/>
               <xsl:variable name="OptyId" select="ens:Opportunity__c"/>
               <xsl:variable name="PartnerId"
                             select="ens:Partner_Account_Id__c"/>
                <xsl:if test="$OptyPartnerId1 != ''">
               <xsl:for-each select="$sflog_objectevents/ns3:SFLogObjectEvents/ns3:OpportunityPartnerUpsert">
                  <xsl:variable name="SFLogId" select="ns3:SFLOGID"/>
                  <xsl:if test="ns3:OBJECTID = $OptyPartnerId1">
                     <db:P_EVENT_BLOCK_DTLS_ITEM>
                        <db:SOURCE_TYPE>
                           <xsl:text disable-output-escaping="no">CRM_SF_To_OP</xsl:text>
                        </db:SOURCE_TYPE>
                        <db:OBJECT_TYPE>
                           <xsl:text disable-output-escaping="no">Opportunity</xsl:text>
                        </db:OBJECT_TYPE>
                        <db:OBJECT_FOREIGNKEY>
                           <xsl:value-of select="$OptyId"/>
                        </db:OBJECT_FOREIGNKEY>
                        <db:OPERATION>
                           <xsl:text disable-output-escaping="no">insert</xsl:text>
                        </db:OPERATION>
                        <db:SFLOGID>
                           <xsl:value-of select="$SFLogId"/>
                        </db:SFLOGID>
                     </db:P_EVENT_BLOCK_DTLS_ITEM>
                     <xsl:if test="$PartnerId != ''">
                        <db:P_EVENT_BLOCK_DTLS_ITEM>
                           <db:SOURCE_TYPE>
                              <xsl:text disable-output-escaping="no">CRM_SF_To_OP</xsl:text>
                           </db:SOURCE_TYPE>
                           <db:OBJECT_TYPE>
                              <xsl:text disable-output-escaping="no">Account</xsl:text>
                           </db:OBJECT_TYPE>
                           <db:OBJECT_FOREIGNKEY>
                              <xsl:value-of select="$PartnerId"/>
                           </db:OBJECT_FOREIGNKEY>
                           <db:OPERATION>
                              <xsl:text disable-output-escaping="no">insert</xsl:text>
                           </db:OPERATION>
                           <db:SFLOGID>
                              <xsl:value-of select="$SFLogId"/>
                           </db:SFLOGID>
                        </db:P_EVENT_BLOCK_DTLS_ITEM>
                     </xsl:if>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
            </xsl:for-each>
         </db:P_EVENT_BLOCK_DTLS>
      </db:InputParameters>
   </xsl:template>
</xsl:stylesheet>
