trigger AccountTrigger on Account (before insert,before update,before delete,after insert,after update,after delete,after undelete)
{
    if(trigger.isafter)
    {
       if(trigger.isinsert)
       {
               for(Account a:Trigger.new) 
               {
                   SendAccount.createAccount(a.name, a.Phone, a.Website); 
               } 
                AccountTriggerHandler.HandleAfterInsert(trigger.new,trigger.newmap);
            
       }
        if(trigger.isupdate)
       {
           //if ( !RecursiveTriggerHelper.isAccAlreadyModified()  || test.isRunningTest())
            //{
                //RecursiveTriggerHelper.setAccAlreadyModified();
                system.debug('update account trigger: ');
           		AccountTriggerHandler.HandleAfterUpdate(trigger.new,trigger.newmap,trigger.old,trigger.oldmap);
            //}
       }
        if(trigger.isDelete)
       {
           AccountTriggerHandler.HandleAfterDelete(trigger.old,trigger.oldmap);
       }
       
       if(trigger.isundelete)
       {
           AccountTriggerHandler.HandleAfterUndelete(trigger.new,trigger.newmap);
       }
    }
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
       {
           if ( !RecursiveTriggerHelper.isAccAlreadyModified()  || test.isRunningTest())
            {
                RecursiveTriggerHelper.setAccAlreadyModified();
           		AccountTriggerHandler.HandleAfterInsert(Trigger.new,trigger.newmap);
            }
       }
       if(trigger.isupdate)
       {
           if ( !RecursiveTriggerHelper.isAccAlreadyModified()  || test.isRunningTest())
            {
                //RecursiveTriggerHelper.setAccAlreadyModified();
           		AccountTriggerHandler.HandleBeforeUpdate(trigger.new,trigger.newmap,trigger.old,trigger.oldmap);
            }
       }
       if(trigger.isdelete)
       {
           AccountTriggerHandler.HandleBeforedelete(trigger.old,trigger.oldmap);
       } 
    }
    
}