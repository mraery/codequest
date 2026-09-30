import 'package:flutter/material.dart';

enum CodeLanguage {
  git,
  godot,
  c,
  python,
  csharp,
  kotlin,
  linux,
  javascript,
  sql,
  algorithms,
}

class CodeTrackConfig {
  final CodeLanguage language;
  final String title;
  final String shortTitle;
  final String badgeText;
  final String description;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final String mascotGreeting;
  final String mascotEmoji;
  final List<String> categories;
  final String fileExtension;
  final String helloWorldSnippet;

  const CodeTrackConfig({
    required this.language,
    required this.title,
    required this.shortTitle,
    required this.badgeText,
    required this.description,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.mascotGreeting,
    required this.mascotEmoji,
    required this.categories,
    required this.fileExtension,
    required this.helloWorldSnippet,
  });

  static const CodeTrackConfig git = CodeTrackConfig(
    language: CodeLanguage.git,
    title: 'Git & Versiyon Kontrol',
    shortTitle: 'Git',
    badgeText: 'Git 🌿',
    description: "Branch'ler, Rebase, Çakışma Çözümü & DevOps İş Akışları",
    primaryColor: Color(0xFFF05032), // Git Turuncusu
    secondaryColor: Color(0xFFF97316),
    accentColor: Color(0xFFE24329),
    mascotGreeting: 'Selam Versiyon Mimarı! Git ile zamanda yolculuk yapmaya ve branch\'leri fethetmeye hazır mısın? 🌿',
    mascotEmoji: '🌿',
    categories: ['Tümü', 'Temeller', 'İnceleme & Diff', 'Dallanma & Branch', 'Birleştirme & Merge', 'Uzak Depo & GitHub', 'Rebase & Reset', 'Kurtarma & Reflog', 'İleri Seviye & Mimarisi'],
    fileExtension: '.sh',
    helloWorldSnippet: '''# Temel Git İş Akışı
git init
git add .
git commit -m "feat: ilk commit!"
git branch -M main
git log --oneline''',
  );

  static const CodeTrackConfig godot = CodeTrackConfig(
    language: CodeLanguage.godot,
    title: 'Godot 4 & Oyun Geliştirme',
    shortTitle: 'Godot',
    badgeText: 'Godot 🎮',
    description: 'GDScript 2.0, Düğümler, Sahneler, Fizik & 2D/3D',
    primaryColor: Color(0xFF478CBF), // Godot Mavisi
    secondaryColor: Color(0xFF41709E),
    accentColor: Color(0xFF10B981),
    mascotGreeting: 'Oyun geliştiricisi hoş geldin! Godot 4 ve GDScript ile hayalindeki oyunu adım adım kodluyoruz! 🎮',
    mascotEmoji: '🎮',
    categories: ['Tümü', 'Temeller & Düğümler', 'GDScript 2.0', 'Fizik & Hareket', 'Sinyaller & Olaylar', 'UI & Animasyon'],
    fileExtension: '.gd',
    helloWorldSnippet: '''extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
    var direction = Input.get_axis("ui_left", "ui_right")
    velocity.x = direction * SPEED
    move_and_slide()''',
  );

  static const CodeTrackConfig c = CodeTrackConfig(
    language: CodeLanguage.c,
    title: 'C Dili & Bellek Yönetimi',
    shortTitle: 'C Dili',
    badgeText: 'C ⚡',
    description: 'İşaretçiler (Pointers), Heap/Stack, Structs & Düşük Seviye',
    primaryColor: Color(0xFF0284C7), // C Mavisi
    secondaryColor: Color(0xFF6366F1),
    accentColor: Color(0xFFF59E0B),
    mascotGreeting: 'Donanıma en yakın seviyedesin! C dili ile işaretçileri yönetip gerçek yazılımcı refleksleri kazanıyoruz! ⚡',
    mascotEmoji: '⚡',
    categories: ['Tümü', 'Temeller & Tipler', 'İşaretçiler (Pointers)', 'Dinamik Bellek & Malloc', 'Structs & Unions', 'Bitwise & Dosya'],
    fileExtension: '.c',
    helloWorldSnippet: '''#include <stdio.h>
#include <stdlib.h>

int main() {
    int sayi = 42;
    int *ptr = &sayi;
    printf("Deger: %d, Adres: %p\\n", *ptr, (void*)ptr);
    return 0;
}''',
  );

  static const CodeTrackConfig python = CodeTrackConfig(
    language: CodeLanguage.python,
    title: 'Python Quest',
    shortTitle: 'Python',
    badgeText: 'Python 🐍',
    description: 'Sıfırdan İleri Seviyeye Temiz, Modern Python & Algoritmalar',
    primaryColor: Color(0xFF3B82F6), // Python Mavi
    secondaryColor: Color(0xFFF59E0B), // Python Sarı
    accentColor: Color(0xFF10B981),
    mascotGreeting: 'Selam Yazılımcı! Bugün Python ile algoritmaları ve veri yapılarını fethediyoruz! 🐍',
    mascotEmoji: '🐍',
    categories: ['Tümü', 'Temeller', 'Kontrol Yapıları', 'Koleksiyonlar', 'Comprehension', 'Fonksiyonlar', 'OOP', 'Hata & Dosya'],
    fileExtension: '.py',
    helloWorldSnippet: '# İlk Python Programın\nname = "Kod Dünyası"\nprint(f"Merhaba, {name}!")\n\nfor i in range(1, 4):\n    print(f"Adım {i}: Kodla ve Öğren!")',
  );

  static const CodeTrackConfig csharp = CodeTrackConfig(
    language: CodeLanguage.csharp,
    title: 'C# & .NET Quest',
    shortTitle: 'C#',
    badgeText: 'C# ⚙️',
    description: '.NET 8, Kurumsal Mimari, LINQ & Async/Await',
    primaryColor: Color(0xFF6366F1), // C# İndigo
    secondaryColor: Color(0xFF10B981), // .NET Yeşil
    accentColor: Color(0xFF06B6D4),
    mascotGreeting: 'Hoş geldin Mimar! C# ve .NET ile kurumsal seviyede güçlü yapılar kuruyoruz! ⚙️',
    mascotEmoji: '⚙️',
    categories: ['Tümü', 'Temeller', 'Karar Yapıları', 'Sınıflar & OOP', 'Koleksiyonlar & LINQ', 'Asenkron & Hata'],
    fileExtension: '.cs',
    helloWorldSnippet: r'''using System;

class Program {
    static void Main() {
        string lang = "C#";
        Console.WriteLine($"Merhaba {lang}! .NET dünyasına hoş geldin.");
    }
}''',
  );

  static const CodeTrackConfig kotlin = CodeTrackConfig(
    language: CodeLanguage.kotlin,
    title: 'Kotlin & Android Quest',
    shortTitle: 'Kotlin',
    badgeText: 'Kotlin 📱',
    description: 'Modern Android, Null Safety & Coroutines',
    primaryColor: Color(0xFF8B5CF6), // Kotlin Mor
    secondaryColor: Color(0xFFF97316), // Kotlin Turuncu
    accentColor: Color(0xFFEC4899),
    mascotGreeting: 'Android mimarı! Kotlin ile Null-Safety ve modern syntax seni bekliyor! 📱',
    mascotEmoji: '📱',
    categories: ['Tümü', 'Temeller', 'Null Safety', 'Fonksiyonlar & Lambdalar', 'Data Class & OOP', 'Koleksiyonlar', 'Extensions & Coroutines'],
    fileExtension: '.kt',
    helloWorldSnippet: r'''fun main() {
    val dev = "Mobil Geliştirici"
    println("Merhaba $dev! Kotlin ile Null-Safety güvendesin.")
}''',
  );

  static const CodeTrackConfig linux = CodeTrackConfig(
    language: CodeLanguage.linux,
    title: 'Linux & Bash Terminal',
    shortTitle: 'Linux',
    badgeText: 'Linux 🐧',
    description: "Komut Satırı, Pipe'lar, İzinler & Shell Scripting",
    primaryColor: Color(0xFFEAB308), // Terminal Gold
    secondaryColor: Color(0xFF10B981),
    accentColor: Color(0xFF06B6D4),
    mascotGreeting: 'Terminal siyah ekranından korkma! Linux komutları ve pipe\'lar ile sunucuların hakimi olacaksın! 🐧',
    mascotEmoji: '🐧',
    categories: ['Tümü', 'Temel Komutlar', 'Pipe & Yönlendirme', 'Metin Filtreleme (grep)', 'İzinler (chmod)', 'Shell Scripting'],
    fileExtension: '.sh',
    helloWorldSnippet: '''#!/bin/bash
NAME="DevOps Kahramani"
echo "Selam \$NAME!"
echo "Mevcut Dizin: \$(pwd)"
ls -la | grep "txt"''',
  );

  static const CodeTrackConfig javascript = CodeTrackConfig(
    language: CodeLanguage.javascript,
    title: 'JavaScript & Web Quest',
    shortTitle: 'JavaScript',
    badgeText: 'JS 🌐',
    description: 'Modern ES6+, Asenkron JS, Event Loop & Web',
    primaryColor: Color(0xFFF7DF1E), // JS Sarı
    secondaryColor: Color(0xFFF59E0B),
    accentColor: Color(0xFF38BDF8),
    mascotGreeting: 'Web dünyasının kalbi JavaScript! Asenkron kodlama ve modern ES6+ yetenekleriyle harikalar yaratıyoruz! 🌐',
    mascotEmoji: '🌐',
    categories: ['Tümü', 'ES6+ Temelleri', 'Diziler & Nesneler', 'Asenkron & Promise', 'DOM & Olaylar', 'Modern Web & Modüller'],
    fileExtension: '.js',
    helloWorldSnippet: '''const greet = (name) => `Merhaba \${name}!`;
console.log(greet("Geliştirici"));

const nums = [1, 2, 3, 4];
const squares = nums.map(n => n * n);
console.log(squares);''',
  );

  static const CodeTrackConfig sql = CodeTrackConfig(
    language: CodeLanguage.sql,
    title: 'SQL & Veritabanı Mimarisi',
    shortTitle: 'SQL',
    badgeText: 'SQL 🗄️',
    description: 'İlişkisel Veritabanları, JOIN\'ler, İndeksler & Optimizasyon',
    primaryColor: Color(0xFF06B6D4), // SQL Cyan
    secondaryColor: Color(0xFF3B82F6),
    accentColor: Color(0xFF10B981),
    mascotGreeting: 'Veriyi doğru ve hızlı yöneten yazılımcı vazgeçilmezdir! SQL sorgularıyla veri dağlarını fethetmeye hazır mısın? 🗄️',
    mascotEmoji: '🗄️',
    categories: ['Tümü', 'Temel CRUD', 'Filtreleme & Sıralama', 'Gruplama & Aggregate', 'JOIN & İlişkiler', 'İndeksler & ACID'],
    fileExtension: '.sql',
    helloWorldSnippet: '''SELECT u.username, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.is_active = TRUE
GROUP BY u.username
HAVING COUNT(o.id) > 5
ORDER BY order_count DESC;''',
  );

  static const CodeTrackConfig algorithms = CodeTrackConfig(
    language: CodeLanguage.algorithms,
    title: 'Algoritmalar & Veri Yapıları',
    shortTitle: 'Algoritmalar',
    badgeText: 'Algoritma 🧩',
    description: 'Big-O, Ağaçlar, Grafikler, Sıralama & Mülakatlar',
    primaryColor: Color(0xFFA855F7), // Mor
    secondaryColor: Color(0xFFEC4899),
    accentColor: Color(0xFF3B82F6),
    mascotGreeting: 'Büyük teknoloji mülakatlarının ve yüksek performansın anahtarı algoritmalar! Karmaşıklıkları dize getirelim! 🧩',
    mascotEmoji: '🧩',
    categories: ['Tümü', 'Big-O & Karmaşıklık', 'Doğrusal Yapılar (Stack/Queue)', 'Ağaçlar & BST', 'Sıralama & Arama', 'Grafikler & Dinamik'],
    fileExtension: '.py',
    helloWorldSnippet: '''def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1''',
  );

  static const List<CodeTrackConfig> allTracks = [
    git,
    godot,
    c,
    python,
    csharp,
    kotlin,
    linux,
    javascript,
    sql,
    algorithms,
  ];

  static CodeTrackConfig fromLanguage(CodeLanguage lang) {
    switch (lang) {
      case CodeLanguage.git:
        return git;
      case CodeLanguage.godot:
        return godot;
      case CodeLanguage.c:
        return c;
      case CodeLanguage.python:
        return python;
      case CodeLanguage.csharp:
        return csharp;
      case CodeLanguage.kotlin:
        return kotlin;
      case CodeLanguage.linux:
        return linux;
      case CodeLanguage.javascript:
        return javascript;
      case CodeLanguage.sql:
        return sql;
      case CodeLanguage.algorithms:
        return algorithms;
    }
  }
}
