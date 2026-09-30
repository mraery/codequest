# -*- coding: utf-8 -*-
"""
Master Knowledge Base for All 10 Tracks (CodeQuest 16,000 Questions)
Provides specialized, deeply technical questions, code snippets, and explanations
for Godot, C, Python, C#, Kotlin, Linux, JavaScript, SQL, and Algorithms.
"""

from track_kb_git import get_git_lesson_knowledge
from track_kb_part2 import get_python_lesson_knowledge, get_csharp_lesson_knowledge, get_kotlin_lesson_knowledge
from track_kb_part3 import get_linux_lesson_knowledge, get_javascript_lesson_knowledge, get_sql_lesson_knowledge, get_algorithms_lesson_knowledge

def get_track_lesson_knowledge(track, unit_num, lesson_num, topic, title, desc):
    if track == "git":
        return get_git_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "godot":
        return get_godot_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "c":
        return get_c_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "python":
        return get_python_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "csharp":
        return get_csharp_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "kotlin":
        return get_kotlin_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "linux":
        return get_linux_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "javascript":
        return get_javascript_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "sql":
        return get_sql_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    elif track == "algorithms":
        return get_algorithms_lesson_knowledge(unit_num, lesson_num, topic, title, desc)
    
    # Generic fallback if unexpected
    return get_git_lesson_knowledge(unit_num, lesson_num, topic, title, desc)


# ==========================================
# 2. GODOT 4 KNOWLEDGE BASE
# ==========================================
def get_godot_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"Godot 4 motorunda '{title}' konusu, sahne ağacı (SceneTree) ve GDScript 2.0 ile yüksek performanslı oyun mekanikleri geliştirmeyi sağlar. Godot'ta her görsel veya mantıksal varlık bir Node'dur.",
        "codeExample": "extends CharacterBody2D\n\n@export var speed: float = 300.0\n\nfunc _physics_process(delta: float) -> void:\n    var dir = Input.get_axis('ui_left', 'ui_right')\n    velocity.x = dir * speed\n    move_and_slide()",
        "devTip": "Fizik ve hareket hesaplamalarını asla _process içinde değil, sabit zaman adımlı _physics_process içinde çalıştırın.",
        "mc": [
            {
                "prompt": "Godot 4'te karakter hareketi ve çarpışma kontrolü için en uygun temel düğüm (Node) hangisidir?",
                "code": "extends CharacterBody2D",
                "correct": "CharacterBody2D (Godot 3'teki KinematicBody2D'nin yerini almıştır).",
                "distractors": [
                    "StaticBody2D (Sadece sabit duvarlar içindir).",
                    "RigidBody2D (Sadece motorun fizik simülasyonu içindir).",
                    "Node2D (Çarpışma hesaplaması yeteneği yoktur)."
                ],
                "explanation": "CharacterBody2D, kodla doğrudan kontrol edilen karakterler için optimize edilmiştir; 'move_and_slide()' metoduyla yerçekimi ve duvar kaymasını yönetir."
            },
            {
                "prompt": "Godot 4'te 'move_and_slide()' fonksiyonu çağrılırken hız vektörü nereden okunur?",
                "code": "velocity.x = 200.0\nmove_and_slide()",
                "correct": "Düğümün dahili 'velocity' özelliğinden okunur; parametre almaz.",
                "distractors": [
                    "move_and_slide(velocity, Vector2.UP) şeklinde parametre zorunludur.",
                    "Hız doğrudan delta ile çarpılarak fonksiyona verilmelidir.",
                    "Sadece x ekseni verilebilir, y ekseni ayrı hesaplanır."
                ],
                "explanation": "Godot 4 ile birlikte 'move_and_slide()' artık parametre almaz. Doğrudan sınıfın 'velocity' değişkenini okur ve delta çarpımını dahili olarak halleder."
            },
            {
                "prompt": "GDScript 2.0'da bir değişkeni editör denetçisinde (Inspector) görünür ve ayarlanabilir kılmak için hangi anotasyon kullanılır?",
                "code": "@_____ var max_health: int = 100",
                "correct": "@export",
                "distractors": ["@public", "@inspector", "@serialize"],
                "explanation": "Godot 4'te '@export' anotasyonu değişkeni Godot Inspector panelinde düzenlenebilir kılar."
            },
            {
                "prompt": "Düğüm sahne ağacına ilk kez eklendiğinde ve tüm alt düğümleri hazır olduğunda tetiklenen yaşam döngüsü metodu hangisidir?",
                "code": "func _ready() -> void:",
                "correct": "_ready() fonksiyonu, düğüm ve tüm çocukları ağaca girdiğinde bir kez çalışır.",
                "distractors": [
                    "_init() fonksiyonu sahne ağacı kurulmadan önce çalışır.",
                    "_process() her karede sürekli çalışır.",
                    "_enter_tree() sadece düğüm ağaca girdiği anda, çocuklar hazır olmadan çalışır."
                ],
                "explanation": "'_ready()' metodu sahne ağacı hiyerarşisinde en alttaki çocuklardan başlayarak yukarı doğru tetiklenir; alt düğümlere güvenle erişim sağlar."
            },
            {
                "prompt": "Godot 4'te alt düğümlere doğrudan erişim için değişken tanımıyla birlikte kullanılan anotasyon hangisidir?",
                "code": "@_____ var anim_player = $AnimationPlayer",
                "correct": "@onready",
                "distractors": ["@lazy", "@inject", "@await"],
                "explanation": "'@onready', değişkenin değerinin düğümün '_ready()' anında atanmasını sağlar; '$Node' referanslarının null dönmesini engeller."
            },
            {
                "prompt": "Düğümler arasında gevşek bağlılık (loose coupling) sağlamak ve olay bildirmek için Godot'ta ne kullanılır?",
                "code": "signal health_depleted(final_score)\n\nfunc take_damage(amount):\n    health_depleted.emit(score)",
                "correct": "Sinyaller (Signals) ve 'emit()' metodu.",
                "distractors": [
                    "Global statik değişkenler ve doğrudan fonksiyon çağrısı.",
                    "İş parçacığı kilitleri (Thread mutex).",
                    "Doğrudan ana sahneye hardcoded bağlama."
                ],
                "explanation": "Godot felsefesi: 'Sinyaller yukarı, fonksiyon çağrıları aşağı' (Signals up, call down). Sinyaller alt bileşenlerin üst bileşenleri bilmeden olay fırlatmasını sağlar."
            },
            {
                "prompt": "Godot 4'te bir sinyalin veya sürenin tamamlanmasını asenkron olarak beklemek için hangi anahtar kelime kullanılır?",
                "code": "await get_tree().create_timer(1.5).timeout",
                "correct": "await (Godot 3'teki yield'in yerini almıştır).",
                "distractors": ["yield", "async", "defer"],
                "explanation": "Godot 4 GDScript 2.0 ile 'yield' kaldırılmış ve modern dillerle uyumlu 'await' anahtar kelimesi getirilmiştir."
            },
            {
                "prompt": "Fizik tabanlı bir tetikleme (trigger) veya mermi çarpışma algılaması için fiziksel engelleme yapmadan olay yakalayan düğüm hangisidir?",
                "code": "extends Area2D\n\nfunc _on_body_entered(body: Node2D) -> void:",
                "correct": "Area2D (Varlıkların içine giriş/çıkış olaylarını algılar).",
                "distractors": [
                    "StaticBody2D (Fiziksel katı engeldir).",
                    "CollisionShape2D (Tek başına mantık içermez, sadece geometridir).",
                    "Camera2D (Sadece ekran görünümünü yönetir)."
                ],
                "explanation": "Area2D, katı fizik çarpışması (blocking) oluşturmadan 'body_entered' ve 'area_entered' sinyalleriyle algılama bölgeleri (hitbox/hurtbox) kurar."
            },
            {
                "prompt": "Sahneye dinamik olarak yeni bir düğüm veya düşman örneği (instance) eklemek için doğru sıra hangisidir?",
                "code": "var enemy_scene = preload('res://enemy.tscn')\nvar enemy = enemy_scene.instantiate()\nadd_child(enemy)",
                "correct": "Sahne önceden yüklenir (preload), örneklenir (instantiate) ve ağaca eklenir (add_child).",
                "distractors": [
                    "add_child() çağrıldıktan sonra preload yapılır.",
                    "instantiate() doğrudan sahne ağacını siler.",
                    "Sahneler çalışma zamanında dinamik olarak türetilemez."
                ],
                "explanation": "Dinamik nesneler: PackedScene 'preload/load' edilir, '.instantiate()' ile düğüm nesnesi oluşturulur ve 'add_child()' ile aktif sahneye bağlanır."
            },
            {
                "prompt": "Godot 4 TileMap sisteminde çok katmanlı haritalar oluştururken hangi özellik kullanılır?",
                "code": "tile_map.set_cell(layer, coords, source_id, atlas_coords)",
                "correct": "TileMapLayers (Her katman zemin, dekorasyon veya çarpışma için bağımsız yönetilebilir).",
                "distractors": [
                    "Her katman için ayrı bir bağımsız pencere açılmalıdır.",
                    "Godot 4'te katman sistemi tamamen kaldırılmıştır.",
                    "Tüm çizimler tek bir texture üzerinde pikseller boyanarak yapılır."
                ],
                "explanation": "Godot 4 TileMap mimarisi, zemin, duvarlar ve nesneler için bağımsız Z-indeksli katmanlar (Layers) sunarak derinlik yönetimini kolaylaştırır."
            },
            {
                "prompt": "Bir düğümü sahne ağacından güvenli bir şekilde silmek ve bellekten temizlemek için hangi metot çağrılmalıdır?",
                "code": "queue_free()",
                "correct": "queue_free() mevcut kare çizimi bittiğinde nesneyi güvenle bellekten temizler.",
                "distractors": [
                    "free() (Hemen siler ve o karede nesneye erişmeye çalışan kodlarda crash riski yaratır).",
                    "hide() (Sadece görünmez yapar, bellekte ve işlemde kalır).",
                    "remove_child() (Sadece ağaçtan çıkarır, bellek sızıntısına yol açar)."
                ],
                "explanation": "'queue_free()', düğümü o karenin sonunda güvenli bir biçimde yok eder; böylece o anda çalışan sinyaller veya referanslar asılı kalmaz."
            },
            {
                "prompt": "Godot 4'te veri odaklı programlama (Data-driven) ve envanter eşyaları tanımlamak için en uygun sınıf hangisidir?",
                "code": "class_name ItemResource extends Resource",
                "correct": "Resource sınıfı (Hafif, serileştirilebilir ve diskte .tres olarak saklanabilir).",
                "distractors": [
                    "Node sınıfı (Ağaç maliyeti gereksizdir).",
                    "Control sınıfı (Sadece arayüz bileşenidir).",
                    "CanvasLayer (Görsel katmandır)."
                ],
                "explanation": "Resource'lar ağaç üzerinde yer kaplamaz, diskte verimli saklanır ve birden çok düğüm arasında paylaşılarak bellek tasarrufu sağlar."
            },
            {
                "prompt": "Farklı çözünürlüklerde oyun arayüzünün (UI) doğru ölçeklenmesi için hangi düğüm ailesi kullanılır?",
                "code": "extends Control",
                "correct": "Control düğümleri (Anchors ve Containers ile responsive düzen sağlar).",
                "distractors": [
                    "Node2D (Çapa ve otomatik boyutlandırma yeteneği yoktur).",
                    "Sprite2D (Sadece sabit resim basar).",
                    "ParallaxBackground (Sadece arka plan kaydırma içindir)."
                ],
                "explanation": "Control düğümleri, VBoxContainer, HBoxContainer ve çapa (anchor) sistemi ile mobil ve masaüstü ekran boyutlarına otomatik uyum sağlar."
            },
            {
                "prompt": "Godot 4'te GPU üzerinde piksel ve tepe noktası efektleri yazmak için hangi özel gölgelendirici dili kullanılır?",
                "code": "shader_type canvas_item;\nvoid fragment() { COLOR = vec4(1.0, 0.0, 0.0, 1.0); }",
                "correct": "Godot Shading Language (GLSL ES 3.0 benzeri yerleşik gölgelendirici dili).",
                "distractors": [
                    "Doğrudan Python GDScript kodu.",
                    "Sadece C++ derleyicisi.",
                    "HTML5 Canvas API'si."
                ],
                "explanation": "Godot Shading Language, canvas_item (2D), spatial (3D) ve particles gölgelendiricilerini yüksek performansla GPU'da yürütür."
            },
            {
                "prompt": "Godot'ta global olarak her sahneden erişilebilen tekil yöneticiler (Singleton / Autoload) nasıl tanımlanır?",
                "code": "GameManager.player_score += 10",
                "correct": "Project Settings -> Globals -> Autoload menüsünden bir script veya sahne eklenerek.",
                "distractors": [
                    "Her sahneye manuel olarak bir kopya sürükleyerek.",
                    "İşletim sistemi ortam değişkenlerine yazarak.",
                    "Godot'ta global singleton desteği bulunmamaktadır."
                ],
                "explanation": "Autoload scriptleri, oyun açıldığında SceneTree'nin köküne (root) eklenir ve oyun boyunca sahneler değişse bile bellekte kalıcı olur."
            },
            {
                "prompt": "Birden çok fizik katmanı arasında çarpışma filtrelemesi yaparken 'Collision Layer' ve 'Collision Mask' farkı nedir?",
                "code": "# Player: Layer 1, Mask 2 (Enemies)",
                "correct": "Layer nesnenin hangi katmanda olduğunu belirtir, Mask ise nesnenin hangi katmanları tarayıp çarpışacağını belirtir.",
                "distractors": [
                    "İkisi tamamen aynı işlevi görür, gereksiz yedeklerdir.",
                    "Layer sadece 3D'de, Mask sadece 2D'de kullanılır.",
                    "Layer grafik katmanıdır, Mask ses katmanıdır."
                ],
                "explanation": "Layer: 'Ben kimim / neredeyim?' Mask: 'Ben kimleri arıyorum / kimlerle çarpışırım?' Bu ayrım performansı optimize eder."
            }
        ],
        "fib": [
            ("Godot 4'te 2D karakter hareketini işletmek için '_____()' fonksiyonu çağrılır.", "move_and_slide", ["move_and_collide", "step", "walk"], "'move_and_slide()' velocity değerini işleyip çarpışmaları çözer."),
            ("İki saniye beklemek için '_____ get_tree().create_timer(2.0).timeout' yazılır.", "await", ["yield", "delay", "sleep"], "Godot 4'te asenkron bekleme 'await' ile yapılır."),
            ("Inspector'da görünmesi istenen değişkene '@_____' öneki verilir.", "export", ["public", "show", "editor"], "'@export' editörde ayarlanabilir alan yaratır."),
            ("Düğüm ağaca eklenip hazır olunca 'func ______() -> void:' çalışır.", "ready", ["init", "start", "enter"], "'_ready()' tüm alt düğümler kurulunca çalışır.")
        ],
        "tf": [
            ("Godot 4'te CharacterBody2D'nin move_and_slide() metodu içine delta argümanı verilmez.", True, "Godot 4 dahili olarak delta çarpımını yönetir, delta ile manuel çarpmak karakteri yavaşlatır."),
            ("queue_free() çağrıldığı anda nesneyi anında yok eder, o karenin sonunu beklemez.", False, "queue_free() güvenli silme için karenin sonunu bekler; anında silen metot free()'dir.")
        ],
        "mat1": [
            ("CharacterBody2D", "Kodla yönetilen oyuncu ve NPC hareket fiziği"),
            ("StaticBody2D", "Hareketsiz zemin ve katı duvar engelleri"),
            ("Area2D", "Katı olmayan algılama ve tetikleme sahası"),
            ("RigidBody2D", "Tamamen motorun fizik simülasyonuna bağlı cisimler")
        ],
        "mat2": [
            ("@export", "Değişkeni Inspector panelinde açar"),
            ("@onready", "Düğüm hazır olunca değişkeni atar"),
            ("emit_signal()", "Tanımlı bir sinyali tetikler"),
            ("instantiate()", "PackedScene'den yeni bir düğüm kopyası üretir")
        ]
    }


# ==========================================
# 3. C DİLİ KNOWLEDGE BASE
# ==========================================
def get_c_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    return {
        "rule": f"C dilinde '{title}' konusu, doğrudan bellek yönetimi ve sistem seviyesi optimizasyonun temelidir. C'de her değişken bir bellek adresine sahiptir ve donanıma en yakın kontrolü sunar.",
        "codeExample": "#include <stdio.h>\n#include <stdlib.h>\n\nint main(void) {\n    int *ptr = malloc(sizeof(int) * 5);\n    if (ptr == NULL) return 1;\n    ptr[0] = 42;\n    free(ptr);\n    return 0;\n}",
        "devTip": "malloc/calloc ile tahsis edilen her bayt bellek için mutlaka serbest bırakma (free) çağrısı yapın ve dangling pointer'ı önlemek için ptr = NULL atayın.",
        "mc": [
            {
                "prompt": "C dilinde bir değişkenin bellekteki adresine erişmek için hangi operatör kullanılır?",
                "code": "int sayi = 10;\nint *ptr = ___sayi;",
                "correct": "& (Adres operatörü - Address-of).",
                "distractors": ["* (İçerik/Dereference operatörü)", "-> (Ok operatörü)", "% (Mod operatörü)"],
                "explanation": "'&' operatörü değişkenin RAM'deki başlangıç adresini döndürür. '*' ise o adresteki değere erişmeyi (dereference) sağlar."
            },
            {
                "prompt": "Aşağıdaki C kod parçası çalıştırıldığında çıktısı ne olur?",
                "code": "int a = 5;\nint *p = &a;\n*p = 20;\nprintf(\"%d\", a);",
                "correct": "20",
                "distractors": ["5", "Bellek adresi (0x7ffe...)", "Derleme hatası"],
                "explanation": "'*p = 20' ifadesi, 'p' işaretçisinin gösterdiği adres olan 'a' değişkeninin değerini doğrudan 20 olarak günceller."
            },
            {
                "prompt": "Dinamik bellek tahsisinde 'malloc' ile 'calloc' arasındaki temel fark nedir?",
                "code": "int *p1 = malloc(10 * sizeof(int));\nint *p2 = calloc(10, sizeof(int));",
                "correct": "malloc tahsis edilen belleği sıfırlamaz (çöp değer kalır), calloc ise tüm baytları 0 ile doldurur.",
                "distractors": [
                    "malloc Stack'ten, calloc Heap'ten yer tahsis eder.",
                    "calloc bellek sınırını aşamaz, malloc sınırsızdır.",
                    "malloc serbest bırakılamaz, calloc serbest bırakılabilir."
                ],
                "explanation": "malloc belleği temizlemez (uninitialized memory), calloc ise baytları sıfırlar. Bu yüzden calloc hafif bir performans maliyetiyle güvenli başlangıç sunar."
            },
            {
                "prompt": "'free(ptr)' çağrıldıktan sonra 'ptr' işaretçisi üzerinde işlem yapmaya devam edilirse ne tür bir hata oluşur?",
                "code": "free(ptr);\nprintf(\"%d\", *ptr);",
                "correct": "Dangling Pointer (Askıda İşaretçi) ve Tanımsız Davranış (Undefined Behavior / Crash).",
                "distractors": [
                    "Derleyici otomatik olarak yeni bellek tahsis eder.",
                    "Program sonsuz döngüye girer.",
                    "Hiçbir sorun olmaz, C dilinde bellek kalıcıdır."
                ],
                "explanation": "Serbest bırakılan bir adrese erişmek (Use-After-Free), güvenlik açığı ve program çökmesine (Segmentation Fault) sebep olan kritik bir tanımsız davranıştır."
            },
            {
                "prompt": "C'de 'sizeof(dizi)' ile 'sizeof(isaretci)' arasındaki fark nedir?",
                "code": "int arr[10];\nint *ptr = arr;",
                "correct": "sizeof(arr) tüm dizinin bayt boyutunu (10*4=40) verirken, sizeof(ptr) mimariye göre işaretçinin boyutunu (64-bitte 8 bayt) verir.",
                "distractors": [
                    "İkisi de daima 40 bayt döner.",
                    "İkisi de daima 8 bayt döner.",
                    "Diziler üzerinde sizeof fonksiyonu çağrılamaz."
                ],
                "explanation": "Dizi bir fonksiyona geçirildiğinde işaretçiye bozulur (pointer decay). Bu yüzden fonksiyon içinde dizinin eleman sayısını sizeof ile hesaplayamazsınız."
            },
            {
                "prompt": "C'de bir struct tanımlanırken bellek hizalaması (padding) sebebiyle toplam boyut beklenen toplamdan neden büyük çıkabilir?",
                "code": "struct Test {\n    char c;   // 1 byte\n    int i;    // 4 byte\n};",
                "correct": "İşlemcinin verilere en hızlı şekilde erişebilmesi için veri tiplerini doğal sınırlarına (alignment) hizalaması ve araya dolgu (padding) koyması.",
                "distractors": [
                    "C derleyicisinin gereksiz kod eklemesi.",
                    "char tipinin aslında 4 bayt yer kaplaması.",
                    "Bellek sızıntısı oluşması."
                ],
                "explanation": "32/64-bit CPU'lar 4 veya 8'in katı olan adreslerden veri okurken daha hızlıdır. Bu yüzden char'dan sonra 3 bayt padding eklenerek 'i' 4'ün katına hizalanır."
            },
            {
                "prompt": "Bir işaretçinin hiçbir geçerli adresi göstermediğini belirtmek için C standartlarında ne atanır?",
                "code": "int *ptr = _____;",
                "correct": "NULL (veya modern C'de 0)",
                "distractors": ["nil", "undefined", "none"],
                "explanation": "Başlatılmamış veya serbest bırakılmış işaretçilere 'NULL' atanmalıdır. NULL işaretçiyi dereference etmek işletim sistemi tarafından doğrudan tespit edilir."
            },
            {
                "prompt": "İki işaretçi aritmetiğinde 'ptr + 1' ifadesi adresi sayısal olarak kaç bayt ileri taşır?",
                "code": "int *ptr = 0x1000;\nptr++;",
                "correct": "İşaretçinin gösterdiği veri tipinin bayt boyutu kadar (sizeof(*ptr) - int için 4 bayt).",
                "distractors": [
                    "Daima tam olarak 1 bayt ileri taşır.",
                    "Daima 8 bayt ileri taşır.",
                    "Adres rastgele bir yere zıplar."
                ],
                "explanation": "İşaretçi aritmetiği tipe duyarlıdır. 'ptr++' yapıldığında adres 'sizeof(type)' bayt kadar artarak bir sonraki dizi elemanına geçer."
            },
            {
                "prompt": "C dilinde bir dosya açma işlemi ('fopen') başarısız olduğunda ne döner?",
                "code": "FILE *f = fopen(\"dosya.txt\", \"r\");",
                "correct": "NULL göstericisi döner; bu yüzden f == NULL kontrolü zorunludur.",
                "distractors": [
                    "Program doğrudan sonlanır.",
                    "0 değeri döner.",
                    "Boş bir sanal dosya oluşturur."
                ],
                "explanation": "Dosya bulunamazsa veya erişim izni yoksa 'fopen' NULL döner. Kontrol edilmeden dosya okunmaya çalışılırsa Segmentation Fault oluşur."
            },
            {
                "prompt": "Bit düzeyinde belirli bir biti '1' yapmak (Set Bit) için hangi bitwise operatörü kullanılır?",
                "code": "flags |= (1 << 3);",
                "correct": "| (Bitwise OR operatörü)",
                "distractors": ["& (Bitwise AND)", "^ (Bitwise XOR)", "~ (Bitwise NOT)"],
                "explanation": "OR operatörü (|) ilgili biti 1 ile işleme sokarak diğer bitleri değiştirmeden hedef biti 1 yapar."
            },
            {
                "prompt": "Bir fonksiyona parametre olarak geçirilen değişkenin orijinal değerini fonksiyon içinde değiştirmek için ne kullanılır?",
                "code": "void increment(int *val) {\n    (*val)++;\n}",
                "correct": "Değişkenin adresini işaretçi olarak geçirmek (Pass by Reference / Pointer).",
                "distractors": [
                    "Değişkeni const anahtar kelimesiyle tanımlamak.",
                    "Değişkeni char tipine dönüştürmek.",
                    "C dilinde fonksiyon içinden dışarıdaki değişken asla değiştirilemez."
                ],
                "explanation": "C dili varsayılan olarak 'Pass by Value' (değer kopyalama) ile çalışır. Orijinal değişkeni değiştirmek için bellek adresini işaretçiyle göndermek şarttır."
            },
            {
                "prompt": "'realloc' fonksiyonu mevcut bellek bloğunu büyütürken yeterli yer bulamazsa ne yapar?",
                "code": "int *new_ptr = realloc(old_ptr, new_size);",
                "correct": "Yeni ve yeterli bir bellek alanına tüm verileri kopyalar, eski alanı serbest bırakır ve yeni adresi döner.",
                "distractors": [
                    "Tüm verileri siler ve hata fırlatır.",
                    "Sadece işletim sistemini yeniden başlatır.",
                    "Eski bloğu kesip yarım bırakır."
                ],
                "explanation": "realloc mevcut bloğun ardında yer yoksa, yeni bir alan tahsis eder, baytları taşır, eskiyi free eder. Yetersiz RAM varsa NULL döner."
            },
            {
                "prompt": "C'de 'typedef' anahtar kelimesinin temel amacı nedir?",
                "code": "typedef unsigned long long uint64_t;",
                "correct": "Var olan bir türe daha okunabilir ve taşınabilir yeni bir takma ad (alias) tanımlamak.",
                "distractors": [
                    "Yeni bir bellek alanı tahsis etmek.",
                    "Değişkeni otomatik olarak const yapmak.",
                    "Kodun çalışma süresini hızlandırmak."
                ],
                "explanation": "'typedef', özellikle karmaşık struct ve fonksiyon işaretçisi türlerini kısaltmak ve mimariler arası taşınabilirliği artırmak için kullanılır."
            },
            {
                "prompt": "Fonksiyon işaretçisi (Function Pointer) C dilinde en çok hangi senaryoda tercih edilir?",
                "code": "void qsort(void *base, size_t num, size_t size, int (*compar)(const void*, const void*));",
                "correct": "Geri çağırma (Callback) fonksiyonları ve dinamik sıralama/karşılaştırma algoritmaları için.",
                "distractors": [
                    "Sadece ekrana yazı yazdırmak için.",
                    "Dosyaları sıkıştırmak için.",
                    "C dilinde fonksiyon işaretçisi desteklenmez."
                ],
                "explanation": "Standart kütüphanedeki 'qsort' gibi fonksiyonlar, sıralama mantığını dışarıdan fonksiyon işaretçisi (callback) alarak esnek ve genel çalışır."
            },
            {
                "prompt": "Header dosyalarında aynı başlığın birden fazla dahil edilmesini (double inclusion) önlemek için ne kullanılır?",
                "code": "#ifndef MY_HEADER_H\n#define MY_HEADER_H\n// ...\n#endif",
                "correct": "Include Guards (#ifndef / #define) veya '#pragma once'.",
                "distractors": [
                    "#include <stop>",
                    "static void main()",
                    "break komutu"
                ],
                "explanation": "Include guard'lar, aynı header dosyasının birden fazla C kaynak dosyasında derlenirken 'redefinition' hatalarını önler."
            },
            {
                "prompt": "Bellekteki iki bloğu bayt bayt kopyalamak için hangi standart kütüphane fonksiyonu kullanılır?",
                "code": "memcpy(dest, src, count);",
                "correct": "memcpy (string.h kütüphanesinde yer alır).",
                "distractors": ["strcpy (Sadece null sonlandırılmış dizeler içindir)", "memalloc", "copymem"],
                "explanation": "'memcpy' ham bellek baytlarını hızla kopyalar; blokların birbiriyle çakışmadığı (overlap) durumlarda en hızlı yoldur."
            }
        ],
        "fib": [
            ("Heap bellekten yer tahsis etmek için 'int *p = (int*)_____(sizeof(int));' yazılır.", "malloc", ["new", "alloc", "create"], "'malloc' heap bölgesinden belirtilen bayt kadar yer ayırır."),
            ("Ayrılan dinamik belleği işletim sistemine iade etmek için '_____(p);' çağrılır.", "free", ["delete", "release", "drop"], "'free' bellek sızıntısını önlemek için ayrılan alanı geri verir."),
            ("İşaretçinin gösterdiği yerdeki veriyi okumak için 'int x = _____ptr;' yazılır.", "*", ["&", "->", "%"], "'*' dereference operatörüdür, adresteki değeri çeker."),
            ("Yapı (struct) işaretçisi üzerinden üyelere erişmek için 'ptr_____field' kullanılır.", "->", [".", "::", ":"], "İşaretçilerde ok (->) operatörü (*ptr).field anlamına gelir.")
        ],
        "tf": [
            ("C dilinde diziler fonksiyonlara geçirildiğinde bir işaretçiye dönüşür (decay).", True, "Diziler fonksiyona değer olarak değil, ilk elemanın bellek adresi olarak kopyalanır."),
            ("free(ptr) çağrısı ptr işaretçisinin değerini otomatik olarak NULL yapar.", False, "free sadece belleği serbest bırakır, ptr eski adresi tutmaya devam eder (dangling pointer).")
        ],
        "mat1": [
            ("Stack", "Yerel değişkenlerin tutulduğu hızlı, otomatik temizlenen bellek"),
            ("Heap", "malloc/free ile dinamik yönetilen esnek bellek bölgesi"),
            ("Pointer", "Başka bir verinin bellek adresini saklayan değişken"),
            ("Segmentation Fault", "Geçersiz bir bellek adresine erişim girişimi hatası")
        ],
        "mat2": [
            ("& operatörü", "Değişkenin bellek adresini alır"),
            ("* operatörü", "Adresteki değere erişir (Dereference)"),
            ("malloc()", "Sıfırlanmamış ham bellek tahsis eder"),
            ("calloc()", "Sıfırlanmış (0x00) bellek tahsis eder")
        ]
    }
