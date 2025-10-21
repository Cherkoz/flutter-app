import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_onCodeChanged);
  }

  @override
  void dispose() {
    _codeController.removeListener(_onCodeChanged);
    _codeController.dispose();
    super.dispose();
  }

  void _onCodeChanged() {
    if (_codeController.text.length == 6) {
      // Используем addPostFrameCallback чтобы избежать ошибок во время build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _submit();
      });
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Navigate to main app
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 32),
                Text(
                  'Введите код',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Мы отправили код на ${widget.phoneNumber}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: 'Введите код',
                    hintText: '000000',
                    prefixIcon: Icon(Icons.pin),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the verification code';
                    }
                    if (value.length != 6) {
                      return 'Code must be 6 digits';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Code must contain only numbers';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Код отправлен'),
                      ),
                    );
                  },
                  child: const Text('Отправить код повторно'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
