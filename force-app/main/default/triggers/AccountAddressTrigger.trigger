trigger AccountAddressTrigger on Account (before insert,before update) 
{
    For(Account a : trigger.new)
    {
        if(a.Match_Billing_Address__c == true && (a.BillingPostalCode != null && a.BillingPostalCode != '') )
        {
            System.debug('***billing'+a.BillingPostalCode);
            a.ShippingPostalCode = a.BillingPostalCode;
        	System.debug('***billing'+a.ShippingPostalCode);
        }
        
    }

}