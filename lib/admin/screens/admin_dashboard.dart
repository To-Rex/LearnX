import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/certificate_model.dart';
import '../../models/partner_model.dart';
import '../../services/partner_service.dart';
import '../../services/certificate_service.dart';
import '../../services/web_storage_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final PartnerService _partnerService = PartnerService();
  final CertificateService _certificateService = CertificateService();
  final WebStorageService _webStorageService = WebStorageService();

  final TextEditingController _partnerName = TextEditingController();
  final TextEditingController _partnerLocation = TextEditingController();
  final TextEditingController _partnerCountry = TextEditingController();
  final TextEditingController _certificateTitle = TextEditingController();

  final GlobalKey<FormState> _partnerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _certificateFormKey = GlobalKey<FormState>();

  List<PartnerModel> partners = [];
  List<CertificateModel> certificates = [];

  String? _selectedPartnerImage;
  String? _selectedCertificateImage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final partnerList = await _partnerService.getPartners();
    final certificateList = await _certificateService.getCertificates();
    setState(() {
      partners = partnerList;
      certificates = certificateList;
    });
  }

  Future<void> _selectPartnerImage() async {
    final imageUrl = await _webStorageService.pickAndUploadImage(bucket: 'partners');
    if (imageUrl != null) {
      setState(() => _selectedPartnerImage = imageUrl);
    }
  }

  Future<void> _selectCertificateImage() async {
    final imageUrl = await _webStorageService.pickAndUploadImage(bucket: 'certificates');
    if (imageUrl != null) {
      setState(() => _selectedCertificateImage = imageUrl);
    }
  }

  Future<void> _addPartner() async {
    if (!_partnerFormKey.currentState!.validate() || _selectedPartnerImage == null) return;
    await _partnerService.addPartner(
      _partnerName.text,
      _selectedPartnerImage!,
      _partnerLocation.text,
      _partnerCountry.text,
    );
    _clearPartnerFields();
    _loadData();
    Navigator.pop(context);
  }

  Future<void> _addCertificate() async {
    if (!_certificateFormKey.currentState!.validate() || _selectedCertificateImage == null) return;
    await _certificateService.addCertificate(_certificateTitle.text, _selectedCertificateImage!);
    _clearCertificateFields();
    _loadData();
    Navigator.pop(context);
  }

  Future<void> _deletePartner(String? id) async {
    if (id != null) {
      await _partnerService.deletePartner(id);
      _loadData();
    }
  }

  Future<void> _deleteCertificate(String? id) async {
    if (id != null) {
      await _certificateService.deleteCertificate(id);
      _loadData();
    }
  }

  void _clearPartnerFields() {
    _partnerName.clear();
    _partnerLocation.clear();
    _partnerCountry.clear();
    _selectedPartnerImage = null;
  }

  void _clearCertificateFields() {
    _certificateTitle.clear();
    _selectedCertificateImage = null;
  }

  void _showBlurDialog({required Widget child}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(100),
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 400),
            child: child,
          ),
        ),
      ),
    );
  }

  void _showAddPartnerDialog() {
    _showBlurDialog(
      child: Form(
        key: _partnerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDialogTitle("Yangi Partnyor Qo'shish"),
            const SizedBox(height: 16),
            _buildInput("Nomi", _partnerName),
            _buildInput("Manzil", _partnerLocation),
            _buildInput("Davlat", _partnerCountry),
            const SizedBox(height: 16),
            _buildImageBox(_selectedPartnerImage, _selectPartnerImage),
            const SizedBox(height: 20),
            _buildDialogActions(_addPartner),
          ],
        ),
      ),
    );
  }

  void _showAddCertificateDialog() {
    _showBlurDialog(
      child: Form(
        key: _certificateFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDialogTitle("Yangi Sertifikat Qo'shish"),
            const SizedBox(height: 16),
            _buildInput("Sertifikat nomi", _certificateTitle),
            const SizedBox(height: 16),
            _buildImageBox(_selectedCertificateImage, _selectCertificateImage),
            const SizedBox(height: 20),
            _buildDialogActions(_addCertificate),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogTitle(String title) => Text(
    title,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: const Color(0xFF1A237E),
    ),
  );

  Widget _buildInput(String label, TextEditingController controller) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextFormField(
      controller: controller,
      validator: (v) => v == null || v.trim().isEmpty ? 'Iltimos, maydonni to‘ldiring' : null,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3F51B5), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFB00020), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFB00020), width: 2),
        ),
        labelStyle: TextStyle(color: Colors.grey.shade700),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      style: const TextStyle(color: Color(0xFF212121)),
    ),
  );

  Widget _buildImageBox(String? imageUrl, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: imageUrl != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 36,
                color: Colors.grey.shade500,
              ),
              const SizedBox(height: 8),
              Text(
                "Rasm tanlash",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogActions(VoidCallback onSave) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey.shade600,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: const Text(
            "Bekor qilish",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: onSave,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF3F51B5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
          child: const Text(
            "Qo‘shish",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildList(
      String title,
      List<Map<String, dynamic>> items,
      String imageKey,
      String textKey,
      VoidCallback onAdd,
      String? Function(int) idGetter,
      void Function(String? id) onDelete, // ✅ yangi qo‘shildi
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A237E),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: items.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 36,
                          color: const Color(0xFF3F51B5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Qo'shish",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF3F51B5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              final item = items[index - 1];
              return Stack(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            item[imageKey] ?? '',
                            height: 80,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 80,
                              color: Colors.grey.shade100,
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey.shade400,
                                size: 36,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              item[textKey] ?? '',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF212121),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () => onDelete(idGetter(index - 1)), // ✅ o‘zgartirildi
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xFFB00020),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A237E),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _showAddPartnerDialog,
            icon: const Icon(Icons.group_add, color: Color(0xFF3F51B5)),
            tooltip: 'Partnyor qo‘shish',
          ),
          IconButton(
            onPressed: _showAddCertificateDialog,
            icon: const Icon(Icons.badge_outlined, color: Color(0xFF3F51B5)),
            tooltip: 'Sertifikat qo‘shish',
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildList(
            'Partnyorlar',
            partners.map((e) => {'photo': e.photo, 'name': e.name}).toList(),
            'photo',
            'name',
            _showAddPartnerDialog,
                (index) => partners[index].id.toString(),
            _deletePartner, // ✅ qo‘shildi
          ),

          _buildList(
            'Sertifikatlar',
            certificates.map((e) => {'url': e.imageUrl, 'title': e.title}).toList(),
            'url',
            'title',
            _showAddCertificateDialog,
                (index) => certificates[index].id.toString(),
            _deleteCertificate, // ✅ qo‘shildi
          ),

        ],
      ),
    );
  }
}