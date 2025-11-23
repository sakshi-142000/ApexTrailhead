public with sharing class ApexRestCalloutDemo {
    public ApexRestCalloutDemo() {

    }

    public static void getUsersFromReqres(){
        Http http= new Http(); 
        HttpRequest req= new HttpRequest();

        req.setEndpoint('https://reqres.in/api/users');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('GET');
        // req.setBody(''); //no body required

        HttpResponse res=new HttpResponse();
        res=http.send(req);//sending request to reqres

        System.debug('@@@@Response Body: '+ res.getBody());
    }

    public static void createUsersForReqres(){
        Http http= new Http(); 
        HttpRequest req= new HttpRequest();

        req.setEndpoint('https://reqres.in/api/users');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setBody('{"name": "John Doe","job": "Developer"}');
        HttpResponse res=new HttpResponse();
        res=http.send(req);//sending request to reqres

        System.debug('@@@@Response Body: '+ res.getBody());
    }
}