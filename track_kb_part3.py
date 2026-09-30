# -*- coding: utf-8 -*-
"""
Master Knowledge Base Part 3: Linux, JavaScript, SQL, and Algorithms
Deep technical questions, realistic code snippets, and comprehensive explanations.
"""

# ==========================================
# 7. LINUX & BASH KNOWLEDGE BASE
# ==========================================
def get_linux_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Linux ve Unix felsefesinde '{title}' konusu, 'Her şey bir dosyadır ve küçük araçlar birleşerek büyük işler yapar' ilkesine dayanır. Terminal ve Bash komutları DevOps süreçlerinin omurgasıdır.",
        "codeExample": "# Log filtreleme ve analiz\ncat access.log | grep '404' | awk '{print $7}' | sort | uniq -c | sort -nr | head -n 10",
        "devTip": "Kritik scriptlerin başında 'set -euo pipefail' kullanın; tanımsız değişkenler ve hata veren komutlar scripti anında durdurarak felaketleri önler.",
        "mc": [
            {
                "prompt": "Linux'ta bir komutun standart çıktısını (stdout) alıp diğer komutun standart girdisine (stdin) bağlayan operatör hangisidir?",
                "code": "cat access.log _____ grep 'ERROR'",
                "correct": "| (Pipe operatörü - Boru hattı).",
                "distractors": ["> (Yeniden yönlendirme / dosyaya yazma)", ">> (Dosya sonuna ekleme)", "& (Arka planda çalıştırma)"],
                "explanation": "Pipe (|) operatörü, iki bağımsız Unix sürecini bellekte bağlayarak ara dosya oluşturmadan akışkan veri işlemeyi sağlar."
            },
            {
                "prompt": "Dosya izinlerinde 'chmod 755 script.sh' komutu kimlere hangi yetkileri tanımlar?",
                "code": "-rwxr-xr-x 1 root root 1204 script.sh",
                "correct": "Sahip: Okuma, Yazma, Çalıştırma (7 = 4+2+1); Grup ve Diğerleri: Okuma ve Çalıştırma (5 = 4+1).",
                "distractors": [
                    "Herkese tam yetki verir (777).",
                    "Dosyayı salt okunur yapar.",
                    "Sadece root kullanıcısına izin verir."
                ],
                "explanation": "Sekizlik izin sistemi: 4 = Read (r), 2 = Write (w), 1 = Execute (x). 7 = rwx (Sahip), 5 = r-x (Grup), 5 = r-x (Diğerleri)."
            },
            {
                "prompt": "Büyük bir metin dosyasında belirli bir deseni aramak ve eşleşen satırları getirmek için en hızlı araç hangisidir?",
                "code": "grep -rn 'DATABASE_URL' /var/www/",
                "correct": "grep (Global Regular Expression Print).",
                "distractors": ["cat", "echo", "pwd"],
                "explanation": "'grep -rn' belirtilen dizin altındaki tüm dosyalarda özyinelemeli (recursive) olarak ve satır numaralarıyla arama yapar."
            },
            {
                "prompt": "Linux'ta bir komutun hem standart çıktısını (stdout - 1) hem de hata çıktısını (stderr - 2) aynı dosyaya yönlendirmek için ne kullanılır?",
                "code": "python app.py > output.log _____ ",
                "correct": "2>&1 (Stderr'i stdout'un hedefine yönlendirir) veya '&>' operatörü.",
                "distractors": ["1>&2", ">> 2", "< 1"],
                "explanation": "'2>&1' ifadesi dosya tanıtıcısı 2'yi (stderr), dosya tanıtıcısı 1'in (stdout) gösterdiği hedefe bağlar; böylece tüm loglar tek dosyada toplanır."
            },
            {
                "prompt": "Çalışan tüm süreçleri detaylı kullanıcı, CPU ve bellek bilgileriyle listelemek için hangi komut kullanılır?",
                "code": "ps aux | grep node",
                "correct": "ps aux",
                "distractors": ["ls -la", "df -h", "uptime"],
                "explanation": "'ps aux' tüm kullanıcıların çalışan süreçlerini (a: all users, u: user format, x: terminali olmayan süreçler) ayrıntılı döker."
            },
            {
                "prompt": "Cevap vermeyen kilitlenmiş bir süreci anında zorla sonlandırmak için hangi sinyal gönderilir?",
                "code": "kill -_____ 1234",
                "correct": "9 (SIGKILL - Sürecin yakalayamayacağı zorunlu sonlandırma sinyali).",
                "distractors": ["15 (SIGTERM - Nazik sonlanma isteği)", "1 (SIGHUP)", "0 (SIGCONT)"],
                "explanation": "SIGTERM (15) sürecin temiz kapanmasına izin verir. Süreç yanıt vermiyorsa SIGKILL (9) işletim sistemi seviyesinde işlemi doğrudan öldürür."
            },
            {
                "prompt": "Linux'ta disk doluluk oranlarını okunabilir boyut formatında (GB/MB) görmek için hangi komut kullanılır?",
                "code": "df -h",
                "correct": "df -h (Disk Free - Human Readable).",
                "distractors": ["du -sh (Dizin boyutunu ölçer)", "free -m (RAM miktarını gösterir)", "fdisk -l"],
                "explanation": "'df -h' tüm bağlı dosya sistemlerinin toplam boyutunu, kullanılan ve boş alan miktarını GB/MB cinsinden listeler."
            },
            {
                "prompt": "Sütun bazlı metin işleme ve raporlama için Unix dünyasının en güçlü mini programlama dili hangisidir?",
                "code": "awk '{print $1, $4}' access.log",
                "correct": "awk (Metin sütunlarını değişken gibi işleyen betik dili).",
                "distractors": ["touch", "mkdir", "wc"],
                "explanation": "awk satırları boşluklara göre '$1, $2, $3' sütunlarına ayırır ve matematiksel hesaplama/filtreleme yapabilen tam teşekküllü bir dildir."
            },
            {
                "prompt": "Akış düzenleyicisi (Stream Editor) olarak bilinen ve metinlerde regex ile toplu değişiklik yapmayı sağlayan araç hangisidir?",
                "code": "sed -i 's/localhost/127.0.0.1/g' config.yaml",
                "correct": "sed (Stream Editor).",
                "distractors": ["nano", "vim", "tail"],
                "explanation": "'sed -i' dosya içine girmeden doğrudan satır bazlı arama ve değiştirme (find & replace) işlemlerini topluca yürütür."
            },
            {
                "prompt": "Sürekli güncellenen bir log dosyasını terminalde canlı olarak izlemek için hangi komut ve bayrak kullanılır?",
                "code": "tail -f /var/log/syslog",
                "correct": "tail -f (Follow - Dosyanın sonuna yeni eklenen satırları anlık gösterir).",
                "distractors": ["head -n 20", "cat -n", "more -c"],
                "explanation": "'tail -f' dosyanın son 10 satırını basar ve terminali açık tutarak dosyaya yeni yazılan her satırı canlı olarak akıtır."
            },
            {
                "prompt": "Sistem servislerini (Nginx, PostgreSQL vb.) başlatmak, durdurmak ve durumunu sorgulamak için hangi modern araç kullanılır?",
                "code": "sudo systemctl status nginx",
                "correct": "systemctl (Systemd servis yöneticisi komutu).",
                "distractors": ["service tek başına legacy'dir", "killall", "reboot"],
                "explanation": "Modern Linux dağıtımlarında Systemd servislerinin başlatılması (start), yeniden başlatılması (restart) ve izlenmesi 'systemctl' ile yapılır."
            },
            {
                "prompt": "Dosya veya dizin sahipliğini (kullanıcı ve grup) değiştirmek için hangi komut kullanılır?",
                "code": "chown -R www-data:www-data /var/www/html",
                "correct": "chown (Change Owner).",
                "distractors": ["chmod (Sadece izinleri değiştirir)", "chgrp tek başına", "passwd"],
                "explanation": "'chown' dosya ve klasörlerin sahibini ve grubunu günceller. '-R' bayrağı tüm alt dizinlere özyinelemeli uygular."
            },
            {
                "prompt": "Bir komutun çıktısını hem ekranda görmek hem de aynı anda bir log dosyasına yazmak için hangi araç kullanılır?",
                "code": "./build.sh | tee build.log",
                "correct": "tee (Boru hattını ikiye bölerek hem stdout'a hem dosyaya yönlendirir).",
                "distractors": ["split", "fork", "mirror"],
                "explanation": "'tee' komutu, T-bağlantı borusu gibi çalışır; veriyi hem ekranda akıtır hem de diske kaydeder."
            },
            {
                "prompt": "Belirli bir isim, boyut veya tarihe göre dosya sisteminde arama yapmak için hangi komut kullanılır?",
                "code": "find /var/log -name '*.log' -size +100M",
                "correct": "find komutu.",
                "distractors": ["which (PATH'te komut arar)", "whereis", "locate"],
                "explanation": "'find' dosya sistemi inode'larını doğrudan tarayarak boyuta, tarihe ve desene göre güçlü filtreleme sunar."
            },
            {
                "prompt": "SSH ile uzak bir sunucuya anahtar tabanlı şifresiz giriş için yerel açık anahtar nereye eklenmelidir?",
                "code": "cat id_ed25519.pub >> ~/.ssh/authorized_keys",
                "correct": "Uzak sunucudaki '~/.ssh/authorized_keys' dosyasına.",
                "distractors": ["/etc/passwd", "~/.bashrc", "/var/log/secure"],
                "explanation": "SSH sunucusu istemcinin açık anahtarını (public key) 'authorized_keys' dosyasında doğrular ve güvenli şifresiz giriş sağlar."
            },
            {
                "prompt": "Arka planda çalışan işleri (background jobs) ön plana (foreground) almak için hangi Bash komutu kullanılır?",
                "code": "fg %1",
                "correct": "fg (Foreground).",
                "distractors": ["bg (Arka planda devam ettirir)", "jobs (Listeler)", "resume"],
                "explanation": "Ctrl+Z ile duraklatılan veya '&' ile arkaya atılan süreçler 'jobs' ile listelenir ve 'fg' ile ön plana taşınır."
            }
        ],
        "fib": [
            ("Çıktıyı filtrelemek için 'dmesg _____ grep -i error' yazılır.", "|", [">", ">>", "<"], "'|' komutları birbirine bağlar."),
            ("Yürütme izni vermek için 'chmod +_____ run.sh' yazılır.", "x", ["r", "w", "s"], "'+x' çalıştırma yetkisi tanımlar."),
            ("Canlı log takibi için 'tail -_____ app.log' çalıştırılır.", "f", ["n", "c", "l"], "'-f' follow bayrağıdır."),
            ("Servisi yeniden başlatmak için 'systemctl _____ nginx' yazılır.", "restart", ["reboot", "refresh", "up"], "'restart' servisi durdurup tekrar açar.")
        ],
        "tf": [
            ("Linux'ta 'rm -rf /' gibi komutların felakete yol açmasını engellemek için root yetkisi dikkatli kullanılmalıdır.", True, "Root kullanıcısı tüm sistem kısıtlamalarından muaftır; dikkatsiz silme işlemleri geri alınamaz."),
            ("Linux dosya izinlerinde 777 vermek her zaman en güvenli ve önerilen pratik yöntemdir.", False, "777 izni sistemdeki her kullanıcının dosyayı değiştirmesine ve çalıştırmasına izin vererek ağır bir güvenlik açığı oluşturur.")
        ],
        "mat1": [
            ("755 izni", "Sahip tam yetkili, diğerleri okur ve çalıştırır"),
            ("644 izni", "Sahip okur/yazar, diğerleri sadece okur"),
            ("600 izni", "Sadece sahip okur ve yazar (SSH anahtarları için zorunlu)"),
            ("777 izni", "Herkese tam yetki (Güvenlik riski!)")
        ],
        "mat2": [
            ("grep", "Metin içinde regex ve kelime arama aracı"),
            ("awk", "Sütun bazlı veri işleme ve raporlama dili"),
            ("sed", "Akış düzenleyicisi ile toplu metin değiştirme"),
            ("find", "Dizin ağacında dosya ve klasör arama")
        ]
    }


# ==========================================
# 8. JAVASCRIPT & WEB KNOWLEDGE BASE
# ==========================================
def get_javascript_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Modern JavaScript ve Web dünyasında '{title}' konusu, Event Loop ve asenkron mimari ile duyarlı ve hızlı web uygulamaları geliştirmenin merkezindedir. JavaScript tek iş parçacıklı (single-threaded) bir dildir.",
        "codeExample": "const fetchData = async (url) => {\n    try {\n        const res = await fetch(url);\n        return await res.json();\n    } catch (err) {\n        console.error('Hata:', err);\n    }\n};",
        "devTip": "Array.prototype.map() ve filter() orijinal diziyi mutasyona uğratmaz (immutability), yeni bir dizi üretir. Kodlarınızda yan etkileri önlemek için mutasyondan kaçının.",
        "mc": [
            {
                "prompt": "JavaScript'in tek iş parçacıklı (single-threaded) olmasına rağmen bloklanmadan çalışabilmesini sağlayan mekanizma nedir?",
                "code": "console.log('1');\nsetTimeout(() => console.log('2'), 0);\nconsole.log('3');",
                "correct": "Event Loop (Olay Döngüsü) ve Call Stack / Task Queue mimarisi.",
                "distractors": [
                    "Çoklu CPU çekirdeklerine kodu otomatik dağıtması.",
                    "Kodları çalıştırmadan önce C++ koduna derlemesi.",
                    "Sadece tarayıcı kapandığında çalışması."
                ],
                "explanation": "Event Loop, Call Stack boşaldığında Microtask Queue (Promise'ler) ve Macrotask Queue (setTimeout) sırasındaki callback'leri çağrı yığıtına taşır."
            },
            {
                "prompt": "Yukarıdaki kod çalıştırıldığında konsol çıktısının sırası ne olur?",
                "code": "console.log('1');\nsetTimeout(() => console.log('2'), 0);\nconsole.log('3');",
                "correct": "1, 3, 2 (setTimeout callback'i macrotask kuyruğuna alınır ve senkron kodlar bittikten sonra çalışır).",
                "distractors": ["1, 2, 3", "2, 1, 3", "3, 2, 1"],
                "explanation": "0 ms verilse dahi setTimeout callback'i Macrotask Queue'ya atılır. JavaScript önce çağrı yığınındaki tüm senkron deyimleri (1 ve 3) tamamlar, sonra 2'yi basar."
            },
            {
                "prompt": "JavaScript'te '==' ile '===' operatörleri arasındaki fark nedir?",
                "code": "console.log(0 == '0');  // true\nconsole.log(0 === '0'); // false",
                "correct": "'==' tür zorlaması (type coercion) yaparak kıyaslar, '===' ise hem türün hem değerin tam eşitliğini (strict equality) sınar.",
                "distractors": [
                    "İkisi de tamamen aynıdır.",
                    "'===' sadece sayılarda çalışır.",
                    "'==' bellek adresini kıyaslar."
                ],
                "explanation": "'==' operatörü farklı türleri örtük olarak birbirine çevirir ve beklenmeyen hatalara yol açabilir. Modern standartlarda her zaman '===' kullanılmalıdır."
            },
            {
                "prompt": "ES6 ile gelen 'const', 'let' ve eski 'var' arasındaki temel fark nedir?",
                "code": "if (true) {\n    var x = 10;\n    let y = 20;\n}",
                "correct": "'var' fonksiyon kapsamlıdır (function-scoped), 'let' ve 'const' ise blok kapsamlıdır (block-scoped) ve hoisting sırasında TDZ uygular.",
                "distractors": [
                    "'var' sadece tarayıcıda, 'let' sadece Node.js'te çalışır.",
                    "'const' dizilerin içine yeni eleman eklenmesini engeller.",
                    "Hiçbir fark yoktur."
                ],
                "explanation": "var blok dışına sızar; let ve const ise sadece yazıldığı süslü parantez '{ }' içinde yaşar. const değişkenin yeniden atanmasını engeller."
            },
            {
                "prompt": "Arrow Fonksiyonların (Ok Fonksiyonları - () => {}) geleneksel fonksiyonlardan en büyük farkı nedir?",
                "code": "const obj = {\n    name: 'Byte',\n    greet: () => console.log(this.name)\n};",
                "correct": "Kendi 'this' bağlamına sahip değildirler; 'this' değerini tanımlandıkları üst lexical bağlamdan (lexical scoping) alırlar.",
                "distractors": [
                    "Asla parametre alamazlar.",
                    "Dönüş değeri üretemezler.",
                    "Sadece tek bir satır kod yazılabilir."
                ],
                "explanation": "Arrow fonksiyonlar kendi 'this', 'arguments' veya 'super' bağlamlarını oluşturmaz. Bu yüzden nesne metotlarında dikkatli kullanılmalıdır."
            },
            {
                "prompt": "Bir dizideki tüm sayıların toplamını tek bir değere indirgemek için hangi fonksiyonel dizi metodu kullanılır?",
                "code": "const total = nums.reduce((acc, curr) => acc + curr, 0);",
                "correct": "Array.prototype.reduce()",
                "distractors": ["Array.prototype.map()", "Array.prototype.filter()", "Array.prototype.forEach()"],
                "explanation": "'reduce()' metodu, bir biriktirici (accumulator) ve dizideki her bir elemanı işleyerek diziyi tek bir sonuca (sayı, nesne, harita) indirger."
            },
            {
                "prompt": "JavaScript'te bir fonksiyonun kendi dışındaki değişkenleri hatırlaması ve erişebilmesi yeteneğine ne ad verilir?",
                "code": "function counter() {\n    let count = 0;\n    return () => ++count;\n}",
                "correct": "Closure (Kapanış / Kapsama).",
                "distractors": ["Recursion", "Inheritance", "Polymorphism"],
                "explanation": "Closure, bir fonksiyonun dış fonksiyon tamamlandıktan sonra bile dış değişkenlerin referanslarını kendi lexical ortamında canlı tutmasıdır."
            },
            {
                "prompt": "Promise zincirinde 'Promise.all([p1, p2, p3])' çağrıldığında davranış nasıldır?",
                "code": "const results = await Promise.all([fetch1(), fetch2()]);",
                "correct": "Tüm Promise'ler başarılı olursa sonuçları dizi olarak döner; içlerinden BİRİ BİLE hata verirse anında reject olur (Fail-fast).",
                "distractors": [
                    "Hata verenleri yok sayıp sadece başarılı olanları döner.",
                    "Promise'leri sırayla tek tek senkron çalıştırır.",
                    "Sonsuza kadar bekler."
                ],
                "explanation": "Promise.all paralel çalışır ancak biri reddedilirse tüm işlem reject olur. Hatalara rağmen tüm sonuçları görmek için 'Promise.allSettled()' kullanılır."
            },
            {
                "prompt": "JavaScript nesnelerinde derin klonlama (Deep Clone) yapmak için modern yerleşik standart metot hangisidir?",
                "code": "const copy = structuredClone(originalObj);",
                "correct": "structuredClone() (Döngüsel referansları ve Date/Map/Set yapılarını da doğru kopyalar).",
                "distractors": [
                    "JSON.parse(JSON.stringify()) (Tarih ve fonksiyonları bozar)",
                    "Object.assign() (Sadece shallow copy yapar)",
                    "Spread operatörü {...obj} (Sadece shallow copy yapar)"
                ],
                "explanation": "Modern web standartlarında 'structuredClone()', harici kütüphane (lodash) gerektirmeden derin ve güvenli klonlama sunar."
            },
            {
                "prompt": "Bir olay tetiklendiğinde DOM ağacında çocuktan ebeveyne doğru yükselmesine ne denir?",
                "code": "button.addEventListener('click', e => e.stopPropagation());",
                "correct": "Event Bubbling (Olay Kabarcıklanması).",
                "distractors": ["Event Capturing (Yukarıdan aşağı inme)", "Event Tunneling", "DOM Freezing"],
                "explanation": "Etkinlik önce en içteki öğede tetiklenir, ardından ağaç boyunca yukarı doğru ebeveynlerine yayılır. Durdurmak için 'e.stopPropagation()' kullanılır."
            },
            {
                "prompt": "Kullanıcı arama kutusuna yazı yazarken her harfte API isteği atmayıp yazmayı bitirmesini bekleyen kalıp hangisidir?",
                "code": "const debouncedSearch = debounce(searchApi, 300);",
                "correct": "Debounce (Gecikmeli tetikleme kalıbı).",
                "distractors": ["Throttle (Sabit aralıklarla tetikleme)", "Singleton", "Observer"],
                "explanation": "Debounce, işlem peş peşe tetiklendiğinde süreyi sıfırlar ve kullanıcı yazmayı bıraktıktan X milisaniye sonra tek bir istek atılmasını sağlar."
            },
            {
                "prompt": "JavaScript'te 'null' veri tipinin 'typeof null' ile kontrol edildiğinde 'object' dönmesi nedir?",
                "code": "console.log(typeof null); // 'object'",
                "correct": "JavaScript'in ilk sürümünden kalan ve geriye dönük uyumluluk nedeniyle düzeltilemeyen tarihi bir dil hatasıdır (bug).",
                "distractors": [
                    "Null'un aslında bir sınıf olmasından kaynaklanır.",
                    "Tüm modern tarayıcıların bilerek getirdiği yeni bir kuraldır.",
                    "Sadece TypeScript'te geçerlidir."
                ],
                "explanation": "JS'nin ilk motorunda tip etiketleri için 3 bit kullanılıyordu ve nesneler 000 etiketi alıyordu. null (0x00) adresi de 000 aldığı için 'object' görünür."
            },
            {
                "prompt": "Bir nesnenin prototip zincirinde (Prototype Chain) bir özelliğin bulunup bulunmadığını arayan mekanizma nedir?",
                "code": "console.log(dog.hasOwnProperty('bark'));",
                "correct": "Prototipsel Kalıtım (Prototypal Inheritance) ve '__proto__' zinciri.",
                "distractors": ["Sanal bellek tablosu", "Derleme optimizasyonu", "DOM Seçici"],
                "explanation": "JavaScript sınıf tabanlı değil prototip tabanlı bir dildir; nesnede özellik bulunamazsa prototip zinciri boyunca 'Object.prototype'a kadar taranır."
            },
            {
                "prompt": "ES modüllerinde (ESM) bir modülden belirli fonksiyonları seçerek içe aktarmak için hangi sözdizimi kullanılır?",
                "code": "import { calculate, format } from './math.js';",
                "correct": "Named Import (İsimlendirilmiş İçe Aktarma).",
                "distractors": [
                    "const math = require('./math.js')",
                    "include math.h",
                    "using math"
                ],
                "explanation": "Named import ({ func }), modülden sadece ihtiyaç duyulan parçaları seçer ve modern derleyicilerde Tree-Shaking ile ölü kod temizliği sağlar."
            },
            {
                "prompt": "Microtask kuyruğu ile Macrotask kuyruğu arasındaki öncelik farkı nedir?",
                "code": "queueMicrotask(() => console.log('micro'));\nsetTimeout(() => console.log('macro'), 0);",
                "correct": "Tüm Microtask'lar (Promise callback'leri) Macrotask'lardan (setTimeout, I/O) ÖNCE tamamen tüketilir.",
                "distractors": [
                    "Macrotask'lar daima önce çalışır.",
                    "İkisi de rastgele sırayla çalışır.",
                    "Aralarında hiçbir öncelik farkı yoktur."
                ],
                "explanation": "Event Loop her macrotask çalıştırmadan önce ve her senkron kod bittiğinde microtask kuyruğunu tamamen boşaltır; Promise'ler önceliklidir."
            },
            {
                "prompt": "JavaScript nesnelerinde özellikleri dondurarak yeni özellik eklenmesini ve değiştirilmesini tamamen engelleyen metot hangisidir?",
                "code": "Object.freeze(config);",
                "correct": "Object.freeze()",
                "distractors": ["Object.seal() (Değerler değişebilir, yeni eklenemez)", "Object.preventExtensions()", "Object.lock()"],
                "explanation": "'Object.freeze()' nesneyi sığ (shallow) olarak tamamen değişmez (immutable) yapar; özellik silinemez, eklenemez, değiştirilemez."
            }
        ],
        "fib": [
            ("Dizideki her elemanı dönüştürmek için 'nums._____(x => x * 2)' yazılır.", "map", ["each", "for", "select"], "'map()' yeni dönüştürülmüş dizi üretir."),
            ("Asenkron sonucu beklemek için 'const data = _____ fetch(url);' yazılır.", "await", ["defer", "wait", "hold"], "'await' Promise sonucunu çözer."),
            ("Yeniden atanamayan değişken tanımı için '_____ API_KEY = \"123\";' kullanılır.", "const", ["let", "var", "val"], "'const' sabit değişken tanımlar."),
            ("Tüm Promise'leri paralel beklemek için 'Promise._____(promises)' çağrılır.", "all", ["race", "any", "join"], "'Promise.all' paralel yürütür.")
        ],
        "tf": [
            ("JavaScript'te diziler (Array) aslında arka planda özel anahtarları olan birer Nesnedir (Object).", True, "typeof [] 'object' döner; diziler sayısal indeks anahtarları olan nesnelerdir."),
            ("JavaScript'te 'const' ile tanımlanmış bir dizinin içine '.push()' ile yeni eleman eklenemez.", False, "const referansı sabitler; dizinin içindeki elemanlar değiştirilebilir (mutasyona uğrayabilir).")
        ],
        "mat1": [
            ("Call Stack", "Çalışmakta olan fonksiyon çağrılarının yığıtı"),
            ("Microtask Queue", "Promise callback'lerinin beklediği öncelikli kuyruk"),
            ("Macrotask Queue", "setTimeout, setInterval gibi zamanlayıcıların kuyruğu"),
            ("Event Loop", "Yığıt boşalınca kuyruktaki görevleri yığıta taşıyan döngü")
        ],
        "mat2": [
            ("Array.map()", "Her elemanı dönüştürüp yeni dizi döner"),
            ("Array.filter()", "Şartı sağlayan elemanları süzer"),
            ("Array.reduce()", "Tüm diziyi tek bir sonuca biriktirir"),
            ("Array.find()", "Şartı sağlayan ilk elemanı döner")
        ]
    }


# ==========================================
# 9. SQL & DATABASE KNOWLEDGE BASE
# ==========================================
def get_sql_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"İlişkisel veritabanları (RDBMS) dünyasında '{title}' konusu, verilerin tutarlı, ilişkisel ve yüksek performansla sorgulanmasının temelini oluşturur. SQL bildirimsel (declarative) bir dildir.",
        "codeExample": "SELECT c.name, COUNT(o.id) AS total_orders\nFROM customers c\nLEFT JOIN orders o ON c.id = o.customer_id\nWHERE c.is_active = TRUE\nGROUP BY c.name\nHAVING COUNT(o.id) > 5\nORDER BY total_orders DESC;",
        "devTip": "WHERE filtresi gruplama yapılmadan ÖNCE satırları eler, HAVING ise GROUP BY sonrasındaki toplamlar üzerinde filtreleme yapar.",
        "mc": [
            {
                "prompt": "SQL sorgu çalıştırma mantığında filtreleme deyimleri olan 'WHERE' ile 'HAVING' arasındaki fark nedir?",
                "code": "SELECT dept, AVG(salary) FROM employees\nWHERE status = 'Active'\nGROUP BY dept\nHAVING AVG(salary) > 50000;",
                "correct": "WHERE gruplama yapılmadan önce tek tek satırları eler, HAVING ise GROUP BY aggregate sonuçları üzerinde filtreleme yapar.",
                "distractors": [
                    "İkisi de tamamen aynıdır, fark yoktur.",
                    "HAVING sadece sayılarda, WHERE sadece metinlerde çalışır.",
                    "WHERE sorgunun en sonunda çalışır."
                ],
                "explanation": "Sorgu yürütme sırası: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY. Bu yüzden aggregate fonksiyonlar WHERE içine yazılamaz."
            },
            {
                "prompt": "'LEFT JOIN' (veya LEFT OUTER JOIN) kullanıldığında sağ tablodaki eşleşmeyen satırlar nasıl sonuçlanır?",
                "code": "SELECT u.name, o.order_id\nFROM users u\nLEFT JOIN orders o ON u.id = o.user_id;",
                "correct": "Sol tablodaki (users) tüm satırlar gelir; siparişi olmayan kullanıcıların sipariş alanları NULL olarak dolar.",
                "distractors": [
                    "Siparişi olmayan kullanıcılar sonuç kümesinden tamamen çıkarılır.",
                    "Veritabanı foreign key hatası fırlatır.",
                    "Sağ tablodaki tüm siparişler rastgele kullanıcılara atanır."
                ],
                "explanation": "LEFT JOIN sol tablodaki verileri korur. Eşleşme yoksa sağ tablonun sütunları NULL döner. Sadece eşleşenleri getiren 'INNER JOIN'dir."
            },
            {
                "prompt": "Veritabanlarında ACID prensiplerindeki 'Atomicity' (Bütünlük/Bölünemezlik) ne anlama gelir?",
                "code": "BEGIN TRANSACTION;\nUPDATE accounts SET bal = bal - 100 WHERE id = 1;\nUPDATE accounts SET bal = bal + 100 WHERE id = 2;\nCOMMIT;",
                "correct": "İşlemler kümesinin 'ya hep ya hiç' prensibiyle çalışması; bir adım başarısız olursa tüm transaction'ın ROLLBACK ile geri alınması.",
                "distractors": [
                    "Verilerin diske atomik parçacıklar olarak yazılması.",
                    "Sorguların sadece tek bir CPU çekirdeğinde çalışabilmesi.",
                    "Veritabanının hiçbir zaman yedeklenememesi."
                ],
                "explanation": "Atomicity, finansal para transferlerinde kritik bir kuraldır: Para bir hesaptan çıkıp diğerine giremezse işlem tamamen iptal edilir."
            },
            {
                "prompt": "B-Tree indekslerinin büyük tablolardaki aramalarda sağladığı temel performans avantajı nedir?",
                "code": "CREATE INDEX idx_users_email ON users(email);",
                "correct": "Tüm tabloyu baştan sona taramak (Full Table Scan - O(n)) yerine O(log n) karmaşıklığında hızlı arama sağlar.",
                "distractors": [
                    "Veritabanındaki tabloyu tamamen şifreler.",
                    "Tablonun diskte kapladığı alanı yarıya düşürür.",
                    "INSERT ve UPDATE işlemlerini 100 kat hızlandırır."
                ],
                "explanation": "İndeksler dengeli arama ağacı (B-Tree) kurarak milyonlarca satır arasından aranan kaydı birkaç disk I/O okumasıyla bulur. Ancak INSERT/UPDATE maliyetini hafif artırır."
            },
            {
                "prompt": "Birden fazla tablodan dönen sonuçları birleştirirken tekrarlanan (duplicate) satırları elemek için hangisi kullanılır?",
                "code": "SELECT city FROM customers\n_____\nSELECT city FROM suppliers;",
                "correct": "UNION (Tekrarları ayıklar; tekrarları korumak için UNION ALL kullanılır).",
                "distractors": ["UNION ALL", "JOIN", "INTERSECT"],
                "explanation": "'UNION' iki sorgunun sonucunu birleştirir ve benzersiz kayıtları döker (DISTINCT maliyeti vardır). Hız için tekrarlar sorun değilse 'UNION ALL' tercih edilir."
            },
            {
                "prompt": "Ortak Tablo İfadeleri (CTE - Common Table Expressions) tanımlamak için hangi SQL anahtar kelimesi kullanılır?",
                "code": "WITH RegionalSales AS (\n    SELECT region, SUM(amount) AS total FROM sales GROUP BY region\n)\nSELECT * FROM RegionalSales WHERE total > 100000;",
                "correct": "WITH anahtar kelimesi.",
                "distractors": ["DECLARE", "LET", "VIEW"],
                "explanation": "WITH ifadesi geçici, adlandırılmış sonuç kümeleri (CTE) oluşturarak karmaşık alt sorguları okunabilir ve özyinelemeli (recursive) hale getirir."
            },
            {
                "prompt": "Bir tablodaki tüm verileri hızlıca boşaltmak için 'DELETE FROM' yerine 'TRUNCATE TABLE' tercih edilmesinin sebebi nedir?",
                "code": "TRUNCATE TABLE logs;",
                "correct": "Satır satır transaction log tutmaz, veri sayfalarını doğrudan serbest bırakır ve identity sayacını sıfırlar; çok daha hızlıdır.",
                "distractors": [
                    "Sadece belirli WHERE şartlarına uyan satırları siler.",
                    "Tabloyu ve tüm şemayı tamamen yok eder.",
                    "Sadece test veritabanlarında çalışır."
                ],
                "explanation": "'TRUNCATE' DDL komutudur; veri sayfalarını deallocate eder ve minimum log yazar. 'DELETE' ise DML'dir ve her satır için tek tek log kaydı tutar."
            },
            {
                "prompt": "SQL Injection güvenlik açığını önlemenin sektör standardı birincil yöntemi nedir?",
                "code": "SELECT * FROM users WHERE email = ? AND password = ?",
                "correct": "Parametreli Sorgular (Parameterized Queries / Prepared Statements) kullanmak.",
                "distractors": [
                    "Kullanıcı şifrelerini açık metin saklamak.",
                    "Sorguyu JavaScript içinde string olarak birleştirmek ('+ input +').",
                    "SQL yerine sadece Excel dosyaları kullanmak."
                ],
                "explanation": "Parametreli sorgular, kullanıcı girdisini çalıştırılabilir SQL komutu olarak değil, salt veri (literals) olarak derleyiciye iletir; enjeksiyonu imkansız kılar."
            },
            {
                "prompt": "SQL'de Pencere Fonksiyonları (Window Functions) kullanırken bölümleme ve sıralama hangi ifadeyle yapılır?",
                "code": "SELECT name, salary, DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) as rank\nFROM employees;",
                "correct": "OVER (PARTITION BY ... ORDER BY ...)",
                "distractors": ["GROUP BY ... ORDER BY", "APPLY ... WHERE", "SECTION ... SORT"],
                "explanation": "Pencere fonksiyonları satırları tek bir sonuca çökertmeden (GROUP BY gibi yapmadan) her satırın yanında pencere istatistiklerini hesaplar."
            },
            {
                "prompt": "Veritabanında Foreign Key (Yabancı Anahtar) kısıtlamasının temel amacı nedir?",
                "code": "ALTER TABLE orders ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(id);",
                "correct": "Referans Bütünlüğünü (Referential Integrity) korumak; var olmayan bir müşteriye sipariş açılmasını engellemek.",
                "distractors": [
                    "Sorguların iki kat daha hızlı çalışmasını sağlamak.",
                    "Veritabanı şifresini korumak.",
                    "Sadece tablodaki satır sayısını sınırlandırmak."
                ],
                "explanation": "Foreign Key, ilişkili tablolardaki veri tutarlılığını sağlar; ebeveyn kayıt silindiğinde 'CASCADE' veya 'RESTRICT' kurallarını yürütür."
            },
            {
                "prompt": "Tekrarlanabilir Okuma (Repeatable Read) izolasyon seviyesi hangi anormalliği engeller?",
                "code": "-- İzolasyon Seviyesi: REPEATABLE READ",
                "correct": "Non-Repeatable Read (Bir transaction içinde aynı satırın iki kez okunduğunda farklı sonuç dönmesi).",
                "distractors": [
                    "Phantom Read (Hayalet Okuma)",
                    "Deadlock'ların tamamını",
                    "Veritabanının kapanmasını"
                ],
                "explanation": "Repeatable Read seviyesinde, okunan satırlar kilitlenir veya MVCC ile dondurulur; başka transaction'lar o satırları değiştiremez."
            },
            {
                "prompt": "SQL'de 'COALESCE' fonksiyonu ne işe yarar?",
                "code": "SELECT COALESCE(phone, mobile, 'Telefon Yok') FROM contacts;",
                "correct": "Argüman listesinde NULL olmayan İLK değeri döndürür.",
                "distractors": [
                    "Tüm argümanları tek bir string olarak birleştirir.",
                    "Sadece sayıları toplar.",
                    "Değer null ise hata fırlatır."
                ],
                "explanation": "'COALESCE', sırayla parametreleri denetler ve ilk geçerli (non-null) veriyi seçer; tümü null ise son parametreyi veya null döner."
            },
            {
                "prompt": "İlişkisel veritabanlarında Normalizasyonun (1NF, 2NF, 3NF) temel amacı nedir?",
                "code": "-- 3NF: Geçişli bağımlılıkları ortadan kaldırma",
                "correct": "Veri tekrarını (redundancy) en aza indirmek ve güncelleme anormalliklerini (anomalies) önlemek.",
                "distractors": [
                    "Tüm tabloları tek bir devasa tabloda birleştirmek.",
                    "Sorgu hızını her zaman artırmak.",
                    "Veritabanı boyutunu 10 katına çıkarmak."
                ],
                "explanation": "Normalizasyon, veriyi atomik sütunlara ve ilişkili mantıksal tablolara bölerek veri tutarsızlığını ve disk israfını önler."
            },
            {
                "prompt": "SQL'de bir tablonun belirli kolonlarında NULL değerleri sayıma dahil etmeyen aggregate fonksiyon hangisidir?",
                "code": "SELECT COUNT(email), COUNT(*) FROM users;",
                "correct": "COUNT(kolon_adi) NULL olan satırları saymaz; COUNT(*) ise tablodaki tüm satırları sayar.",
                "distractors": [
                    "İkisi de tamamen aynı sayıyı verir.",
                    "COUNT(*) null olanları saymaz.",
                    "COUNT(kolon_adi) null görünce hata verir."
                ],
                "explanation": "'COUNT(*)' tablodaki toplam fiziksel satır sayısını dönerken, 'COUNT(email)' sadece email sütununda geçerli veri olanları sayar."
            },
            {
                "prompt": "Bir tablodaki verileri güncellerken yanlışlıkla tüm tablonun değişmesini önlemek için ne zorunludur?",
                "code": "UPDATE users SET is_active = FALSE _____ id = 42;",
                "correct": "WHERE şartı (WHERE yazılmazsa tablodaki tüm satırlar güncellenir!).",
                "distractors": ["HAVING", "LIMIT", "ORDER BY"],
                "explanation": "WHERE şartı unutulan bir UPDATE veya DELETE komutu, tablodaki tüm satırları geri dönülmez şekilde değiştirir veya siler."
            },
            {
                "prompt": "İki tablonun kartezyen çarpımını (her satırın diğer tablodaki her satırla eşleşmesi) üreten JOIN türü hangisidir?",
                "code": "SELECT * FROM colors _____ sizes;",
                "correct": "CROSS JOIN",
                "distractors": ["INNER JOIN", "LEFT JOIN", "SELF JOIN"],
                "explanation": "CROSS JOIN koşul almaz ve N x M satırlık kartezyen çarpım üretir; tüm kombinasyonları listelemek için kullanılır."
            }
        ],
        "fib": [
            ("Belirli sayıda kayıt çekmek için 'SELECT * FROM users _____ 10;' yazılır.", "LIMIT", ["TOP", "COUNT", "FIRST"], "'LIMIT' dönen satır sayısını sınırlar."),
            ("Filtreleme için 'SELECT * FROM products _____ price > 100;' yazılır.", "WHERE", ["HAVING", "WHEN", "ON"], "'WHERE' satır bazlı filtreleme yapar."),
            ("Gruplama sonrası toplamlara filtre uygulamak için '_____ COUNT(*) > 5' yazılır.", "HAVING", ["WHERE", "CHECK", "WITH"], "'HAVING' gruplama sonrası filtre uygular."),
            ("Eşleşmeyen sol kayıtları da tutmak için 'SELECT * FROM a _____ JOIN b ON ...' yazılır.", "LEFT", ["INNER", "CROSS", "RIGHT"], "'LEFT JOIN' sol tablodaki tüm kayıtları korur.")
        ],
        "tf": [
            ("SQL'de 'WHERE' şartı içinde 'SUM()' veya 'AVG()' gibi aggregate fonksiyonlar doğrudan kullanılamaz.", True, "Aggregate fonksiyonlar gruplama sonrası hesaplandığı için WHERE yerine HAVING içinde kullanılmalıdır."),
            ("Bir sütuna indeks (INDEX) eklemek o tabloya yapılan INSERT ve UPDATE işlemlerini her zaman hızlandırır.", False, "İndeksler okumayı (SELECT) hızlandırır ancak her yeni kayıtta ağacın güncellenmesi gerektiği için yazmayı yavaşlatır.")
        ],
        "mat1": [
            ("Atomicity", "İşlemler ya hep birlikte gerçekleşir ya da hiçbiri gerçekleşmez"),
            ("Consistency", "Veritabanı daima tüm kısıtlamalara ve kurallara uyar"),
            ("Isolation", "Eşzamanlı işlemler birbirinin ara durumlarını göremez"),
            ("Durability", "Commit edilen veriler elektrik kesilse dahi diske kalıcı yazılır")
        ],
        "mat2": [
            ("INNER JOIN", "Yalnızca her iki tabloda da eşleşen satırları getirir"),
            ("LEFT JOIN", "Sol tablodaki tüm kayıtları ve sağdaki eşleşenleri getirir"),
            ("CROSS JOIN", "İki tablonun kartezyen çarpımını (tüm kombinasyonları) üretir"),
            ("FULL OUTER JOIN", "Eşleşsin veya eşleşmesin iki tablodaki tüm kayıtları getirir")
        ]
    }


# ==========================================
# 10. ALGORITHMS & DATA STRUCTURES KNOWLEDGE BASE
# ==========================================
def get_algorithms_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Bilgisayar bilimleri ve algoritma dünyasında '{title}' konusu, büyük veri kümeleri üzerinde bellek ve zaman verimliliğini optimize etmenin temelidir. Algoritmaların karmaşıklığı Big-O gösterimi ile analiz edilir.",
        "codeExample": "# İkili Arama (Binary Search) - O(log n)\ndef binary_search(arr, target):\n    low, high = 0, len(arr) - 1\n    while low <= high:\n        mid = (low + high) // 2\n        if arr[mid] == target: return mid\n        elif arr[mid] < target: low = mid + 1\n        else: high = mid - 1\n    return -1",
        "devTip": "Sıralı bir dizide arama yaparken doğrusal arama O(n) yerine daima O(log n) ikili arama (Binary Search) tercih edin.",
        "mc": [
            {
                "prompt": "Sıralı (sorted) bir dizide İkili Arama (Binary Search) algoritmasının en kötü durumdaki zaman karmaşıklığı nedir?",
                "code": "# 1.000.000 elemanlı sıralı dizi",
                "correct": "O(log n) - Her adımda arama uzayını yarıya böler (1 milyon eleman için ~20 adım).",
                "distractors": ["O(n) - Doğrusal tarama", "O(n log n)", "O(1) - Sabit zaman"],
                "explanation": "İkili arama her karşılaştırmada kalan yarıyı eler; bu yüzden logaritmik hızda (O(log n)) çalışır."
            },
            {
                "prompt": "Yığın (Stack) veri yapısının temel çalışma prensibi aşağıdakilerden hangisidir?",
                "code": "stack.push(10)\nstack.push(20)\nval = stack.pop() // val = 20",
                "correct": "LIFO (Last In, First Out - Son Giren İlk Çıkar).",
                "distractors": ["FIFO (First In, First Out - İlk Giren İlk Çıkar)", "Random Access", "Prioritized Order"],
                "explanation": "Yığınlar (Stack) LIFO prensibiyle çalışır; tarayıcı geçmişi (Geri butonu) ve fonksiyon çağrı yığıtı (Call Stack) tipik örnekleridir."
            },
            {
                "prompt": "Kuyruk (Queue) veri yapısının temel çalışma prensibi hangisidir?",
                "code": "queue.enqueue(A)\nqueue.enqueue(B)\nval = queue.dequeue() // val = A",
                "correct": "FIFO (First In, First Out - İlk Giren İlk Çıkar).",
                "distractors": ["LIFO (Last In, First Out)", "Filo tabanlı erişim", "En büyük eleman önce çıkar"],
                "explanation": "Kuyruklar (Queue) FIFO kuralına uyar; yazıcı baskı kuyrukları ve görev işleme hatları bu prensiple çalışır."
            },
            {
                "prompt": "Hızlı Sıralama (Quicksort) algoritmasının ortalama ve en kötü durum (worst-case) zaman karmaşıklıkları nelerdir?",
                "code": "# Pivot seçimi: Quicksort",
                "correct": "Ortalama: O(n log n), En Kötü Durum: O(n^2) (Pivotun hep en kötü eleman seçilmesi durumunda).",
                "distractors": [
                    "Ortalama: O(n), En Kötü: O(n log n)",
                    "Daima O(n^2)",
                    "Daima O(log n)"
                ],
                "explanation": "Quicksort böl ve yönet (divide-and-conquer) yaklaşımıyla ortalama O(n log n) çalışır. Kötü pivotta derinlik n'e ulaşıp O(n^2)'ye düşebilir."
            },
            {
                "prompt": "Bağlı Liste (Linked List) veri yapısının dizilere (Array) göre en belirgin avantajı nedir?",
                "code": "node.next = new_node;",
                "correct": "Listenin başına veya bilinen bir düğüme eleman eklemenin O(1) sabit zamanda yapılması ve dinamik bellek büyümesi.",
                "distractors": [
                    "Herhangi bir indeksteki elemana O(1) hızında doğrudan erişim sağlaması.",
                    "Bellekte dizilerden daha az yer kaplaması (işaretçi ek yükü yoktur).",
                    "Önbellek (CPU cache) dostu olması."
                ],
                "explanation": "Dizilerde başa eleman eklemek tüm diziyi kaydırmayı (O(n)) gerektirir. Bağlı listede ise sadece iki işaretçi güncellenerek O(1) hızında ekleme yapılır."
            },
            {
                "prompt": "İkili Arama Ağacı'nda (BST - Binary Search Tree) 'In-Order' (Kök Ortada) dolaşma yapıldığında ne elde edilir?",
                "code": "in_order(node.left)\nprint(node.val)\nin_order(node.right)",
                "correct": "Ağaçtaki tüm elemanlar küçükten büyüğe sıralı (sorted order) olarak ziyaret edilir.",
                "distractors": [
                    "Büyükten küçüğe sıralı liste elde edilir.",
                    "Sadece yaprak düğümler basılır.",
                    "Ağacın kökü ilk sırada basılır."
                ],
                "explanation": "BST kuralı gereği sol çocuk küçük, sağ çocuk büyüktür. In-Order (Sol -> Kök -> Sağ) sırasıyla gezildiğinde doğal sıralı çıktı elde edilir."
            },
            {
                "prompt": "Hash Tablolarında (Hash Table) iki farklı anahtarın aynı hash indeksini üretmesi durumuna ne ad verilir?",
                "code": "hash(\"k1\") % table_size == hash(\"k2\") % table_size",
                "correct": "Hash Çakışması (Hash Collision).",
                "distractors": ["Memory Overflow", "Buffer Underrun", "Deadlock"],
                "explanation": "Pigeonhole (Güvercin Yuvası) ilkesi gereği sonsuz anahtar kümesi sonlu bir tabloya sığdırılırken çakışma kaçınılmazdır; Chaining veya Open Addressing ile çözülür."
            },
            {
                "prompt": "Genişlik Öncelikli Arama (BFS - Breadth-First Search) graf veya ağaç dolaşırken hangi yardımcı veri yapısını kullanır?",
                "code": "queue.append(root)\nwhile queue:\n    curr = queue.pop(0)",
                "correct": "Kuyruk (Queue - Seviye seviye ilerlemek için FIFO kuyruğu).",
                "distractors": ["Yığın (Stack)", "Öncelik Kuyruğu", "İkili Arama Ağacı"],
                "explanation": "BFS en yakın komşulardan başlayarak dalga dalga yayılır; bu seviye sırasını garanti etmek için FIFO Kuyruk (Queue) kullanılır."
            },
            {
                "prompt": "Derinlik Öncelikli Arama (DFS - Depth-First Search) mantığında hangi yapı kullanılır?",
                "code": "def dfs(node):\n    for neighbor in node.neighbors:\n        dfs(neighbor)",
                "correct": "Yığın (Stack - veya çağrı yığıtı kullanan özyineleme/recursion).",
                "distractors": ["FIFO Kuyruk", "Hash Haritası", "Dairesel Liste"],
                "explanation": "DFS bir yolda gidebildiği kadar derine iner ve geri döner (backtracking); bu LIFO yapısı çağrı yığıtı (call stack) ile yürütülür."
            },
            {
                "prompt": "Dinamik Programlamanın (Dynamic Programming) temel çalışma prensibi nedir?",
                "code": "# Fibonacci Memoization\nmemo = {}\ndef fib(n):\n    if n in memo: return memo[n]\n    memo[n] = fib(n-1) + fib(n-2)\n    return memo[n]",
                "correct": "Büyük problemi örtüşen alt problemlere (overlapping subproblems) bölmek ve hesaplanan alt sonuçları saklayıp tekrar kullanmak (Memoization / Tabulation).",
                "distractors": [
                    "Rastgele sayılar üreterek çözümü tahmin etmek.",
                    "Sadece sıralama algoritmalarında pivot seçmek.",
                    "Tüm olasılıkları kaba kuvvetle (brute-force) denemek."
                ],
                "explanation": "Dinamik programlama, aynı alt hesaplamaları tekrar tekrar yapmayı engelleyerek üssel O(2^n) süreyi doğrusal O(n) süresine indirir."
            },
            {
                "prompt": "Ağırlıklı bir grafta en kısa yolu (Shortest Path) negatif kenarlar yokken bulan klasik algoritma hangisidir?",
                "code": "# En kısa yol hesaplaması",
                "correct": "Dijkstra Algoritması (Öncelik Kuyruğu / Min-Heap kullanarak).",
                "distractors": ["Kruskal Algoritması (Minimum Spanning Tree içindir)", "Kadane Algoritması", "Floyd-Warshall"],
                "explanation": "Dijkstra algoritması, açgözlü (greedy) yaklaşımla en kısa mesafeli komşuları Min-Heap üzerinden seçerek O((V+E) log V) sürede en kısa yolu bulur."
            },
            {
                "prompt": "Dengeli bir İkili Arama Ağacı (AVL veya Red-Black Tree) en kötü durumda arama ve ekleme süresini hangi sınırda garanti eder?",
                "code": "# AVL Ağacı: Denge faktörü -1, 0, 1",
                "correct": "O(log n) - Ağacın yüksekliği logaritmik tutularak tek taraflı bozulması (skewed tree) engellenir.",
                "distractors": ["O(n)", "O(1)", "O(n^2)"],
                "explanation": "Dengesiz bir BST doğrusal bir bağlı listeye dönüşüp O(n)'e düşebilir. AVL ve Red-Black ağaçları rotasyonlarla dengeyi koruyarak O(log n) garantisi verir."
            },
            {
                "prompt": "Aşağıdaki Big-O zaman karmaşıklıklarından en hızlı büyüyen (en yavaş çalışan / en verimsiz) hangisidir?",
                "code": "O(1), O(log n), O(n), O(n log n), O(n^2), O(2^n), O(n!)",
                "correct": "O(n!) - Faktöriyel karmaşıklık (örneğin Gezgin Satıcı kaba kuvvet çözümü).",
                "distractors": ["O(2^n)", "O(n^2)", "O(n log n)"],
                "explanation": "n=20 için n! yaklaşık 2.4 kentilyon adımdır; algoritma dünyasında pratik olarak çözülemez ölçektedir."
            },
            {
                "prompt": "Bir dizideki en büyük K adet elemanı (Top K Elements) en verimli şekilde bulmak için hangi veri yapısı kullanılır?",
                "code": "# Top-K Eleman",
                "correct": "Min-Heap (K boyutunda bir Min-Heap ile O(n log k) sürede).",
                "distractors": ["Tüm diziyi Quicksort ile O(n log n) sıralamak", "Bağlı liste kullanmak", "Stack kullanmak"],
                "explanation": "K boyutlu bir Min-Heap, her yeni elemanı en küçükle kıyaslar; diziyi tamamen sıralamadan O(n log k) sürede en büyük K elemanı bulur."
            },
            {
                "prompt": "Birleştirme Sıralaması (Merge Sort) algoritmasının temel özelliği ve bellek gereksinimi nedir?",
                "code": "# Merge Sort: Divide and Conquer",
                "correct": "Her zaman kararlı (Stable) ve O(n log n) garantilidir; ancak birleştirme adımı için O(n) ek bellek (auxiliary space) gerektirir.",
                "distractors": [
                    "Hiç ek bellek gerektirmez (In-place).",
                    "En kötü durumda O(n^2)'ye düşer.",
                    "Sadece tamsayılarda çalışır."
                ],
                "explanation": "Merge Sort garantili O(n log n) çalışma süresi sunar ve eşit elemanların sırasını korur (stable), ancak alt dizileri birleştirmek için O(n) ek RAM kullanır."
            },
            {
                "prompt": "Grafiklerde döngü (cycle) tespiti ve ayrık kümeleri birleştirmek için en verimli veri yapısı hangisidir?",
                "code": "uf.union(u, v)\nif (uf.find(u) == uf.find(v)): # Döngü bulundu!",
                "correct": "Union-Find (Disjoint Set Union - DSU).",
                "distractors": ["B-Tree", "Trie (Önek Ağacı)", "Circular Buffer"],
                "explanation": "Union-Find, 'yol sıkıştırma' (path compression) ve 'rütbeye göre birleştirme' ile neredeyse O(1) (ters Ackermann) sürede döngüleri tespit eder."
            }
        ],
        "fib": [
            ("Sıralı dizide O(log n) arama için '_____ Search' algoritması kullanılır.", "Binary", ["Linear", "Quick", "Jump"], "İkili arama (Binary Search) O(log n) sürede çalışır."),
            ("Son giren ilk çıkar (LIFO) kuralıyla çalışan yapı '_____' adını alır.", "Stack", ["Queue", "Heap", "Tree"], "Stack (Yığın) LIFO mantığıyla çalışır."),
            ("İlk giren ilk çıkar (FIFO) kuralıyla çalışan yapı '_____' adını alır.", "Queue", ["Stack", "Array", "Map"], "Queue (Kuyruk) FIFO mantığıyla çalışır."),
            ("İkili ağaçta kökü sol ile sağ arasında işleyen gezinti '_____-Order' adını alır.", "In", ["Pre", "Post", "Level"], "In-Order gezinti küçükten büyüğe sıralar.")
        ],
        "tf": [
            ("İkili Arama (Binary Search) algoritmasının çalışabilmesi için dizinin önceden sıralanmış olması zorunludur.", True, "Dizi sıralı değilse arama uzayını yarıya bölme mantığı geçerliliğini yitirir."),
            ("Hash tablolarında arama işlemi her zaman istisnasız O(1) sürede gerçekleşir.", False, "Tüm anahtarlar aynı kovaya çakışırsa (worst-case hash collision), arama karmaşıklığı O(n)'e düşebilir.")
        ],
        "mat1": [
            ("O(1)", "Girdi boyutundan bağımsız sabit zaman (Hash table lookup)"),
            ("O(log n)", "Her adımda arama uzayını yarıya bölen logaritmik hız (Binary search)"),
            ("O(n)", "Tüm elemanları birer kez tarayan doğrusal karmaşıklık"),
            ("O(n log n)", "Verimli böl ve yönet sıralama algoritmaları (Merge/Quick sort)")
        ],
        "mat2": [
            ("Stack", "LIFO (Son Giren İlk Çıkar) prensibi"),
            ("Queue", "FIFO (İlk Giren İlk Çıkar) prensibi"),
            ("Binary Search Tree", "Sol alt ağaç küçük, sağ alt ağaç büyük olan hiyerarşi"),
            ("Min-Heap", "Kök düğümünde daima en küçük elemanı tutan tam ağaç")
        ]
    }
