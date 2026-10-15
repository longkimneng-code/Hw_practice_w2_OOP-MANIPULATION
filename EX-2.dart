class BankAccount {
    // TODO
    String _userName;
    int _accountId;
    double _balance;
    BankAccount({required this._userName, required this._accountId, this._balance = 0.0});


    // getter
    String get userName => _userName;
    int get accountId => _accountId;
    double get balance => _balance;

    // methods
    void withdraw(double amount){
        if(amount > _balance || _balance == 0){
            throw Exception("Insufficient balance for withdrawal!");
        }
        _balance -= amount;
    }

    void credit(double amount){
        _balance += amount;
    }

}

class Bank {
    // TODO
    List<BankAccount> accounts = [];
    String name;
    Bank({required this.name});

    // methods
    BankAccount createAccount({required String userName, required int accountId, double? balance = 0.0}){
        var existAcount = findbyAccountId(accountId, userName);
        if(existAcount != null){
            throw Exception("Account with ID $accountId already exists!");
        }
        BankAccount newAccount = BankAccount(userName: userName, accountId: accountId, balance: balance ?? 0.0);
        accounts.add(newAccount);
        return newAccount;

    }

    BankAccount? findbyAccountId(int accountId, String username){
      return accounts.where((e) => e.accountId == accountId || e.userName == username).firstOrNull;

    }

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(userName: "Ronan", accountId: 100);

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(userName: "Honlgy", accountId: 100); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
