import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme.dart';
import 'providers/app_provider.dart';
import 'screens/home_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/more_screen.dart';
import 'screens/placeholder_screen.dart';

void main() async { WidgetsFlutterBinding.ensureInitialized(); final container = ProviderContainer(); await container.read(appProvider.notifier).initialize(); runApp(UncontrolledProviderScope(container: container, child: const SmartKhataApp())); }

class SmartKhataApp extends ConsumerStatefulWidget { const SmartKhataApp({super.key}); @override ConsumerState<SmartKhataApp> createState() => _SmartKhataAppState(); }
class _SmartKhataAppState extends ConsumerState<SmartKhataApp> { int index = 0; bool dark = false; @override Widget build(BuildContext context) { final pages = [HomeScreen(go: (i) => setState(() => index = i)), const ContactsScreen(), const PlaceholderScreen(title: 'Sales', icon: Icons.point_of_sale_outlined), const InventoryScreen(), const MoreScreen()]; return MaterialApp(debugShowCheckedModeBanner: false, title: 'Smart Khata', theme: AppTheme.light, darkTheme: AppTheme.dark, themeMode: dark ? ThemeMode.dark : ThemeMode.light, home: Scaffold(body: pages[index], bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (i) => setState(() => index = i), destinations: const [NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'), NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Khata'), NavigationDestination(icon: Icon(Icons.point_of_sale_outlined), selectedIcon: Icon(Icons.point_of_sale), label: 'Sales'), NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Inventory'), NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More')]))); } }
