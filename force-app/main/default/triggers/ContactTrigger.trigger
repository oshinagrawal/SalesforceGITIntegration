trigger ContactTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete)
{
	if(trigger.isafter)
    {
       if(trigger.isinsert)
       {
           if ( !RecursiveTriggerHelper.isConAlreadyModified()  || test.isRunningTest())
            {
                RecursiveTriggerHelper.setConAlreadyModified();
           		ContactTriggerHandler.HandleAfterInsert(trigger.new,trigger.newmap);
            }
       }
        if(trigger.isupdate)
       {
           //if ( !RecursiveTriggerHelper.isConAlreadyModified()  || test.isRunningTest())
           //{
           		 //RecursiveTriggerHelper.setConAlreadyModified();
           		ContactTriggerHandler.HandleAfterUpdate(trigger.new,trigger.old,trigger.newmap,trigger.oldmap);
            //}
       }
        if(trigger.isDelete)
       {
           ContactTriggerHandler.HandleAfterDelete(trigger.old,trigger.oldmap);
       }
       
       if(trigger.isundelete)
       {
           ContactTriggerHandler.HandleAfterUndelete(trigger.new,trigger.newmap);
       }
    }
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
       {
           if ( !RecursiveTriggerHelper.isConAlreadyModified()  || test.isRunningTest())
            {
              	RecursiveTriggerHelper.setConAlreadyModified();
           		ContactTriggerHandler.HandleBeforeInsert(trigger.new,trigger.newmap);
            }
       }
       if(trigger.isupdate)
       {
           if ( !RecursiveTriggerHelper.isConAlreadyModified()  || test.isRunningTest())
            {
                RecursiveTriggerHelper.setConAlreadyModified();
           		ContactTriggerHandler.HandleBeforeUpdate(trigger.new,trigger.old,trigger.newmap,trigger.oldmap);
            }
       }
       if(trigger.isdelete)
       {
           ContactTriggerHandler.HandleBeforedelete(trigger.old,trigger.oldmap);
       } 
    }
}