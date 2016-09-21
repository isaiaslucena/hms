

#Creating a policy
insert into policies(Name,Priority,Disabled) VALUES ('messagesize_policy',0,0);


#Creating policy members
#with group
insert into policy_members(PolicyID,Source,Destination,Disabled) VALUES (1,'%test_group','any',0);

#without group
insert into policy_members(PolicyID,Source,Destination,Disabled) VALUES (1,'user@mydomain.com','any',0);
insert into policy_members(PolicyID,Source,Destination,Disabled) VALUES (1,'civil@construtoraicivl.com.br','any',0);


#Here are the possible options that can be in the Source and Destination columns:
/*NULL = any
a.b.c.d/e = IP address with optional /e
@domain = domain specification,
%xyz = xyz group,
abc@domain = abc user specification
all options support negation using !<key>*/

#groups
#add group
insert into policy_groups(Name,Disabled) VALUES ('test_group',0);

#create the members
#Formats
/* Format of member: a.b.c.d/e = ip,  @domain = domain, %xyz = xyz group, abc@domain = abc user */
insert into policy_group_members(PolicyGroupID,Member,Disabled) VALUES (1,'testuser@mydomain',0);
insert into policy_group_members(PolicyGroupID,Member,Disabled) VALUES (1,'192.168.56.10/24',0);


#Configure quotas
#we will have to edit two tables: quotas and quotas_limits
/* Tracking Options */
/* Format:   <type>:<spec>
SenderIP - This takes a bitmask to mask the IP with. A good default is /24
Sender & Recipient - Either "user@domain" (default), "user@" or "@domain" for the entire
email addy or email addy domain respectively.
*/

#create a quota
insert into quotas(PolicyID,Name,Track,Period,Verdict,Data,Disabled) VALUES (1,'test_quota','Sender:user@domain',120,'DEFER','User has been deferred for two minutes',0);
insert into quotas(PolicyID,Name,Track,Period,Verdict,Data,Disabled) VALUES (6,'messagesize_quota_recipient','Recipient:user@domain',120,'DEFER','Tamanho maximo permitido de 30MB',0);
insert into quotas(PolicyID,Name,Track,Period,Verdict,Data,Disabled) VALUES (6,'messagesize_quota_sender','Sender:user@domain',120,'DEFER','Tamanho maximo permitido de 30MB',0);

#command to edit the quota_limits table:
insert into quotas_limits(QuotasID,Type,CounterLimit,Disabled) VALUES (1,'MessageCount',2,0);
insert into quotas_limits(QuotasID,Type,CounterLimit,Disabled) VALUES (3,'MessageCumulativeSize',30000,0);
insert into quotas_limits(QuotasID,Type,CounterLimit,Disabled) VALUES (4,'MessageCumulativeSize',30000,0);


