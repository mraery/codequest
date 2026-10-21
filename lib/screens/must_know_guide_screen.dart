import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dev_reflex_screen.dart';

class MustKnowRule {
  final String title;
  final String category;
  final String rule;
  final String? codeSnippet;
  final String examTip;
  final String iconEmoji;

  const MustKnowRule({
    required this.title,
    required this.category,
    required this.rule,
    this.codeSnippet,
    required this.examTip,
    required this.iconEmoji,
  });
}

final List<MustKnowRule> mustKnowRulesList = [
  // 1. Big-O & Algoritmalar
  const MustKnowRule(
    title: "Big-O Zaman & Bellek Hiyerarşisi",
    category: "Algoritmalar",
    iconEmoji: "⚡",
    rule: "Zaman karmaşıklığı sırası:\nO(1) < O(log N) < O(N) < O(N log N) < O(N²) < O(2^N) < O(N!).\n\nHash Table: Arama O(1), en kötü O(N)\nBinary Search: Sıralı dizide O(log N)\nMerge Sort / QuickSort (Ort): O(N log N)",
    codeSnippet: "// İki İşaretçi (Two Pointers) Örneği: O(N)\nint left = 0, right = arr.length - 1;\nwhile (left < right) {\n    int sum = arr[left] + arr[right];\n    if (sum == target) return true;\n    if (sum < target) left++; else right--;\n}",
    examTip: "Mülakatlarda O(N²) iç içe döngü çözümü sunduktan sonra mutlaka Hash Table veya Two Pointers ile O(N)'e indirme optimizasyonunu açıkla!",
  ),
  const MustKnowRule(
    title: "İkili Arama (Binary Search) Ön Koşulu",
    category: "Algoritmalar",
    iconEmoji: "🎯",
    rule: "Binary Search algoritmasının çalışması için veri yapısının MUTLAKA sıralı (sorted) olması ve rastgele erişim (random access O(1)) sunması (örn: Array) gerekir. Bağlı listede (Linked List) pointer atlaması yapılamayacağı için verimsizdir.",
    codeSnippet: "int binarySearch(int[] arr, int target) {\n    int low = 0, high = arr.length - 1;\n    while (low <= high) {\n        int mid = low + (high - low) / 2; // Taşmayı önle!\n        if (arr[mid] == target) return mid;\n        if (arr[mid] < target) low = mid + 1; else high = mid - 1;\n    }\n    return -1;\n}",
    examTip: "'(low + high) / 2' yerine 'low + (high - low) / 2' yazmak integer overflow taşmasını önler; mülakatçılar buna bayılır!",
  ),

  // 2. HTTP & Web API
  const MustKnowRule(
    title: "HTTP Durum Kodları (Status Codes)",
    category: "Web & API",
    iconEmoji: "🌐",
    rule: "• 200 OK: Başarılı istek\n• 201 Created: Yeni kaynak başarıyla oluşturuldu (POST)\n• 204 No Content: Başarılı ama dönecek gövde yok (DELETE)\n• 301 Moved Permanently: Kalıcı yönlendirme (SEO için kritik)\n• 400 Bad Request: Geçersiz istemci verisi (Validasyon hatası)\n• 401 Unauthorized: Kimlik doğrulanmadı (Token eksik/geçersiz)\n• 403 Forbidden: Kimlik doğrulandı ancak yetki yetersiz\n• 404 Not Found: Kaynak bulunamadı\n• 500 Internal Server Error: Beklenmedik sunucu çökmesi\n• 502 Bad Gateway: Proxy/Gateway sunucu arkadaki servisten yanıt alamadı",
    codeSnippet: "// REST Yanıt Standardı\nHTTP/1.1 201 Created\nLocation: /api/v1/users/42\nContent-Type: application/json",
    examTip: "401 = 'Sen kimsin?', 403 = 'Kim olduğunu biliyorum ama buraya giremezsin!' farkını unutma.",
  ),
  const MustKnowRule(
    title: "REST Metodları & Idempotency",
    category: "Web & API",
    iconEmoji: "🔄",
    rule: "Idempotent Metot: Aynı isteği 1 kez ya da 100 kez gönderseniz de sunucunun nihai durumu aynı kalır.\n\n• GET: Güvenli (Safe) & Idempotent\n• PUT: Idempotent (Tüm nesneyi değiştirir)\n• DELETE: Idempotent (Kaynak silindikten sonra durum sabittir)\n• PATCH: Genelde Idempotent kabul edilmez (kısmi işlem)\n• POST: Kesinlikle Idempotent DEĞİLDİR (her çağrıda yeni kayıt açabilir)",
    codeSnippet: "PUT /users/42 -> {\"name\": \"Ali\", \"age\": 30} // Tam güncelleme\nPATCH /users/42 -> {\"age\": 31} // Kısmi güncelleme",
    examTip: "Ağ kopmasında güvenle tekrar denenebilecek (retry) istekler sadece idempotent olanlardır.",
  ),

  // 3. Git Kurtarma & Çakışma
  const MustKnowRule(
    title: "Git Reflog: Hayat Kurtaran Kara Kutu",
    category: "Git & DevOps",
    iconEmoji: "🌿",
    rule: "'git reset --hard' ile sildiğinizi sandığınız commitler aslında Git veritabanında asılı (dangling) kalır. 'git reflog' komutu HEAD referansının son günlerdeki tüm adımlarını gösterir.",
    codeSnippet: "# Yanlışlıkla reset atıldıysa:\ngit reflog\n# Çıktıdan commit hash'ini bul:\n# e4a12f3 HEAD@{1}: commit: kritik kodlar\ngit reset --hard e4a12f3",
    examTip: "Git'te remote'a 'force push' yapmadığınız sürece lokalde hiçbir şey gerçekten kaybolmaz!",
  ),
  const MustKnowRule(
    title: "Git Rebase vs Git Merge Felsefesi",
    category: "Git & DevOps",
    iconEmoji: "🔀",
    rule: "• Merge: Gerçek geçmişi ve zaman sırasını korur. Ekstra bir 'Merge commit' üretir.\n• Rebase: Kendi commiterini hedef dalın ucuna yeniden uygular. Doğrusal (lineer), tertemiz bir git log sağlar.\n\nAltın Kural: Başkalarıyla paylaşılan genel (main/dev) branch'lerde ASLA rebase yapma!",
    codeSnippet: "git checkout feature\ngit fetch origin\ngit rebase origin/main\n# Çakışmaları çöz, sonra:\ngit rebase --continue",
    examTip: "Ekip çalışmasında 'Feature branch'i rebase yapıp main'e temiz PR açmak en iyi pratiktir.",
  ),

  // 4. Linux & Terminal
  const MustKnowRule(
    title: "Linux Sayısal İzinler (Chmod Mantığı)",
    category: "Linux & Sistem",
    iconEmoji: "🐧",
    rule: "Bit Ağırlıkları:\nOkuma (r) = 4\nYazma (w) = 2\nÇalıştırma (x) = 1\n\nÜçlü Basamak Sırası: [Sahibi] [Grubu] [Diğerleri]\n• 755: Sahibi tam yetkili (7=4+2+1), Grup & Diğerleri okur/çalıştırır (5=4+1)\n• 644: Sahibi okur/yazar (6=4+2), diğerleri sadece okur (4)\n• 600: Sadece sahibi okur ve yazar (SSH anahtarları için zorunlu)",
    codeSnippet: "chmod 600 ~/.ssh/id_rsa # Gizli anahtar güvenliği\nchmod 755 deploy.sh      # Script çalıştırma",
    examTip: "SSH anahtar izni 600 yapılmazsa 'Permissions are too open' uyarısıyla bağlantı reddedilir!",
  ),
  const MustKnowRule(
    title: "Linux Süreç Yönetimi: SIGTERM vs SIGKILL",
    category: "Linux & Sistem",
    iconEmoji: "⚙️",
    rule: "• SIGTERM (15): Nazik sonlandırma isteğidir. Uygulama veritabanı bağlantılarını kapatabilir, geçici dosyaları silebilir ve düzgünce kapanır.\n• SIGKILL (9): Doğrudan Linux çekirdeği tarafından sürece müdahale edilip bellekten silinir. Uygulama bu sinyali yakalayamaz (catch edemez).",
    codeSnippet: "kill -15 <PID> # Önce nazikçe dene\nkill -9 <PID>  # Yanıt vermiyorsa zorla öldür",
    examTip: "Production'da her zaman önce SIGTERM gönderilmeli, 10-15 saniye içinde kapanmazsa SIGKILL atılmalıdır.",
  ),

  // 5. Veritabanı & SQL
  const MustKnowRule(
    title: "SQL İndeks Performansı & Tuzaklar",
    category: "Veritabanı",
    iconEmoji: "🗄️",
    rule: "B-Tree İndeksi Neler Bozar?\n1. Fonksiyon Kullanımı: 'WHERE YEAR(tarih) = 2026' -> İndeks iptal!\n2. Başta Wildcard: 'WHERE isim LIKE '%can'' -> Full Table Scan!\n3. Implicit Type Conversion: VARCHAR sütunu INTEGER ile aramak.\n\nDoğru Yaklaşım: Sütunu çıplak bırak, fonksiyonu karşı değere uygula!",
    codeSnippet: "-- YANLIŞ:\nWHERE YEAR(tarih) = 2026\n-- DOĞRU (Index Seek):\nWHERE tarih >= '2026-01-01' AND tarih < '2027-01-01'",
    examTip: "Mülakatlarda 'Sorgum yavaş çalışıyor, ne yaparsın?' dendiğinde ilk cevap: 'EXPLAIN / EXPLAIN ANALYZE çıktısına bakıp Index Scan mi Seek mi olduğuna bakarım'.",
  ),
  const MustKnowRule(
    title: "ACID Prensipleri & Veri Bütünlüğü",
    category: "Veritabanı",
    iconEmoji: "🔒",
    rule: "• Atomicity: İşlem ya tamamen gerçekleşir ya da hiç gerçekleşmez (All or nothing).\n• Consistency: Veritabanı kurallarına (Foreign key, check constraints) her an uyar.\n• Isolation: Eşzamanlı işlemler birbirinin ara sonuçlarını görmez.\n• Durability: Commit edilen veri elektrik kesilse bile diske kalıcı yazılmıştır.",
    codeSnippet: "BEGIN TRANSACTION;\nUPDATE hesap SET bakiye = bakiye - 100 WHERE id = 1;\nUPDATE hesap SET bakiye = bakiye + 100 WHERE id = 2;\nCOMMIT;",
    examTip: "Banka para transferi örneği Atomicity ve Isolation için standart mülakat sorusudur.",
  ),

  // 6. Bellek & Pointer
  const MustKnowRule(
    title: "Stack vs Heap Bellek Mimarisi",
    category: "Sistem & Bellek",
    iconEmoji: "🧠",
    rule: "• Stack: LIFO mantığıyla çalışır. Fonksiyon lokal değişkenlerini tutar. Çok hızlıdır, bellek derleme anında sabittir. Otomatik temizlenir. Boyutu sınırlıdır (Stack Overflow riski).\n• Heap: Dinamik bellek tahsisidir ('malloc', 'new'). Boyutu RAM kadardır. Daha yavaştır. Manuel (C/C++) veya Garbage Collector (Java, C#, Go) ile temizlenir.",
    codeSnippet: "void ornek() {\n    int a = 10; // Stack üzerinde\n    int *p = (int*)malloc(sizeof(int)); // Pointer stack'te, gösterdiği alan Heap'te!\n    free(p);\n}",
    examTip: "Pointer'ın kendisi Stack'te 8 baytlık bir değişkendir, ama işaret ettiği bellek Heap'tedir!",
  ),
  const MustKnowRule(
    title: "Garbage Collector Nasıl Çalışır?",
    category: "Sistem & Bellek",
    iconEmoji: "♻️",
    rule: "Modern GC sistemleri (Java, .NET, Go) 'Tracing Garbage Collection' (Mark and Sweep) kullanır.\n1. Mark: Root nesnelerden (Stack referansları, statik değişkenler) başlayıp erişilebilen tüm nesneleri işaretler.\n2. Sweep: İşaretlenmeyen nesneleri bellekten temizler.\n3. Compact: Parçalanmayı (fragmentation) önlemek için belleği sıkıştırır.",
    codeSnippet: "// C# Generation Modeli: Gen 0 (yeni), Gen 1 (kısa ömürlü), Gen 2 (uzun ömürlü)",
    examTip: "Nesne referansını null yapmak onu anında silmez; sadece ilk GC taramasında toplanabilir hale getirir.",
  ),
];

class MustKnowGuideScreen extends StatefulWidget {
  const MustKnowGuideScreen({super.key});

  @override
  State<MustKnowGuideScreen> createState() => _MustKnowGuideScreenState();
}

class _MustKnowGuideScreenState extends State<MustKnowGuideScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Tümü';

  final List<String> _categories = [
    'Tümü',
    'Algoritmalar',
    'Web & API',
    'Git & DevOps',
    'Linux & Sistem',
    'Veritabanı',
    'Sistem & Bellek',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = mustKnowRulesList.where((rule) {
      final matchesCategory = (_selectedCategory == 'Tümü' || rule.category == _selectedCategory);
      final matchesQuery = _searchQuery.isEmpty ||
          rule.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          rule.rule.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          rule.examTip.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kesin Bilmen Gerekenler 📖',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Yazılım Mülakat & Mimari Canavarı',
              style: TextStyle(fontSize: 11, color: Color(0xFF38BDF8)),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Hızlı Refleks Oyna',
            icon: const Icon(Icons.bolt, color: Color(0xFFF59E0B)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DevReflexScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Arama & Hızlı Refleks Butonu
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFF0F172A),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: const TextStyle(color: Colors.white, fontSize: 13.5),
                  decoration: InputDecoration(
                    hintText: 'Kural, kod veya mülakat sorusu ara...',
                    hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF38BDF8), size: 20),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Kategori Filtreleri
                SizedBox(
                  height: 34,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, idx) {
                      final cat = _categories[idx];
                      final isSel = (_selectedCategory == cat);
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSel,
                          backgroundColor: const Color(0xFF1E293B),
                          selectedColor: const Color(0xFF0284C7),
                          labelStyle: TextStyle(
                            color: isSel ? Colors.white : const Color(0xFF94A3B8),
                            fontSize: 11.5,
                            fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                          ),
                          onSelected: (_) => setState(() => _selectedCategory = cat),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Liste Görünümü
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];
                return _buildRuleCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleCard(BuildContext context, MustKnowRule item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(item.iconEmoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF38BDF8).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(
                      color: Color(0xFF38BDF8),
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              item.rule,
              style: const TextStyle(
                color: Color(0xFFE2E8F0),
                fontSize: 13.5,
                height: 1.45,
              ),
            ),
            if (item.codeSnippet != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Kod / Terminal Örneği",
                          style: TextStyle(color: Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: item.codeSnippet!));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Kopyalandı! 📋'),
                                duration: Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          child: const Icon(Icons.copy, color: Color(0xFF38BDF8), size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.codeSnippet!,
                      style: const TextStyle(
                        color: Color(0xFF38BDF8),
                        fontFamily: 'monospace',
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('💡 ', style: TextStyle(fontSize: 14)),
                  Expanded(
                    child: Text(
                      item.examTip,
                      style: const TextStyle(
                        color: Color(0xFFFDE68A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
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
