public class AccountTriggerHandler extends TriggerHandler {

    private List<Account> newAccounts;


    public AccountTriggerHandler() {
      
        this.newAccounts = (List<Account>) Trigger.new;
       
    }


  

    // Before Insert Method

    public override void beforeInsert(List<Account> newAccount){

        for(Account acc :List<Account> newAccount) {

            if (acc.Name != null && acc.Name.length() <= 80) {
                acc.Name = acc.Name + ' - Adaptus';
            }
            else if (acc.Name != null) {
                acc.Name = acc.Name.substring(0, 80) + ' - Adaptus';
            }
        }


    }



     // After Insert Method

     public override void afterInsert(List<Account> newAccounts) {

        List<Contact> newContacts = new List<Contact>();

        for (Account acc : newAccounts) {

            Contact newContact = new Contact(

                FirstName = 'Candidate name',
                LastName = 'Candidate lastname',
                AccountId = acc.Id,
                Email = 'candidate_name@adaptus.com'
            );

            newContacts.add(newContact);
        }
        if (!newContacts.isEmpty()) {
            insert newContacts;
        }
        
    }


    // After Delete Method

    public static void afterDelete(List<Account> deletedAccounts) {

        List<Task> newTasks = new List<Task>();

        for (Account acc : deletedAccounts) {
            /
            Task newTask = new Task(
                Subject = 'Deleted account ' + acc.Name,
                DueDate = Date.today()
            );
            newTasks.add(newTask);
        }

        // Insert the new tasks
        if (!newTasks.isEmpty()) {
            insert newTasks;
        }
    }





}