class BaseApiResponse {
  int _status = 200;
  String ResultCode;
  String Message;

  BaseApiResponse(this._status, this.Message, this.ResultCode);

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    print('BaseApiResponse ' + json.toString());

    if (json != null) {
      _status = json['status'];
      Message = json['Message'];
      ResultCode = json['ResultCode'];
    }
  }

  String get status => _status.toString();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['ResultCode'] = this.ResultCode;
    data['Message'] = this.Message;
    return data;
  }
}
