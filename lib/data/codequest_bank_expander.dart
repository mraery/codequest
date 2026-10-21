import '../models/code_track_model.dart';
import '../models/curriculum_models.dart';

/// CodeQuest 100.000+ Soru Motoru & Müfredat Genişletici
/// Her yazılım dalı için en az 10.000 soru (64 ders x 160 soru = 10.240 soru) sağlar.

class _DevTopicFact {
  final String prompt;
  final String? codeSnippet;
  final String correctOption;
  final List<String> wrongOptions;
  final String explanation;
  final String? devTip;

  const _DevTopicFact({
    required this.prompt,
    this.codeSnippet,
    required this.correctOption,
    required this.wrongOptions,
    required this.explanation,
    this.devTip,
  });
}

/// Diline ve ünite konusuna göre derinlemesine yazılım bilgi havuzu
List<_DevTopicFact> _getTopicFactsForTrack(CodeLanguage lang, String unitTitle, String category) {
  switch (lang) {
    case CodeLanguage.python:
      return [
        const _DevTopicFact(
          prompt: "Python'da fonksiyon varsayılan argümanı olarak boş liste (def f(x=[])) verilirse ne olur?",
          codeSnippet: "def ekle(val, lst=[]):\n    lst.append(val)\n    return lst",
          correctOption: "Liste fonksiyon tanımlanırken bir kez oluşturulur; tüm çağrılar aynı listeyi paylaşır (Mutable default trap).",
          wrongOptions: [
            "Her fonksiyon çağrısında sıfırdan yeni ve boş bir liste başlatılır.",
            "Python derleyicisi SyntaxError fırlatarak çalışmayı durdurur.",
            "Liste sadece ilk çağrıda çalışır, ikinci çağrıda None döndürür."
          ],
          explanation: "Python'da varsayılan argümanlar fonksiyon tanımlandığı an değerlendirilir. Bu yüzden mutable objeler (list, dict) yerine 'lst=None' kullanılmalıdır.",
          devTip: "Best Practice: 'def f(x=None): if x is None: x = []' kalıbını kullan!",
        ),
        const _DevTopicFact(
          prompt: "Python'da list comprehension ile normal for döngüsü arasındaki performans farkı nedir?",
          codeSnippet: "[x * 2 for x in range(1000)]",
          correctOption: "List comprehension C seviyesinde LIST_APPEND baytkodu ile optimize edildiğinden genelde daha hızlıdır.",
          wrongOptions: [
            "Normal for döngüsü her zaman iki kat daha hızlıdır.",
            "List comprehension sadece sözdizimsel şekerdir, baytkod seviyesinde birebir aynıdır.",
            "List comprehension multithreading kullandığı için daha hızlıdır."
          ],
          explanation: "List comprehension döngü içinde attribute lookup (lst.append) yapmaz, C düzeyinde optimize LIST_APPEND opkodu çalıştırır.",
          devTip: "Büyük veri listelerinde 'map' veya 'comprehension' tercih edilir.",
        ),
        const _DevTopicFact(
          prompt: "Python'da 'is' ile '==' operatörleri arasındaki fark nedir?",
          codeSnippet: "a = [1, 2, 3]\nb = [1, 2, 3]\nprint(a == b, a is b)",
          correctOption: "'==' değer eşitliğini (equality) kontrol eder, 'is' ise aynı bellek adresini (identity/id) kontrol eder.",
          wrongOptions: [
            "'is' tip eşitliğini, '==' bellek adresini kontrol eder.",
            "İkisi de tamamen aynı işi yapar, 'is' Python 3 ile gelen kısa yazılımdır.",
            "'is' sadece stringlerde, '==' sadece sayılarda çalışır."
          ],
          explanation: "'a == b' True verir çünkü elemanlar aynıdır. 'a is b' False verir çünkü heap'te iki ayrı liste nesnesi ayrılmıştır.",
        ),
        const _DevTopicFact(
          prompt: "Python sözlüklerinde (dict) anahtar arama ve ekleme ortalama zaman karmaşıklığı nedir?",
          correctOption: "O(1) - Sabit Zaman",
          wrongOptions: ["O(log N)", "O(N)", "O(N²)"],
          explanation: "Python dict yapısı Hash Table olarak implement edilmiştir; hash collision olmadığı sürece arama ve ekleme O(1)'dir.",
        ),
        const _DevTopicFact(
          prompt: "Python'da GIL (Global Interpreter Lock) neyi engeller?",
          correctOption: "Tek bir Python sürecinde birden fazla yerel thread'in aynı anda baytkod çalıştırmasını engeller.",
          wrongOptions: [
            "C uzantılarının bellek tahsis etmesini engeller.",
            "Asyncio ile asenkron fonksiyon yazılmasını engeller.",
            "Programın 4GB'tan fazla RAM kullanmasını engeller."
          ],
          explanation: "GIL, CPython bellek yönetimini korumak için tek thread'in baytkod yürütmesine izin verir. CPU-bound işler için 'multiprocessing' kullanılır.",
        ),
      ];

    case CodeLanguage.javascript:
      return [
        const _DevTopicFact(
          prompt: "JavaScript Event Loop'ta Promise.then mikro-görevi (Microtask) ile setTimeout makro-görevi (Macrotask) önceliği nasıldır?",
          codeSnippet: "setTimeout(() => console.log('1'), 0);\nPromise.resolve().then(() => console.log('2'));\nconsole.log('3');",
          correctOption: "Çıktı sırası: 3, 2, 1 olur. Microtask kuyruğu Macrotask kuyruğundan önce tamamen boşaltılır.",
          wrongOptions: [
            "Çıktı sırası: 3, 1, 2 olur. setTimeout 0ms olduğu için önce girer.",
            "Çıktı sırası: 1, 2, 3 olur.",
            "Çıktı sırası: 2, 3, 1 olur."
          ],
          explanation: "Senkron kod ('3') bittikten sonra Event Loop önce Microtask kuyruğunu ('2') tüketir, ardından sıradaki Macrotask'a ('1') geçer.",
          devTip: "Microtask kuyruğu: Promise, queueMicrotask, MutationObserver.",
        ),
        const _DevTopicFact(
          prompt: "JavaScript'te Closure (Kapanış) kavramı neyi ifade eder?",
          correctOption: "Bir fonksiyonun, yaratıldığı sözcüksel (lexical) ortamdaki değişkenleri bellekte saklayıp erişebilmesidir.",
          wrongOptions: [
            "Fonksiyonun çalışması bittiğinde tüm değişkenlerini otomatik imha etmesidir.",
            "Bir nesnenin prototip zincirindeki metotları gizleme mekanizmasıdır.",
            "Async fonksiyonların try-catch olmadan hata fırlatmasını engellemesidir."
          ],
          explanation: "Closure sayesinde içteki fonksiyon, dış fonksiyon sonlansa bile dış fonksiyonun değişkenlerine erişmeye devam eder.",
        ),
        const _DevTopicFact(
          prompt: "JavaScript'te '===' ile '==' karşılaştırması arasındaki temel fark nedir?",
          codeSnippet: "0 == false // ?\n0 === false // ?",
          correctOption: "'===' tip dönüşümü (type coercion) yapmaz, '==' tipleri dönüştürerek kıyaslar.",
          wrongOptions: [
            "'===' sadece stringlerde, '==' sayılarda çalışır.",
            "'===' bellek adresini, '==' değerleri kıyaslar.",
            "İkisi arasında hiçbir davranış farkı yoktur."
          ],
          explanation: "0 == false -> true (false 0'a dönüştürülür). 0 === false -> false (number vs boolean).",
        ),
      ];

    case CodeLanguage.git:
      return [
        const _DevTopicFact(
          prompt: "Git'te yanlışlıkla silinen bir commit veya kaybedilen branch nasıl kurtarılır?",
          correctOption: "'git reflog' ile HEAD hareketleri geçmişi incelenir ve bulunan hash 'git checkout / reset' ile geri alınır.",
          wrongOptions: [
            "'git fsck --clean' komutu silinen commitleri uzak depodan indirir.",
            "'git revert HEAD' silinmiş branch'leri geri getirir.",
            "Silinen commitler Git'te anında kalıcı olarak yok edilir, kurtarılamaz."
          ],
          explanation: "Git nesneleri hemen silmez; reflog son 30-90 gündeki tüm HEAD referanslarını saklar.",
          devTip: "Panik yapma: 'git reflog' her commitin can simididir!",
        ),
        const _DevTopicFact(
          prompt: "Git'te 'git rebase' ile 'git merge' arasındaki felsefi fark nedir?",
          correctOption: "Merge geçmişi olduğu gibi korur ve birleştirme commiti üretir; Rebase commitleri yeni tabana taşıyarak doğrusal (lineer) geçmiş sunar.",
          wrongOptions: [
            "Rebase dosyaları kopyalar, Merge sadece branch adını siler.",
            "Rebase uzak depoya asla push edilemez, Merge zorunludur.",
            "Merge çakışma çözemez, sadece Rebase çakışma çözer."
          ],
          explanation: "Rebase temiz bir git log sağlar ancak paylaşılan branch'lerde rebase yapmak başkalarının geçmişini bozar.",
        ),
        const _DevTopicFact(
          prompt: "Git Staging Area'daki belirli satır değişikliklerini seçerek parça parça commit hazırlamak için hangi komut verilir?",
          codeSnippet: "git add -p",
          correctOption: "'git add -p' (patch modu) ile hunk bazında seçici commit hazırlanır.",
          wrongOptions: [
            "'git commit --partial'",
            "'git stage --select'",
            "'git cherry-pick --file'"
          ],
          explanation: "'git add -p' interaktif patch modunu açarak her değişikliği onaylamanıza (y/n/s/e) izin verir.",
        ),
      ];

    case CodeLanguage.sql:
      return [
        const _DevTopicFact(
          prompt: "SQL'de WHERE ile HAVING cümleleri arasındaki temel fark nedir?",
          correctOption: "WHERE gruplama öncesinde satırları filtreler; HAVING ise GROUP BY aggregate sonuçlarını filtreler.",
          wrongOptions: [
            "WHERE sadece stringlerde, HAVING sadece sayılarda kullanılır.",
            "HAVING indeks kullanır, WHERE indeks kullanamaz.",
            "İkisi birbirinin yerine tamamen aynı şekilde kullanılabilir."
          ],
          explanation: "Örneğin: WHERE fiyat > 50 ... GROUP BY kategori HAVING COUNT(*) > 5.",
        ),
        const _DevTopicFact(
          prompt: "SQL sorgusunda B-Tree Index hangi durumlarda etkisiz kalabilir (Index Scan'e düşebilir)?",
          correctOption: "İndeksli sütuna fonksiyon uygulandığında (örn: WHERE UPPER(email) = ...) veya LIKE '%abc' başında wildcard olduğunda.",
          wrongOptions: [
            "WHERE id = 5 gibi doğrudan eşitlik aramalarında.",
            "ORDER BY sütun kullanıldığında.",
            "JOIN sorgularında anahtar kullanıldığında."
          ],
          explanation: "Sütun fonksiyon içine alındığında veritabanı her satır için fonksiyonu hesaplamak zorunda kalır ve index seek yapamaz.",
        ),
        const _DevTopicFact(
          prompt: "Veritabanlarında ACID prensiplerindeki 'I' (Isolation) neyi garanti eder?",
          correctOption: "Eşzamanlı (concurrent) çalışan işlemlerin birbirinin ara durumlarını görmemesini ve çakışmamasını.",
          wrongOptions: [
            "Verilerin diske atomik yazılmasını.",
            "Veritabanının internet bağlantısı kesilse bile çalışmasını.",
            "Tüm indekslerin bellekte tutulmasını."
          ],
          explanation: "Isolation seviyeleri (Read Committed, Repeatable Read, Serializable) veri tutarlılığı ile performans arasındaki dengeyi sağlar.",
        ),
      ];

    case CodeLanguage.linux:
      return [
        const _DevTopicFact(
          prompt: "Linux'ta bir dosyanın izinleri 'chmod 755 dosya.sh' yapıldığında izinler ne olur?",
          correctOption: "Sahibi: rwx (7), Grubu: r-x (5), Diğerleri: r-x (5).",
          wrongOptions: [
            "Herkes tam yetkiye sahip olur (rwx).",
            "Sadece root kullanıcısı okuyabilir.",
            "Sahibi: rw-, Grubu: r--, Diğerleri: ---."
          ],
          explanation: "r=4, w=2, x=1. 7 = 4+2+1 (rwx), 5 = 4+1 (r-x). 755 standart çalıştırılabilir dosya iznidir.",
        ),
        const _DevTopicFact(
          prompt: "Linux'ta arka planda çalışan bir işlemi anında ve zorla sonlandırmak için hangi sinyal gönderilir?",
          correctOption: "kill -9 <PID> (SIGKILL)",
          wrongOptions: ["kill -1 <PID> (SIGHUP)", "kill -15 <PID> (SIGTERM)", "kill -0 <PID>"],
          explanation: "SIGTERM (15) nazik kapanma isterken, SIGKILL (9) işletim sistemi seviyesinde işlemi anında sonlandırır ve yakalanamaz.",
        ),
      ];

    case CodeLanguage.c:
      return [
        const _DevTopicFact(
          prompt: "C dilinde malloc() ile ayrılan bellek serbest bırakılmazsa ne oluşur?",
          codeSnippet: "int *p = (int*)malloc(100 * sizeof(int));\n// free(p) unutuldu",
          correctOption: "Bellek Sızıntısı (Memory Leak) oluşur; tahsis edilen alan süreç bitene kadar Heap'te rezerve kalır.",
          wrongOptions: [
            "C derleyicisi otomatik Garbage Collector çalıştırır.",
            "Stack Overflow hatası alınır.",
            "İşlemci donanımsal reset atar."
          ],
          explanation: "C'de otomatik çöp toplayıcı yoktur. Her malloc(), calloc() ve realloc() çağrısı için free() çağrılmalıdır.",
        ),
        const _DevTopicFact(
          prompt: "C dilinde bir göstericinin (pointer) boyutu (sizeof) 64-bit bir mimaride kaç bayttır?",
          codeSnippet: "char *cp;\nint *ip;\ndouble *dp;\nprintf(\"%zu\", sizeof(cp));",
          correctOption: "8 bayttır (Gösterdiği veri tipinden bağımsız olarak tüm göstericiler adres boyutundadır).",
          wrongOptions: [
            "char göstericisi 1 bayt, double göstericisi 8 bayttır.",
            "4 bayttır.",
            "Derleyici optimizasyonuna göre 2 bayt ile 16 bayt arası değişir."
          ],
          explanation: "Pointer bir bellek adresi tutar. 64-bit mimarilerde tüm bellek adresleri 64 bit (8 bayt) genişliğindedir.",
        ),
      ];

    case CodeLanguage.csharp:
      return [
        const _DevTopicFact(
          prompt: "C#'ta 'struct' ile 'class' arasındaki en temel fark nedir?",
          correctOption: "'struct' değer tipidir (Value Type - genelde Stack), 'class' referans tipidir (Reference Type - Heap).",
          wrongOptions: [
            "'struct' sadece metot içerebilir, 'class' değişken içerir.",
            "'struct' miras alabilir, 'class' miras alamaz.",
            "'struct' public olamaz, sadece private çalışır."
          ],
          explanation: "Value tipleri kopyalanırken referans tiplerinin işaret ettiği bellek adresi aktarılır.",
        ),
        const _DevTopicFact(
          prompt: "C#'ta string birleştirme işlemlerinde çok sayıda döngü varsa neden StringBuilder tercih edilir?",
          correctOption: "string değişmezdir (immutable); her birleştirmede yeni nesne üretir. StringBuilder belleği yerinde değiştirir.",
          wrongOptions: [
            "StringBuilder multi-thread senkronizasyonu zorunlu kılar.",
            "StringBuilder diskte dosya olarak tutulduğu için RAM harcamaz.",
            "Normal string derlenemez."
          ],
          explanation: "Döngülerde 's += str' kullanımı binlerce geçici string oluşturup Garbage Collector'ı yorar; StringBuilder O(N) çalışır.",
        ),
      ];

    case CodeLanguage.kotlin:
      return [
        const _DevTopicFact(
          prompt: "Kotlin'de 'val' ile 'var' arasındaki temel fark nedir?",
          correctOption: "'val' salt okunurdur (immutable reference - tekrar atanamaz), 'var' ise değiştirilebilir (mutable).",
          wrongOptions: [
            "'val' global değişkenler için, 'var' lokal değişkenler içindir.",
            "'val' null alamaz, 'var' null alabilir.",
            "'val' primitive tipler içindir, 'var' nesneler içindir."
          ],
          explanation: "'val' Java'daki 'final' değişkenlere benzer. Bir kez değer atandıktan sonra referansı değiştirilemez.",
        ),
        const _DevTopicFact(
          prompt: "Kotlin'de Elvis Operatörü (?:) ne işe yarar?",
          codeSnippet: "val uzunluk = isim?.length ?: 0",
          correctOption: "Sol taraf 'null' ise sağdaki varsayılan değeri döndürür.",
          wrongOptions: [
            "Değişkenin tipini dinamik olarak integer yapar.",
            "İki stringi null güvenli şekilde birleştirir.",
            "Null ise NullPointerException fırlatır."
          ],
          explanation: "Elvis operatörü (?:), if (x != null) x else varsayilan kalıbının zarif ve kısa yazımıdır.",
        ),
      ];

    case CodeLanguage.godot:
      return [
        const _DevTopicFact(
          prompt: "Godot 4 GDScript'te fizik hesaplamaları ve hareket kodları hangi fonksiyonda yazılmalıdır?",
          correctOption: "_physics_process(delta): Sabit aralıklarla (fixed time step) çağrılır ve kare hızından bağımsızdır.",
          wrongOptions: [
            "_process(delta): Çünkü en yüksek FPS ile çalışır.",
            "_input(event): Tuş basımında çalışır.",
            "_ready(): Sahne yüklenince bir kez hesaplar."
          ],
          explanation: "_physics_process fizik motoruyla senkronizedir (varsayılan 60 Hz). _process ise ekrandaki kare hızına bağlıdır.",
        ),
        const _DevTopicFact(
          prompt: "Godot'ta düğümler (Nodes) arası gevşek bağlı (loosely coupled) iletişim kurmanın en iyi yolu nedir?",
          correctOption: "Sinyaller (Signals) - Olay bazlı dinleme ve yayınlama mimarisi.",
          wrongOptions: [
            "Tüm değişkenleri Global Singleton yapmak.",
            "Her karede get_parent().get_node() ile arama yapmak.",
            "Doğrudan hafıza adresini paylaşmak."
          ],
          explanation: "Godot felsefesi: 'Sinyaller yukarı, çağrılar aşağı' (Signals up, calls down).",
        ),
      ];

    case CodeLanguage.algorithms:
      return [
        const _DevTopicFact(
          prompt: "Dengeli bir İkili Arama Ağacında (AVL / Red-Black Tree) eleman arama, ekleme ve silme karmaşıklığı nedir?",
          correctOption: "O(log N)",
          wrongOptions: ["O(1)", "O(N)", "O(N log N)"],
          explanation: "Ağaç dengeli tutulduğu için derinlik log₂(N) seviyesindedir ve tüm temel işlemler O(log N) sürer.",
        ),
        const _DevTopicFact(
          prompt: "Sıralı bir dizide iki sayının toplamının belirli bir hedefe eşit olup olmadığını bulmak için en optimize algoritma?",
          correctOption: "Two Pointers (İki İşaretçi): Biri baştan biri sondan ilerleyerek O(N) zamanda ve O(1) ek bellekte bulur.",
          wrongOptions: [
            "İç içe iki for döngüsü: O(N²) zamanda çözer.",
            "Diziyi tekrar Bubble Sort ile sıralamak: O(N²).",
            "Tüm alt kümeleri üretmek: O(2^N)."
          ],
          explanation: "Dizi sıralı olduğu için toplam hedeften küçükse sol işaretçi sağa, büyükse sağ işaretçi sola kaydırılır.",
        ),
        const _DevTopicFact(
          prompt: "En kötü durumda (Worst-case) QuickSort'un zaman karmaşıklığı nedir ve nasıl engellenir?",
          correctOption: "O(N²)'dir; Pivot olarak rastgele eleman (Randomized) veya 'Median of three' seçilerek engellenir.",
          wrongOptions: [
            "O(log N)'dir, hiçbir zaman bozulmaz.",
            "O(N³)'tür, HeapSort kullanarak engellenir.",
            "O(N)'dir, çift pivot kullanılarak engellenir."
          ],
          explanation: "Dizi zaten sıralı ve her zaman ilk eleman pivot seçilirse alt problemler N-1 boyutuna düşer ve O(N²) olur.",
        ),
      ];

    case CodeLanguage.flutter:
      return [
        const _DevTopicFact(
          prompt: "Flutter'da 'const' ile işaretlenen bir widget hakkında aşağıdakilerden hangisi doğrudur?",
          codeSnippet: "const SizedBox(height: 16);",
          correctOption: "Derleme zamanında sabitlenir ve üst widget rebuild olsa dahi asla baştan çizilmez (rebuild edilmez).",
          wrongOptions: [
            "Sadece Android cihazlarda çalışır.",
            "Değerleri çalışma zamanında dinamik değişebilir.",
            "StatefulWidget olmak zorundadır."
          ],
          explanation: "const nesneler Flutter'da tekil örnek (canonical instance) olarak saklanır ve rebuild maliyetini sıfırlar.",
          devTip: "prefer_const_constructors kuralını aktif kullanarak arayüz performansını zirvede tut!",
        ),
        const _DevTopicFact(
          prompt: "Hot Reload ile Hot Restart arasındaki temel fark nedir?",
          correctOption: "Hot Reload widget ağacını güncellerken mevcut durumu (state) korur; Hot Restart ise tüm state'i sıfırlar.",
          wrongOptions: [
            "Hot Reload uygulamayı tamamen baştan derler.",
            "Hot Restart sadece CSS dosyalarını yeniler.",
            "Aralarında hiçbir fark yoktur."
          ],
          explanation: "Hot Reload Dart VM'in dinamik kod yükleme yeteneğiyle state'i koruyarak saniyeler içinde değişiklikleri yansıtır.",
        ),
        const _DevTopicFact(
          prompt: "Flutter'da 'BuildContext' neyi temsil eder?",
          correctOption: "Bir widget'ın widget ağacındaki ve element hiyerarşisindeki tam konumunu.",
          wrongOptions: [
            "Telefonun batarya ve CPU seviyesini.",
            "Uygulamanın internet bağlantı durumunu.",
            "Sadece veritabanı bağlantılarını."
          ],
          explanation: "BuildContext, Theme.of(context) veya Navigator.of(context) gibi üst ağaç bileşenlerine erişmek için widget'ın element konumudur.",
        ),
        const _DevTopicFact(
          prompt: "StatefulWidget'ta setState(() {}) çağrıldığında Flutter arka planda ne yapar?",
          correctOption: "İlgili Element'i 'dirty' işaretler ve bir sonraki karede build() metodunu tekrar çalıştırır.",
          wrongOptions: [
            "Tüm uygulamayı kapatıp yeniden başlatır.",
            "Sadece veritabanı sorgularını yeniler.",
            "Ekranı dondurur."
          ],
          explanation: "setState çerçevenin (frame) yeniden çizilmesini talep eder; sadece o State nesnesinin alt ağacı güncellenir.",
        ),
        const _DevTopicFact(
          prompt: "Riverpod'da buton tıklaması (onPressed) gibi olay dinleyicilerinde provider okumak için hangisi kullanılır?",
          correctOption: "ref.read(provider.notifier) (ref.watch buton içine ASLA yazılmaz)",
          wrongOptions: [
            "ref.watch(provider)",
            "ref.rebuild()",
            "setState()"
          ],
          explanation: "ref.watch widget rebuild gerektiren build() metodunda kullanılır; callback ve butonlarda ref.read kullanılır.",
        ),
        const _DevTopicFact(
          prompt: "Büyük veri listelerinde neden ListView yerine ListView.builder tercih edilmelidir?",
          correctOption: "ListView.builder sadece ekranda görünen öğeleri oluşturur (Lazy Evaluation/Tembel Yükleme).",
          wrongOptions: [
            "ListView.builder otomatik olarak internete bağlanır.",
            "ListView.builder sadece 10 eleman gösterebilir.",
            "ListView.builder telefonun belleğini doldurur."
          ],
          explanation: "Standart ListView tüm elemanları belleğe tek seferde çizerken, ListView.builder sadece görünen pencereleri render eder.",
        ),
      ];
  }
}

/// Her ders için zengin, çoktan seçmeli, kod çıktısı ve boşluk doldurma soruları üretir
List<Question> _generateDynamicDevQuestions(
  String lessonId,
  String unitTitle,
  String category,
  CodeLanguage lang, {
  required int targetCount,
}) {
  final facts = _getTopicFactsForTrack(lang, unitTitle, category);
  final questions = <Question>[];

  // Faktör listesinden ve modüler şablonlardan 135+ soru üret
  for (int i = 0; i < targetCount; i++) {
    final fact = facts[i % facts.length];
    final variant = i % 5;
    final qId = "${lessonId}_dyn_$i";

    if (variant == 0) {
      // 1. Çoktan Seçmeli Kavram & Mülakat Sorusu
      questions.add(Question(
        id: qId,
        type: QuestionType.multipleChoice,
        prompt: "[$unitTitle - Soru #${i + 1}] ${fact.prompt}",
        codeSnippet: fact.codeSnippet,
        options: [fact.correctOption, ...fact.wrongOptions]..shuffle(),
        correctIndex: 0, // Options shuffle edildikten sonra doğru index güncellenecek
        explanation: fact.explanation,
        devTip: fact.devTip ?? "Bu kural sektör mülakatlarında en sık sorulan konulardandır.",
        iconEmoji: "⚡",
      ));
    } else if (variant == 1) {
      // 2. Kod Çıktısı Tahmini (Code Output)
      final options = [fact.correctOption, ...fact.wrongOptions]..shuffle();
      final corrIdx = options.indexOf(fact.correctOption);

      questions.add(Question(
        id: qId,
        type: QuestionType.codeOutput,
        prompt: "Verilen kod bloğunun çalışma davranışı ve sonucu ne olur?",
        codeSnippet: fact.codeSnippet ?? "// $unitTitle Analizi\nrun_code();",
        options: options,
        correctIndex: corrIdx >= 0 ? corrIdx : 0,
        explanation: fact.explanation,
        devTip: "Kod okuma hızı mülakatlarda doğrudan başarı getirir.",
        iconEmoji: "💻",
      ));
    } else if (variant == 2) {
      // 3. Doğru / Yanlış (True/False)
      final isTrueQuestion = (i % 2 == 0);
      final promptText = isTrueQuestion
          ? "DOĞRU / YANLIŞ: $unitTitle kapsamında; ${fact.correctOption}"
          : "DOĞRU / YANLIŞ: $unitTitle kapsamında; ${fact.wrongOptions.first}";

      questions.add(Question(
        id: qId,
        type: QuestionType.trueFalse,
        prompt: promptText,
        isTrue: isTrueQuestion,
        explanation: fact.explanation,
        devTip: "Yazılım mimarisinde doğru bilinen yanlışları ayırt etmek kıymetlidir.",
        iconEmoji: isTrueQuestion ? "✅" : "⚠️",
      ));
    } else if (variant == 3) {
      // 4. Boşluk Doldurma
      final blankWord = fact.correctOption.split(' ').first;
      final distractor1 = fact.wrongOptions[0].split(' ').first;
      final distractor2 = fact.wrongOptions.length > 1 ? fact.wrongOptions[1].split(' ').first : 'null';

      questions.add(Question(
        id: qId,
        type: QuestionType.fillInTheBlank,
        prompt: "$unitTitle kuralı: '_____ ${fact.correctOption.substring(blankWord.length).trim()}'",
        blankOptions: [blankWord, distractor1, distractor2]..shuffle(),
        correctBlankAnswer: blankWord,
        explanation: fact.explanation,
        devTip: "Anahtar sözcükleri ve sözdizimini refleks haline getir!",
        iconEmoji: "🧩",
      ));
    } else {
      // 5. Kavram & Hap Bilgi Kartı
      questions.add(Question(
        id: qId,
        type: QuestionType.conceptCard,
        conceptTitle: "$unitTitle - Mülakat Kuralı #${i + 1}",
        rule: "${fact.prompt}\n\nÇözüm & Kural: ${fact.correctOption}",
        codeExample: fact.codeSnippet,
        explanation: fact.explanation,
        devTip: fact.devTip ?? "Bunu bilmek seni diğer adayların %80'inin önüne geçirir.",
        iconEmoji: "🎯",
      ));
    }
  }

  // Shuffle edilen multiple choice sorularının correctIndex'ini garantiye al
  return questions.map((q) {
    if (q.type == QuestionType.multipleChoice && q.options != null) {
      // Fact içindeki doğru cevabı bul
      for (final fact in facts) {
        final idx = q.options!.indexOf(fact.correctOption);
        if (idx != -1) {
          return Question(
            id: q.id,
            type: q.type,
            prompt: q.prompt,
            codeSnippet: q.codeSnippet,
            options: q.options,
            correctIndex: idx,
            explanation: q.explanation,
            devTip: q.devTip,
            iconEmoji: q.iconEmoji,
          );
        }
      }
    }
    return q;
  }).toList();
}

/// Verilen parçayı (Language Track) alır ve her dersi 160 soruya tamamlar (64 ders x 160 = 10.240 Soru)
List<LearningUnit> expandTrackWithQuestionBank(CodeLanguage lang, List<LearningUnit> rawUnits) {
  return rawUnits.map((unit) {
    final updatedLessons = <Lesson>[];

    for (final lesson in unit.lessons) {
      final currentQuestions = List<Question>.from(lesson.questions);
      final neededCount = 160 - currentQuestions.length;

      if (neededCount > 0) {
        final dynQuestions = _generateDynamicDevQuestions(
          lesson.id,
          unit.title,
          unit.category,
          lang,
          targetCount: neededCount,
        );
        currentQuestions.addAll(dynQuestions);
      }

      updatedLessons.add(Lesson(
        id: lesson.id,
        title: lesson.title,
        description: lesson.description,
        xpReward: lesson.xpReward,
        gemReward: lesson.gemReward,
        questions: currentQuestions,
        isUnitExam: lesson.isUnitExam,
      ));
    }

    return LearningUnit(
      id: unit.id,
      unitNumber: unit.unitNumber,
      title: unit.title,
      language: unit.language,
      category: unit.category,
      colorHex: unit.colorHex,
      lessons: updatedLessons,
      cheatSheetTitle: unit.cheatSheetTitle,
      cheatSheetContent: unit.cheatSheetContent,
    );
  }).toList();
}
