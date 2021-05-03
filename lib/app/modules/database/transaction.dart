class UserTransaction {
  // transactionType is a flag,  expense, income
  String transactionID;
  String description;
  DateTime transactionDate;
  double transactionAmount;
  String transactionType;

  UserTransaction({
    this.transactionID,
    this.description,
    this.transactionDate,
    this.transactionType,
    this.transactionAmount,
  });

  @override
  String toString() {
    return '{ ${this.transactionDate}, ${this.transactionType}, '
        '${this.transactionAmount} }';
  }
}