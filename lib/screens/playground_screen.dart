import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/code_track_model.dart';
import '../widgets/duo_button.dart';

class PlaygroundScreen extends ConsumerStatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  ConsumerState<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends ConsumerState<PlaygroundScreen> {
  CodeLanguage _selectedLang = CodeLanguage.git;
  late TextEditingController _codeController;
  String _consoleOutput = '';
  bool _isRunning = false;

  final Map<CodeLanguage, List<Map<String, String>>> _templates = {
    CodeLanguage.git: [
      {
        'title': '🌿 Git Durum & Commit',
        'code': '''# Git İş Akışı Simülasyonu
git status
git add .
git commit -m "feat(auth): JWT oturum açma eklendi"
git log --oneline --graph''',
        'simulated_output': '''On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   src/auth/jwt.service.ts
	modified:   src/app.module.ts

[main 8f3a1b2] feat(auth): JWT oturum açma eklendi
 2 files changed, 48 insertions(+)
* 8f3a1b2 (HEAD -> main) feat(auth): JWT oturum açma eklendi
* 4a12c90 chore: proje iskeleti kuruldu
[Git komutları başarıyla tamamlandı]''',
      },
      {
        'title': '🔀 Branch & Rebase',
        'code': '''git switch -c feature/payment
git commit -am "feat: stripe entegrasyonu"
git switch main
git pull origin main
git switch feature/payment
git rebase main''',
        'simulated_output': '''Switched to a new branch 'feature/payment'
[feature/payment b1c2d3e] feat: stripe entegrasyonu
Switched to branch 'main'
Already up to date.
Switched to branch 'feature/payment'
Successfully rebased and updated refs/heads/feature/payment.
[Linear Git tarihçesi korundu - 0 Çakışma]''',
      },
    ],
    CodeLanguage.godot: [
      {
        'title': '🎮 2D Karakter Hareketi',
        'code': '''extends CharacterBody2D

@export var speed: float = 350.0
@export var jump_velocity: float = -450.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y += gravity * delta

    var direction = Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * speed
    else:
        velocity.x = move_toward(velocity.x, 0, speed)

    move_and_slide()''',
        'simulated_output': '''[Godot 4.3 Engine] SceneTree başlatıldı.
CharacterBody2D yüklendi: Pos(120, 240)
Input okundu: ui_right basıldı -> Velocity.x = 350.0
_physics_process: 60.0 FPS sabit adımda pürüzsüz çalışıyor.
move_and_slide: Zemin teması sağlandı (is_on_floor == true)''',
      },
      {
        'title': '📡 Sinyal & Event Bus',
        'code': '''extends Node

signal health_changed(new_health: int)

var current_health: int = 100

func take_damage(amount: int) -> void:
    current_health = max(0, current_health - amount)
    health_changed.emit(current_health)
    print("Kalan Can: ", current_health)''',
        'simulated_output': '''[Godot 4.3 Engine] Sinyal Event Bus aktif.
take_damage(25) çağrıldı.
Sinyal emit edildi: health_changed(75) -> UI ProgressBar güncellendi.
Kalan Can: 75''',
      },
    ],
    CodeLanguage.c: [
      {
        'title': '⚡ Pointer & Bellek Adresi',
        'code': '''#include <stdio.h>

int main() {
    int sayi = 42;
    int *ptr = &sayi;

    printf("Değer: %d\\n", *ptr);
    printf("RAM Adresi: %p\\n", (void*)ptr);

    *ptr = 99; // Dereference ile degeri degistir
    printf("Yeni Değer: %d\\n", sayi);
    return 0;
}''',
        'simulated_output': '''Değer: 42
RAM Adresi: 0x7ffd5a98bf44
Yeni Değer: 99
[GCC Derleyici: 0 Hata, 0 Uyarı - Çıkış Kodu: 0]''',
      },
      {
        'title': '🧠 Dinamik Malloc & Free',
        'code': '''#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 5;
    int *arr = (int*)malloc(n * sizeof(int));
    if (arr == NULL) return 1;

    for (int i = 0; i < n; i++) {
        arr[i] = (i + 1) * 10;
        printf("arr[%d] = %d\\n", i, arr[i]);
    }

    free(arr); // Bellek sizintisini onle
    arr = NULL;
    printf("Bellek basariyla serbest birakildi.\\n");
    return 0;
}''',
        'simulated_output': '''arr[0] = 10
arr[1] = 20
arr[2] = 30
arr[3] = 40
arr[4] = 50
Bellek basariyla serbest birakildi.
[Valgrind Memcheck: 0 bayt sızıntı, tüm bloklar serbest bırakıldı]''',
      },
    ],
    CodeLanguage.python: [
      {
        'title': '🐍 Merhaba & Döngü',
        'code': '# Python Temelleri\nuser = "Geliştirici"\nprint(f"Selam {user}! CodeQuest Lab çalışıyor.")\n\nfor i in range(1, 4):\n    print(f"Adım {i}: Kodlama harika!")',
        'simulated_output': 'Selam Geliştirici! CodeQuest Lab çalışıyor.\nAdım 1: Kodlama harika!\nAdım 2: Kodlama harika!\nAdım 3: Kodlama harika!\n[Program 0ms içinde başarıyla sonlandı]',
      },
      {
        'title': '📊 Liste & İstatistik',
        'code': 'numbers = [12, 45, 78, 23, 90]\ntotal = sum(numbers)\navg = total / len(numbers)\nprint(f"Sayılar: {numbers}")\nprint(f"Toplam: {total} | Ortalama: {avg:.2f}")',
        'simulated_output': 'Sayılar: [12, 45, 78, 23, 90]\nToplam: 248 | Ortalama: 49.60\n[Program 0ms içinde başarıyla sonlandı]',
      },
    ],
    CodeLanguage.csharp: [
      {
        'title': '⚙️ C# LINQ Filtreleme',
        'code': r'''using System;
using System.Linq;
using System.Collections.Generic;

class Program {
    static void Main() {
        List<int> numbers = new() { 1, 2, 3, 4, 5, 6, 7, 8 };
        var evens = numbers.Where(n => n % 2 == 0).ToList();
        Console.WriteLine($"Çift Sayılar: {string.Join(", ", evens)}");
    }
}''',
        'simulated_output': 'Çift Sayılar: 2, 4, 6, 8\n[.NET 8 Runtime Çıktısı - 0 Hata]',
      },
    ],
    CodeLanguage.kotlin: [
      {
        'title': '📱 Null Safety & Elvis',
        'code': r'''fun main() {
    val devName: String? = "Ahmet"
    val length = devName?.length ?: 0
    println("Geliştirici: $devName (Uzunluk: $length)")
}''',
        'simulated_output': 'Geliştirici: Ahmet (Uzunluk: 5)\n[Program JVM üzerinde başarıyla çalıştı]',
      },
    ],
    CodeLanguage.linux: [
      {
        'title': '🐧 Pipe & Grep Filtre',
        'code': '''#!/bin/bash
echo "Sistem Log Analizi Başlatılıyor..."
cat /var/log/nginx/access.log | grep "404" | wc -l
echo "İzinler denetleniyor:"
ls -la | awk '{print \$1, \$9}' ''',
        'simulated_output': '''Sistem Log Analizi Başlatılıyor...
42 adet 404 isteği bulundu.
İzinler denetleniyor:
-rwxr-xr-x server.sh
-rw-r--r-- config.yaml
drwxr-xr-x src/''',
      },
    ],
    CodeLanguage.javascript: [
      {
        'title': '🌐 ES6+ & Async/Await',
        'code': '''const fetchUser = async (id) => {
    return new Promise(resolve => {
        setTimeout(() => resolve({ id, name: "Selin", role: "Fullstack Dev" }), 100);
    });
};

const user = await fetchUser(101);
console.log(`Kullanıcı: \${user.name} (\${user.role})`);''',
        'simulated_output': '''Kullanıcı: Selin (Fullstack Dev)
[V8 Engine - Promise mikro görev kuyruğu başarıyla tamamlandı]''',
      },
    ],
    CodeLanguage.sql: [
      {
        'title': '🗄️ GROUP BY & JOIN',
        'code': '''SELECT 
    d.department_name, 
    COUNT(e.id) AS total_employees,
    AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e ON d.id = e.dept_id
GROUP BY d.department_name
HAVING COUNT(e.id) > 2
ORDER BY avg_salary DESC;''',
        'simulated_output': '''+------------------+-----------------+------------+
| department_name  | total_employees | avg_salary |
+------------------+-----------------+------------+
| Bilgi İşlem      | 8               | 85000.00   |
| Ürün & Tasarım   | 5               | 78000.00   |
| Veri Bilimi      | 4               | 92000.00   |
+------------------+-----------------+------------+
(3 satır sorgulandı - Yürütme süresi: 1.4ms)''',
      },
    ],
    CodeLanguage.algorithms: [
      {
        'title': '🧩 İkili Arama (Binary Search)',
        'code': '''def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    steps = 0
    while low <= high:
        steps += 1
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid, steps
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1, steps

data = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
idx, steps = binary_search(data, 23)
print(f"Hedef indeks: {idx}, Adım sayısı: {steps}")''',
        'simulated_output': '''Hedef indeks: 5, Adım sayısı: 2
[Big-O: O(log n) karmaşıklıkla 10 elemanlı dizide sadece 2 adımda bulundu!]''',
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(
      text: _templates[CodeLanguage.git]!.first['code']!,
    );
    _consoleOutput = _templates[CodeLanguage.git]!.first['simulated_output']!;
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _runCode() {
    setState(() => _isRunning = true);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      final currentList = _templates[_selectedLang]!;
      final match = currentList.firstWhere(
        (item) => item['code'] == _codeController.text,
        orElse: () => {
          'simulated_output': '>>> Kod başarıyla analiz edildi ve çalıştırıldı.\nÇıktı:\n${_simulateCustomCode(_codeController.text)}\n[İşlem 0ms içinde başarıyla sonlandı]',
        },
      );

      setState(() {
        _consoleOutput = match['simulated_output']!;
        _isRunning = false;
      });
    });
  }

  String _simulateCustomCode(String code) {
    if (code.contains('print(') || code.contains('Console.WriteLine(') || code.contains('println(') || code.contains('printf(')) {
      return 'Program çıktısı başarıyla üretildi.';
    }
    return 'Kod syntax doğrulaması başarılı.';
  }

  @override
  Widget build(BuildContext context) {
    final templates = _templates[_selectedLang] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Row(
          children: [
            Text('💻 Kod & Komut Laboratuvarı', style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Scrollable Language selector tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: CodeLanguage.values.map((lang) {
                  final isSel = _selectedLang == lang;
                  final cfg = CodeTrackConfig.fromLanguage(lang);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedLang = lang;
                          final tmpls = _templates[lang];
                          if (tmpls != null && tmpls.isNotEmpty) {
                            _codeController.text = tmpls.first['code']!;
                            _consoleOutput = tmpls.first['simulated_output']!;
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSel ? cfg.primaryColor : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSel ? cfg.primaryColor : const Color(0xFF334155),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cfg.badgeText,
                            style: TextStyle(
                              color: isSel ? Colors.white : const Color(0xFF94A3B8),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),

            // Pre-built template chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: templates.map((tmpl) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      backgroundColor: const Color(0xFF1E293B),
                      side: const BorderSide(color: Color(0xFF334155)),
                      label: Text(
                        tmpl['title']!,
                        style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          _codeController.text = tmpl['code']!;
                          _consoleOutput = tmpl['simulated_output']!;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),

            // Editor Card
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF334155), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E293B),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'main${CodeTrackConfig.fromLanguage(_selectedLang).fileExtension}',
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontFamily: 'monospace',
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh_rounded, size: 18, color: Color(0xFF94A3B8)),
                          onPressed: () {
                            final tmpls = _templates[_selectedLang];
                            if (tmpls != null && tmpls.isNotEmpty) {
                              setState(() {
                                _codeController.text = tmpls.first['code']!;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: TextField(
                      controller: _codeController,
                      maxLines: 10,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFFF8FAFC),
                        fontSize: 13,
                        height: 1.4,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Run Button
            DuoButton(
              text: _isRunning ? 'Çalıştırılıyor...' : 'Kodu / Komutu Çalıştır',
              icon: Icons.play_arrow_rounded,
              backgroundColor: CodeTrackConfig.fromLanguage(_selectedLang).primaryColor,
              onPressed: _isRunning ? null : _runCode,
            ),
            const SizedBox(height: 16),

            // Console output
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF020617),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.terminal_rounded, size: 16, color: Color(0xFF10B981)),
                      SizedBox(width: 8),
                      Text(
                        'Konsol / Çıktı Terminali',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFF1E293B), height: 16),
                  Text(
                    _consoleOutput,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Color(0xFF38BDF8),
                      fontSize: 12.5,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
