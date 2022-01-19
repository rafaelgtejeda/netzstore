class CustomerModel {

  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? username;
  String? password;
  Billing? billing;
  Shipping? shipping;
  bool? isPayingCustomer;
  String? avatarUrl;
  
  CustomerModel(
      {
        this.id,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.email,
        this.firstName,
        this.lastName,
        this.role,
        this.username,
        this.password,
        this.billing,
        this.shipping,
        this.isPayingCustomer,
        this.avatarUrl,
      }
  );

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    username = json['username'];    
    billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? Shipping.fromJson(json['shipping'])
        : null;
    isPayingCustomer = json['is_paying_customer'];
    avatarUrl = json['avatar_url'];    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role'] = role;
    data['username'] = username;
    data['password'] = password;
    if (billing != null) {
      data['billing'] = billing?.toJson();
    }
    if (shipping != null) {
      data['shipping'] = shipping?.toJson();
    }
    data['is_paying_customer'] = isPayingCustomer;
    data['avatar_url'] = avatarUrl;
    
    return data;
  }
}

class Billing {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? country;
  String? state;
  String? email;
  String? phone;
  String? number;
  String? neighborhood;
  String? persontype;
  String? cpf;
  String? rg;
  String? cnpj;
  String? ie;
  String? birthdate;
  String? sex;
  String? cellphone;

  Billing({
      this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.postcode,
      this.country,
      this.state,
      this.email,
      this.phone,
      this.number,
      this.neighborhood,
      this.persontype,
      this.cpf,
      this.rg,
      this.cnpj,
      this.ie,
      this.birthdate,
      this.sex,
      this.cellphone});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    postcode = json['postcode'];
    country = json['country'];
    state = json['state'];
    email = json['email'];
    phone = json['phone'];
    number = json['number'];
    neighborhood = json['neighborhood'];
    persontype = json['persontype'];
    cpf = json['cpf'];
    rg = json['rg'];
    cnpj = json['cnpj'];
    ie = json['ie'];
    birthdate = json['birthdate'];
    sex = json['sex'];
    cellphone = json['cellphone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['postcode'] = postcode;
    data['country'] = country;
    data['state'] = state;
    data['email'] = email;
    data['phone'] = phone;
    data['number'] = number;
    data['neighborhood'] = neighborhood;
    data['persontype'] = persontype;
    data['cpf'] = cpf;
    data['rg'] = rg;
    data['cnpj'] = cnpj;
    data['ie'] = ie;
    data['birthdate'] = birthdate;
    data['sex'] = sex;
    data['cellphone'] = cellphone;
    return data;
  }
}

class Shipping {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? country;
  String? state;
  String? number;
  String? neighborhood;

  Shipping({ 
      this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.postcode,
      this.country,
      this.state,
      this.number,
      this.neighborhood
  });

  Shipping.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    postcode = json['postcode'];
    country = json['country'];
    state = json['state'];
    number = json['number'];
    neighborhood = json['neighborhood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['postcode'] = postcode;
    data['country'] = country;
    data['state'] = state;
    data['number'] = number;
    data['neighborhood'] = neighborhood;
    return data;
  }
}
