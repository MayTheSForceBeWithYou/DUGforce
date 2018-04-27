public with sharing class SupplierSubmitController {
    public Supplier__c supplier{get; set;}
    
    public SupplierSubmitController(ApexPages.StandardController ctrl) {
        this.supplier = (Supplier__c)ctrl.getRecord();
    }

    public PageReference saveFormAsPDFandEmail(){
        PageReference pr = Page.SupplierForm;
        pr.getParameters().put('id', this.supplier.Id);
        Blob content = pr.getContentAsPDF();
        Attachment att = new Attachment(Body = content, ParentId = this.supplier.id);
        
        Database.SaveResult insertResult = Database.Insert(att, false);
        // check for errors here and act according!
        System.debug('Result: ' + insertResult);
        System.debug('Supplier Form PDF created: ' + att.Id);
        
        //upon completion redirect to quote
        String emailURL = '/_ui/core/email/author/EmailAuthor?p3_lkid=' + this.supplier.Id + '&doc_id=' + att.Id + '&retURL=%2F' + att.Id;
        emailURL += '&p2_lkid=' + '003i00000184Yd4';
        System.debug('Supplier Form Email URL: ' + emailURL);
        PageReference attPage = new PageReference(emailURL);
        attPage.setRedirect(true);
        return attPage;
    }
}