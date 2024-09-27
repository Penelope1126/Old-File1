// Base class for BankAccount
class BankAccount {
  double _balance;
  String _name;

  BankAccount(this._balance, this._name);

  double get balance => _balance;

  void set balance(double bal) {
    _balance = bal;
  }

  void deposit(double amount) {
    _balance += amount;
    print('ฝาก $amount คงเหลือเงินในบัญชี $_balance');
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print('ถอน $amount คงเหลือเงินในบัญชี $_balance');
    } else {
      print('ยอดเงินคงเหลือไม่เพียงพอสำหรับการถอน');
    }
  }

  void showBalance() {
    print('ยอดเงินคงเหลือในบัญชีคือ $_balance');
  }
}

// Derived class for SavingAccount
class SavingAccount extends BankAccount {
  double _interestRate;

  SavingAccount(double balance, double interestRate)
      : _interestRate = interestRate,
        super(balance, '');

  void addInterest() {
    double interest = _balance * _interestRate / 100;
    deposit(interest);
    print('ดอกเบี้ย $interest คงเหลือเงินในบัญชี $_balance');
  }
}

void main() {
  // Create a new savings account with balance and interest rate
  SavingAccount x = SavingAccount(2000, 5.0);

  // Perform some operations
  x.deposit(400); // Deposit 400
  x.withdraw(100); // Withdraw 100
  x.addInterest(); // Add interest
}
