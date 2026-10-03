import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../services/storage_service.dart';

final storageProvider = Provider((ref) => StorageService());
final appProvider = NotifierProvider<AppController, AppData>(AppController.new);

class AppController extends Notifier<AppData> {
  final _uuid = const Uuid();
  @override AppData build() => const AppData();
  Future<void> initialize() async { state = await ref.read(storageProvider).load(); }
  Future<void> _save(AppData next) async { state = next; await ref.read(storageProvider).save(next); }
  Future<void> addContact(String name, String phone, String type) async { final c = Contact(id: _uuid.v4(), name: name.trim(), phone: phone.trim(), type: type, createdAt: DateTime.now()); await _save(AppData(contacts: [...state.contacts, c], transactions: state.transactions, expenses: state.expenses, products: state.products)); }
  Future<void> addTransaction(String contactId, double amount, String kind, String description) async { final t = LedgerTransaction(id: _uuid.v4(), contactId: contactId, amount: amount, kind: kind, description: description, date: DateTime.now()); await _save(AppData(contacts: state.contacts, transactions: [...state.transactions, t], expenses: state.expenses, products: state.products)); }
  Future<void> addExpense(double amount, String category, String description) async { final e = Expense(id: _uuid.v4(), amount: amount, category: category, description: description, date: DateTime.now()); await _save(AppData(contacts: state.contacts, transactions: state.transactions, expenses: [...state.expenses, e], products: state.products)); }
  Future<void> addProduct(String name, double buy, double sell, double stock, double minStock) async { final p = Product(id: _uuid.v4(), name: name.trim(), purchasePrice: buy, sellingPrice: sell, stock: stock, minStock: minStock); await _save(AppData(contacts: state.contacts, transactions: state.transactions, expenses: state.expenses, products: [...state.products, p])); }
  Future<void> reset() async { await ref.read(storageProvider).clear(); state = const AppData(); }
}

extension AppCalculations on AppData {
  double receivableFor(String contactId) { double value = 0; for (final t in transactions.where((x) => x.contactId == contactId)) { if (t.kind == 'credit' || t.kind == 'sale') value += t.amount; if (t.kind == 'payment_received') value -= t.amount; } return value; }
  double payableFor(String contactId) { double value = 0; for (final t in transactions.where((x) => x.contactId == contactId)) { if (t.kind == 'purchase') value += t.amount; if (t.kind == 'payment_given') value -= t.amount; } return value; }
  double get totalReceivable => contacts.where((c) => c.type == 'customer').fold(0, (s, c) => s + receivableFor(c.id).clamp(0, double.infinity));
  double get totalPayable => contacts.where((c) => c.type == 'supplier').fold(0, (s, c) => s + payableFor(c.id).clamp(0, double.infinity));
  double get totalExpenses => expenses.fold(0, (s, e) => s + e.amount);
  double get totalSales => transactions.where((t) => t.kind == 'sale').fold(0, (s, t) => s + t.amount);
}
