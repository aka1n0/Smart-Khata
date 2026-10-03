import 'dart:convert';

class Contact {
  final String id;
  final String name;
  final String phone;
  final String type; // customer | supplier
  final String address;
  final String notes;
  final DateTime createdAt;

  const Contact({required this.id, required this.name, this.phone = '', this.type = 'customer', this.address = '', this.notes = '', required this.createdAt});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'phone': phone, 'type': type, 'address': address, 'notes': notes, 'createdAt': createdAt.toIso8601String()};
  factory Contact.fromMap(Map<String, dynamic> m) => Contact(id: m['id'], name: m['name'], phone: m['phone'] ?? '', type: m['type'] ?? 'customer', address: m['address'] ?? '', notes: m['notes'] ?? '', createdAt: DateTime.parse(m['createdAt']));
}

class LedgerTransaction {
  final String id;
  final String contactId;
  final double amount;
  final String kind; // credit | payment_received | payment_given | purchase | sale | adjustment
  final String description;
  final String paymentMethod;
  final DateTime date;
  final String notes;

  const LedgerTransaction({required this.id, required this.contactId, required this.amount, required this.kind, this.description = '', this.paymentMethod = 'Cash', required this.date, this.notes = ''});
  Map<String, dynamic> toMap() => {'id': id, 'contactId': contactId, 'amount': amount, 'kind': kind, 'description': description, 'paymentMethod': paymentMethod, 'date': date.toIso8601String(), 'notes': notes};
  factory LedgerTransaction.fromMap(Map<String, dynamic> m) => LedgerTransaction(id: m['id'], contactId: m['contactId'], amount: (m['amount'] as num).toDouble(), kind: m['kind'], description: m['description'] ?? '', paymentMethod: m['paymentMethod'] ?? 'Cash', date: DateTime.parse(m['date']), notes: m['notes'] ?? '');
}

class Expense {
  final String id;
  final double amount;
  final String category;
  final String description;
  final String paymentMethod;
  final DateTime date;
  const Expense({required this.id, required this.amount, required this.category, this.description = '', this.paymentMethod = 'Cash', required this.date});
  Map<String, dynamic> toMap() => {'id': id, 'amount': amount, 'category': category, 'description': description, 'paymentMethod': paymentMethod, 'date': date.toIso8601String()};
  factory Expense.fromMap(Map<String, dynamic> m) => Expense(id: m['id'], amount: (m['amount'] as num).toDouble(), category: m['category'], description: m['description'] ?? '', paymentMethod: m['paymentMethod'] ?? 'Cash', date: DateTime.parse(m['date']));
}

class Product {
  final String id;
  final String name;
  final String sku;
  final String category;
  final double purchasePrice;
  final double sellingPrice;
  final double stock;
  final double minStock;
  const Product({required this.id, required this.name, this.sku = '', this.category = 'Other', this.purchasePrice = 0, this.sellingPrice = 0, this.stock = 0, this.minStock = 0});
  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'sku': sku, 'category': category, 'purchasePrice': purchasePrice, 'sellingPrice': sellingPrice, 'stock': stock, 'minStock': minStock};
  factory Product.fromMap(Map<String, dynamic> m) => Product(id: m['id'], name: m['name'], sku: m['sku'] ?? '', category: m['category'] ?? 'Other', purchasePrice: (m['purchasePrice'] as num).toDouble(), sellingPrice: (m['sellingPrice'] as num).toDouble(), stock: (m['stock'] as num).toDouble(), minStock: (m['minStock'] as num).toDouble());
}

class AppData {
  final List<Contact> contacts;
  final List<LedgerTransaction> transactions;
  final List<Expense> expenses;
  final List<Product> products;
  const AppData({this.contacts = const [], this.transactions = const [], this.expenses = const [], this.products = const []});
  Map<String, dynamic> toMap() => {'contacts': contacts.map((e) => e.toMap()).toList(), 'transactions': transactions.map((e) => e.toMap()).toList(), 'expenses': expenses.map((e) => e.toMap()).toList(), 'products': products.map((e) => e.toMap()).toList()};
  String encode() => jsonEncode(toMap());
  factory AppData.decode(String raw) { final m = jsonDecode(raw) as Map<String, dynamic>; return AppData(contacts: (m['contacts'] as List? ?? []).map((e) => Contact.fromMap(Map<String, dynamic>.from(e))).toList(), transactions: (m['transactions'] as List? ?? []).map((e) => LedgerTransaction.fromMap(Map<String, dynamic>.from(e))).toList(), expenses: (m['expenses'] as List? ?? []).map((e) => Expense.fromMap(Map<String, dynamic>.from(e))).toList(), products: (m['products'] as List? ?? []).map((e) => Product.fromMap(Map<String, dynamic>.from(e))).toList()); }
}
