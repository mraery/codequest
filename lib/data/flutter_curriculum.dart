import '../models/code_track_model.dart';
import '../models/curriculum_models.dart';

final List<LearningUnit> flutterUnits = [
  LearningUnit(
    id: "flutter_unit_1",
    unitNumber: 1,
    title: "Dart 3 & Modern Dil Temelleri",
    language: CodeLanguage.flutter,
    category: "Dart Temelleri",
    colorHex: 0xFF02569B,
    cheatSheetTitle: "Dart 3 & Null Safety Hile Kağıdı",
    cheatSheetContent: r'''// Sound Null Safety
String? nullableStr;
String nonNullStr = nullableStr ?? 'Varsayılan';

// Dart 3 Records & Patterns
(int, String) user = (1, 'Ahmet');
var (id, name) = user;

// Pattern Matching Switch
var status = switch (statusCode) {
  200 => 'Başarılı',
  404 => 'Bulunamadı',
  _ => 'Bilinmeyen'
};''',
    lessons: [
      Lesson(
        id: "flutter_u1_l1",
        title: "Sound Null Safety & Elvis Operatörü",
        description: "Null güvenliği, ?? ve ?. operatörleri",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Dart Null Safety - Hap Bilgi",
            rule: "Dart dilinde değişkenler varsayılan olarak non-nullable'dır. Null alabilmesi için '?' ile işaretlenmelidir. '??' operatörü sol taraf null ise sağdaki değeri döndürür.",
            codeExample: "String? name;\nprint(name ?? 'Misafir');",
            devTip: "Force unwrap (!) operatörünü sadece değerin null olmadığından %100 emin olduğunda kullan, aksi halde runtime crash alırsın.",
            iconEmoji: "💙",
          ),
          Question(
            id: "flutter_u1_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Dart'ta null olabilecek bir nesnenin metodunu güvenle çağırmak için hangi operatör kullanılır?",
            codeSnippet: "String? text;\nint? length = text?.length;",
            options: ["?.", "??", "!", "::"],
            correctIndex: 0,
            explanation: "'?.' (null-aware operator) sol taraf null ise metodu çalıştırmaz ve doğrudan null döndürür.",
          ),
          Question(
            id: "flutter_u1_l1_q3",
            type: QuestionType.trueFalse,
            prompt: "DOĞRU / YANLIŞ: Dart 3 ile gelen Sound Null Safety sayesinde derleme zamanında null hataları %100 önceden yakalanabilir.",
            isTrue: true,
            explanation: "Sound null safety tip sisteminde null kontrolünü garanti altına alarak çalışma zamanı NullPointer hatalarını engeller.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l2",
        title: "Dart 3 Records & Pattern Matching",
        description: "Tuple benzeri veri saklama ve switch desenleri",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Dart 3'te bir fonksiyondan birden fazla değeri hafif ve isimsiz döndürmek için ne kullanılır?",
            options: ["Records", "Map<String, dynamic>", "JSON string", "InheritedModel"],
            correctIndex: 0,
            explanation: "Records, Dart 3'te ek bir sınıf yazmadan çoklu değer döndürmeyi sağlayan anonim, immutable veri yapılarıdır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l3",
        title: "Asenkron Programlama: Future & async/await",
        description: "Arka plan işlemleri ve Event Loop",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l3_q1",
            type: QuestionType.codeOutput,
            prompt: "Aşağıdaki kodun konsol çıktısı sırasıyla ne olur?",
            codeSnippet: "print('1');\nFuture(() => print('2'));\nprint('3');",
            options: ["1, 3, 2", "1, 2, 3", "2, 1, 3", "3, 2, 1"],
            correctIndex: 0,
            explanation: "Future kodu Event Loop kuyruğuna atılır; senkron kodlar (1 ve 3) bittikten sonra 2 çalıştırılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l4",
        title: "Dart Streams & Reactive Veri Akışları",
        description: "Sürekli veri akışları ve async*",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Dart dilinde tek seferlik değer yerine sürekli bir veri akışı dinlemek için hangisi kullanılır?",
            options: ["Stream", "Future", "Record", "Isolate"],
            correctIndex: 0,
            explanation: "Future tek bir asenkron değer dönerken, Stream zaman içinde birden fazla olay ya da veri yayar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l5",
        title: "Dart Koleksiyonları & Spread Operatörü (...)",
        description: "List, Set, Map ve collection if/for",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir listeyi başka bir listenin içine tek tek eleman olarak yaymak için hangi operatör kullanılır?",
            options: ["...", "::", "->", "=>"],
            correctIndex: 0,
            explanation: "Spread operatörü (...) listenin tüm elemanlarını hedef koleksiyona yayar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l6",
        title: "Dart Sınıfları, Mixin'ler & Extension'lar",
        description: "Kod tekrarını önleyen mixin ve extension metotları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Var olan bir sınıfa miras almadan yeni metotlar eklemek için Dart'ta hangi yapı kullanılır?",
            options: ["extension on", "mixin with", "implements", "abstract class"],
            correctIndex: 0,
            explanation: "'extension on Sınıf' yapısı mevcut sınıfları genişletmek için kullanılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u1_l7",
        title: "Dart Isolates & Çoklu İş Parçacığı (Multi-threading)",
        description: "Event Loop dışı ağır hesaplamalar ve compute()",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u1_l7_q1",
            type: QuestionType.multipleChoice,
            prompt: "Dart dilinde thread'ler bellek paylaşmak yerine birbirleriyle nasıl haberleşir?",
            options: ["Mesajlaşma (Port & Message Passing)", "Shared Memory", "Ortak Pointer", "Mutex Lock"],
            correctIndex: 0,
            explanation: "Dart Isolate'leri izole belleğe sahiptir; veri paylaşımı yerine SendPort ve ReceivePort üzerinden mesajlaşırlar.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_2",
    unitNumber: 2,
    title: "Widget Ağacı & Temel Görsel Bileşenler",
    language: CodeLanguage.flutter,
    category: "Widget Ağacı & Layout",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "Flutter Widget Ağacı Hile Kağıdı",
    cheatSheetContent: r'''// Temel Widget Ağacı
Scaffold(
  appBar: AppBar(title: const Text('Başlık')),
  body: Center(
    child: Container(
      padding: const EdgeInsets.all(16),
      child: const Text('Flutter Harika!'),
    ),
  ),
);''',
    lessons: [
      Lesson(
        id: "flutter_u2_l1",
        title: "Flutter'da Her Şey Bir Widget'tır!",
        description: "Widget, Element ve RenderObject üçlüsü",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Flutter'ın 3 Ağacı - Hap Bilgi",
            rule: "Flutter'da kullanıcı arayüzü 3 ağaçtan oluşur: 1) Widget Ağacı (Konfigürasyon), 2) Element Ağacı (İskelet/Yaşam), 3) RenderObject Ağacı (Pikselleri ekrana çizen katman).",
            codeExample: "const Text('Merhaba Dünya');",
            devTip: "Widget'lar hafif ve immutable'dır. Sık sık baştan oluşturulabilirler.",
            iconEmoji: "🌲",
          ),
          Question(
            id: "flutter_u2_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Flutter'da ekrana pikselleri fiziksel olarak çizen ve boyutu hesaplayan ağaç katmanı hangisidir?",
            options: ["RenderObject Ağacı", "Widget Ağacı", "Element Ağacı", "State Ağacı"],
            correctIndex: 0,
            explanation: "RenderObject katmanı düzen (layout), boyut hesaplama ve boyama (painting) işlemlerini yürütür.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l2",
        title: "Scaffold & Temel Ekran İskeleti",
        description: "AppBar, FloatingActionButton, Drawer ve Body",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Material Design standart ekran yapısını (AppBar, body, FAB) kuran ana widget hangisidir?",
            options: ["Scaffold", "MaterialApp", "Container", "SafeArea"],
            correctIndex: 0,
            explanation: "Scaffold, standart mobil ekran görsel iskeletini ve elemanlarını sunar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l3",
        title: "Text, TextStyle & GoogleFonts",
        description: "Metin formatlama, yazı tipleri ve taşma (overflow)",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "Metin ekrana sığmadığında üç nokta (...) ile kırpmak için Text widget'ında ne kullanılır?",
            options: ["overflow: TextOverflow.ellipsis", "softWrap: false", "maxLines: 1", "clip: true"],
            correctIndex: 0,
            explanation: "TextOverflow.ellipsis taşan metinlerin sonuna '...' ekler.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l4",
        title: "Container & BoxDecoration",
        description: "Kenarlıklar, gölgeler, yuvarlak köşeler ve gradyanlar",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Container'a hem 'color' parametresi hem de 'decoration: BoxDecoration(color: ...)' verilirse ne olur?",
            options: ["AssertionError fırlatır ve hata verir", "Decoration rengi ezilir", "Container şeffaf olur", "İki renk karışır"],
            correctIndex: 0,
            explanation: "BoxDecoration kullanılıyorsa arka plan rengi mutlaka BoxDecoration içine yazılmalıdır, aksi halde assert hatası fırlatılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l5",
        title: "SafeArea & Çentik Yönetimi",
        description: "Farklı cihaz çentikleri ve durum çubuğu güvenliği",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "Ekranın çentik veya ana ekran çubuğu gibi alanlarla çakışmasını önleyen widget hangisidir?",
            options: ["SafeArea", "Padding", "ClipRect", "SizedBox"],
            correctIndex: 0,
            explanation: "SafeArea cihazın işletim sistemi padding'lerini otomatik olarak içeri alır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l6",
        title: "Resimler & Varlıklar (Image.asset / network)",
        description: "pubspec.yaml tanımları ve resim optimizasyonu",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Uygulama içine gömülü yerel resimleri yüklemek için pubspec.yaml dosyasında hangi anahtar kullanılır?",
            options: ["flutter: assets:", "dependencies: images:", "android: res:", "assets: local:"],
            correctIndex: 0,
            explanation: "pubspec.yaml altında flutter: -> assets: bloğu yerel kaynak yollarını bildirir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u2_l7",
        title: "Flutter Temaları & Material 3 Mimarisi",
        description: "ThemeData, ColorScheme ve useMaterial3",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u2_l7_q1",
            type: QuestionType.multipleChoice,
            prompt: "Flutter'da modern Material 3 tasarım dilini etkinleştirmek için ThemeData'da hangi özellik kullanılır?",
            options: ["useMaterial3: true", "materialVersion: 3", "style: MaterialStyle.v3", "theme: Material3"],
            correctIndex: 0,
            explanation: "ThemeData(useMaterial3: true) modern Material 3 renk şeması ve bileşenlerini devreye alır.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_3",
    unitNumber: 3,
    title: "Yerleşim Düzeni & Layout Mimarisi",
    language: CodeLanguage.flutter,
    category: "Widget Ağacı & Layout",
    colorHex: 0xFF0369A1,
    cheatSheetTitle: "Row, Column & Stack Hile Kağıdı",
    cheatSheetContent: r'''Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(child: Widget1()),
    SizedBox(width: 12),
    Widget2(),
  ],
)''',
    lessons: [
      Lesson(
        id: "flutter_u3_l1",
        title: "Row & Column: Ana ve Çapraz Eksen",
        description: "MainAxisAlignment ve CrossAxisAlignment farkları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Column widget'ında ana eksen (MainAxis) hangi yöndedir?",
            options: ["Düşey (Yukarıdan Aşağıya)", "Yatay (Soldan Sağa)", "Z-Ekseni (Derinlik)", "Çapraz"],
            correctIndex: 0,
            explanation: "Column'un ana ekseni dikeydir, Row'un ana ekseni yataydır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u3_l2",
        title: "Expanded vs Flexible",
        description: "Kalan alanı doldurma ve flex faktörleri",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Expanded ile Flexible arasındaki en temel fark nedir?",
            options: [
              "Expanded varsayılan olarak fit: FlexFit.tight kullanır ve tüm kalan alanı zorla doldurur.",
              "Flexible sadece Column'da çalışır.",
              "Expanded sadece tek bir child alabilirken Flexible liste alır.",
              "Aralarında hiçbir fark yoktur."
            ],
            correctIndex: 0,
            explanation: "Expanded aslında fit: FlexFit.tight ayarlanmış bir Flexible'dır; child ne kadar küçük olursa olsun kalan tüm alanı zorla kaplar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u3_l3",
        title: "Stack & Positioned: Üst Üste Bindirme",
        description: "Z-ekseninde yerleşim ve mutlak konumlandırma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bileşenleri ekran üzerinde üst üste bindirmek (örneğin resim üzerine rozet koymak) için ne kullanılır?",
            options: ["Stack", "Row", "Column", "Wrap"],
            correctIndex: 0,
            explanation: "Stack widget'ları z-ekseninde üst üste dizer; Positioned ile hassas piksel konumlandırılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u3_l4",
        title: "Wrap & FittedBox",
        description: "Taşan elemanları alt satıra geçirme ve orantılı sığdırma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Row genişliği yetmediğinde elemanların taşma hatası (Yellow-Black stripes) vermeyip alt satıra geçmesi için ne kullanılır?",
            options: ["Wrap", "Row", "SizedBox", "Container"],
            correctIndex: 0,
            explanation: "Wrap, sığmayan elemanları otomatik olarak bir sonraki satıra ya da sütuna taşır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u3_l5",
        title: "SizedBox & Spacer",
        description: "Sabit boşluk bırakma ve dinamik yayılma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "İki widget arasında sabit 16 piksel dikey boşluk bırakmanın en performanslı yolu nedir?",
            options: ["const SizedBox(height: 16)", "Container(height: 16)", "Padding(padding: EdgeInsets.zero)", "Spacer()"],
            correctIndex: 0,
            explanation: "const SizedBox minimum bellek ve hesaplama maliyetiyle sabit boşluk oluşturur.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u3_l6",
        title: "LayoutBuilder & MediaQuery ile Responsive Tasarım",
        description: "Ekran boyutuna ve parent kısıtlarına (Constraints) göre uyarlama",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u3_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Üst widget'ın sunduğu BoxConstraints (min/max genişlik) değerlerine göre arayüz çizmek için hangi widget kullanılır?",
            options: ["LayoutBuilder", "MediaQuery", "OrientationBuilder", "Spacer"],
            correctIndex: 0,
            explanation: "LayoutBuilder parent'ın verebileceği min/max sınırları constraints parametresiyle sağlar.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_4",
    unitNumber: 4,
    title: "Stateless vs Stateful & Yaşam Döngüsü",
    language: CodeLanguage.flutter,
    category: "Stateful & Stateless",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "State Yaşam Döngüsü Hile Kağıdı",
    cheatSheetContent: r'''// State Lifecycle Sıralaması
1. createState()
2. initState() -> Tek seferlik başlangıç (listener, controller)
3. didChangeDependencies() -> InheritedWidget değişince
4. build() -> Her setState'te tekrar çizilir
5. didUpdateWidget() -> Parent widget konfigürasyonu değişince
6. deactivate()
7. dispose() -> Controller ve stream'leri iptal et!''',
    lessons: [
      Lesson(
        id: "flutter_u4_l1",
        title: "StatelessWidget Mantığı & Immutability",
        description: "Değişmeyen durumlar ve const optimizasyonu",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "StatelessWidget için aşağıdakilerden hangisi doğrudur?",
            options: [
              "Tüm alanları (field'ları) final olmalı ve dahili değişen bir durumu olmamalıdır.",
              "Her zaman setState() çağrısı yapabilir.",
              "Sadece tek bir build() metodu çalıştırabilir, parent değişse bile asla yeniden çizilmez.",
              "RAM'de hiçbir yer kaplamaz."
            ],
            correctIndex: 0,
            explanation: "StatelessWidget immutable'dır; dışarıdan parametre alır ve çizilir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u4_l2",
        title: "StatefulWidget & setState() Mekanizması",
        description: "State sınıfı ve ekranı yeniden tetikleme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "setState(() {}) çağrıldığında Flutter arka planda ne yapar?",
            options: [
              "İlgili Element'i 'dirty' olarak işaretler ve sıradaki karede build() metodunu tekrar çalıştırır.",
              "Tüm uygulamayı baştan başlatır.",
              "Veritabanındaki verileri sıfırlar.",
              "Ekrandaki pikselleri anında temizler."
            ],
            correctIndex: 0,
            explanation: "setState Element'i kirli (dirty) yapar ve çerçevenin (frame) yeniden çizilmesini planlar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u4_l3",
        title: "initState() Kuralları & Başlangıç Konfigürasyonu",
        description: "Controller başlatma, bir kerelik veri çekme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "initState() içinde aşağıdakilerden hangisini çağırmak doğru DEĞİLDİR?",
            options: [
              "ModalRoute.of(context) veya InheritedWidget (çünkü context henüz tam bağlanmamıştır)",
              "super.initState()",
              "AnimationController başlatma",
              "Değişkenlere ilk değer atama"
            ],
            correctIndex: 0,
            explanation: "initState anında context henüz tam hazır değildir; InheritedWidget bağımlılıkları didChangeDependencies()'de dinlenmelidir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u4_l4",
        title: "dispose() & Bellek Sızıntısı (Memory Leak) Önleme",
        description: "TextEditingController, Stream ve Animasyonların kapatılması",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "StatefulWidget ekrandan kalıcı olarak kaldırıldığında hangi yaşam döngüsü metodu çalışır?",
            options: ["dispose()", "initState()", "build()", "deactivate()"],
            correctIndex: 0,
            explanation: "dispose() widget yok edilirken controller ve listener'ları kapatmak için çağrılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u4_l5",
        title: "didUpdateWidget() & Üst Widget Güncellemeleri",
        description: "Parent yeni parametre yolladığında state güncelleme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "Üst (parent) widget yeni parametrelerle yeniden çizildiğinde State nesnesinde hangi metot tetiklenir?",
            options: ["didUpdateWidget()", "initState()", "dispose()", "createState()"],
            correctIndex: 0,
            explanation: "didUpdateWidget(oldWidget) eski ve yeni widget özelliklerini karşılaştırmayı sağlar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u4_l6",
        title: "Keys (ValueKey, UniqueKey & GlobalKey)",
        description: "Widget kimliği ve state koruma kuralları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u4_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir Form'un geçerliliğini (validate) dışarıdan kontrol etmek için hangi Key türü kullanılır?",
            options: ["GlobalKey<FormState>", "ValueKey", "UniqueKey", "ObjectKey"],
            correctIndex: 0,
            explanation: "GlobalKey widget ağacının herhangi bir yerinden State nesnesine erişim sağlar.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_5",
    unitNumber: 5,
    title: "Listeler & Kaydırma Mimarisi",
    language: CodeLanguage.flutter,
    category: "Widget Ağacı & Layout",
    colorHex: 0xFF02569B,
    cheatSheetTitle: "ListView.builder Hile Kağıdı",
    cheatSheetContent: r'''ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    final item = items[index];
    return ListTile(
      title: Text(item.title),
      leading: const Icon(Icons.code),
    );
  },
)''',
    lessons: [
      Lesson(
        id: "flutter_u5_l1",
        title: "ListView vs ListView.builder",
        description: "Tembel yükleme (Lazy evaluation) ve bellek farkı",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Binlerce elemanlı bir listede neden standart ListView yerine ListView.builder tercih edilmelidir?",
            options: [
              "ListView.builder sadece ekranda görünen öğeleri oluşturur ve belleği şişirmez.",
              "ListView.builder otomatik internete bağlanır.",
              "ListView.builder SQLite gerektirir.",
              "Hiçbir fark yoktur."
            ],
            correctIndex: 0,
            explanation: "ListView.builder 'on-demand' yani ihtiyaç duyuldukça çizim yaparak yüksek performans sağlar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u5_l2",
        title: "GridView & Izgara Düzeni",
        description: "SliverGridDelegateWithFixedCrossAxisCount ve responsive ızgara",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "GridView'de her satırda sabit sayıda sütun (örneğin 2 sütun) göstermek için hangi delege kullanılır?",
            options: [
              "SliverGridDelegateWithFixedCrossAxisCount",
              "SliverGridDelegateWithMaxCrossAxisExtent",
              "FixedColumnDelegate",
              "GridColumnProvider"
            ],
            correctIndex: 0,
            explanation: "FixedCrossAxisCount sütun sayısını sabitler.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u5_l3",
        title: "ScrollController & Sayfalama (Pagination)",
        description: "Kaydırma pozisyonunu dinleme ve sonsuz kaydırma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "Listenin en altına gelindiğini algılayıp yeni veri yüklemek için ne dinlenir?",
            options: ["scrollController.position.pixels >= scrollController.position.maxScrollExtent", "onTap", "setState", "build()"],
            correctIndex: 0,
            explanation: "maxScrollExtent listenin son piksel sınırını verir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u5_l4",
        title: "Dismissible: Kaydırarak Silme",
        description: "Swipe to delete ve arka plan animasyonları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Dismissible widget'ının düzgün çalışması için her elemana zorunlu olarak ne verilmelidir?",
            options: ["Key (Anahtar)", "Color", "Icon", "SizedBox"],
            correctIndex: 0,
            explanation: "Dismissible liste elemanını silerken doğru öğeyi takip edebilmek için benzersiz bir Key zorunlu kılar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u5_l5",
        title: "RefreshIndicator: Çekip Yenileme",
        description: "Pull-to-refresh mekanizması ve Future yönetimi",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "RefreshIndicator'ın onRefresh parametresi ne türde bir değer döndürmelidir?",
            options: ["Future<void>", "void", "bool", "int"],
            correctIndex: 0,
            explanation: "Future dönmelidir ki yenileme işlemi tamamlanana kadar dönen çark (spinner) ekranda kalsın.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u5_l6",
        title: "SingleChildScrollView & Klavye Taşma Çözümü",
        description: "Bottom overflowed hatasını önleme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u5_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Klavye açıldığında form elemanlarının sarı-siyah taşma hatası vermesini önlemenin en pratik yolu nedir?",
            options: ["Column'u SingleChildScrollView ile sarmalamak", "Klavyeyi kapatmak", "Fontu küçültmek", "Scaffold'u silmek"],
            correctIndex: 0,
            explanation: "SingleChildScrollView ekrana sığmayan içeriğe kaydırma özelliği kazandırır.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_6",
    unitNumber: 6,
    title: "Durum Yönetimi (State Management)",
    language: CodeLanguage.flutter,
    category: "State Management",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "Riverpod & State Management Hile Kağıdı",
    cheatSheetContent: r'''// Riverpod Provider
final counterProvider = StateProvider<int>((ref) => 0);

// UI Tarafında Okuma
class CounterText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider); // Rebuild tetikler
    return Text('$count');
  }
}

// Buton Tıklaması
ref.read(counterProvider.notifier).state++;''',
    lessons: [
      Lesson(
        id: "flutter_u6_l1",
        title: "State Management Neden Gereklidir?",
        description: "Prop drilling sorunu ve küresel durum yönetimi",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir veriyi 10 alt widget derine aktarmak için her ara widget'a parametre geçme zahmetine ne ad verilir?",
            options: ["Prop Drilling", "Hot Reload", "Tree Shaking", "Code Generation"],
            correctIndex: 0,
            explanation: "Prop drilling kod karmaşasına ve bakım zorluğuna yol açar; state management bu sorunu çözer.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u6_l2",
        title: "Flutter Riverpod: ref.watch vs ref.read",
        description: "Rebuild performansı ve doğru kullanım senaryoları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Riverpod Kuralı - ref.watch vs ref.read",
            rule: "Widget'ın build metodunda veriyi dinleyip UI'ı güncellemek için 'ref.watch' kullanılır. Buton onTap gibi olay dinleyicilerinde tek seferlik işlem için 'ref.read' kullanılır. Buton içine ref.watch ASLA yazılmaz!",
            codeExample: "onPressed: () => ref.read(provider.notifier).doSomething();",
            devTip: "ref.watch rebuild gerektiren yer içindir; buton click içinde ref.watch kullanırsan linter uyarısı alırsın.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "flutter_u6_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir butonun onPressed tıklama metodunda bir state'i değiştirmek için hangisi kullanılmalıdır?",
            options: ["ref.read", "ref.watch", "ref.listen", "ref.refresh"],
            correctIndex: 0,
            explanation: "Olay işleyicilerinde tek seferlik erişim için ref.read kullanılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u6_l3",
        title: "StateNotifier & StateNotifierProvider",
        description: "Karmaşık durum mantığını izole etme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "StateNotifier sınıfında durumu güncellemek için dahili hangi değişkene yeni değer atanır?",
            options: ["state", "value", "data", "notify()"],
            correctIndex: 0,
            explanation: "StateNotifier'da 'state = yeniDurum;' atandığı an dinleyiciler otomatik haberdar olur.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u6_l4",
        title: "FutureProvider & AsyncValue",
        description: "Yükleniyor, Hata ve Veri durumlarını (.when) yönetme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Riverpod AsyncValue nesnesini UI'da loading, error ve data durumlarına güvenle ayırmak için ne kullanılır?",
            options: ["asyncValue.when(data: ..., error: ..., loading: ...)", "switch (type)", "if (hasData)", "try-catch"],
            correctIndex: 0,
            explanation: ".when() pattern matching ile tüm durumların ele alınmasını zorunlu kılar ve crash'leri önler.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u6_l5",
        title: "ChangeNotifier & ValueNotifier",
        description: "Flutter yerleşik durum sınıfları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "ChangeNotifier sınıfında değişiklik olduğunu dinleyicilere bildirmek için hangi metot çağrılır?",
            options: ["notifyListeners()", "setState()", "update()", "emit()"],
            correctIndex: 0,
            explanation: "notifyListeners() tüm aktif dinleyicileri tetikler.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u6_l6",
        title: "ProviderScope & Uygulama Kökü",
        description: "Riverpod ağacını ayağa kaldırma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u6_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Riverpod'un çalışabilmesi için main() fonksiyonunda MaterialApp hangi widget ile sarmalanmalıdır?",
            options: ["ProviderScope", "MultiProvider", "RiverpodApp", "Container"],
            correctIndex: 0,
            explanation: "ProviderScope tüm provider durumlarının depolandığı kök konteynerdir.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_7",
    unitNumber: 7,
    title: "Navigasyon & Rotalar (Routing)",
    language: CodeLanguage.flutter,
    category: "Navigasyon & Rotalar",
    colorHex: 0xFF02569B,
    cheatSheetTitle: "Navigasyon Hile Kağıdı",
    cheatSheetContent: r'''// Yeni Sayfaya Geçiş
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const DetailScreen()),
);

// Geri Dönüş
Navigator.pop(context, 'Sonuç');

// Geri Dönüşsüz Geçiş (Login -> Home)
Navigator.pushReplacement(context, MaterialPageRoute(...));''',
    lessons: [
      Lesson(
        id: "flutter_u7_l1",
        title: "Navigator.push & Navigator.pop",
        description: "Yığın (Stack) mantığı ile sayfa geçişleri",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir sayfadan önceki sayfaya geri dönmek için hangi metot çağrılır?",
            options: ["Navigator.pop(context)", "Navigator.back()", "Navigator.remove()", "Navigator.close()"],
            correctIndex: 0,
            explanation: "Navigator.pop navigasyon yığınının en üstündeki rotayı çıkarır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u7_l2",
        title: "pushReplacement & Giriş Ekranı Senaryosu",
        description: "Giriş yaptıktan sonra geri basınca login'e dönmeyi engelleme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Kullanıcı başarılı giriş yaptığında mevcut login ekranını yığından silip ana ekrana geçmek için ne kullanılır?",
            options: ["Navigator.pushReplacement()", "Navigator.push()", "Navigator.pop()", "Navigator.canPop()"],
            correctIndex: 0,
            explanation: "pushReplacement geçerli rotayı yenisiyle değiştirir, kullanıcı geri basınca tekrar giriş ekranına dönemez.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u7_l3",
        title: "Named Routes & Parametre Aktarımı",
        description: "onGenerateRoute ve route argümanları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "İsimlendirilmiş bir rotaya argüman göndermek için pushNamed'in hangi parametresi kullanılır?",
            options: ["arguments", "params", "extra", "data"],
            correctIndex: 0,
            explanation: "Navigator.pushNamed(context, '/detay', arguments: veri); şeklinde aktarılır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u7_l4",
        title: "PopScope & Geri Tuşu Yakalama",
        description: "Kullanıcının uygulamadan çıkmasını veya formu kaybetmesini önleme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Flutter 3.16+ ile WillPopScope yerine gelen modern geri tuşu engelleme/onaylama widget'ı hangisidir?",
            options: ["PopScope", "WillPopScope", "BackListener", "ExitInterceptor"],
            correctIndex: 0,
            explanation: "PopScope (canPop: false, onPopInvoked) yeni Flutter standart API'sidir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u7_l5",
        title: "GoRouter & Bildirimsel (Declarative) Routing",
        description: "Web URL desteği, derin bağlantılar (Deep links)",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "Flutter resmi ekibinin geliştirdiği deklaratif URL ve derin link uyumlu rota paketi hangisidir?",
            options: ["go_router", "auto_route", "get", "fluro"],
            correctIndex: 0,
            explanation: "go_router Flutter ekibinin desteklediği modern yönlendirme paketidir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u7_l6",
        title: "BottomNavigationBar ile Sekmeli Rotalar",
        description: "IndexedStack kullanarak sayfa durumunu koruma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u7_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Alt sekme çubuğunda sekmeler arası geçiş yaparken sayfaların yeniden yüklenmeyip durumlarını koruması için ne kullanılır?",
            options: ["IndexedStack", "Column", "PageView", "ListBody"],
            correctIndex: 0,
            explanation: "IndexedStack tüm sayfaları bellekte tutar ve sadece aktif olanı gösterir.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_8",
    unitNumber: 8,
    title: "Ağ İstekleri, HTTP & JSON Serileştirme",
    language: CodeLanguage.flutter,
    category: "Ağ İstekleri & JSON",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "HTTP & JSON Hile Kağıdı",
    cheatSheetContent: r'''// JSON Dönüştürme
final response = await http.get(Uri.parse('https://api.dev/users'));
if (response.statusCode == 200) {
  final Map<String, dynamic> data = jsonDecode(response.body);
  final user = User.fromJson(data);
}''',
    lessons: [
      Lesson(
        id: "flutter_u8_l1",
        title: "http Paketi & GET/POST İstekleri",
        description: "REST API ile veri çekme ve gönderme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir REST API'ye GET isteği göndermek için http paketinde URL nasıl oluşturulur?",
            options: ["Uri.parse('https://api.com/data')", "String url", "URL('...')", "HttpUri()"],
            correctIndex: 0,
            explanation: "http paketinde adresler Uri tipinde verilir; Uri.parse('...') ile dönüştürülür.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u8_l2",
        title: "jsonDecode & jsonEncode",
        description: "dart:convert kütüphanesi",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Gelen ham JSON string metnini Map veya List nesnesine dönüştürmek için hangi fonksiyon kullanılır?",
            options: ["jsonDecode()", "jsonEncode()", "JSON.stringify()", "parseJSON()"],
            correctIndex: 0,
            explanation: "jsonDecode() string veriyi Dart Map/List nesnesine ayrıştırır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u8_l3",
        title: "Model Sınıfları & fromJson Factory",
        description: "Tip güvenli veri modelleri üretme",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "Dart'ta Map verisinden nesne üreten yapıcı metot (constructor) kalıbı genelde nasıl adlandırılır?",
            options: ["factory Sınıf.fromJson(Map<String, dynamic> json)", "Sınıf.create(json)", "Sınıf.build()", "void parse(json)"],
            correctIndex: 0,
            explanation: "factory Sınıf.fromJson() Dart ekosisteminin standart deserialization desenidir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u8_l4",
        title: "FutureBuilder Widget'ı",
        description: "Asenkron veriyi UI'a bağlama ve ConnectionState",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "FutureBuilder içinde veri henüz gelmediğinde yükleniyor durumunu kontrol etmek için ne kontrol edilir?",
            options: ["snapshot.connectionState == ConnectionState.waiting", "snapshot.isBusy", "snapshot.data == null", "future.isLoading"],
            correctIndex: 0,
            explanation: "ConnectionState.waiting veri beklendiğini gösterir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u8_l5",
        title: "Hata Yönetimi & HTTP Durum Kodları",
        description: "401, 404, 500 yakalama ve try-catch blokları",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "İstemcinin yetkisiz olduğunu veya token'ın geçersiz olduğunu bildiren HTTP durum kodu hangisidir?",
            options: ["401 Unauthorized", "200 OK", "404 Not Found", "500 Server Error"],
            correctIndex: 0,
            explanation: "401 kimlik doğrulanamadığında döner.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u8_l6",
        title: "Dio Paketi & Interceptor'lar",
        description: "İstekleri otomatik token ile zenginleştirme ve loglama",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u8_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Her API isteğine otomatik olarak 'Authorization: Bearer <token>' başlığı eklemek için Dio'da ne kullanılır?",
            options: ["Interceptor (Araya girici)", "Transformer", "CookieJar", "HttpClientAdapter"],
            correctIndex: 0,
            explanation: "Interceptor istek ve yanıtları araya girerek modifiye etmeyi sağlar.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_9",
    unitNumber: 9,
    title: "Animasyonlar & Slivers Mimarisi",
    language: CodeLanguage.flutter,
    category: "Animasyonlar & Slivers",
    colorHex: 0xFF02569B,
    cheatSheetTitle: "Animasyonlar Hile Kağıdı",
    cheatSheetContent: r'''// Implicit (Örtük) Animasyon
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  width: isExpanded ? 200 : 100,
  color: isExpanded ? Colors.blue : Colors.grey,
);

// Hero Animasyonu
Hero(
  tag: 'profile_pic',
  child: Image.asset('avatar.png'),
);''',
    lessons: [
      Lesson(
        id: "flutter_u9_l1",
        title: "Implicit Animasyonlar: AnimatedContainer & AnimatedOpacity",
        description: "Controller gerektirmeyen pratik geçişler",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l1_q1",
            type: QuestionType.multipleChoice,
            prompt: "Sadece durum değiştiğinde boyut ve renk geçişini otomatik anime eden widget hangisidir?",
            options: ["AnimatedContainer", "Container", "Transform", "Align"],
            correctIndex: 0,
            explanation: "AnimatedContainer verilen duration süresinde özellikleri yumuşakça anime eder.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u9_l2",
        title: "Explicit Animasyonlar: AnimationController & TickerProvider",
        description: "vsync: this ve SingleTickerProviderStateMixin",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "AnimationController oluştururken ekran yenileme hızıyla (60/120 Hz) senkron olmak için State sınıfına hangi mixin eklenir?",
            options: ["SingleTickerProviderStateMixin", "ChangeNotifier", "AutomaticKeepAliveClientMixin", "WidgetsBindingObserver"],
            correctIndex: 0,
            explanation: "SingleTickerProviderStateMixin ekranın her karesinde ticker darbesi sağlar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u9_l3",
        title: "Hero Widget: Ekranlar Arası Paylaşılan Eleman",
        description: "Liste öğesinden detay ekranına uçuş animasyonu",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "İki farklı sayfadaki görseli birbirine bağlayıp geçiş sırasında uçurmak için her iki sayfada da ne aynı olmalıdır?",
            options: ["Hero widget'ının 'tag' değeri", "Widget'ın genişliği", "Sayfa isimleri", "Key değeri"],
            correctIndex: 0,
            explanation: "Hero widget'ı eşleştirmeyi benzersiz 'tag' parametresi üzerinden yapar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u9_l4",
        title: "CustomScrollView & Slivers Mimarisi",
        description: "Katlanan başlıklar (SliverAppBar) ve karma kaydırma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Aşağı kaydırıldığında küçülen ve yukarı kaydırıldığında genişleyen esnek başlık için hangi widget kullanılır?",
            options: ["SliverAppBar", "AppBar", "CustomAppBar", "HeaderWidget"],
            correctIndex: 0,
            explanation: "SliverAppBar CustomScrollView içinde esnek, daralan başlıklar oluşturur.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u9_l5",
        title: "CurvedAnimation & Tween",
        description: "Doğrusal olmayan hız eğrileri (Curves.easeInOut)",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "0.0 ile 1.0 arasındaki kontrolcü değerini örneğin 50.0 ile 200.0 piksele dönüştürmek için ne kullanılır?",
            options: ["Tween<double>(begin: 50.0, end: 200.0)", "CurvedAnimation", "ScaleTransition", "Matrix4"],
            correctIndex: 0,
            explanation: "Tween iki değer arasındaki geçiş aralığını tanımlar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u9_l6",
        title: "Lottie & Rive Vektör Animasyonları",
        description: "After Effects JSON dosyalarını Flutter'da oynatma",
        xpReward: 40,
        gemReward: 15,
        questions: [
          Question(
            id: "flutter_u9_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "After Effects'ten dışa aktarılan JSON tabanlı vektörel animasyonları oynatmak için en popüler paket hangisidir?",
            options: ["lottie", "rive", "flame", "video_player"],
            correctIndex: 0,
            explanation: "lottie paketi bodymovin JSON animasyonlarını yüksek performansla oynatır.",
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "flutter_unit_10",
    unitNumber: 10,
    title: "Performans, Optimizasyon & Platform Kanalları",
    language: CodeLanguage.flutter,
    category: "İleri Seviye & Performans",
    colorHex: 0xFF02569B,
    cheatSheetTitle: "Performans & Optimizasyon Hile Kağıdı",
    cheatSheetContent: r'''// 1. const Kullanımı (Rebuild Önleme)
const Text('Sabit Başlık');

// 2. RepaintBoundary ile Boyama İzolasyonu
RepaintBoundary(
  child: AgirCizimWidget(),
);

// 3. Platform Kanalları
const platform = MethodChannel('com.example.app/battery');
final int battery = await platform.invokeMethod('getBatteryLevel');''',
    lessons: [
      Lesson(
        id: "flutter_u10_l1",
        title: "const Constructor Kullanımının Önemi",
        description: "Rebuild sayısını azaltma ve bellek optimizasyonu",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "const Optimizasyonu - Hap Bilgi",
            rule: "Flutter'da 'const' ile işaretlenen widget'lar derleme zamanında tek bir örnek (canonicalized instance) olarak belleğe alınır. Parent widget ne kadar setState yaparsa yapsın, const widget'lar asla baştan çizilmez (rebuild edilmez)!",
            codeExample: "const SizedBox(height: 16);",
            devTip: "VS Code veya Android Studio'da 'prefer_const_constructors' linter kuralını her zaman açık tut.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "flutter_u10_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Flutter'da const anahtar kelimesiyle oluşturulan widget'lar hakkında hangisi doğrudur?",
            options: [
              "Parent widget rebuild edildiğinde const widget'lar yeniden oluşturulmaz, bellek ve CPU korunur.",
              "Sadece Android cihazlarda çalışır.",
              "const widget'lar arka planda thread açar.",
              "Uygulamanın APK boyutunu iki katına çıkarır."
            ],
            correctIndex: 0,
            explanation: "const nesneler derleme zamanında sabitlenir ve rebuild zincirinden muaf tutulur.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l2",
        title: "RepaintBoundary ile Çizim İzolasyonu",
        description: "Ağır widget'ların gereksiz yeniden boyanmasını önleme",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l2_q1",
            type: QuestionType.multipleChoice,
            prompt: "Sürekli hareket eden bir animasyonun etrafındaki diğer sabit widget'ları boyamasını (repaint) engellemek için ne kullanılır?",
            options: ["RepaintBoundary", "Offstage", "Visibility", "BackdropFilter"],
            correctIndex: 0,
            explanation: "RepaintBoundary çizim katmanını izole eder; animasyon sadece kendi katmanını boyar.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l3",
        title: "Flutter DevTools & Profiler Kullanımı",
        description: "Jank (kare atlaması), bellek sızıntıları ve FPS takibi",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l3_q1",
            type: QuestionType.multipleChoice,
            prompt: "Bir animasyonun 60 FPS akıcı çalışabilmesi için bir karenin (frame) en fazla kaç milisaniyede çizilmesi gerekir?",
            options: ["16.6 ms", "33.3 ms", "100 ms", "5 ms"],
            correctIndex: 0,
            explanation: "1000 ms / 60 FPS = ~16.6 ms. Bu süreyi aşan kareler jank (takılma) yaratır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l4",
        title: "MethodChannel: Yerel Kodla İletişim (Kotlin/Swift)",
        description: "Java/Kotlin ve Objective-C/Swift ile mesajlaşma",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l4_q1",
            type: QuestionType.multipleChoice,
            prompt: "Flutter ile yerel Android (Kotlin) veya iOS (Swift) kodu arasında iki yönlü asenkron metot çağırmak için ne kullanılır?",
            options: ["MethodChannel", "BasicMessageChannel", "EventChannel", "JNI Bridge"],
            correctIndex: 0,
            explanation: "MethodChannel isim bazlı metot çağrılarını platform katmanına iletir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l5",
        title: "Isolates & compute() ile Ağır İş Parçacıkları",
        description: "Ağır JSON parse ve şifreleme işlemlerinde UI'ın donmasını önleme",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l5_q1",
            type: QuestionType.multipleChoice,
            prompt: "Çok büyük bir JSON verisini parse ederken ekran animasyonunun takılmasını önlemek için ne kullanılır?",
            options: ["compute(parseFonksiyonu, veri)", "await Future.delayed()", "Timer.periodic()", "setState()"],
            correctIndex: 0,
            explanation: "compute() işlemi ayrı bir Dart Isolate'inde (ayrı bellekli thread) çalıştırır ve ana UI thread'ini rahatlatır.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l6",
        title: "Release Derleme & Tree Shaking",
        description: "Kod küçültme, kullanılmayan ikonların atılması ve imzalama",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l6_q1",
            type: QuestionType.multipleChoice,
            prompt: "Flutter release derleme sırasında kullanılmayan ikon ve kodları paketten atma sürecine ne ad verilir?",
            options: ["Tree Shaking", "Hot Restart", "AOT Derleme", "JIT Derleme"],
            correctIndex: 0,
            explanation: "Tree Shaking kullanılmayan varlıkları ve ölü kodları temizleyerek APK/IPA boyutunu küçültür.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l7",
        title: "Cross-Platform Farklılıkları (Android, iOS & Web)",
        description: "Platform.isAndroid vs kIsWeb kontrolleri",
        xpReward: 45,
        gemReward: 20,
        questions: [
          Question(
            id: "flutter_u10_l7_q1",
            type: QuestionType.multipleChoice,
            prompt: "Kodun web ortamında çalışıp çalışmadığını güvenle kontrol etmek için hangi bayrak kullanılır?",
            options: ["kIsWeb", "Platform.isWeb", "Environment.web", "kDebugMode"],
            correctIndex: 0,
            explanation: "kIsWeb sabit boolean bayrağıdır; Platform.isAndroid webde çağrılırsa hata verir.",
          ),
        ],
      ),
      Lesson(
        id: "flutter_u10_l8",
        title: "Bitirme Projesi & Flutter Mimar Ustalık Sınavı",
        description: "Widget ağacı, state, ağ ve performansın ortak değerlendirmesi",
        xpReward: 100,
        gemReward: 50,
        isUnitExam: true,
        questions: [
          Question(
            id: "flutter_u10_l8_q1",
            type: QuestionType.multipleChoice,
            prompt: "Büyük ölçekli bir Flutter uygulamasında yüksek performans ve temiz mimari için hangisi önerilir?",
            options: [
              "Küçük ve const widget'lara bölmek, iş mantığını state sınıflarına ayırmak ve ağır işleri Isolate'e vermek.",
              "Her şeyi tek bir 5000 satırlık StatefulWidget içinde toplamak.",
              "Tüm verileri Global değişkenlerde tutup her saniye setState çağırmak.",
              "Hiç model sınıfı kullanmadan dinamik Map ile çalışmak."
            ],
            correctIndex: 0,
            explanation: "Modülerlik, const kullanımı ve state izolasyonu profesyonel Flutter mimarisinin temel taşlarıdır.",
          ),
        ],
      ),
    ],
  ),
];
