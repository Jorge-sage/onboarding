public virtual class BaseTests {

    public static String GenerateRandomGUID() {
        Blob b = Crypto.GenerateAESKey(128);
        String h = EncodingUtil.ConvertTohex(b);
        return h.SubString(0,8)+ '-' + h.SubString(8,12) + '-' + h.SubString(12,16) + '-' + h.SubString(16,20) + '-' + h.substring(20);
    }

    public static Employee__c GenerateEmployee(Integer Salary){
        Employee__c employee = new Employee__c(Email__c=GenerateRandomGUID()+'@gmail.com', Salary__c=5000);
        insert employee;
        return employee;
    }
}
