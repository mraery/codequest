# -*- coding: utf-8 -*-
"""
Master Knowledge Base Part 2: Python, C#, and Kotlin
Deep technical questions, realistic code snippets, and comprehensive explanations.
"""

# ==========================================
# 4. PYTHON QUEST KNOWLEDGE BASE
# ==========================================
def get_python_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Modern Python dünyasında '{title}' konusu, okunabilir, Pythonic ve yüksek verimli kod yazmanın temelini oluşturur. Python dinamik ama katı tipli (strongly typed) bir dildir.",
        "codeExample": "# Pythonic Veri İşleme\nnums = [1, 2, 3, 4, 5, 6]\nevens_squared = [x**2 for x in nums if x % 2 == 0]\nprint(evens_squared)  # [4, 16, 36]",
        "devTip": "Büyük veri listelerinde bellek tüketimini düşürmek için köşeli parantez [ ] yerine normal parantez ( ) kullanarak Generator Expression oluşturun.",
        "mc": [
            {
                "prompt": "Python'da liste üreteçleri (List Comprehension) kullanmanın geleneksel 'for' döngüsüne göre temel avantajı nedir?",
                "code": "squares = [x*x for x in range(1000)]",
                "correct": "C seviyesinde optimize edildiği için hem daha hızlıdır hem de daha kısa ve okunabilir sentaks sunar.",
                "distractors": [
                    "Sonsuz eleman tutabilir ve hiç bellek tüketmez.",
                    "Sadece tamsayılar üzerinde çalışır, string kabul etmez.",
                    "Tüm elemanları diskteki geçici bir dosyaya yazar."
                ],
                "explanation": "List Comprehension, Python bytecode seviyesinde LIST_APPEND talimatını doğrudan optimize ederek 'for' döngüsü ve .append() çağrısına göre çok daha hızlı çalışır."
            },
            {
                "prompt": "Büyük bir veri kümesini belleğe tek seferde yüklemeden parça parça üretmek için ne kullanılır?",
                "code": "def stream_data():\n    for i in range(1000000):\n        _____ i",
                "correct": "yield (Fonksiyonu bir Generator nesnesine dönüştürür).",
                "distractors": ["return (Fonksiyonu tek seferde sonlandırır)", "break", "pass"],
                "explanation": "'yield' anahtar kelimesi fonksiyonun durumunu dondurur ve her 'next()' çağrıldığında bir sonraki elemanı üretir; bellek tüketimini O(1) seviyesinde tutar."
            },
            {
                "prompt": "Python'da bir fonksiyonun davranışını kaynak kodunu değiştirmeden genişletmek için hangi yapı kullanılır?",
                "code": "@timer\ndef calculate_fibonacci(n):\n    pass",
                "correct": "Dekoratörler (Decorators - Bir fonksiyonu argüman alıp yeni fonksiyon dönen sarmalayıcı).",
                "distractors": ["Miras alma (Inheritance)", "Metot ezme (Overriding)", "Kalıtım operatörü"],
                "explanation": "Dekoratörler (@syntax), fonksiyonları sarmalayarak logging, yetkilendirme veya performans ölçümü gibi çapraz kesişen (cross-cutting) işlevleri temiz bir şekilde ekler."
            },
            {
                "prompt": "Python sözlüklerinde (dict) 'd.get(\"key\", default)' kullanmanın 'd[\"key\"]' erişimine göre avantajı nedir?",
                "code": "val = user_data.get(\"email\", \"bilgi_yok\")",
                "correct": "Anahtar sözlükte yoksa 'KeyError' hatası fırlatmak yerine güvenle varsayılan değeri döner.",
                "distractors": [
                    "Sözlüğü arka planda otomatik olarak günceller.",
                    "Anahtar yoksa programı anında kapatır.",
                    "Erişim süresini iki katına çıkarır."
                ],
                "explanation": "'dict.get()' anahtar bulunamadığında KeyError fırlatmaz, belirtilen varsayılan değeri (veya None) dönerek hata yönetimini kolaylaştırır."
            },
            {
                "prompt": "Dosya açma veya veritabanı bağlantısı gibi kaynakları otomatik kapatmak için hangi Python yapısı kullanılır?",
                "code": "with open(\"data.csv\", \"r\") as f:\n    content = f.read()",
                "correct": "Context Manager ('with' ifadesi ve __enter__ / __exit__ metotları).",
                "distractors": ["try-except bloğu tek başına", "while döngüsü", "lambda fonksiyonu"],
                "explanation": "'with' bloğu çıkışında hata olsa dahi '__exit__' metodunu garantili çalıştırarak dosya tanıtıcılarını ve kilitleri otomatik kapatır."
            },
            {
                "prompt": "Python'da bir nesnenin konsolda okunabilir string temsilini ve hata ayıklama çıktısını tanımlayan özel metotlar hangileridir?",
                "code": "class Dev:\n    def __str__(self): ...\n    def __repr__(self): ...",
                "correct": "__str__ kullanıcı odaklı okunabilir metin, __repr__ ise geliştirici ve hata ayıklayıcı odaklı kesin temsil sunar.",
                "distractors": [
                    "İkisi de tamamen aynıdır, fark yoktur.",
                    "__str__ belleği temizler, __repr__ ekrana yazar.",
                    "__str__ sadece sayılar içindir."
                ],
                "explanation": "'__str__' son kullanıcıya (print) dostça görünüm sağlarken, '__repr__' nesneyi yeniden oluşturabilecek teknik detayı (debug konsolu) sağlar."
            },
            {
                "prompt": "Aşağıdaki kod parçası çalıştırıldığında ne çıktı üretir?",
                "code": "def add_item(item, lst=[]):\n    lst.append(item)\n    return lst\n\nprint(add_item(1))\nprint(add_item(2))",
                "correct": "[1] ve ardından [1, 2] (Çünkü varsayılan argümanlar fonksiyon tanımlandığında tek bir kez oluşturulur).",
                "distractors": [
                    "[1] ve [2] (Her çağrıda yeni liste oluşur)",
                    "[1] ve [1]",
                    "TypeError hatası"
                ],
                "explanation": "Python'da mutable (değiştirilebilir) nesneler varsayılan parametre olarak verilirse, tüm çağrılar aynı nesneyi paylaşır. Çözüm 'lst=None' yapmaktır."
            },
            {
                "prompt": "Python 3.10 ile gelen yapısal desen eşleme (Structural Pattern Matching) sözdizimi hangisidir?",
                "code": "match status_code:\n    case 200: return 'OK'\n    case 404: return 'Not Found'\n    case _: return 'Bilinmiyor'",
                "correct": "match ... case sözdizimi.",
                "distractors": ["switch ... case", "select ... case", "when ... then"],
                "explanation": "Python 3.10+, diğer dillerdeki basit switch-case'lerin çok ötesinde, nesne tipleri ve veri yapısı kalıplarını ayrıştıran 'match-case' yeteneği sunar."
            },
            {
                "prompt": "Asenkron Python (asyncio) dünyasında eşzamanlı olarak birden çok görevi başlatıp beklemek için ne kullanılır?",
                "code": "results = await asyncio._____(task1(), task2(), task3())",
                "correct": "gather",
                "distractors": ["all", "wait_all", "join"],
                "explanation": "'asyncio.gather(*coroutines)' tüm verilen coroutine'leri aynı olay döngüsünde eşzamanlı çalıştırır ve sonuçları liste olarak döner."
            },
            {
                "prompt": "Python'da 'is' operatörü ile '==' operatörü arasındaki kritik fark nedir?",
                "code": "a = [1, 2, 3]\nb = [1, 2, 3]\nprint(a == b, a is b)",
                "correct": "'==' değerlerin eşitliğini (equality) kontrol eder, 'is' ise nesnelerin bellek kimliğinin (identity / id) aynı olup olmadığını kontrol eder.",
                "distractors": [
                    "İkisi de tamamen aynı kontrolü yapar.",
                    "'is' sadece stringler için çalışır.",
                    "'==' bellek adresini kıyaslar."
                ],
                "explanation": "Örnekte 'a == b' True verir (içerikler eşit), ancak 'a is b' False verir çünkü bellekte iki bağımsız liste nesnesi tahsis edilmiştir."
            },
            {
                "prompt": "Python'da sınıflarda '__slots__' kullanmanın birincil amacı nedir?",
                "code": "class Point:\n    __slots__ = ('x', 'y')",
                "correct": "Her nesne için dahili '__dict__' sözlüğü oluşturulmasını engelleyerek RAM tüketimini büyük ölçüde düşürmek.",
                "distractors": [
                    "Sınıfın fonksiyon yazmasını engellemek.",
                    "Sınıfı JSON dosyasına dönüştürmek.",
                    "Çoklu kalıtımı zorunlu kılmak."
                ],
                "explanation": "Milyonlarca küçük nesne üretildiğinde '__slots__', dinamik öznitelik sözlüğünü iptal ederek nesne başına yüzlerce bayt bellek tasarrufu sağlar."
            },
            {
                "prompt": "Python'da lambda fonksiyonlarının temel kısıtı nedir?",
                "code": "square = lambda x: x ** 2",
                "correct": "Yalnızca tek bir ifade (single expression) içerebilir; çok satırlı deyimler ve döngüler barındıramaz.",
                "distractors": [
                    "Sadece bir kez çağrılabilir, sonra silinir.",
                    "Asla parametre alamaz.",
                    "Sayısal değer döndüremez."
                ],
                "explanation": "Lambda'lar tek satırlık anonim fonksiyonlardır. 'if-else' ternary içerebilir ancak döngü, try-except gibi karmaşık deyimler içeremez."
            },
            {
                "prompt": "Python'da 'shallow copy' (yüzeysel kopya) ile 'deep copy' (derin kopya) farkı nedir?",
                "code": "import copy\nlst2 = copy.deepcopy(lst1)",
                "correct": "Shallow copy sadece dış listeyi kopyalar (iç içe nesneler referans kalır), deepcopy ise iç içe tüm nesneleri yinelemeli olarak bağımsız kopyalar.",
                "distractors": [
                    "Deepcopy sadece sayıları kopyalar.",
                    "Shallow copy orijinal listeyi tamamen siler.",
                    "Aralarında hiçbir performans veya mantık farkı yoktur."
                ],
                "explanation": "İçinde liste veya sözlük barındıran bir yapıda '.copy()' yapılırsa içteki nesneler paylaşılır. Tam bağımsızlık için 'copy.deepcopy()' gerekir."
            },
            {
                "prompt": "Bir koleksiyonda elemanların frekansını (kaç kez geçtiğini) en pratik şekilde saymak için hangi standart kütüphane kullanılır?",
                "code": "from collections import Counter\ncounts = Counter(['elma', 'armut', 'elma'])",
                "correct": "collections.Counter sınıfı.",
                "distractors": ["itertools.count", "sys.counter", "math.frequency"],
                "explanation": "'Counter' listeyi tek adımda eleman-frekans sözlüğüne dönüştürür ve '.most_common(n)' gibi güçlü metotlar sunar."
            },
            {
                "prompt": "Python'da 'GIL' (Global Interpreter Lock) neyi ifade eder?",
                "code": "# Python CPython Çoklu İş Parçacığı Mimarisi",
                "correct": "CPython'da aynı anda sadece tek bir yerel iş parçacığının (thread) Python bytecode'u çalıştırmasını sağlayan bir kilit mekanizmasıdır.",
                "distractors": [
                    "İnternet bağlantısını kilitleyen bir güvenlik kuralıdır.",
                    "Sadece dosya yazma işlemlerini kısıtlar.",
                    "Python'da döngülerin 1000'den fazla dönmesini engeller."
                ],
                "explanation": "GIL yüzünden CPU-yoğun görevlerde threading gerçek paralellik sağlamaz; bu senaryolarda 'multiprocessing' kullanılması gerekir."
            },
            {
                "prompt": "Fonksiyonlara değişken sayıda isimlendirilmiş argüman geçirmek için kullanılan sözdizimi hangisidir?",
                "code": "def configure(**kwargs):",
                "correct": "**kwargs (Sözlük olarak fonksiyon içine aktarılır).",
                "distractors": ["*args (Tuple olarak aktarılır)", "&kwargs", "$kwargs"],
                "explanation": "'*args' pozisyonel argümanları bir tuple'da toplarken, '**kwargs' anahtar-değer çiftlerini bir Python sözlüğünde toplar."
            }
        ],
        "fib": [
            ("Çift sayıları filtrelemek için '[x for x in nums if x % 2 _____ 0]' yazılır.", "==", ["=", "!=", "is"], "Eşitlik kontrolü '==' operatörü ile yapılır."),
            ("Jeneratör fonksiyonlarında değer üretmek için 'return' yerine '_____' kullanılır.", "yield", ["produce", "send", "defer"], "'yield' jeneratör üretir."),
            ("Dosyayı otomatik kapatmak için '_____ open(\"test.txt\") as f:' yazılır.", "with", ["using", "open", "file"], "'with' context manager başlatır."),
            ("Asenkron bir fonksiyon tanımlamak için başına '_____ def' eklenir.", "async", ["await", "thread", "task"], "'async def' coroutine fonksiyonu tanımlar.")
        ],
        "tf": [
            ("Python'da tuple'lar değiştirilemez (immutable), listeler ise değiştirilebilir (mutable) veri tipleridir.", True, "Tuple elemanları oluşturulduktan sonra değiştirilemez, sözlük anahtarı olarak güvenle kullanılabilir."),
            ("Python'da varsayılan parametreler her fonksiyon çağrıldığında yeniden oluşturulur.", False, "Varsayılan argümanlar modül derlenirken sadece 1 kez oluşturulur; mutable nesneler ortak paylaşılır.")
        ],
        "mat1": [
            ("List", "Sıralı, indekslenebilir, değiştirilebilir koleksiyon [ ]"),
            ("Tuple", "Sıralı, değiştirilemez, sabit koleksiyon ( )"),
            ("Set", "Sırasız, benzersiz elemanlar tutan küme { }"),
            ("Dict", "Anahtar-değer (Key-Value) çiftleriyle çalışan harita {k: v}")
        ],
        "mat2": [
            ("map()", "Fonksiyonu dizinin her elemanına uygular"),
            ("filter()", "Koşulu sağlayan elemanları filtreler"),
            ("zip()", "İki veya daha çok koleksiyonu paralel eşleştirir"),
            ("enumerate()", "Elemanları indeks numaralarıyla birlikte döner")
        ]
    }


# ==========================================
# 5. C# & .NET KNOWLEDGE BASE
# ==========================================
def get_csharp_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"C# ve .NET 8 dünyasında '{title}' mimarisi, kurumsal düzeyde ölçeklenebilir, tip güvenli ve yüksek performanslı yazılımlar inşa etmeyi hedefler.",
        "codeExample": "public record Developer(string Name, int Experience);\n\nvar seniors = developers\n    .Where(d => d.Experience >= 5)\n    .OrderBy(d => d.Name)\n    .ToList();",
        "devTip": "LINQ sorgularında ToList() çağırmadıkça sorgu çalıştırılmaz (Deferred Execution). Gereksiz döngüleri önlemek için sorguyu tüketmeden filtreleri zincirleyin.",
        "mc": [
            {
                "prompt": "C#'ta Değer Tipleri (Value Types) ile Referans Tipleri (Reference Types) bellek yerleşimi açısından nasıl ayrışır?",
                "code": "int a = 10; // Value Type\nstring s = \"Code\"; // Reference Type",
                "correct": "Değer tipleri doğrudan Stack'te saklanırken, referans tiplerinin verisi Heap'te tutulur ve Stack'te nesnenin adresi (pointer) yer alır.",
                "distractors": [
                    "İkisi de tamamen Stack'te saklanır.",
                    "İkisi de diskteki sanal belleğe yazılır.",
                    "Referans tipleri bellekte hiç yer tutmaz."
                ],
                "explanation": "Struct ve int gibi değer tipleri Stack'te saklanır; class ve string gibi referans tiplerinin gerçek gövdesi Garbage Collector yönetimindeki Heap'te yaşar."
            },
            {
                "prompt": "C#'ta LINQ sorgularının 'Deferred Execution' (Ertelenmiş Çalışma) özelliği ne anlama gelir?",
                "code": "var query = db.Users.Where(u => u.IsActive);\n// Sorgu henüz veritabanına gitmedi!",
                "correct": "Sorgu tanımlandığı anda değil, foreach, ToList() veya Count() gibi tetikleyicilerle tüketildiği anda çalıştırılır.",
                "distractors": [
                    "Sorgunun çalışması için programın yeniden başlatılması gerekir.",
                    "Sorgu sadece arka planda hata yakalamak için ertelenir.",
                    "C# LINQ sorgularını asla çalıştırmaz."
                ],
                "explanation": "Deferred execution sayesinde sorguya yeni filtreler zincirlenebilir ve veritabanına sadece en optimize edilmiş tek bir SQL gönderilir."
            },
            {
                "prompt": "C# 9+ ile gelen 'record' türünün standart 'class' türüne göre temel farkı nedir?",
                "code": "public record User(int Id, string Username);",
                "correct": "Varsayılan olarak değer tabanlı eşitlik (Value-based equality) ve değişmezlik (Immutability) desteği sunması.",
                "distractors": [
                    "Sadece statik değişken tanımlayabilmesi.",
                    "Bellekte hiç yer kaplamaması.",
                    "C# derleyicisi tarafından desteklenmeyen bir ön ek olması."
                ],
                "explanation": "İki record nesnesi farklı bellek adreslerinde olsa bile tüm alanları eşitse '==' True döner. Ayrıca 'with' ifadesiyle kopyalama sunar."
            },
            {
                "prompt": "Asenkron metotlarda 'async' ve 'await' kullanılırken arka planda ne oluşturulur?",
                "code": "public async Task<string> FetchDataAsync() {\n    return await httpClient.GetStringAsync(url);\n}",
                "correct": "Derleyici tarafından bir Durum Makinesi (State Machine - IAsyncStateMachine) üretilir.",
                "distractors": [
                    "Yeni bir işletim sistemi çekirdek iş parçacığı (kernel thread) ayrılır.",
                    "Tüm program kilitlenir ve donar.",
                    "C# kodu doğrudan C++'a dönüştürülür."
                ],
                "explanation": "Derleyici 'async' metodu bir State Machine yapısına derler. Bekleme anında thread ThreadPool'a iade edilir ve işlem bitince devam eder."
            },
            {
                "prompt": ".NET Dependency Injection (DI) konteynerinde 'AddScoped' yaşam süresi neyi ifade eder?",
                "code": "builder.Services.AddScoped<IOrderService, OrderService>();",
                "correct": "Her HTTP isteği (request) başına tek bir nesne örneği oluşturulmasını ve o istek bitene kadar paylaşılmasını.",
                "distractors": [
                    "Uygulama boyunca tüm isteklerde tek bir nesne (Singleton).",
                    "Her enjekte edildiği yere her seferinde yeni bir nesne (Transient).",
                    "Veritabanında kalıcı olarak saklanan nesne."
                ],
                "explanation": "Scoped servisler (örneğin DbContext), bir web request boyunca aynı instance'ı paylaşır ve request tamamlandığında otomatik Dispose edilir."
            },
            {
                "prompt": "Yönetilmeyen kaynakları (Unmanaged resources) temizlemek için C#'ta hangi arayüz ve kalıp kullanılır?",
                "code": "public class FileLogger : IDisposable {\n    public void Dispose() { ... }\n}",
                "correct": "IDisposable arayüzü ve 'using' ifadesi.",
                "distractors": ["ICloneable arayüzü", "IEnumerable arayüzü", "IComparable arayüzü"],
                "explanation": "Dosya tanıtıcıları, soketler gibi Garbage Collector tarafından hemen temizlenemeyen kaynaklar 'IDisposable' ve 'using' ile deterministik serbest bırakılır."
            },
            {
                "prompt": "Boxing ve Unboxing işlemi C#'ta neden performans maliyeti oluşturur?",
                "code": "int val = 42;\nobject obj = val; // Boxing\nint num = (int)obj; // Unboxing",
                "correct": "Değer tipinin Heap'te yeni bir nesne olarak sarılması (alloc) ve sonrasında tür denetimiyle geri açılması sebebiyle GC baskısı yaratır.",
                "distractors": [
                    "İşlemcinin frekansını düşürür.",
                    "Sadece 32-bit sistemlerde çalışır.",
                    "Boxing işlemi hiçbir zaman belleği etkilemez."
                ],
                "explanation": "Boxing heap allocation ve garbage collection maliyeti getirir. Generics (List<T>) bu maliyeti ortadan kaldırmak için tasarlanmıştır."
            },
            {
                "prompt": "C# koleksiyonlarında 'IEnumerable<T>' ile 'IQueryable<T>' arasındaki en temel fark nedir?",
                "code": "IQueryable<User> q = db.Users.Where(u => u.Age > 18);",
                "correct": "IEnumerable filtrelemeyi bellekte (in-memory) yaparken, IQueryable filtrelemeyi SQL sorgusuna dönüştürüp veritabanında çalıştırır.",
                "distractors": [
                    "IEnumerable sadece veritabanı içindir.",
                    "IQueryable sadece dizilerde çalışır.",
                    "İkisi de tamamen aynı SQL kodunu üretir."
                ],
                "explanation": "IQueryable, Expression Tree (İfade Ağacı) yapısını kullanarak C# sorgusunu SQL SELECT ... WHERE şartına dönüştürür; gereksiz veri çekilmesini önler."
            },
            {
                "prompt": "C#'ta 'sealed' anahtar kelimesi bir sınıfa uygulandığında ne işe yarar?",
                "code": "public sealed class SecurityManager { }",
                "correct": "O sınıftan başka hiçbir sınıfın miras almasını (inheritance) engeller.",
                "distractors": [
                    "Sınıfın nesnesinin üretilmesini engeller.",
                    "Sınıfı şifreleyerek gizler.",
                    "Sınıfın sadece tek bir metodu olmasını sağlar."
                ],
                "explanation": "'sealed' sınıflar kalıtımı kapatır; derleyiciye sanal metot çağrılarını optimize etme (devirtualization) fırsatı vererek performans kazandırır."
            },
            {
                "prompt": "C#'ta bir nesnenin null olup olmadığını güvenli kontrol edip özelliğe erişmek için ne kullanılır?",
                "code": "string? name = user?.Profile?.FirstName ?? \"Misafir\";",
                "correct": "Null-conditional (?.) ve Null-coalescing (??) operatörleri.",
                "distractors": ["Ternary operatörü tek başına", "is operatörü", "as operatörü"],
                "explanation": "'?.' zincirdeki herhangi bir eleman null ise NullReferenceException atmadan null döner, '??' ise null durumunda varsayılan bir alternatif sunar."
            },
            {
                "prompt": "Task.Run ile ThreadPool üzerinde uzun süren bir arka plan görevi başlatılırken sonuç nasıl beklenir?",
                "code": "int result = await Task.Run(() => HeavyCalculation());",
                "correct": "'await' anahtar kelimesi ile UI thread'i bloke etmeden asenkron olarak beklenir.",
                "distractors": [
                    "Thread.Sleep() çağrılır.",
                    "Doğrudan Task.Result çağrılarak UI thread kilitlenir.",
                    "while(true) döngüsü ile beklenir."
                ],
                "explanation": "'.Result' veya '.Wait()' senkron bloklama yaparak Deadlock riski yaratır. Doğru yaklaşım her zaman 'await' kullanmaktır."
            },
            {
                "prompt": "C#'ta 'yield return' ifadesi içeren bir metot hangi türde bir dönüş tipi gerektirir?",
                "code": "public IEnumerable<int> GetNumbers() {\n    yield return 1;\n    yield return 2;\n}",
                "correct": "IEnumerable veya IEnumerator (veya jenerik türevleri).",
                "distractors": ["void", "int[]", "List<int>"],
                "explanation": "'yield return' derleyici tarafından arka planda IEnumerator uygulayan bir iterator durum makinesine derlenir."
            },
            {
                "prompt": "C# 11+ ile gelen Generic Math ve statik soyut arayüz üyeleri ne sağlar?",
                "code": "public interface INumber<TSelf> where TSelf : INumber<TSelf>",
                "correct": "Sayısal tipler (int, float, double vb.) üzerinde jenerik algoritmalar yazmayı ve operatörleri (+, -) jenerik kullanmayı sağlar.",
                "distractors": [
                    "Sadece tamsayıları toplar.",
                    "Matematiksel işlemleri devre dışı bırakır.",
                    "Sadece GPU üzerinde çalışır."
                ],
                "explanation": ".NET 7 ve C# 11 ile gelen 'static abstract members in interfaces', jenerik matematiksel kodlamayı tip güvenli ve sıfır boxing maliyetiyle mümkün kılmıştır."
            },
            {
                "prompt": "C# koleksiyonlarında 'Dictionary<TKey, TValue>' içindeki arama işleminin ortalama zaman karmaşıklığı nedir?",
                "code": "if (cache.TryGetValue(key, out var val)) { ... }",
                "correct": "O(1) - Sabit zaman karmaşıklığı (Hash tabanlı arama).",
                "distractors": ["O(n) - Doğrusal arama", "O(log n) - İkili arama", "O(n^2)"],
                "explanation": "Dictionary, GetHashCode() ve bucket dizisi kullanarak anahtarları doğrudan adresler; ortalama durumda O(1) hızında çalışır."
            },
            {
                "prompt": "C#'ta 'ref struct' türlerinin Stack dışında (Heap'te) bulunamamasının sebebi nedir?",
                "code": "public ref struct ReadOnlySpan<T>",
                "correct": "Span<T> gibi yapıların bellek güvenliğini garanti etmek ve referansın Stack ömrünü aşmasını önlemek.",
                "distractors": [
                    "Derleyicinin bir hatasıdır.",
                    "Sadece eski Windows sürümleriyle uyumludur.",
                    "Heap belleğin dolmasını önlemek için rastgele konmuştur."
                ],
                "explanation": "'ref struct' boxing yapılamaz, class üyesi olamaz, async metotlarda kullanılamaz; böylece yığındaki bellek güvenliği yüzde yüz korunur."
            },
            {
                "prompt": "Bir delegenin (delegate) birden fazla metodu sırayla çağırmasını sağlayan C# mekanizması nedir?",
                "code": "Action onCompleted = Step1;\nonCompleted += Step2;",
                "correct": "Multicast Delegate (Çoklu Temsilci) ve '+=' operatörü.",
                "distractors": ["Tekil fonksiyon", "Sanal metot", "Arayüz kalıtımı"],
                "explanation": "C# delegeleri 'System.MulticastDelegate' tabanlıdır; '+=' ile bağlanan tüm fonksiyonları sıra ile çağırır ve olay (event) mimarisini kurar."
            }
        ],
        "fib": [
            ("Filtreleme için LINQ ifadesinde 'users._____(u => u.Active)' yazılır.", "Where", ["Filter", "Find", "Check"], "'Where' koleksiyonu filtreler."),
            ("Kaynakları otomatik serbest bırakmak için '_____ var file = File.Open(...);' yazılır.", "using", ["with", "dispose", "close"], "'using' bloğu IDisposable.Dispose çağırır."),
            ("Null ise varsayılan değer dönmek için 'name _____ \"Anonim\"' yazılır.", "??", ["?:", "?.", "||"], "'??' null-coalescing operatörüdür."),
            ("Eşitlik odaklı değişmez sınıf tanımlamak için 'public _____ User(string Name);' yazılır.", "record", ["class", "struct", "entity"], "'record' immutable değer tipi semantics sunar.")
        ],
        "tf": [
            ("C#'ta 'struct' türleri değer tipi (Value Type), 'class' türleri ise referans tipidir (Reference Type).", True, "Struct doğrudan Stack'te yer tutar, class ise Heap'teki bir nesneye referanstır."),
            ("LINQ sorguları 'ToList()' çağrılmasa dahi tanımlandığı satırda anında veritabanına gider.", False, "LINQ deferred execution ile çalışır; sorgu ancak iterate edildiğinde veya ToList() çağrıldığında yürütülür.")
        ],
        "mat1": [
            ("AddTransient", "Her enjeksiyon noktasında yepyeni bir nesne üretir"),
            ("AddScoped", "Her HTTP request için tek bir nesne üretir ve paylaşır"),
            ("AddSingleton", "Uygulama ömrü boyunca tüm isteklerde tek bir nesne tutar"),
            ("IDisposable", "Yönetilmeyen kaynakları serbest bırakan Dispose metodu")
        ],
        "mat2": [
            ("Select()", "Koleksiyondaki elemanları dönüştürür (Projection)"),
            ("Where()", "Belirtilen koşula uyan elemanları süzer"),
            ("OrderBy()", "Belirtilen alana göre sıralama yapar"),
            ("GroupBy()", "Elemanları ortak anahtara göre gruplar")
        ]
    }


# ==========================================
# 6. KOTLIN KNOWLEDGE BASE
# ==========================================
def get_kotlin_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Modern Android ve Kotlin dünyasında '{title}' konusu, Null-Safety ve Coroutines ile çökmeyen, reaktif mobil uygulamalar geliştirmeyi mümkün kılar.",
        "codeExample": "data class Developer(val id: Int, val name: String)\n\nfun greetUser(dev: Developer?): String {\n    return dev?.name ?: 'Misafir Geliştirici'\n}",
        "devTip": "Asla mecbur kalmadıkça '!!' (not-null assertion) kullanmayın; 'NullPointerException' riskini yeniden kodunuza sokmuş olursunuz.",
        "mc": [
            {
                "prompt": "Kotlin'in Null Safety (Boş Değer Güvenliği) mimarisinde bir değişkenin null olabileceğini belirtmek için ne kullanılır?",
                "code": "var name: String_____ = null",
                "correct": "? (Soru işareti ile nullable tip tanımlama).",
                "distractors": ["! (Ünlem)", "* (Yıldız)", "# (Kare)"],
                "explanation": "Kotlin'de 'String' asla null alamaz. Değişkenin null olabilmesi için açıkça 'String?' olarak bildirilmesi zorunludur."
            },
            {
                "prompt": "Kotlin'de 'Elvis Operatörü' (?:) ne işe yarar?",
                "code": "val length = text?.length ?: 0",
                "correct": "Solundaki ifade null ise sağındaki varsayılan değeri veya alternatifi döndürür.",
                "distractors": [
                    "İki sayıyı çarpar.",
                    "Tüm stringi büyük harfe çevirir.",
                    "Programı anında sonlandırır."
                ],
                "explanation": "Elvis operatörü (?:), if-null kontrolünün en kısa ve okunabilir halidir; sol taraf null değilse solu, null ise sağı döndürür."
            },
            {
                "prompt": "Kotlin'de 'data class' tanımlandığında derleyici otomatik olarak hangi metotları üretir?",
                "code": "data class User(val id: Int, val email: String)",
                "correct": "equals(), hashCode(), toString(), copy() ve componentN() metotlarını.",
                "distractors": [
                    "Sadece boş bir kurucu metot üretir.",
                    "Veritabanı tablolarını otomatik oluşturur.",
                    "Hiçbir metot üretmez, sadece arayüzdür."
                ],
                "explanation": "Data class, POJO/DTO karmaşasını ortadan kaldırarak alan tabanlı eşitlik, kopyalama (copy) ve destructuring yeteneklerini otomatik üretir."
            },
            {
                "prompt": "Kotlin Coroutines mimarisinde ana iş parçacığını (Main Thread / UI) kitlemeden arka planda iş yapmak için hangi Dispatcher kullanılır?",
                "code": "withContext(Dispatchers._____) {\n    database.saveUser(user)\n}",
                "correct": "Dispatchers.IO (Disk ve ağ G/Ç işlemleri için optimize edilmiş iş parçacığı havuzu).",
                "distractors": ["Dispatchers.Main (UI güncellemeleri içindir)", "Dispatchers.Unconfined", "Dispatchers.Custom"],
                "explanation": "Dispatchers.IO, disk ve ağ gibi beklemeli işlemler için esnek bir thread havuzudur; UI'ın donmasını engeller."
            },
            {
                "prompt": "Bir nesnenin bağlamında (context) geçici işlemler yapıp nesnenin kendisini zincirleme geri dönmek için hangi Scope Function kullanılır?",
                "code": "val file = File(\"test.txt\")._____ {\n    setReadable(true)\n    setWritable(true)\n}",
                "correct": "apply (Nesneyi 'this' olarak alır ve nesnenin kendisini döner).",
                "distractors": [
                    "let (Sonucu 'it' olarak alır ve lambda sonucunu döner)",
                    "run (Nesneyi siler)",
                    "also (Sadece yazdırma yapar)"
                ],
                "explanation": "'apply' nesne yapılandırması (configuration) için idealdir; nesnenin metotlarını doğrudan çağırıp nesneyi zincirleme olarak geri döndürür."
            },
            {
                "prompt": "Kotlin'de var olan bir sınıfa kaynak kodunu değiştirmeden yeni bir metot eklemeyi sağlayan yetenek nedir?",
                "code": "fun String.isEmail(): Boolean {\n    return this.contains(\"@\")\n}",
                "correct": "Extension Functions (Uzantı Fonksiyonları).",
                "distractors": ["Miras alma (Inheritance)", "Arayüz ezme", "Makro tanımı"],
                "explanation": "Extension functions sayesinde 'String', 'View' veya 'List' gibi standart sınıflara sanki kendi metotlarıymış gibi yeni fonksiyonlar yazılabilir."
            },
            {
                "prompt": "Kotlin'de 'val' ile 'var' anahtar kelimeleri arasındaki temel fark nedir?",
                "code": "val pi = 3.14\nvar counter = 0",
                "correct": "'val' yeniden atanamaz (read-only / immutable), 'var' ise değeri sonradan değiştirilebilir (mutable) değişkendir.",
                "distractors": [
                    "'val' sadece fonksiyon içinde, 'var' sadece sınıfta yazılır.",
                    "'val' float sayılar içindir, 'var' tamsayılar içindir.",
                    "Aralarında hiçbir fark yoktur."
                ],
                "explanation": "Temiz kod ve thread-safety için Kotlin'de varsayılan tercih daima 'val' olmalı, sadece zorunlu durumlarda 'var' kullanılmalıdır."
            },
            {
                "prompt": "Sınırlı sayıda alt sınıfı olan ve 'when' kontrolünde 'else' dalı gerektirmeyen hiyerarşiler kurmak için ne kullanılır?",
                "code": "sealed class NetworkResult {\n    data class Success(val data: String) : NetworkResult()\n    data class Error(val msg: String) : NetworkResult()\n}",
                "correct": "Sealed Class / Sealed Interface (Mühürlü Sınıflar).",
                "distractors": ["Abstract class tek başına", "Open class", "Inner class"],
                "explanation": "Sealed class'lar derleme zamanında bilinen kapalı bir hiyerarşi kurar; 'when' ifadesi tüm durumları kapsadığı için 'else' gerekmez."
            },
            {
                "prompt": "Kotlin'de 'suspend' anahtar kelimesi ile işaretlenen fonksiyonların temel özelliği nedir?",
                "code": "suspend fun fetchUserProfile(): User",
                "correct": "Çalıştığı iş parçacığını bloke etmeden duraklatılabilen ve kaldığı yerden devam edebilen coroutine fonksiyonudur.",
                "distractors": [
                    "İşletim sistemi tarafından askıya alınıp bir daha çalıştırılamaz.",
                    "Sadece Java'dan çağrılabilir.",
                    "Bellekten anında silinir."
                ],
                "explanation": "'suspend' fonksiyonlar sadece başka bir suspend fonksiyon veya coroutine builder (launch, async) içinden çağrılabilir ve non-blocking çalışır."
            },
            {
                "prompt": "Kotlin'de reaktif veri akışlarını yönetmek için Coroutines tabanlı soğuk akış (Cold Stream) yapısı hangisidir?",
                "code": "fun getNumbers(): Flow<Int> = flow {\n    emit(1)\n    emit(2)\n}",
                "correct": "Flow (Yalnızca bir abone 'collect' ettiğinde veri üretmeye başlar).",
                "distractors": ["LiveData", "Channel", "RxJava"],
                "explanation": "Flow, Kotlin'in yerel reaktif akış kütüphanesidir; 'cold' yapıdadır, yani tüketici '.collect()' diyene kadar kod çalışmaz."
            },
            {
                "prompt": "Kotlin'de 'lateinit var' ile 'by lazy' arasındaki fark nedir?",
                "code": "lateinit var client: HttpClient\nval db by lazy { Database.connect() }",
                "correct": "'lateinit' var ile kullanılır ve sonradan atanır; 'by lazy' ise val ile kullanılır ve ilk erişildiği anda hesaplanıp önbelleğe alınır.",
                "distractors": [
                    "İkisi de tamamen aynıdır.",
                    "'by lazy' değişkenin değerini sürekli sıfırlar.",
                    "'lateinit' sadece tamsayılarda çalışır."
                ],
                "explanation": "'by lazy' thread-safe tekil başlatma sunar ve val ile kullanılır. 'lateinit' ise dependency injection senaryolarında var ile kullanılır."
            },
            {
                "prompt": "Kotlin'de Java'daki 'static' anahtar kelimesinin yerine sınıfa ait tekil üyeleri tanımlamak için ne kullanılır?",
                "code": "class ApiClient {\n    companion object {\n        const val BASE_URL = \"https://api.com\"\n    }\n}",
                "correct": "companion object (Yoldaş Nesne).",
                "distractors": ["static bloğu", "global object", "extern"],
                "explanation": "Kotlin'de 'static' yoktur; sınıf seviyesindeki metot ve sabitler 'companion object' içinde tanımlanarak sınıf adıyla erişilir."
            },
            {
                "prompt": "Android'de ViewModel içinde başlatılan coroutine'lerin yaşam döngüsüyle uyumlu olması için hangi scope kullanılır?",
                "code": "viewModelScope.launch {\n    // UI yaşam döngüsü bitince otomatik iptal edilir\n}",
                "correct": "viewModelScope (ViewModel temizlendiğinde coroutine'leri otomatik iptal eder).",
                "distractors": ["GlobalScope (Memory leak yaratır)", "MainScope", "ProcessScope"],
                "explanation": "GlobalScope kullanmak ViewModel yok olsa bile işlemi sürdürerek bellek sızıntısına yol açar. viewModelScope ise güvenli iptal sağlar."
            },
            {
                "prompt": "Kotlin'de nullable bir değişkeni null değilse çalıştırmak için en idiomatik yöntem hangisidir?",
                "code": "user?.let { validUser ->\n    sendEmail(validUser)\n}",
                "correct": "?.let { ... } bloğu ile güvenli çağrı ve kapsam içi çalıştırma.",
                "distractors": [
                    "if (user == null) { } else { }",
                    "user!!.let { } (Tehlikelidir)",
                    "try { sendEmail(user) } catch"
                ],
                "explanation": "'user?.let { }', değişken null değilse bloğu çalıştırır ve bloğun içinde 'it' üzerinden güvenle erişilmesini sağlar."
            },
            {
                "prompt": "İki nesnenin içeriğini değil, bellek adreslerinin eşitliğini sınamak için Kotlin'de ne kullanılır?",
                "code": "if (obj1 === obj2)",
                "correct": "=== (Referans eşitliği operatörü - Referential Equality).",
                "distractors": ["== (İçerik eşitliği / equals)", "= (Atama)", "equals()"],
                "explanation": "Kotlin'de '==' operatörü Java'daki 'equals()' metodunu çağırır. Bellek referansı eşitliğini kontrol etmek için '===' kullanılır."
            },
            {
                "prompt": "Kotlin'de bir fonksiyonun parametresine fonksiyon geçirilmesini sağlayan (Higher-Order Function) sentaks hangisidir?",
                "code": "fun performAction(action: (Int) -> String) { ... }",
                "correct": "Fonksiyon Tipi (Function Type - Girdi ve çıktı türlerini belirten lambda imzası).",
                "distractors": ["FunctionPointer", "ActionClass", "MethodRef"],
                "explanation": "Kotlin birinci sınıf fonksiyonları destekler; '(T) -> R' sözdizimi ile lambda ifadeleri parametre veya dönüş değeri olarak taşınabilir."
            }
        ],
        "fib": [
            ("Null olabilecek değişken tanımında 'val name: String_____ = null' yazılır.", "?", ["!", "*", "#"], "'?' tipi nullable yapar."),
            ("Null ise alternatif değer için 'val x = name _____ \"Bilinmeyen\"' yazılır.", "?:", ["??", "?.", "||"], "'?:' Elvis operatörüdür."),
            ("Coroutine başlatmak için 'viewModelScope._____{ ... }' çağrılır.", "launch", ["start", "run", "fire"], "'launch' yeni bir coroutine başlatır."),
            ("Otomatik metotlar üreten veri sınıfı için '_____ class User(...)' yazılır.", "data", ["entity", "model", "record"], "'data class' copy/equals gibi metotları otomatik üretir.")
        ],
        "tf": [
            ("Kotlin'de 'String' tipinde bir değişkene 'null' atanmaya çalışılırsa derleme hatası oluşur.", True, "Kotlin varsayılan olarak non-null tipler kullanır; null atanabilmesi için 'String?' yapılmalıdır."),
            ("Kotlin'de '!!' operatörü değişken null olsa dahi hatasız bir şekilde devam edilmesini sağlar.", False, "Değişken null ise '!!' operatörü anında NullPointerException fırlatarak uygulamayı çökertir.")
        ],
        "mat1": [
            ("let", "Nullable nesneleri güvenle açıp dönüştürme fonksiyonu"),
            ("apply", "Nesneyi yapılandırıp 'this' ile nesnenin kendisini döner"),
            ("also", "Ek yan etkileri (logging vb.) nesneyi bozmadan işletir"),
            ("with", "Belirli bir nesnenin bağlamında blok çalıştırma")
        ],
        "mat2": [
            ("StateFlow", "Mevcut durumu tutan ve değişiklikleri yayan reaktif akış"),
            ("SharedFlow", "Tek seferlik olayları (event/snackBar) dinleyicilere yayan akış"),
            ("Dispatchers.Main", "Android kullanıcı arayüzünü güncelleyen thread"),
            ("Dispatchers.IO", "Ağ ve veritabanı işlemlerini yürüten thread")
        ]
    }
