import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

// ── EmailJS credentials — fill these in after creating your EmailJS account ──
// https://www.emailjs.com → Services, Templates, Account → Public Key
const _kEmailJsServiceId  = '';
const _kEmailJsTemplateId = '';
const _kEmailJsPublicKey  = '';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(label: '06. Contact', title: "Let's Connect"),
          isMobile
              ? _MobileContact()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactInfo()),
                    const SizedBox(width: 80),
                    Expanded(child: _ContactForm()),
                  ],
                ),
        ],
      ),
    );
  }
}

class _MobileContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactInfo(),
        const SizedBox(height: 48),
        _ContactForm(),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlide(
      key: const Key('contact-info'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I'm currently open to new opportunities. "
            "Whether you have a project in mind or just want to say hi — my inbox is always open!",
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 32),
          _ContactRow(
            icon: FontAwesomeIcons.envelope,
            label: 'Email',
            value: PortfolioData.email,
            onTap: () => _launch('mailto:${PortfolioData.email}'),
          ),
          const SizedBox(height: 16),
          _ContactRow(
            icon: FontAwesomeIcons.locationDot,
            label: 'Location',
            value: PortfolioData.location,
          ),
          const SizedBox(height: 40),
          // Social buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                url: PortfolioData.linkedIn,
              ),
              _SocialButton(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                url: PortfolioData.github,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(icon, size: 16, color: AppColors.accent),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.label.copyWith(fontSize: 10),
              ),
              Text(
                value,
                style: AppTextStyles.body.copyWith(
                  color: onTap != null
                      ? AppColors.accent
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launch,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: 16,
                color: _hovered ? AppColors.accent : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTextStyles.body.copyWith(
                  color: _hovered ? AppColors.accent : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Contact form ──────────────────────────────────────────────────────────────

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _submitted = false;
  bool _sending = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() { _sending = true; _errorMessage = null; });

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id':  _kEmailJsServiceId,
          'template_id': _kEmailJsTemplateId,
          'user_id':     _kEmailJsPublicKey,
          'template_params': {
            'title':   'Portfolio message from ${_nameCtrl.text.trim()}',
            'name':    _nameCtrl.text.trim(),
            'message': _messageCtrl.text.trim(),
            'email':   _emailCtrl.text.trim(),
          },
        }),
      );

      if (response.statusCode == 200) {
        setState(() { _submitted = true; _sending = false; });
      } else {
        setState(() {
          _sending = false;
          _errorMessage = 'Failed to send (${response.statusCode}). Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _sending = false;
        _errorMessage = 'Network error. Please check your connection and try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlide(
      key: const Key('contact-form'),
      delay: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: _submitted
            ? _SuccessMessage()
            : _FormBody(
                formKey: _formKey,
                nameCtrl: _nameCtrl,
                emailCtrl: _emailCtrl,
                messageCtrl: _messageCtrl,
                onSubmit: _submit,
                sending: _sending,
                errorMessage: _errorMessage,
              ),
      ),
    );
  }
}

class _FormBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController messageCtrl;
  final VoidCallback onSubmit;
  final bool sending;
  final String? errorMessage;

  const _FormBody({
    required this.formKey,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.messageCtrl,
    required this.onSubmit,
    required this.sending,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Send a Message', style: AppTextStyles.cardTitle),
          const SizedBox(height: 24),
          _FormField(
            controller: nameCtrl,
            label: 'Your Name',
            enabled: !sending,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: 16),
          _FormField(
            controller: emailCtrl,
            label: 'Your Email',
            enabled: !sending,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email is required';
              if (!v.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          _FormField(
            controller: messageCtrl,
            label: 'Message',
            maxLines: 5,
            enabled: !sending,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Message is required' : null,
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(
              errorMessage!,
              style: AppTextStyles.bodySmall.copyWith(color: Colors.redAccent),
            ),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: _SubmitButton(onTap: onSubmit, sending: sending),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final bool enabled;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      validator: validator,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.bodySmall,
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool sending;
  const _SubmitButton({required this.onTap, required this.sending});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.sending
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.sending ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.sending
                  ? [AppColors.textMuted, AppColors.textMuted]
                  : _hovered
                      ? [AppColors.accentSecondary, AppColors.accent]
                      : [AppColors.accent, AppColors.accent],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered && !widget.sending
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: widget.sending
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    'Send Message',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.background,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        const FaIcon(
          FontAwesomeIcons.circleCheck,
          color: AppColors.success,
          size: 48,
        ),
        const SizedBox(height: 16),
        Text("Message sent!", style: AppTextStyles.cardTitle),
        const SizedBox(height: 8),
        Text(
          "Thanks for reaching out. I'll get back to you soon!",
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
