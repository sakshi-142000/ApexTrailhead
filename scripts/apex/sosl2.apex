String soslFindClause='Wingo or SFDC';

List<List<sObject>> searchList= [FIND :soslFindClause IN ALL FIELDS
RETURNING Account(Name), Contact(FirstName, LastName, Department)
];

System.debug(searchList);
Account[] searchAccounts= (Account[]) searchList[0];
Contact[] searchContacts=(Contact[]) searchList[1];

for(Account a: searchAccounts){
    System.debug('Account Name: '+ a.Name);
}

for(Contact c: searchContacts){
    System.debug('Contact Name: '+ c.FirstName);
}


// ((Account:{Name=SFDC Computing, Id=001gL00000VciMNQAZ}, 
// Account:{Name=The SFDC Query Man, Id=001gL00000VciMOQAZ}), 
// (Contact:{FirstName=Carol, LastName=Ruiz, Department=Wingo, Id=003gL00000I9u8fQAB}))

/*

Things to note:
You can filter SOSL results by adding conditions in the WHERE clause for an object. For example, this results in only accounts whose industry is Apparel to be returned: RETURNING Account(Name, Industry WHERE Industry='Apparel')Copy.

Likewise, ordering results for one sObject is supported by adding ORDER BY for an object. For example this causes the returned accounts to be ordered by the Name field: RETURNING Account(Name, Industry ORDER BY Name)Copy.

The number of returned records can be limited to a subset of records. This example limits the returned accounts to 10 only: RETURNING Account(Name, Industry LIMIT 10)Copy.



*/