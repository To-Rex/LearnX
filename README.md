# Work and Travel Flutter Web App

Bu loyiha Flutter yordamida yaratilgan Work and Travel xizmati uchun web ilovasi.

## Xususiyatlar

- 🌐 Responsive web dizayn
- 🔐 Foydalanuvchi autentifikatsiyasi (kirish/ro'yxatdan o'tish)
- 📱 Minimalistik va zamonaviy dizayn
- 🎯 O'quvchilar uchun maxsus dasturlar
- 📊 Foydalanuvchi dashboard
- 🌍 Xalqaro ish va sayohat imkoniyatlari

## Ishga tushirish

### Talablar
- Flutter SDK (3.10.0 yoki undan yuqori)
- Dart SDK
- Web browser

### O'rnatish

1. Loyihani klonlang:
```bash
git clone <repository-url>
cd work_travel_app
```

2. Dependencies o'rnating:
```bash
flutter pub get
```

3. Web uchun ishga tushiring:
```bash
flutter run -d chrome
```

## Loyiha tuzilishi

```
lib/
├── main.dart                 # Asosiy fayl
├── models/                   # Ma'lumotlar modellari
│   └── user_model.dart
├── screens/                  # Sahifalar
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── dashboard_screen.dart
├── services/                 # Xizmatlar
│   └── auth_service.dart
└── widgets/                  # Qayta ishlatiladigan widgetlar
    ├── custom_button.dart
    ├── custom_text_field.dart
    └── hero_section.dart
```

## Sahifalar

1. **Bosh sahifa** - Kompaniya haqida ma'lumot va xizmatlar
2. **Kirish sahifasi** - Foydalanuvchi autentifikatsiyasi
3. **Ro'yxatdan o'tish** - Yangi foydalanuvchi ro'yxatdan o'tishi
4. **Dashboard** - Foydalanuvchi shaxsiy kabineti

## Texnologiyalar

- **Flutter** - UI framework
- **Dart** - Dasturlash tili
- **Material Design** - Dizayn tizimi

## Kelajakdagi rivojlanish

- [ ] Real API integratsiyasi
- [ ] Ma'lumotlar bazasi ulanishi
- [ ] To'lov tizimi
- [ ] Fayllarni yuklash
- [ ] Push bildirishnomalar
- [ ] Multilingual qo'llab-quvvatlash

## Muallif

WorkTravel jamoasi