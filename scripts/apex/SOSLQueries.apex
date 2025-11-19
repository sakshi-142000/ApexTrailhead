List<List<SObject>> searchList = [FIND 'North' IN ALL FIELDS
                                    RETURNING Account(Name), Contact(FirstName,LastName)];

System.debug(searchList);