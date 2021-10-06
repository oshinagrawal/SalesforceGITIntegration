trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) 
{
    list<BatchLeadConvertErrors__c> lstevent = new list<BatchLeadConvertErrors__c>();
    For(BatchApexErrorEvent ev : trigger.new)
    {
        BatchLeadConvertErrors__c btchevent = new BatchLeadConvertErrors__c(AsyncApexJobId__c = ev.AsyncApexJobId,
                                                                            Records__c = ev.JobScope,StackTrace__c = ev.StackTrace);
        lstevent.add(btchevent);
    }
    insert lstevent;
}