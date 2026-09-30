# 🚀 CodeQuest - Gamified Software Learning Platform

<p align="center">
  <img src="assets/images/app_icon.png" width="140" height="140" alt="CodeQuest Icon" />
</p>

<p align="center">
  <b>Yazılımcılar İçin 10 Farklı Patikada 11.520 Soru & Duolingo Tarzı Oyunlaştırılmış Eğitim Uygulaması</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart" alt="Dart" />
  <img src="https://img.shields.io/badge/State_Management-Riverpod-blue" alt="Riverpod" />
  <img src="https://img.shields.io/badge/Tracks-10_Languages-success" alt="10 Tracks" />
  <img src="https://img.shields.io/badge/Questions-11%2C520_Interactive-brightgreen" alt="11520 Questions" />
  <img src="https://img.shields.io/badge/Platform-Android_&_Cross--Platform-orange" alt="Platform" />
</p>

---

## 📖 Genel Bakış

**CodeQuest**, yazılım geliştiricilerin temel seviyeden ileri seviyeye kadar en popüler dilleri, araçları ve mimari kavramları oyunlaştırılmış bir patika üzerinde eğlenerek öğrenmesini sağlayan modern bir Flutter uygulamasıdır.

İnteraktif yol haritası (winding learning path), Duolingo tarzı can (hearts), elmas (gems) ve deneyim puanı (XP) mekanikleri, Byte adındaki yapay zeka koçu, konu özetli hile kağıtları (cheat sheets) ve her dilde canlı kod deneme konsolu (Playground) içerir.

---

## 🎯 10 Yazılım Patikası & Müfredat Özeti

Uygulamada her biri **8 Ünite**, ünite başına **8 Ders** ve ders başına **18 Soru** olmak üzere patika başına **1.152 Soru**, toplamda **11.520 Soru** bulunmaktadır:

| Patika | İkon | Ünite | Soru | Temel Konular |
| :--- | :---: | :---: | :---: | :--- |
| **Git & Versiyon Kontrol** | 🌿 | 8 | 1.152 | Temeller, .gitignore, Diff, Branching, 3-Way Merge, GitHub & PR, Rebase, Stash, Reflog, Bisect |
| **Godot 4 & Oyun Geliştirme**| 🎮 | 8 | 1.152 | GDScript 2.0, Düğümler, Sahneler, CharacterBody2D, Fizik, Sinyaller, UI, TileMap, Shader |
| **C Dili & Bellek Yönetimi** | ⚡ | 8 | 1.152 | Veri Tipleri, İşaretçiler (Pointers), Heap/Stack, Malloc/Free, Struct & Union, Bit Düzeyi İşlemler |
| **Python Quest** | 🐍 | 8 | 1.152 | Sözdizimi, List/Dict/Set, Comprehensions, Lambda, Decorators, OOP, Dunder Metotlar, Asyncio |
| **C# & .NET 8** | ⚙️ | 8 | 1.152 | Tipler, OOP, LINQ, Generics, Async/Await, Task, Dependency Injection, Stack/Heap |
| **Kotlin & Android** | 📱 | 8 | 1.152 | Null Safety (Elvis ?:), Scope Functions, Data Classes, Coroutines, Flow, Jetpack Compose |
| **Linux & Terminal** | 🐧 | 8 | 1.152 | Dizin Yönetimi, Pipe (\|), grep/awk/sed, chmod & chown İzinleri, Bash Scripting, Systemd |
| **JavaScript & Web** | 🌐 | 8 | 1.152 | ES6+, Array Metotları, Event Loop, Promise & Async/Await, DOM, Modüller, Web API'leri |
| **SQL & Veritabanı** | 🗄️ | 8 | 1.152 | DDL/DML, WHERE & ORDER, GROUP BY & HAVING, JOIN İlişkileri, İndeksler, ACID & Transaction |
| **Algoritmalar & Veri Yapıları**| 🧩 | 8 | 1.152 | Big-O Analizi, Stack/Queue, Ağaçlar & BST, Quicksort/Merge, Grafikler, Dinamik Programlama |
| **GENEL TOPLAM** | 🌟 | **80 Ünite** | **11.520 Soru** | **Eksiksiz Offline Yazılımcı Eğitim Kütüphanesi** |

---

## 💡 İnteraktif Soru Tipleri

Her ders, derinlemesine kavratıcı 5 farklı soru tipiyle zenginleştirilmiştir:
1. **Hap Bilgi (Concept Card):** Mimar kuralı, gerçek kod örneği, Byte geliştirici tavsiyesi.
2. **Çoktan Seçmeli Senaryo Sorusu:** Kod çıktısı tahminleme, mantık hataları ve teknik mülakat senaryoları.
3. **Boşluk Doldurma (Fill-in-the-Blank):** Kod bloklarında eksik sözdizimini tamamlama.
4. **Doğru / Yanlış:** Sektör pratikleri ve best-practice denetimi.
5. **Eşleştirme (Matching Pairs):** Komut-görev, metot-açıklama eşleştirmeleri.

---

## ✨ Özellikler

- **Offline-First Mimari:** Tüm sorular ve müfredat cihazda çevrimdışı çalışır, internet gerektirmez.
- **Byte Mascot Koçu:** Her patikada yazılımcıyı motive eden, ipuçları veren yapay zeka rehberi.
- **Hile Kağıtları (Cheat Sheets):** Her üniteye ait hızlı başvuru kod kartları.
- **Code Playground:** 10 farklı dil için önceden hazırlanmış şablonlarla interaktif kod deneme alanı.
- **Oyunlaştırma & Başarımlar:** Günlük seri (streak), can sistemi, seviye atlama ve başarım ödülleri.
- **Modern Karanlık Tema:** Yazılımcı gözünü yormayan derin IDE renk paleti (Slate / Midnight Navy).

---

## 🛠️ Kurulum & Çalıştırma

Projeyi yerel ortamınızda çalıştırmak için:

```bash
# Depoyu klonlayın
git clone https://github.com/mraery/codequest.git
cd codequest

# Bağımlılıkları yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run
```

### Release APK Derleme

```bash
flutter build apk --release
```
Derlenen APK dosyası `build/app/outputs/flutter-apk/app-release.apk` dizininde oluşur.

---

## 🏗️ Mimari & Teknolojiler

- **UI Framework:** Flutter (Dart)
- **State Management:** Riverpod (`flutter_riverpod`)
- **Tasarım & Tipografi:** Google Fonts (JetBrains Mono & Poppins), Smooth Duolingo-style Animations
- **Depolama:** SharedPreferences (Kullanıcı ilerlemesi, canlar, elmaslar)

---

## 📄 Lisans

Bu proje MIT lisansı ile lisanslanmıştır.
