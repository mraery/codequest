import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';

class DevReflexQuestion {
  final String prompt;
  final String triggerWord;
  final String correctAnswer;
  final List<String> wrongOptions;
  final String memoryCode;
  final String category;
  final String? codeSnippet;

  const DevReflexQuestion({
    required this.prompt,
    required this.triggerWord,
    required this.correctAnswer,
    required this.wrongOptions,
    required this.memoryCode,
    required this.category,
    this.codeSnippet,
  });
}

final List<DevReflexQuestion> devReflexBank = [
  // Flutter & Dart Refleksleri
  const DevReflexQuestion(
    prompt: "Flutter'da 'const' ile işaretlenen bir widget hakkında aşağıdakilerden hangisi doğrudur?",
    triggerWord: "const Widget Faydası",
    correctAnswer: "Derleme zamanında tekil üretilir ve asla gereksiz rebuild edilmez.",
    wrongOptions: [
      "Her karede (frame) sıfırdan çizilir.",
      "Sadece Android işletim sisteminde çalışır.",
      "Arka planda otomatik thread açar."
    ],
    memoryCode: "const widget'lar bellek ve CPU'yu korur, rebuild zincirinden muaf tutulur!",
    category: "Flutter & Dart",
    codeSnippet: "const SizedBox(height: 16);",
  ),
  const DevReflexQuestion(
    prompt: "Flutter'da Hot Reload ile Hot Restart arasındaki temel fark nedir?",
    triggerWord: "Hot Reload vs Hot Restart",
    correctAnswer: "Hot Reload widget ağacını yenilerken State'i korur; Hot Restart State'i sıfırlar.",
    wrongOptions: [
      "Hot Reload tüm projeyi baştan derler.",
      "İkisi de tamamen aynı işi yapar.",
      "Hot Restart sadece resimleri yeniler."
    ],
    memoryCode: "Ekrandaki veriyi kaybetmeden UI denemek için Hot Reload; temiz başlangıç için Hot Restart!",
    category: "Flutter & Dart",
  ),
  const DevReflexQuestion(
    prompt: "Flutter'da 'BuildContext' parametresi temel olarak neyi belirtir?",
    triggerWord: "BuildContext Rolü",
    correctAnswer: "Widget'ın widget ağacındaki ve element hiyerarşisindeki tam konumunu.",
    wrongOptions: [
      "Telefonun batarya ve CPU seviyesini.",
      "Uygulamanın internet bağlantı durumunu.",
      "Cihazın ekran parlaklığını."
    ],
    memoryCode: "BuildContext = Widget'ın soy ağacındaki konumu! Theme.of(context) ve Navigator bu konumla çalışır.",
    category: "Flutter & Dart",
  ),
  const DevReflexQuestion(
    prompt: "Riverpod'da buton tıklaması (onPressed) gibi olay dinleyicilerinde provider okumak için hangisi kullanılır?",
    triggerWord: "Riverpod: ref.read",
    correctAnswer: "ref.read(provider.notifier) (ref.watch buton içine ASLA yazılmaz!)",
    wrongOptions: [
      "ref.watch(provider)",
      "ref.refresh(provider)",
      "setState()"
    ],
    memoryCode: "ref.watch sadece build() metodunda ekranı tazelemek içindir; butonlarda her zaman ref.read!",
    category: "Flutter & Dart",
    codeSnippet: "onPressed: () => ref.read(counterProvider.notifier).increment();",
  ),
  const DevReflexQuestion(
    prompt: "Büyük veri listelerinde neden ListView yerine ListView.builder kullanılmalıdır?",
    triggerWord: "ListView.builder",
    correctAnswer: "Sadece ekranda görünen öğeleri oluşturur (Tembel Yükleme - Lazy Evaluation).",
    wrongOptions: [
      "Tüm listeyi belleğe tek seferde basar.",
      "İnternet bağlantısını zorunlu kılar.",
      "Sadece 5 öğe gösterebilir."
    ],
    memoryCode: "Binlerce öğeli listelerde bellek patlamasını önleyen yegane yöntem ListView.builder'dır!",
    category: "Flutter & Dart",
  ),

  // Algoritmalar & Veri Yapıları
  const DevReflexQuestion(
    prompt: "Hash Map / Dictionary veri yapısında ortalama arama, ekleme ve silme zaman karmaşıklığı nedir?",
    triggerWord: "Big-O: Hash Table",
    correctAnswer: "O(1) - Sabit Zaman",
    wrongOptions: ["O(log N)", "O(N)", "O(N²)"],
    memoryCode: "Hash çakışması (collision) olmadığı sürece arama O(1)'dir!",
    category: "Algoritmalar",
  ),
  const DevReflexQuestion(
    prompt: "Binary Search (İkili Arama) algoritmasının çalışabilmesi için dizinin ön şartı nedir?",
    triggerWord: "İkili Arama Şartı",
    correctAnswer: "Dizinin Sıralı (Sorted) Olması Şarttır",
    wrongOptions: [
      "Elemanların tek sayı olması",
      "Dizinin linked list olması",
      "Bellekte ardışık olmaması"
    ],
    memoryCode: "Binary Search sıralı dizide her adımda arama uzayını yarıya böler: O(log N)!",
    category: "Algoritmalar",
  ),

  // Web & API
  const DevReflexQuestion(
    prompt: "HTTP 401 Unauthorized ile HTTP 403 Forbidden arasındaki kritik fark nedir?",
    triggerWord: "HTTP 401 vs 403",
    correctAnswer: "401: Kimlik doğrulanmadı (Kimsin?). 403: Kimlik belli ama yetkin yok (Giremezsin!).",
    wrongOptions: [
      "401 sunucu hatasıdır, 403 istemci hatasıdır.",
      "401 veritabanı hatasıdır, 403 ağ hatasıdır.",
      "İkisi de tamamen aynıdır, RFC standartlarında eşanlamlıdır."
    ],
    memoryCode: "401 = Authentication (Kimlik), 403 = Authorization (Yetki)!",
    category: "Web & API",
  ),
  const DevReflexQuestion(
    prompt: "HTTP GET ve POST isteklerinden hangisi 'Idempotent' (Tekrarlanabilir) kabul edilir?",
    triggerWord: "API Idempotency",
    correctAnswer: "GET, PUT ve DELETE Idempotenttir; POST Idempotent Değildir.",
    wrongOptions: [
      "Sadece POST Idempotenttir.",
      "Tüm HTTP metodları Idempotenttir.",
      "Hiçbir HTTP metodu Idempotent olamaz."
    ],
    memoryCode: "GET/PUT/DELETE arka arkaya 100 kez çağrılsa da sunucu durumu aynı kalır; POST her çağrıda yeni kayıt açabilir!",
    category: "Web & API",
  ),
  const DevReflexQuestion(
    prompt: "REST mimarisinde var olan bir kaynağın sadece belirli alanlarını kısmi güncellemek için hangi HTTP metodu kullanılır?",
    triggerWord: "PUT vs PATCH",
    correctAnswer: "PATCH (Kısmi Güncelleme - PUT ise Tam Değiştirme)",
    wrongOptions: [
      "PUT (Kısmi Güncelleme)",
      "POST",
      "UPDATE"
    ],
    memoryCode: "PUT tüm nesneyi sıfırdan değiştirir; PATCH sadece değişen alanları günceller!",
    category: "Web & API",
  ),

  // Git & DevOps
  const DevReflexQuestion(
    prompt: "Git'te yanlışlıkla 'git reset --hard' yapıldığında silinen commitler nereden kurtarılır?",
    triggerWord: "Git Kurtarma: Reflog",
    correctAnswer: "git reflog",
    wrongOptions: [
      "git revert --undo",
      "git stash pop",
      "git branch --restore"
    ],
    memoryCode: "Reflog HEAD'in gezindiği tüm commitlerin kara kutusudur. 'git reflog' hayat kurtarır!",
    category: "Git & DevOps",
  ),
  const DevReflexQuestion(
    prompt: "Git Staging Area'daki değişiklikleri koruyarak son commit mesajını düzeltmek için hangi bayrak kullanılır?",
    triggerWord: "git commit --amend",
    correctAnswer: "git commit --amend",
    wrongOptions: [
      "git commit --update",
      "git commit --fix",
      "git commit --force"
    ],
    memoryCode: "--amend en son commiti günceller, yeni hash üretir ve geçmişi temiz tutar!",
    category: "Git & DevOps",
  ),

  // Sistem & Bellek
  const DevReflexQuestion(
    prompt: "Linux'ta 'chmod 755 script.sh' komutu hangi izinleri tanımlar?",
    triggerWord: "Linux: chmod 755",
    correctAnswer: "Sahibi: rwx (Tam Yetki), Grubu & Diğerleri: r-x (Okuma & Çalıştırma)",
    wrongOptions: [
      "Herkes için rwx (Tam Yetki)",
      "Sadece root için okuma izni",
      "Sahibi: rw-, Grubu: ---, Diğerleri: ---"
    ],
    memoryCode: "r=4, w=2, x=1 => 7 (4+2+1), 5 (4+1), 5 (4+1)!",
    category: "Sistem & Bellek",
  ),
  const DevReflexQuestion(
    prompt: "Linux'ta bir süreci (process) CPU seviyesinde anında ve zorla öldürmek için hangi sinyal verilir?",
    triggerWord: "SIGKILL Sinyali",
    correctAnswer: "kill -9 (SIGKILL)",
    wrongOptions: [
      "kill -15 (SIGTERM)",
      "kill -1 (SIGHUP)",
      "kill -0"
    ],
    memoryCode: "SIGTERM (15) nazik kapanma ister; SIGKILL (9) anında işletim sistemi tarafından sonlandırılır!",
    category: "Sistem & Bellek",
  ),
  const DevReflexQuestion(
    prompt: "C dilinde dinamik ayrılan bellek (malloc) serbest bırakılmazsa (free) ne oluşur?",
    triggerWord: "C: Bellek Sızıntısı",
    correctAnswer: "Bellek Sızıntısı (Memory Leak)",
    wrongOptions: [
      "Stack Overflow",
      "Segmentation Fault",
      "Derleme Hatası"
    ],
    memoryCode: "C'de çöp toplayıcı yoktur; her malloc() mutlaka bir free() ile kapatılmalıdır!",
    category: "Sistem & Bellek",
  ),
  const DevReflexQuestion(
    prompt: "64-bit modern bir işlemci mimarisinde herhangi bir pointer (gösterici) kaç bayttır?",
    triggerWord: "Pointer Boyutu",
    correctAnswer: "8 Bayt (64 Bit)",
    wrongOptions: [
      "4 Bayt",
      "İşaret ettiği veri tipinin boyutu kadardır",
      "16 Bayt"
    ],
    memoryCode: "İster char* ister double* olsun, pointer bir bellek adresi tutar ve 64-bit mimaride 8 bayttır!",
    category: "Sistem & Bellek",
  ),
  const DevReflexQuestion(
    prompt: "C#'ta 'struct' ile 'class' arasındaki temel bellek farkı nedir?",
    triggerWord: "C#: struct vs class",
    correctAnswer: "struct Değer Tipidir (Value Type - Stack), class Referans Tipidir (Heap).",
    wrongOptions: [
      "struct Heap'tedir, class Stack'tedir.",
      "İkisi de tamamen aynı bellek modelini kullanır.",
      "struct sadece static üyeler barındırabilir."
    ],
    memoryCode: "Value type değişkenleri doğrudan veriyi tutar; Reference type bir bellek referansı taşır!",
    category: "Sistem & Bellek",
  ),
  const DevReflexQuestion(
    prompt: "Godot 4'te karakter hareketi ve fizik hesaplamaları hangi fonksiyonda yürütülmelidir?",
    triggerWord: "Godot: _physics_process",
    correctAnswer: "_physics_process(delta): Sabit zaman aralıklı ve FPS'ten bağımsızdır.",
    wrongOptions: [
      "_process(delta): En yüksek kare hızıyla çalıştığı için",
      "_input(event)",
      "_ready()"
    ],
    memoryCode: "Fizik ve çarpışmalar _physics_process()'te; görsel animasyonlar _process()'te yazılır!",
    category: "Sistem & Bellek",
  ),

  // Veritabanı
  const DevReflexQuestion(
    prompt: "SQL'de aggregate (COUNT, SUM, AVG) sonuçlarına filtre uygulamak için hangisi kullanılır?",
    triggerWord: "SQL: HAVING",
    correctAnswer: "HAVING",
    wrongOptions: [
      "WHERE",
      "ORDER BY",
      "DISTINCT"
    ],
    memoryCode: "WHERE satırları gruplama öncesinde eler; HAVING ise GROUP BY sonrasını eler!",
    category: "Veritabanı",
  ),
  const DevReflexQuestion(
    prompt: "SQL'de B-Tree Index kullanırken aşağıdaki sorgulardan hangisi indeksi geçersiz kılar (Index Scan yapar)?",
    triggerWord: "Index Sakatlama",
    correctAnswer: "WHERE UPPER(email) = 'TEST@TEST.COM' (Sütuna Fonksiyon Uygulama)",
    wrongOptions: [
      "WHERE email = 'test@test.com'",
      "WHERE id = 42",
      "WHERE created_at > '2026-01-01'"
    ],
    memoryCode: "Sütun fonksiyon içine alınırsa veritabanı her satırı hesaplamak zorunda kalır ve index arama yapamaz!",
    category: "Veritabanı",
  ),

  // Diller: Python, JS, Kotlin
  const DevReflexQuestion(
    prompt: "Python'da fonksiyon varsayılan parametresi 'def f(x=[])' yapıldığında ne gerçekleşir?",
    triggerWord: "Python Mutable Default",
    correctAnswer: "Tüm fonksiyon çağrıları bellekteki aynı liste nesnesini paylaşır (Tuzak!).",
    wrongOptions: [
      "Her çağrıda yeni boş liste açılır.",
      "SyntaxError fırlatılır.",
      "Fonksiyon sadece bir kez çalışabilir."
    ],
    memoryCode: "Varsayılan argümanlar tanım anında bir kez üretilir! 'x=None' kullanıp içeride 'x=[]' yap!",
    category: "Python & JS",
  ),
  const DevReflexQuestion(
    prompt: "Python'da 'a = [1, 2]' ve 'b = [1, 2]' iken 'a == b' ve 'a is b' sonuçları nedir?",
    triggerWord: "Python: '==' vs 'is'",
    correctAnswer: "a == b -> True (Değer Eşitliği) / a is b -> False (Farklı Bellek Adresi)",
    wrongOptions: [
      "İkisi de True",
      "İkisi de False",
      "a == b -> False / a is b -> True"
    ],
    memoryCode: "'==' değerlerin içeriğini, 'is' nesnelerin bellekteki adres kimliğini (id) kontrol eder!",
    category: "Python & JS",
  ),
  const DevReflexQuestion(
    prompt: "Kotlin'de 'val' ile 'var' anahtar sözcükleri arasındaki fark nedir?",
    triggerWord: "Kotlin: val vs var",
    correctAnswer: "val Salt Okunurdur (Immutable/Tek Atama), var Değiştirilebilir (Mutable).",
    wrongOptions: [
      "val public, var private değişkendir.",
      "val primitive tipler içindir, var nesneler içindir.",
      "val thread-safe değildir, var thread-safe'tir."
    ],
    memoryCode: "val = Value (sabit referans, Java final gibi); var = Variable (değişken)!",
    category: "Python & JS",
  ),
];

enum ReflexStage {
  learnRule, // 1. Aşama: Şifreyi öğren ("Şu kelimeyi görünce bunu yapıştıracaksın")
  challenge, // 2. Aşama: 7 saniyelik refleks testi
}

class DevReflexScreen extends ConsumerStatefulWidget {
  const DevReflexScreen({super.key});

  @override
  ConsumerState<DevReflexScreen> createState() => _DevReflexScreenState();
}

class _DevReflexScreenState extends ConsumerState<DevReflexScreen> {
  int _score = 0;
  int _combo = 0;
  int _currentIndex = 0;
  int _timeLeft = 7;
  Timer? _timer;
  bool _isAnswered = false;
  int? _selectedOptionIndex;
  String _selectedCategory = 'Tümü';
  ReflexStage _stage = ReflexStage.learnRule;

  late List<DevReflexQuestion> _filteredQuestions;
  late List<String> _currentShuffledOptions;

  final List<String> _categories = [
    'Tümü',
    'Flutter & Dart',
    'Algoritmalar',
    'Web & API',
    'Git & DevOps',
    'Sistem & Bellek',
    'Veritabanı',
    'Python & JS',
  ];

  @override
  void initState() {
    super.initState();
    _applyFilter();
  }

  void _applyFilter() {
    if (_selectedCategory == 'Tümü') {
      _filteredQuestions = List.from(devReflexBank)..shuffle();
    } else {
      _filteredQuestions = devReflexBank
          .where((q) => q.category == _selectedCategory)
          .toList()
        ..shuffle();
    }
    _currentIndex = 0;
    _prepareQuestion();
  }

  void _prepareQuestion() {
    if (_filteredQuestions.isEmpty) return;
    if (_currentIndex >= _filteredQuestions.length) {
      _filteredQuestions.shuffle();
      _currentIndex = 0;
    }

    final q = _filteredQuestions[_currentIndex];
    final allOps = [q.correctAnswer, ...q.wrongOptions];
    allOps.shuffle();
    _currentShuffledOptions = allOps;
    _isAnswered = false;
    _selectedOptionIndex = null;
    _timeLeft = 7;
    _timer?.cancel();

    // Kullanıcının önce kuralı okuması için learnRule aşamasıyla başla
    setState(() {
      _stage = ReflexStage.learnRule;
    });
  }

  void _startChallenge() {
    _timer?.cancel();
    _timeLeft = 7;
    _isAnswered = false;
    _selectedOptionIndex = null;

    setState(() {
      _stage = ReflexStage.challenge;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_timeLeft > 1) {
          _timeLeft--;
        } else {
          _onTimeOut();
        }
      });
    });
  }

  void _onTimeOut() {
    _timer?.cancel();
    _isAnswered = true;
    _combo = 0;
    HapticFeedback.heavyImpact();
    SystemSound.play(SystemSoundType.alert);
    setState(() {});
    _scheduleNext();
  }

  void _onOptionSelected(int index) {
    if (_isAnswered) return;
    _timer?.cancel();
    _isAnswered = true;
    _selectedOptionIndex = index;

    final q = _filteredQuestions[_currentIndex];
    final isCorrect = (_currentShuffledOptions[index] == q.correctAnswer);

    if (isCorrect) {
      _combo++;
      final addedScore = 100 + (_combo * 25) + (_timeLeft * 10);
      _score += addedScore;
      HapticFeedback.mediumImpact();
      SystemSound.play(SystemSoundType.click);
      ref.read(userProfileProvider.notifier).addXp(15);
    } else {
      _combo = 0;
      HapticFeedback.heavyImpact();
      SystemSound.play(SystemSoundType.alert);
    }

    setState(() {});
    _scheduleNext();
  }

  void _scheduleNext() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!mounted) return;
      setState(() {
        _currentIndex++;
        _prepareQuestion();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_filteredQuestions.isEmpty) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B1120),
        body: Center(child: Text("Soru bulunamadı", style: TextStyle(color: Colors.white))),
      );
    }

    final q = _filteredQuestions[_currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF10B981)),
              ),
              child: Row(
                children: [
                  const Text('⚡ ', style: TextStyle(fontSize: 16)),
                  Text(
                    'Puan: $_score',
                    style: const TextStyle(
                      color: Color(0xFF34D399),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (_combo > 1)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber),
                ),
                child: Text(
                  '${_combo}x Seri! 🔥',
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              // Kategori Filtreleme Barı
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, idx) {
                    final cat = _categories[idx];
                    final isSel = (_selectedCategory == cat);
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: FilterChip(
                        label: Text(cat),
                        selected: isSel,
                        backgroundColor: const Color(0xFF1E293B),
                        selectedColor: const Color(0xFF0284C7),
                        labelStyle: TextStyle(
                          color: isSel ? Colors.white : Colors.white70,
                          fontSize: 11.5,
                          fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        onSelected: (val) {
                          setState(() {
                            _selectedCategory = cat;
                            _applyFilter();
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Aşama Kontrolü: 1) Kuralı Öğren veya 2) Süreli Refleks Testi
              Expanded(
                child: _stage == ReflexStage.learnRule
                    ? _buildLearnRuleView(q)
                    : _buildChallengeView(q),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Aşama 1: "Şu Kelimeyi Görünce Bunu Yapıştıracaksın" Kural Ekranı
  Widget _buildLearnRuleView(DevReflexQuestion q) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lightbulb, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'GÖRÜNCE YAPIŞTIR! ÖNCE KURALI ÖĞREN 🧠',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Ana Öğrenme Kartı
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF38BDF8).withValues(alpha: 0.4), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Anahtar Kelime
                const Row(
                  children: [
                    Icon(Icons.vpn_key_rounded, color: Color(0xFF38BDF8), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'ŞU KELİMEYİ / DURUMU GÖRÜNCE:',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF38BDF8)),
                  ),
                  child: Text(
                    '⚡ ${q.triggerWord}',
                    style: const TextStyle(
                      color: Color(0xFF38BDF8),
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 2. Yapıştırılacak Cevap
                const Row(
                  children: [
                    Icon(Icons.bolt_rounded, color: Color(0xFF10B981), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'DİREKT BUNU YAPIŞTIRACAKSIN:',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF10B981), width: 1.5),
                  ),
                  child: Text(
                    q.correctAnswer,
                    style: const TextStyle(
                      color: Color(0xFF34D399),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Akılda Tutucu Şifre / Neden?
                const Row(
                  children: [
                    Icon(Icons.psychology_rounded, color: Color(0xFFF59E0B), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'AKILDA TUTMA ŞİFRESİ (NEDEN?):',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    q.memoryCode,
                    style: const TextStyle(
                      color: Color(0xFFE2E8F0),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),

                if (q.codeSnippet != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B1120),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Text(
                      q.codeSnippet!,
                      style: const TextStyle(
                        color: Color(0xFF38BDF8),
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Aksiyon Butonu
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF59E0B),
                foregroundColor: Colors.black,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              onPressed: _startChallenge,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bolt, color: Colors.black, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'ŞİFREYİ KAPTIM, ŞİMDİ YAPIŞTIR! ⚡',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Aşama 2: 7 Saniyelik Süreye Karşı Hızlı Refleks Testi
  Widget _buildChallengeView(DevReflexQuestion q) {
    return Column(
      children: [
        // Geri sayım barı (7 saniye)
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: _timeLeft / 7.0,
            minHeight: 8,
            backgroundColor: Colors.white10,
            valueColor: AlwaysStoppedAnimation<Color>(
              _timeLeft <= 2 ? Colors.redAccent : const Color(0xFF38BDF8),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Başlık ve Tetikleyici Rozeti
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white12),
              ),
              child: Text(
                'Süre: ${_timeLeft}s ⏱️',
                style: TextStyle(
                  color: _timeLeft <= 2 ? Colors.redAccent : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF38BDF8)),
              ),
              child: Text(
                '⚡ ${q.triggerWord}',
                style: const TextStyle(
                  color: Color(0xFF38BDF8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Soru Metni Kartı
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1.5),
          ),
          child: Column(
            children: [
              Text(
                q.prompt,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                ),
              ),
              if (q.codeSnippet != null) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Text(
                    q.codeSnippet!,
                    style: const TextStyle(
                      color: Color(0xFF38BDF8),
                      fontFamily: 'monospace',
                      fontSize: 11.5,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const Spacer(),

        // Şıklar (Yapıştırılacak seçenekler)
        ...List.generate(_currentShuffledOptions.length, (idx) {
          final optionText = _currentShuffledOptions[idx];
          final isCorrectOption = (optionText == q.correctAnswer);
          final isSelected = (_selectedOptionIndex == idx);

          Color btnBg = const Color(0xFF1E293B);
          Color borderC = Colors.white.withValues(alpha: 0.1);
          Color textC = Colors.white;

          if (_isAnswered) {
            if (isCorrectOption) {
              btnBg = const Color(0xFF059669).withValues(alpha: 0.35);
              borderC = const Color(0xFF10B981);
              textC = const Color(0xFF34D399);
            } else if (isSelected) {
              btnBg = Colors.redAccent.withValues(alpha: 0.35);
              borderC = Colors.redAccent;
              textC = Colors.redAccent;
            }
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: InkWell(
              onTap: _isAnswered ? null : () => _onOptionSelected(idx),
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: btnBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderC, width: 2),
                ),
                child: Text(
                  optionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textC,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 12),
      ],
    );
  }
}
