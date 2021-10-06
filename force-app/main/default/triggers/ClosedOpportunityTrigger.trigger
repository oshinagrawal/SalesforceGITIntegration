trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) 
{
    List<task> lstTask = new List<task>() ;
    for(Opportunity opp : trigger.new)
        //[select id ,StageName from opportunity where StageName = 'Closed Won' and id in : trigger.new]
    {
        if(opp.StageName == 'Closed Won')
        {
            Task t = new task();
            t.WhatId = opp.id;
            t.Subject = 'Follow Up Test Task';
            lstTask.add(t);
        }
    }
    insert lstTask;

}