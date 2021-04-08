class Transaction {
  // transactionType is a flag, 0/false means expense, 1/true means income
  String transactionID;
  String description;
  String category;
  DateTime transactionDate;
  double transactionAmount;
  bool transactionType;

  Transaction({
    this.transactionID,
    this.description,
    this.category,
    this.transactionDate,
    this.transactionType,
    this.transactionAmount,
  });

  @override
  String toString() {
    return '{ ${this.transactionDate}, ${this.transactionType}, ${this.category}, '
        '${this.transactionAmount} }';
  }
}