import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// providerをグローバルに宣言

// StateProvider
// 外部から変更可能な状態をシンプルに提供する
// 1ずつ値をぞかさせるためのカウンターProvider
final counterProvider = StateProvider((ref) => 0);

// Provider
// (外部からは)変更できない値を公開できる基本的なProvider
// カウンターの値を2倍にした値を提供するProvider
final doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  static const String title = 'ProviderPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // doubleCounterProviderの値を読み取る
    // counterProviderの状態が更新されるとdoubleCounterProviderも変更され、再構築される
    final doubleCount = ref.watch(doubleCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text(
              '2倍されたカウント値:',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            // doubleCounterProvider の値を表示
            Text(
              '$doubleCount',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
              // counterProviderの値を+1する
              onPressed: () => ref.read(counterProvider.notifier).update(
                    (state) => state + 1,
                  ),
              child: const Text('Increment Count'),
            ),
          ]),
        ),
      ),
    );
  }
}
