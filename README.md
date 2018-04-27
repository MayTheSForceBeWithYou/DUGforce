# DUGforce
Salesforce package to organize and run a community group

## Vendor Registration
The custom SObject "Supplier__c" represents an entity registered with Salesforce as a vendor capable of accepting reimbursement payments.

## Vendor Reimbursement
The Invoice__c and InvoiceLineItem__c custom SObjects make up the main components of submitting reimbursements for one or more events (Meetup__c).  The InvoicePDF Visualforce page serves as a way to render an Invoice__c with its related InvoiceLineItems__r into a PDF to email to the appropriate Salesforce email address.

