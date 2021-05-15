class TransactionSection {
  List<TransactionResponse> transactionList;
  String date = '';

  TransactionSection({this.transactionList, this.date});
}

class TransactionResponse {
  String transactionId;
  String type;
  String remark;
  String amount;
  String teamName;
  String time;
  String statusRequest;
  String statusProcess;
  String statusCredit;

  bool isExpanded;

  TransactionResponse({
    this.transactionId,
    this.type,
    this.remark,
    this.amount,
    this.teamName,
    this.statusRequest,
    this.statusCredit,
    this.statusProcess,
    this.time,
    this.isExpanded = false,
  });
}

class Wallet {
  String status;
  String message;
  Details details;

  Wallet({this.status, this.message, this.details});

  Wallet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    details = json['data'] != null ? new Details.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  int total;
  String deposit;
  String winning;
  String bonus;

  Details({this.total, this.deposit, this.winning, this.bonus});

  Details.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    deposit = json['deposit'];
    winning = json['winning'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['deposit'] = this.deposit;
    data['winning'] = this.winning;
    data['bonus'] = this.bonus;
    return data;
  }
}
