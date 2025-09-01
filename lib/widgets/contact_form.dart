import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}
class _ContactFormState extends State<ContactForm>
  with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
  super.initState();
  _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  _slideAnimation = Tween<double>(
    begin: 100.0,
    end: 0.0,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  ));

  _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  _controller.forward();
  }

  @override
  void dispose() {
  _controller.dispose();
  _nameController.dispose();
  _emailController.dispose();
  _messageController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
    return Transform.translate(
      offset: Offset(0, _slideAnimation.value),
      child: Opacity(
      opacity: _fadeAnimation.value,
      child: Center(
        child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [theme.colorScheme.primary.withOpacity(0.05), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.computeLuminance() > 0.5
                ? Colors.black.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
            elevation: 0,
            color: theme.colorScheme.primary.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'Contact Information',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 16),
                SelectableText(
                'Rohit Singh\nNew Delhi, Delhi, IN 110044\n'
                'Email: rohitdev6282@gmail.com\n'
                'Phone: +91 99991 81009\n'
                'LinkedIn: linkedin.com/in/rohit-singh-311272187',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: theme.colorScheme.onSurface,
                ),
                ),
              ],
              ),
            ),
            ),
            const SizedBox(height: 24),
            Text(
            'Send me a message',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Your Name',
              prefixIcon: const Icon(Icons.person),
              filled: true,
              fillColor: theme.colorScheme.primary.withOpacity(0.07),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
              return 'Please enter your name';
              }
              return null;
            },
            ),
            const SizedBox(height: 16),
            TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Your Email',
              prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: theme.colorScheme.primary.withOpacity(0.07),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
              return 'Please enter your email';
              }
              if (!value.contains('@')) {
              return 'Please enter a valid email';
              }
              return null;
            },
            ),
            const SizedBox(height: 16),
            TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              prefixIcon: const Icon(Icons.message),
              filled: true,
              fillColor: theme.colorScheme.primary.withOpacity(0.07),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
              return 'Please enter your message';
              }
              return null;
            },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
              // TODO: Implement form submission
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                content: Text('Message sent successfully!'),
                ),
              );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 8,
            ),
            icon: const Icon(Icons.send),
            label: const Text(
              'Send Message',
              style: TextStyle(fontSize: 16),
            ),
            ),
          ],
          ),
        ),
        ),
      ),
      ),
    );
    },
  );
  }
}
