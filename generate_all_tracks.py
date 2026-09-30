# -*- coding: utf-8 -*-
"""
Full Generator for all 10 tracks
Generates 10 tracks x 5 units x 6 lessons x 18 questions = 5,400 questions!
"""

import os
from track_generator_engine import write_curriculum_file
from question_bank_builder import generate_lesson_questions

BASE_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\lib\data"

TRACK_CONFIGS = [
    {
        "track": "git",
        "file": "git_curriculum.dart",
        "var_name": "gitUnits",
        "lang_enum": "CodeLanguage.git",
        "units": [
            {
                "id": "git_unit_1", "unitNumber": 1, "title": "Git Temelleri & Versiyon Kontrolü", "category": "Temeller", "colorHex": "0xFFF05032",
                "cheatSheetTitle": "Git Temelleri Hile Kağıdı",
                "cheatSheetContent": "git init\ngit status\ngit add .\ngit commit -m 'feat: ilk commit'\ngit diff",
                "lessons": [
                    ("Git Nedir & Dağıtık Versiyon Kontrol", "Merkezi vs Dağıtık mimari", "git_init_philosophy", False),
                    ("Çalışma Alanları (Working, Staging, Repo)", "Git'in 3 temel ağacı", "git_three_trees", False),
                    ("git status ve git diff ile İnceleme", "Satır satır dosya farkları", "git_status_diff", False),
                    ("git add ve .gitignore Kuralları", "İzlenmeyen dosyaları yok sayma", "git_add_gitignore", False),
                    ("git commit ve Mesaj Yazım Standartları", "Atomik commitler ve Conventional Commits", "git_commit_best_practices", False),
                    ("1. Ünite Kapsamlı Git Temelleri Sınavı", "Temel Git komutları sınavı", "git_u1_exam", True),
                ]
            },
            {
                "id": "git_unit_2", "unitNumber": 2, "title": "Dallanma (Branching) & Birleştirme", "category": "Dallanma & Branch", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Git Branch & Merge Hile Kağıdı",
                "cheatSheetContent": "git branch <dal>\ngit switch <dal>\ngit merge <dal>\ngit branch -d <dal>",
                "lessons": [
                    ("Dallanma Felsefesi & git branch", "HEAD referansı ve dal mantığı", "git_branch_basics", False),
                    ("git switch ile Dallar Arası Geçiş", "Yeni dal açma ve geçiş yapma", "git_checkout_switch", False),
                    ("Fast-Forward vs 3-Way Merge", "Dalları birleştirme stratejileri", "git_merge_types", False),
                    ("Merge Çakışmaları (Conflicts) & Çözümü", "Çakışma etiketleri ve çözüm adımları", "git_merge_conflicts", False),
                    ("Dal Temizliği & git branch -d / -D", "Birleşmiş dalları güvenle silme", "git_branch_cleanup", False),
                    ("2. Ünite Kapsamlı Branching Sınavı", "Dallanma ve çakışma yönetimi sınavı", "git_u2_exam", True),
                ]
            },
            {
                "id": "git_unit_3", "unitNumber": 3, "title": "Uzak Depolar (Remotes) & GitHub", "category": "Uzak Depo & GitHub", "colorHex": "0xFFEA580C",
                "cheatSheetTitle": "Git Remote & GitHub Hile Kağıdı",
                "cheatSheetContent": "git remote -v\ngit fetch origin\ngit pull origin main\ngit push -u origin main",
                "lessons": [
                    ("Uzak Depo Mantığı & origin", "Uzak URL tanımlama ve kontrol", "git_remote_origin", False),
                    ("git fetch vs git pull Farkı", "İndirme ve otomatik birleştirme farkı", "git_fetch_vs_pull", False),
                    ("git push ve Upstream (-u) Takibi", "Dalı uzak sunucuya bağlama", "git_push_upstream", False),
                    ("Pull Request (PR) & Kod İnceleme", "GitHub üzerinde profesyonel PR akışı", "git_pr_code_review", False),
                    ("Fork & Açık Kaynak İş Akışı", "Bağımsız çatal oluşturma ve senkronizasyon", "git_fork_workflow", False),
                    ("3. Ünite Kapsamlı Uzak Depolar Sınavı", "GitHub ve remote yönetim sınavı", "git_u3_exam", True),
                ]
            },
            {
                "id": "git_unit_4", "unitNumber": 4, "title": "Gelişmiş Git & Zaman Yolculuğu", "category": "Rebase & Reset", "colorHex": "0xFFC2410C",
                "cheatSheetTitle": "Rebase & Reset Hile Kağıdı",
                "cheatSheetContent": "git rebase main\ngit rebase -i HEAD~3\ngit cherry-pick <hash>\ngit reset --soft HEAD~1\ngit stash",
                "lessons": [
                    ("git rebase ile Düzlemsel Tarihçe", "Rebase mantığı ve altın kurallar", "git_rebase_basics", False),
                    ("İnteraktif Rebase (git rebase -i)", "Commit squash ve mesaj düzenleme", "git_interactive_rebase", False),
                    ("git cherry-pick ile Seçici Commit", "Başka daldan tek bir commiti alma", "git_cherry_pick", False),
                    ("git reset Modları (--soft, --mixed, --hard)", "Geri sarma seviyeleri ve veri güvenliği", "git_reset_types", False),
                    ("git revert, git stash & git reflog", "Güvenli geri alma ve kayıp commit bulma", "git_revert_stash_reflog", False),
                    ("4. Ünite Kapsamlı Zaman Yolculuğu Sınavı", "Rebase, reset ve kurtarma sınavı", "git_u4_exam", True),
                ]
            },
            {
                "id": "git_unit_5", "unitNumber": 5, "title": "Git İç Mimarisi & DevOps Pratikleri", "category": "İleri Seviye & Stash", "colorHex": "0xFF9A3412",
                "cheatSheetTitle": "Git İç Yapı & Tag Hile Kağıdı",
                "cheatSheetContent": "git tag -a v1.0.0 -m 'v1.0.0'\ngit reflog\ngit bisect start\ngit clean -fd",
                "lessons": [
                    ("Git Objeleri (Blob, Tree, Commit, Tag)", "SHA hashleri ve içerik adresleme", "git_objects_internals", False),
                    ("Git Tag & Sürümleme (SemVer)", "Sürümleri kalıcı etiketleme", "git_tag_semver", False),
                    ("Git Submodules & Çoklu Projeler", "İç içe depo bağımlılıkları", "git_submodules", False),
                    ("Git Hooks & Otomasyon", "pre-commit ile linter entegrasyonu", "git_hooks_automation", False),
                    ("git bisect ile Hata Avcılığı", "İkili arama ile regresyon tespiti", "git_bisect_security", False),
                    ("5. Ünite Kapsamlı Git Ustalık Sınavı", "Kıdemli Git mimarisi değerlendirmesi", "git_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "godot",
        "file": "godot_curriculum.dart",
        "var_name": "godotUnits",
        "lang_enum": "CodeLanguage.godot",
        "units": [
            {
                "id": "godot_unit_1", "unitNumber": 1, "title": "Godot 4 & Düğüm/Sahne Mimarisi", "category": "Temeller & Düğümler", "colorHex": "0xFF478CBF",
                "cheatSheetTitle": "Godot Düğüm Mimarisi Hile Kağıdı",
                "cheatSheetContent": "# Düğüme erişim\n$Sprite2D\nget_node('Sprite2D')\n\n# Sahne değiştirme\nget_tree().change_scene_to_file('res://Game.tscn')",
                "lessons": [
                    ("Godot 4 Motoru & Düğüm (Node) Felsefesi", "Her şeyin bir düğüm olduğu mimari", "godot_node_philosophy", False),
                    ("Sahne (Scene) & Sahne Ağacı (SceneTree)", "Sahnelerin birleşerek oyunu oluşturması", "godot_scenes_tree", False),
                    ("Düğüm Hiyerarşisi ($Node & get_node)", "Ağaç üzerinde gezinme ve erişim", "godot_node_access", False),
                    ("Sahne Mirası & Örnekleme (Instancing)", "Karakter ve düşman sahnelerini çoğaltma", "godot_scene_instancing", False),
                    ("Proje Ayarları & Koordinat Sistemi", "Pencere çözünürlüğü ve 2D koordinat düzlemi", "godot_project_setup", False),
                    ("1. Ünite Godot Düğüm Mimarisi Sınavı", "Düğümler ve sahne yapısı sınavı", "godot_u1_exam", True),
                ]
            },
            {
                "id": "godot_unit_2", "unitNumber": 2, "title": "GDScript 2.0 Syntax & Tipler", "category": "GDScript 2.0", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "GDScript 2.0 Hile Kağıdı",
                "cheatSheetContent": "extends CharacterBody2D\n\n@export var speed: float = 300.0\n@onready var anim = $AnimationPlayer\n\nfunc _ready() -> void:\n    print('Hazır!')",
                "lessons": [
                    ("Değişkenler, Sabitler & Statik Tipleme", "var, const ve tip belirteçleri (: float)", "godot_vars_typing", False),
                    ("@export ve @onready Direktifleri", "Inspector entegrasyonu ve hazır referanslar", "godot_export_onready", False),
                    ("Fonksiyonlar & Lambdalar (Callable)", "Dönüş tipleri ve Callables yapısı", "godot_functions_callable", False),
                    ("Koşullar, match İfadesi & Enums", "Durum makineleri için match ifadesi", "godot_match_enums", False),
                    ("Diziler, Sözlükler (Dictionary) & Döngüler", "Koleksiyonlar ve for döngüsü", "godot_collections_loops", False),
                    ("2. Ünite GDScript 2.0 Sınavı", "GDScript sözdizimi ve tipler sınavı", "godot_u2_exam", True),
                ]
            },
            {
                "id": "godot_unit_3", "unitNumber": 3, "title": "2D & 3D Oyun Fizik ve Hareketi", "category": "Fizik & Hareket", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Godot Fizik Hile Kağıdı",
                "cheatSheetContent": "func _physics_process(delta):\n    var dir = Input.get_axis('ui_left', 'ui_right')\n    velocity.x = dir * SPEED\n    move_and_slide()",
                "lessons": [
                    ("CharacterBody2D & move_and_slide()", "Oyuncu hareketi ve çarpışma tepkisi", "godot_character_body", False),
                    ("Fizik Döngüsü: _physics_process & delta", "Sabit kare hızı ve zaman hesapları", "godot_physics_process", False),
                    ("CollisionShape2D & Çarpışma Katmanları", "Collision Layers ve Masks ayarları", "godot_collision_shapes", False),
                    ("Area2D & Tetikleyiciler (Triggers)", "Altın toplama ve kapı açma sensörleri", "godot_area2d_triggers", False),
                    ("RigidBody2D & Fiziksel Kuvvetler", "Kütle, sürtünme ve itme kuvveti", "godot_rigidbody_forces", False),
                    ("3. Ünite Fizik & Karakter Sınavı", "Karakter hareketi ve çarpışmalar sınavı", "godot_u3_exam", True),
                ]
            },
            {
                "id": "godot_unit_4", "unitNumber": 4, "title": "Sinyaller & Olay Mimarisi", "category": "Sinyaller & Olaylar", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "Godot Sinyal Hile Kağıdı",
                "cheatSheetContent": "signal coin_collected(amount)\n\nfunc collect():\n    coin_collected.emit(10)\n\n# Bağlama\ncoin_collected.connect(_on_coin_collected)",
                "lessons": [
                    ("Sinyal Nedir? (Observer Deseni)", "Düğümler arası gevşek bağlı iletişim", "godot_signals_intro", False),
                    ("Özel Sinyal Tanımlama & emit()", "signal anahtarı ve parametreli tetikleme", "godot_custom_signals", False),
                    ("Kod ile Sinyal Bağlama (connect)", "Dinamik sinyal dinleyicileri", "godot_signal_connect", False),
                    ("Global Olay Yolu (Event Bus & Autoload)", "Merkezi oyun yöneticisi deseni", "godot_event_bus_autoload", False),
                    ("Sahne Geçişleri & Bellek Yönetimi", "change_scene_to_file ve queue_free()", "godot_scene_switching", False),
                    ("4. Ünite Sinyaller & Mimari Sınavı", "Sinyal ve event mimarisi sınavı", "godot_u4_exam", True),
                ]
            },
            {
                "id": "godot_unit_5", "unitNumber": 5, "title": "UI, Animasyon, Ses & Export", "category": "UI & Animasyon", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Godot UI & Animasyon Hile Kağıdı",
                "cheatSheetContent": "var tween = create_tween()\ntween.tween_property($Sprite2D, 'modulate:a', 0.0, 0.5)\n$AudioPlayer.play()",
                "lessons": [
                    ("Control Düğümleri & Responsive Arayüz", "VBox, HBox, Anchors ve Marginler", "godot_control_ui", False),
                    ("AnimationPlayer & Anahtar Kareler", "Karakter animasyonları ve trackler", "godot_animation_player", False),
                    ("Tween İle Kodla Akıcı Animasyon", "Pürüzsüz geçişler ve interpolasyon", "godot_tweens_code", False),
                    ("AudioStreamPlayer & Ses Kanalları", "BGM, SFX ve ses bus yönetimi", "godot_audio_system", False),
                    ("Shader Temelleri & Platform Dışa Aktarma", "Görsel efektler ve Android/PC derlemesi", "godot_shaders_export", False),
                    ("5. Ünite Godot Ustalık Sınavı", "Kapsamlı Godot oyun geliştirme sınavı", "godot_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "c",
        "file": "c_curriculum.dart",
        "var_name": "cUnits",
        "lang_enum": "CodeLanguage.c",
        "units": [
            {
                "id": "c_unit_1", "unitNumber": 1, "title": "C Temelleri & Derleme Mimarisi", "category": "Temeller & Tipler", "colorHex": "0xFF0284C7",
                "cheatSheetTitle": "C Temelleri Hile Kağıdı",
                "cheatSheetContent": "#include <stdio.h>\n\nint main() {\n    int a = 10;\n    float b = 3.14f;\n    printf('a: %d, b: %.2f\\n', a, b);\n    return 0;\n}",
                "lessons": [
                    ("C Diline Giriş & main() Fonksiyonu", "Dönüş kodları ve programın giriş noktası", "c_main_intro", False),
                    ("Temel Veri Tipleri & sizeof Operatörü", "int, char, float, double ve bayt boyutları", "c_types_sizeof", False),
                    ("Formatlı Girdi/Çıktı (printf & scanf)", "%d, %f, %s, %p format belirteçleri", "c_printf_scanf", False),
                    ("GCC Derleme Aşamaları (Preprocess, Compile, Link)", "Derleme boru hattı ve .o dosyaları", "c_gcc_stages", False),
                    ("Operatörler & Tip Dönüşümleri (Casting)", "Aritmetik ve açık tür dönüşümleri", "c_operators_casting", False),
                    ("1. Ünite C Temelleri & Derleme Sınavı", "C dili temelleri değerlendirme sınavı", "c_u1_exam", True),
                ]
            },
            {
                "id": "c_unit_2", "unitNumber": 2, "title": "Bellek & İşaretçiler (Pointers)", "category": "İşaretçiler (Pointers)", "colorHex": "0xFF38BDF8",
                "cheatSheetTitle": "C Pointer Hile Kağıdı",
                "cheatSheetContent": "int x = 42;\nint *p = &x;     // Adres ata\n*p = 100;        // Dereference (x degisir)\nprintf('%p\\n', (void*)p);",
                "lessons": [
                    ("Bellek Adresi & Address-of Operatörü (&)", "RAM yapısı ve değişkenlerin adresleri", "c_addressof_intro", False),
                    ("İşaretçi Tanımlama & Dereferencing (*)", "Adrese erişme ve değeri değiştirme", "c_pointer_deref", False),
                    ("İşaretçi Aritmetiği (Pointer Arithmetic)", "ptr + 1 neden veri tipi boyutu kadar atlar?", "c_pointer_arithmetic", False),
                    ("Diziler ve İşaretçi İlişkisi (Decay)", "Dizi adının bir işaretçi gibi davranması", "c_arrays_pointers", False),
                    ("void* (Jenerik İşaretçi) & NULL Kontrolü", "Tipten bağımsız bellek adresleri", "c_void_null_pointers", False),
                    ("2. Ünite Bellek & İşaretçiler Sınavı", "İşaretçi ustalığı değerlendirme sınavı", "c_u2_exam", True),
                ]
            },
            {
                "id": "c_unit_3", "unitNumber": 3, "title": "Dinamik Bellek Yönetimi (Heap & Stack)", "category": "Dinamik Bellek & Malloc", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "C Dinamik Bellek Hile Kağıdı",
                "cheatSheetContent": "int *arr = malloc(10 * sizeof(int));\nif (arr == NULL) return 1;\n// ... kullan ...\nfree(arr);\narr = NULL; // Dangling pointer onle",
                "lessons": [
                    ("Stack vs Heap Bellek Mimarisi", "Otomatik ömür vs manuel tahsis farkları", "c_stack_heap_diff", False),
                    ("malloc() & Dinamik Bellek Tahsisi", "Heap üzerinde bayt bazlı alan açma", "c_malloc_usage", False),
                    ("free() & Belleği Sisteme İade Etme", "Bellek temizliği ve çift free (double free) hatası", "c_free_cleanup", False),
                    ("calloc() ve realloc() Kullanımı", "Sıfırlanmış bellek ve boyut genişletme", "c_calloc_realloc", False),
                    ("Bellek Sızıntısı (Memory Leak) & Valgrind", "Sızıntıları tespit etme ve önleme", "c_memory_leaks_valgrind", False),
                    ("3. Ünite Dinamik Bellek Sınavı", "Heap yönetimi ve güvenli tahsis sınavı", "c_u3_exam", True),
                ]
            },
            {
                "id": "c_unit_4", "unitNumber": 4, "title": "Structs, Unions & Veri Yapıları", "category": "Structs & Unions", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "C Struct Hile Kağıdı",
                "cheatSheetContent": "typedef struct {\n    int id;\n    char name[32];\n} Student;\n\nStudent s;\ns.id = 1;\nStudent *ptr = &s;\nptr->id = 2;",
                "lessons": [
                    ("struct Tanımlama & typedef Kolaylığı", "Özel veri modelleri ve ok operatörü (->)", "c_struct_typedef", False),
                    ("Struct Padding & Bellek Hizalama (Alignment)", "Bellekte boşluklar neden bırakılır?", "c_struct_padding", False),
                    ("union & Ortak Bellek Alanı Kullanımı", "Aynı adresi paylaşan değişkenler", "c_union_shared", False),
                    ("enum & Sabit Değer Gruplama", "Durum kodları ve okunabilir sabitler", "c_enum_constants", False),
                    ("Tek Yönlü Bağlı Liste (Linked List) Temelleri", "Düğümler ve next işaretçileri", "c_linked_list_basics", False),
                    ("4. Ünite Structs & Veri Yapıları Sınavı", "Veri modelleme ve struct mimarisi sınavı", "c_u4_exam", True),
                ]
            },
            {
                "id": "c_unit_5", "unitNumber": 5, "title": "Düşük Seviye, Bit Manipülasyonu & Dosyalar", "category": "Bitwise & Dosya", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "C Düşük Seviye Hile Kağıdı",
                "cheatSheetContent": "// Bitwise\nint flags = (1 << 3); // 3. biti 1 yap\n\n// Dosya\nFILE *f = fopen('data.bin', 'rb');\nfread(buf, 1, 100, f);\nfclose(f);",
                "lessons": [
                    ("Bit Düzeyi Operatörler (&, |, ^, ~, <<, >>)", "İkili sistemde bit işlemleri", "c_bitwise_operators", False),
                    ("Bit Maskeleme & Flag Yönetimi", "Bayrakları set etme, temizleme ve okuma", "c_bit_masking", False),
                    ("Dosya İşlemleri (fopen, fclose, fread, fwrite)", "Metin ve ikili dosya okuma/yazma", "c_file_io_binary", False),
                    ("Önişlemci Direktifleri (#define, Header Guards)", "Makrolar ve derleme koruyucuları", "c_preprocessor_guards", False),
                    ("Fonksiyon İşaretçileri (Function Pointers)", "Metotları parametre olarak geçirme", "c_function_pointers", False),
                    ("5. Ünite C Düşük Seviye Ustalık Sınavı", "Sistem programlama ve C ustalığı sınavı", "c_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "python",
        "file": "python_curriculum.dart",
        "var_name": "pythonUnits",
        "lang_enum": "CodeLanguage.python",
        "units": [
            {
                "id": "py_unit_1", "unitNumber": 1, "title": "Python 3 Temelleri & Tipler", "category": "Temeller", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Python Temelleri Hile Kağıdı",
                "cheatSheetContent": "name = 'Ada'\nprint(f'Selam {name}')\n\nsayi = int('42')\non_altilik = 0xFF",
                "lessons": [
                    ("print() ve Modern f-String Biçimlendirme", "Ekrana yazdırma ve string interpolasyonu", "py_fstring_print", False),
                    ("Temel Veri Tipleri (int, float, bool, str)", "Dinamik tipleme ve tip dönüşümleri", "py_types_casting", False),
                    ("Aritmetik ve Mantıksal Operatörler", "Matematiksel işlemler ve mantık kapıları", "py_operators_logic", False),
                    ("Koşullu İfadeler (if, elif, else)", "Girintileme (indentation) ve karar akışları", "py_if_conditions", False),
                    ("Döngüler (for ve while)", "range() fonksiyonu ve döngü kontrolleri", "py_loops_range", False),
                    ("1. Ünite Python Temelleri Sınavı", "Python temel sözdizimi sınavı", "py_u1_exam", True),
                ]
            },
            {
                "id": "py_unit_2", "unitNumber": 2, "title": "Veri Yapıları & Koleksiyonlar", "category": "Koleksiyonlar", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "Python Koleksiyonlar Hile Kağıdı",
                "cheatSheetContent": "liste = [1, 2, 3]\nsozluk = {'id': 1, 'ad': 'Ali'}\nkume = {1, 2, 3}\n\nkareler = [x**2 for x in liste]",
                "lessons": [
                    ("Listeler (Lists) ve Dilimleme (Slicing)", "Mutable yapılar ve indeksleme pratikleri", "py_lists_slicing", False),
                    ("Demetler (Tuples) & İmmutability", "Değişmez veri paketleri", "py_tuples_immutability", False),
                    ("Sözlükler (Dictionaries) ve get() Metodu", "Anahtar-değer eşleşmesi ve güvenli okuma", "py_dicts_get", False),
                    ("Kümeler (Sets) ve Küme Operatörleri", "Benzersiz elemanlar ve kesişim/birleşim", "py_sets_operations", False),
                    ("List & Dict Comprehensions", "Tek satırda yüksek performanslı üretim", "py_comprehensions", False),
                    ("2. Ünite Koleksiyonlar Sınavı", "Veri yapıları ve filtreleme sınavı", "py_u2_exam", True),
                ]
            },
            {
                "id": "py_unit_3", "unitNumber": 3, "title": "Fonksiyonlar, Lambdalar & Kapsam", "category": "Fonksiyonlar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Python Fonksiyon Hile Kağıdı",
                "cheatSheetContent": "def greet(name, *args, **kwargs):\n    return f'Merhaba {name}'\n\nkare = lambda x: x * 2",
                "lessons": [
                    ("Fonksiyon Tanımlama (def) & Varsayılan Değerler", "Parametre geçişi ve dönüş değerleri", "py_def_defaults", False),
                    ("*args ve **kwargs ile Esnek Argümanlar", "Bilinmeyen sayıda parametre yakalama", "py_args_kwargs", False),
                    ("Lambda Fonksiyonları & map / filter", "Anonim tek satırlık fonksiyonlar", "py_lambdas_map", False),
                    ("Kapsam Kuralları (LEGB & nonlocal)", "Yerel ve global değişken erişimi", "py_scope_legb", False),
                    ("Decorator Mantığı (@decorator)", "Fonksiyonları sarmallayarak genişletme", "py_decorators_intro", False),
                    ("3. Ünite Fonksiyonlar & Lambdalar Sınavı", "Fonksiyonel Python sınavı", "py_u3_exam", True),
                ]
            },
            {
                "id": "py_unit_4", "unitNumber": 4, "title": "Nesne Yönelimli Programlama (OOP)", "category": "OOP", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Python OOP Hile Kağıdı",
                "cheatSheetContent": "class User:\n    def __init__(self, name):\n        self.name = name\n    def __str__(self):\n        return self.name",
                "lessons": [
                    ("Sınıf ve Nesne (Class & self)", "Örnek nitelikleri ve sınıf nitelikleri", "py_class_self", False),
                    ("__init__ Kurucusu ve Kapsülleme", "Nesne başlatma ve private alanlar (_gizli)", "py_init_encapsulation", False),
                    ("Kalıtım (Inheritance) & super()", "Üst sınıf metotlarını genişletme", "py_inheritance_super", False),
                    ("Dunder (Magic) Metotlar (__str__, __len__)", "Python veri modelini entegre etme", "py_dunder_methods", False),
                    ("@property ve Getter/Setter Mantığı", "Nitelik erişimini fonksiyonla kontrol etme", "py_property_decorator", False),
                    ("4. Ünite Nesne Yönelimli Python Sınavı", "OOP ve modelleme sınavı", "py_u4_exam", True),
                ]
            },
            {
                "id": "py_unit_5", "unitNumber": 5, "title": "İleri Seviye Python & Ekosistem", "category": "Hata & Dosya", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "İleri Python Hile Kağıdı",
                "cheatSheetContent": "with open('f.txt') as f:\n    pass\n\ndef gen():\n    yield 1",
                "lessons": [
                    ("Generators & yield Anahtar Kelimesi", "Bellek tasarruflu veri üretimi", "py_generators_yield", False),
                    ("Context Manager & with Bloğu", "Kaynakların güvenle kapatılması", "py_context_managers", False),
                    ("Hata Yakalama (try / except / finally)", "Özel istisnalar fırlatma (raise)", "py_exceptions_try", False),
                    ("Tip İpuçları (Type Hinting) & dataclasses", "Statik tip güvenliği ve veri sınıfları", "py_typing_dataclasses", False),
                    ("asyncio ile Asenkron Programlama", "async/await ve eşzamanlı görevler", "py_asyncio_intro", False),
                    ("5. Ünite Python Ustalık Sınavı", "Kıdemli Python geliştirici sınavı", "py_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "csharp",
        "file": "csharp_curriculum.dart",
        "var_name": "csharpUnits",
        "lang_enum": "CodeLanguage.csharp",
        "units": [
            {
                "id": "cs_unit_1", "unitNumber": 1, "title": "C# & .NET 8 Temelleri", "category": "Temeller", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "C# Temelleri Hile Kağıdı",
                "cheatSheetContent": "int a = 10;\nstring s = $'Deger: {a}';\nvar point = (X: 1, Y: 2);",
                "lessons": [
                    ("Değer vs Referans Tipleri (Stack vs Heap)", "Bellek tahsis farkları", "cs_val_ref_types", False),
                    ("Nullability & Null-Forgiving Operatörü", "Nullable referans tipleri (string?)", "cs_nullability", False),
                    ("Diziler, Listeler ve Koleksiyon Başlatıcılar", "List<T> ve modern koleksiyon ifadeleri", "cs_lists_collections", False),
                    ("Pattern Matching & Modern switch", "Tip ve özellik eşleme kalıpları", "cs_pattern_matching", False),
                    ("Metotlar, params ve ref/out Parametreleri", "Argüman geçirme mekanizmaları", "cs_methods_ref_out", False),
                    ("1. Ünite C# Temelleri Sınavı", ".NET temel tipler değerlendirmesi", "cs_u1_exam", True),
                ]
            },
            {
                "id": "cs_unit_2", "unitNumber": 2, "title": "OOP & Kurumsal Mimari", "category": "Sınıflar & OOP", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "C# OOP Hile Kağıdı",
                "cheatSheetContent": "public record Dev(string Name, int Exp);\npublic interface IRepo { void Save(); }",
                "lessons": [
                    ("Sınıflar, Kurucular & Primary Constructors", "Modern C# 12 sınıf başlatıcıları", "cs_classes_primary_ctor", False),
                    ("Arayüzler (Interfaces) & Dependency Injection", "Gevşek bağlılık ve servis sözleşmeleri", "cs_interfaces_di", False),
                    ("Kalıtım, abstract Sınıflar & virtual", "Çok biçimlilik ve override kuralları", "cs_inheritance_polymorphism", False),
                    ("record & Değer Tabanlı Eşitlik", "Değişmez (immutable) veri taşıyıcılar", "cs_records_equality", False),
                    ("sealed Sınıflar & Performans Optimizasyonu", "Kalıtımı kapatmanın derleme avantajları", "cs_sealed_perf", False),
                    ("2. Ünite OOP & Mimari Sınavı", "Kurumsal nesne modelleme sınavı", "cs_u2_exam", True),
                ]
            },
            {
                "id": "cs_unit_3", "unitNumber": 3, "title": "Koleksiyonlar & Güçlü LINQ", "category": "Koleksiyonlar & LINQ", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "C# LINQ Hile Kağıdı",
                "cheatSheetContent": "var r = items.Where(x => x.Active).Select(x => x.Id).ToList();",
                "lessons": [
                    ("LINQ Temelleri & Deferred Execution", "Ertelenmiş sorgulama mekanizması", "cs_linq_deferred", False),
                    ("Where, Select ve OrderBy Filtreleri", "Temel sorgu metotları", "cs_linq_filter_sort", False),
                    ("GroupBy, Join ve İlişkisel Sorgular", "Koleksiyonları gruplama ve bağlama", "cs_linq_group_join", False),
                    ("Aggregate, Any, All ve FirstOrDefault", "Sonuç özetleme ve doğrulama", "cs_linq_aggregate", False),
                    ("Dictionary<TKey, TValue> & Hash Performansı", "Anahtar bazlı hızlı erişim", "cs_dictionary_hash", False),
                    ("3. Ünite LINQ & Veri İşleme Sınavı", "LINQ uzmanlık sınavı", "cs_u3_exam", True),
                ]
            },
            {
                "id": "cs_unit_4", "unitNumber": 4, "title": "Asenkron Programlama & Görevler", "category": "Asenkron & Hata", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "C# Async Hile Kağıdı",
                "cheatSheetContent": "async Task<int> FetchDataAsync(CancellationToken ct) {\n    return await Task.FromResult(42);\n}",
                "lessons": [
                    ("async / await ve Task Modeli", "İş parçacığı bloklamadan IO operasyonu", "cs_async_await_task", False),
                    ("Task<T> vs ValueTask<T> Performansı", "Ekstra heap tahsisinden kaçınma", "cs_valuestask_perf", False),
                    ("CancellationToken ile İptal Yönetimi", "İstek zaman aşımları ve iptal akışı", "cs_cancellation_token", False),
                    ("Task.WhenAll ve Eşzamanlı Çalıştırma", "Birden çok görevi paralel koşturma", "cs_task_whenall", False),
                    ("Deadlock Tuzakları & ConfigureAwait(false)", "UI senkronizasyon bağlamı yönetimi", "cs_deadlocks_configureawait", False),
                    ("4. Ünite Asenkron C# Sınavı", "Asenkron mimari değerlendirmesi", "cs_u4_exam", True),
                ]
            },
            {
                "id": "cs_unit_5", "unitNumber": 5, "title": "İleri Seviye C# & Bellek Mimarisi", "category": "Asenkron & Hata", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "C# Bellek Hile Kağıdı",
                "cheatSheetContent": "using var stream = File.OpenRead('f');\nSpan<byte> buf = stackalloc byte[128];",
                "lessons": [
                    ("Delegates, Func<T> ve Action<T>", "Tip güvenli fonksiyon işaretçileri", "cs_delegates_func_action", False),
                    ("Events & Publisher-Subscriber Modeli", "Olay tabanlı bildirimler", "cs_events_pubsub", False),
                    ("IDisposable & using İfadesi", "Yönetilmeyen kaynakları serbest bırakma", "cs_idisposable_using", False),
                    ("Span<T> ve Memory<T> ile Sıfır Tahsis", "Bellek kopyalamadan yüksek hız", "cs_span_memory", False),
                    ("Garbage Collector (GC) & Bellek Nesilleri", "Gen0, Gen1, Gen2 çalışma mantığı", "cs_gc_internals", False),
                    ("5. Ünite C# Ustalık Sınavı", "Kıdemli .NET mimarisi sınavı", "cs_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "kotlin",
        "file": "kotlin_curriculum.dart",
        "var_name": "kotlinUnits",
        "lang_enum": "CodeLanguage.kotlin",
        "units": [
            {
                "id": "kt_unit_1", "unitNumber": 1, "title": "Kotlin Temelleri & Güvenli Tipler", "category": "Temeller", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Kotlin Temelleri Hile Kağıdı",
                "cheatSheetContent": "val a: Int = 10\nvar s: String? = null\nval len = s?.length ?: 0",
                "lessons": [
                    ("val vs var ve Değişmezlik Felsefesi", "Salt okunur referanslar", "kt_val_var_immutability", False),
                    ("Null Safety & Nullable Tipler (Type?)", "NPE hatalarını kökten engelleme", "kt_null_safety_intro", False),
                    ("Elvis Operatörü (?:) & Güvenli Çağrı (?.)", "Null durumunda varsayılan değer dönme", "kt_elvis_operator", False),
                    ("Smart Casts & is Kontrolü", "Otomatik tip dönüştürme mekanizması", "kt_smart_casts", False),
                    ("Temel Tipler ve String Şablonları ($var)", "Metin içine değişken gömme", "kt_string_templates", False),
                    ("1. Ünite Kotlin Temelleri Sınavı", "Temel Kotlin sözdizimi sınavı", "kt_u1_exam", True),
                ]
            },
            {
                "id": "kt_unit_2", "unitNumber": 2, "title": "Fonksiyonlar & Lambdalar", "category": "Fonksiyonlar & Lambdalar", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "Kotlin Fonksiyon Hile Kağıdı",
                "cheatSheetContent": "fun String.clean() = this.trim().lowercase()\nuser?.let { println(it.name) }",
                "lessons": [
                    ("Fonksiyon Tanımlama & Tek Satırlık İfadeler", "fun sum(a: Int, b: Int) = a + b", "kt_fun_single_expression", False),
                    ("Genişletme Fonksiyonları (Extension Functions)", "Sınıfları miras almadan genişletme", "kt_extension_functions", False),
                    ("Yüksek Mertebeden Fonksiyonlar (Higher-Order)", "Fonksiyon alan ve dönen fonksiyonlar", "kt_higher_order_functions", False),
                    ("Scope Fonksiyonları (let, apply, also, run, with)", "Nesne bağlamı yönetimi", "kt_scope_functions", False),
                    ("inline Fonksiyonlar & Performans Avantajı", "Lambda nesnesi tahsisini engelleme", "kt_inline_functions", False),
                    ("2. Ünite Fonksiyonlar & Lambdalar Sınavı", "Fonksiyonel Kotlin değerlendirmesi", "kt_u2_exam", True),
                ]
            },
            {
                "id": "kt_unit_3", "unitNumber": 3, "title": "OOP, Data Class & Tipler", "category": "Data Class & OOP", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Kotlin OOP Hile Kağıdı",
                "cheatSheetContent": "data class Dev(val id: Int, val name: String)\nsealed interface UiState { object Loading : UiState }",
                "lessons": [
                    ("Sınıflar & Primary Constructor", "Kurucu parametreleri ve init bloğu", "kt_classes_primary_ctor", False),
                    ("data class & copy() Metodu", "Veri taşıyıcı modeller ve otomatik metotlar", "kt_data_classes_copy", False),
                    ("sealed class & sealed interface", "Sınırlı sayıda hiyerarşi ve when güvenliği", "kt_sealed_classes", False),
                    ("object (Singleton) & companion object", "Tekil nesneler ve statik benzeri üyeler", "kt_object_companion", False),
                    ("open, final ve Kalıtım Kuralları", "Varsayılan kapalı kalıtım felsefesi", "kt_open_inheritance", False),
                    ("3. Ünite OOP & Tipler Sınavı", "Kotlin nesne modelleme sınavı", "kt_u3_exam", True),
                ]
            },
            {
                "id": "kt_unit_4", "unitNumber": 4, "title": "Koleksiyonlar & Veri İşleme", "category": "Koleksiyonlar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Kotlin Koleksiyon Hile Kağıdı",
                "cheatSheetContent": "val list = listOf(1, 2, 3)\nval evens = list.filter { it % 2 == 0 }",
                "lessons": [
                    ("Değişmez vs Değiştirilebilir Koleksiyonlar", "listOf() vs mutableListOf()", "kt_immutable_collections", False),
                    ("map, filter ve find Dönüşümleri", "Koleksiyon filtreleme ve projeksiyon", "kt_map_filter_find", False),
                    ("groupBy, associateBy ve Kümeleme", "Harita yapılarına hızlı dönüştürme", "kt_groupby_associate", False),
                    ("reduce ve fold ile Kümülatif Hesap", "Toplam ve birleştirme işlemleri", "kt_reduce_fold", False),
                    ("Sequences (Tembel Değerlendirme)", "Büyük veri listelerinde bellek optimizasyonu", "kt_sequences_lazy", False),
                    ("4. Ünite Koleksiyonlar Sınavı", "Koleksiyon ve veri dönüştürme sınavı", "kt_u4_exam", True),
                ]
            },
            {
                "id": "kt_unit_5", "unitNumber": 5, "title": "Coroutines, Flow & Android", "category": "Extensions & Coroutines", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Kotlin Coroutines Hile Kağıdı",
                "cheatSheetContent": "suspend fun fetch() = withContext(Dispatchers.IO) {\n    // Ağ isteği\n}",
                "lessons": [
                    ("Coroutines Nedir & Hafif İş Parçacıkları", "Thread vs Coroutine mimarisi", "kt_coroutines_intro", False),
                    ("suspend Fonksiyonlar & Kesintiye Uğrama", "Bloke etmeden duraklatma", "kt_suspend_functions", False),
                    ("Dispatchers (IO, Main, Default)", "İş parçacığı havuzu seçimi", "kt_dispatchers_threading", False),
                    ("CoroutineScope & Job / İptal Yönetimi", "Yapılandırılmış eşzamanlılık (Structured Concurrency)", "kt_scopes_structured", False),
                    ("Flow & Reaktif Asenkron Veri Akışı", "Soğuk akışlar ve collect işlemi", "kt_flow_reactive", False),
                    ("5. Ünite Kotlin Ustalık Sınavı", "Kıdemli Kotlin ve Coroutines sınavı", "kt_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "linux",
        "file": "linux_curriculum.dart",
        "var_name": "linuxUnits",
        "lang_enum": "CodeLanguage.linux",
        "units": [
            {
                "id": "lin_unit_1", "unitNumber": 1, "title": "Linux & Terminal Temelleri", "category": "Temel Komutlar", "colorHex": "0xFFEAB308",
                "cheatSheetTitle": "Linux Temelleri Hile Kağıdı",
                "cheatSheetContent": "pwd\nls -la\ncd /var/log\nmkdir -p proje/src\nrm -rf temp",
                "lessons": [
                    ("Terminal Dünyası & Dizin Gezintisi (pwd, cd, ls)", "Linux dosya sistemi hiyerarşisi", "lin_nav_basics", False),
                    ("Dosya ve Dizin Yönetimi (mkdir, touch, cp, mv, rm)", "Oluşturma, taşıma ve silme", "lin_file_management", False),
                    ("FHS (Filesystem Hierarchy Standard)", "/etc, /var, /bin, /usr, /home ne işe yarar?", "lin_fhs_hierarchy", False),
                    ("Dosya İçeriğini Görüntüleme (cat, less, head, tail)", "Metin dosyalarını terminalde okuma", "lin_viewing_files", False),
                    ("Canlı Log İzleme: tail -f", "Sürekli güncellenen logları ekranda takip etme", "lin_tail_follow_logs", False),
                    ("1. Ünite Linux Temelleri Sınavı", "Temel Linux komutları değerlendirmesi", "lin_u1_exam", True),
                ]
            },
            {
                "id": "lin_unit_2", "unitNumber": 2, "title": "Giriş/Çıkış & Pipe Mimarisi", "category": "Pipe & Yönlendirme", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Linux Pipe Hile Kağıdı",
                "cheatSheetContent": "ls | grep txt\ncmd > out.txt\ncmd >> out.txt\ncmd 2>&1 | tee log.txt",
                "lessons": [
                    ("Standart Akışlar (stdin: 0, stdout: 1, stderr: 2)", "Linux girdi/çıktı felsefesi", "lin_streams_descriptors", False),
                    ("Yönlendirme Operatörleri (> ve >>)", "Çıktıları dosyalara yazma ve ekleme", "lin_redirection_gt", False),
                    ("Pipe (|) Operatörü ile Komut Zincirleme", "Küçük araçları birbirine bağlama", "lin_pipe_chaining", False),
                    ("Hata Yönlendirme (2>&1 ve /dev/null)", "Gereksiz çıktıları sessize alma", "lin_stderr_devnull", False),
                    ("tee Komutu ile Hem Ekrana Hem Dosyaya Yazma", "Çıktıyı çatallama aracı", "lin_tee_command", False),
                    ("2. Ünite Pipe & Yönlendirme Sınavı", "Linux akış boru hatları sınavı", "lin_u2_exam", True),
                ]
            },
            {
                "id": "lin_unit_3", "unitNumber": 3, "title": "Metin İşleme & Filtreleme", "category": "Metin Filtreleme (grep)", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Linux Filtreleme Hile Kağıdı",
                "cheatSheetContent": "grep -rn 'TODO' .\nawk '{print $1}' access.log\nsed -i 's/foo/bar/g' file.txt",
                "lessons": [
                    ("grep ile Desen ve Kelime Arama", "Arama bayrakları (-i, -r, -v, -n)", "lin_grep_searching", False),
                    ("sed (Stream Editor) ile Metin Değiştirme", "Bul ve değiştir işlemleri (s/eski/yeni/g)", "lin_sed_editing", False),
                    ("awk ile Sütun Bazlı Veri İşleme", "Log formatlarını sütunlara bölüp ayrıştırma", "lin_awk_columns", False),
                    ("cut, sort, uniq ve wc Araçları", "Sıralama, tekilleştirme ve satır sayma", "lin_text_utils", False),
                    ("find ile Gelişmiş Dosya Arama", "İsim, boyut ve tarihe göre dosya bulma", "lin_find_advanced", False),
                    ("3. Ünite Metin İşleme Sınavı", "Terminal metin analizi sınavı", "lin_u3_exam", True),
                ]
            },
            {
                "id": "lin_unit_4", "unitNumber": 4, "title": "İzinler, Kullanıcılar & Süreçler", "category": "İzinler (chmod)", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "Linux İzinler Hile Kağıdı",
                "cheatSheetContent": "chmod 755 script.sh\nchown deploy:www-data app/\nps aux | grep node\nkill -9 <PID>",
                "lessons": [
                    ("Kullanıcı, Grup ve Diğerleri İzin Mantığı", "rwx sembolik izinleri okuma", "lin_permissions_rwx", False),
                    ("chmod ile Sekizlik İzin Değiştirme (755, 644)", "Matematiksel izin hesaplama", "lin_chmod_octal", False),
                    ("chown ile Dosya ve Dizin Sahipliği", "Kullanıcı ve grup sahipliğini aktarma", "lin_chown_ownership", False),
                    ("Süreçleri İzleme (ps aux, top, htop)", "CPU ve RAM tüketen süreçleri bulma", "lin_processes_monitoring", False),
                    ("Süreç Sonlandırma (kill, kill -9 & SIGTERM/SIGKILL)", "Süreçlere sinyal gönderme", "lin_kill_signals", False),
                    ("4. Ünite İzinler & Süreçler Sınavı", "Sistem güvenliği ve süreç yönetimi sınavı", "lin_u4_exam", True),
                ]
            },
            {
                "id": "lin_unit_5", "unitNumber": 5, "title": "Bash Scripting, Ağ & SSH", "category": "Shell Scripting", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "Linux Ağ & Bash Hile Kağıdı",
                "cheatSheetContent": "#!/bin/bash\ncurl -s https://api.com\nssh -i key.pem user@host",
                "lessons": [
                    ("Bash Script Temelleri (Shebang #!/bin/bash)", "Değişkenler ve çalıştırma yetkisi", "lin_bash_shebang", False),
                    ("Koşullar ve Döngüler (if [ ... ], for, while)", "Shell script mantıksal karar blokları", "lin_bash_loops_conditions", False),
                    ("Ağ Araçları (curl, wget, ping, netstat/ss)", "HTTP istekleri ve port dinleme", "lin_network_tools", False),
                    ("SSH ile Uzak Sunucuya Güvenli Bağlantı", "SSH anahtarları (id_rsa) ve ssh-copy-id", "lin_ssh_keys", False),
                    ("Arşivleme ve Sıkıştırma (tar, gzip)", "Yedekleme dosyaları (.tar.gz) oluşturma", "lin_tar_compression", False),
                    ("5. Ünite Linux Ustalık Sınavı", "DevOps ve sistem yöneticiliği sınavı", "lin_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "javascript",
        "file": "javascript_curriculum.dart",
        "var_name": "javascriptUnits",
        "lang_enum": "CodeLanguage.javascript",
        "units": [
            {
                "id": "js_unit_1", "unitNumber": 1, "title": "Modern JS (ES6+) Temelleri", "category": "ES6+ Temelleri", "colorHex": "0xFFF7DF1E",
                "cheatSheetTitle": "JavaScript ES6+ Hile Kağıdı",
                "cheatSheetContent": "const pi = 3.14;\nlet score = 10;\nconst add = (a, b) => a + b;\nconst { id, name } = user;",
                "lessons": [
                    ("let, const vs Eski var Farkı", "Block scope vs Function scope", "js_let_const_var", False),
                    ("Arrow Functions ve Lexical this", "Kısa fonksiyon sözdizimi ve bağlam", "js_arrow_functions", False),
                    ("Template Literals (`${degisken}`)", "Çok satırlı metinler ve formatlama", "js_template_literals", False),
                    ("Destructuring (Parçalama) ile Kolay Atama", "Nesne ve dizi elemanlarını ayıklama", "js_destructuring", False),
                    ("Spread ve Rest Operatörleri (...)", "Dizileri birleştirme ve parametre toplama", "js_spread_rest", False),
                    ("1. Ünite JavaScript Temelleri Sınavı", "Modern ES6+ sözdizimi sınavı", "js_u1_exam", True),
                ]
            },
            {
                "id": "js_unit_2", "unitNumber": 2, "title": "Diziler, Nesneler & Kapsam", "category": "Diziler & Nesneler", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "JS Koleksiyon Hile Kağıdı",
                "cheatSheetContent": "const evens = arr.filter(x => x % 2 === 0);\nconst doubled = arr.map(x => x * 2);\nconst sum = arr.reduce((a, b) => a + b, 0);",
                "lessons": [
                    ("Dizi Dönüşümleri (map, filter, reduce)", "Fonksiyonel dizi metotları", "js_map_filter_reduce", False),
                    ("Arama Metotları (find, some, every, includes)", "Eleman varlığı kontrolü", "js_find_some_every", False),
                    ("Nesne İşlemleri (Object.keys, values, entries)", "Nesneler üzerinde döngü kurma", "js_object_methods", False),
                    ("Kapsam (Scope) ve Closures (Kapanışlar)", "Dış değişkenleri hatırlayan fonksiyonlar", "js_closures_scope", False),
                    ("Strict Equality (===) vs Gevşek Eşitlik (==)", "Tip zorlama (type coercion) tuzakları", "js_equality_coercion", False),
                    ("2. Ünite Diziler & Kapsam Sınavı", "Diziler ve closures değerlendirmesi", "js_u2_exam", True),
                ]
            },
            {
                "id": "js_unit_3", "unitNumber": 3, "title": "Asenkron JS & Event Loop", "category": "Asenkron & Promise", "colorHex": "0xFF38BDF8",
                "cheatSheetTitle": "JS Asenkron Hile Kağıdı",
                "cheatSheetContent": "async function getData() {\n    const res = await fetch('/api');\n    return await res.json();\n}",
                "lessons": [
                    ("Event Loop & Tek İş Parçacıklı Çalışma", "Call Stack, Web APIs ve Task Queue", "js_event_loop_arch", False),
                    ("Microtask vs Macrotask Kuyrukları", "Promise kuyruğu neden önce çalışır?", "js_microtask_macrotask", False),
                    ("Promise Yapısı (resolve, reject & then/catch)", "Gelecekteki değerlerin yönetimi", "js_promises_intro", False),
                    ("async / await ile Senkron Görünümlü Asenkron Kod", "Modern ve okunaklı asenkron yapı", "js_async_await", False),
                    ("fetch API ile Ağ İstekleri", "JSON verisi alma ve HTTP hata yönetimi", "js_fetch_network", False),
                    ("3. Ünite Asenkron JavaScript Sınavı", "Event loop ve asenkron JS sınavı", "js_u3_exam", True),
                ]
            },
            {
                "id": "js_unit_4", "unitNumber": 4, "title": "DOM Manipülasyonu & Web Olayları", "category": "DOM & Olaylar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "JS DOM Hile Kağıdı",
                "cheatSheetContent": "const btn = document.querySelector('#btn');\nbtn.addEventListener('click', e => {\n    localStorage.setItem('k', 'v');\n});",
                "lessons": [
                    ("DOM Seçicileri (querySelector, querySelectorAll)", "HTML elemanlarına erişme", "js_dom_selectors", False),
                    ("Eleman Özellikleri ve Stilleri Değiştirme", "classList, innerText, style müdahalesi", "js_dom_manipulation", False),
                    ("addEventListener ile Olay Dinleme", "click, submit, change olayları", "js_event_listeners", False),
                    ("Event Bubbling, Capturing & Event Delegation", "Olay yayılımı ve performanslı dinleme", "js_event_bubbling_delegation", False),
                    ("Web Depolama (LocalStorage & SessionStorage)", "Tarayıcıda veri saklama", "js_localstorage_web", False),
                    ("4. Ünite DOM & Web Olayları Sınavı", "Tarayıcı arayüz yönetimi sınavı", "js_u4_exam", True),
                ]
            },
            {
                "id": "js_unit_5", "unitNumber": 5, "title": "Prototip, Modüller & Modern Web", "category": "Modern Web & Modüller", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "JS İleri Konular Hile Kağıdı",
                "cheatSheetContent": "import { func } from './mod.js';\nexport default App;\ntry { JSON.parse(str); } catch (e) {}",
                "lessons": [
                    ("Prototip Zinciri (Prototype Chain)", "JavaScript'te nesne kalıtımının temeli", "js_prototype_chain", False),
                    ("ES Modülleri (import & export)", "Kodları modüler dosyalara bölme", "js_es_modules", False),
                    ("Hata Yakalama (try...catch...finally)", "Çalışma zamanı hatalarını zarifçe karşılama", "js_try_catch", False),
                    ("JSON Serileştirme (parse & stringify)", "Veri takası ve derin kopyalama", "js_json_methods", False),
                    ("Modern Web Güvenliği (XSS ve CSRF Temelleri)", "Güvenli JS kodu yazma pratikleri", "js_security_basics", False),
                    ("5. Ünite JavaScript Ustalık Sınavı", "Kıdemli JavaScript geliştirici sınavı", "js_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "sql",
        "file": "sql_curriculum.dart",
        "var_name": "sqlUnits",
        "lang_enum": "CodeLanguage.sql",
        "units": [
            {
                "id": "sql_unit_1", "unitNumber": 1, "title": "SQL Temelleri & Veri Tanımlama", "category": "Temel CRUD", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "SQL DDL & DML Hile Kağıdı",
                "cheatSheetContent": "CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(50));\nINSERT INTO users VALUES (1, 'Ali');\nUPDATE users SET name = 'Veli' WHERE id = 1;\nDELETE FROM users WHERE id = 1;",
                "lessons": [
                    ("İlişkisel Veritabanı Mantığı (RDBMS)", "Tablolar, satırlar ve sütunlar", "sql_rdbms_intro", False),
                    ("DDL vs DML Komutları Ayrımı", "Veri yapısı tanımlama ve veri işleme", "sql_ddl_dml_diff", False),
                    ("CREATE TABLE & Veri Tipleri (INT, VARCHAR, DATE)", "Tablo oluşturma ve tip kısıtları", "sql_create_table", False),
                    ("INSERT INTO ile Yeni Kayıt Ekleme", "Tekli ve çoklu satır ekleme", "sql_insert_rows", False),
                    ("UPDATE ve DELETE ile Veri Düzenleme", "WHERE filtresi olmadan çalıştırmama kuralı", "sql_update_delete", False),
                    ("1. Ünite SQL Temelleri Sınavı", "Temel SQL CRUD sınavı", "sql_u1_exam", True),
                ]
            },
            {
                "id": "sql_unit_2", "unitNumber": 2, "title": "Temel Sorgular & Filtreleme", "category": "Filtreleme & Sıralama", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "SQL Sorgulama Hile Kağıdı",
                "cheatSheetContent": "SELECT name, email FROM users\nWHERE age >= 18 AND status = 'ACTIVE'\nORDER BY created_at DESC\nLIMIT 10 OFFSET 20;",
                "lessons": [
                    ("SELECT ile Sütun Seçimi & Takma Adlar (AS)", "Projeksiyon ve okunabilir isimlendirme", "sql_select_aliases", False),
                    ("WHERE Filtresi ve Mantıksal Operatörler (AND, OR)", "Kriter bazlı satır filtreleme", "sql_where_logical", False),
                    ("Aralık ve Liste Operatörleri (BETWEEN & IN)", "Birden çok değeri pratikçe sorgulama", "sql_between_in", False),
                    ("Metin Arama (LIKE ve % Deseni)", "Kısmi kelime ve desen eşleme", "sql_like_wildcards", False),
                    ("Sıralama ve Sayfalama (ORDER BY & LIMIT/OFFSET)", "Sonuçları dizme ve pagination", "sql_order_limit_offset", False),
                    ("2. Ünite Filtreleme & Sıralama Sınavı", "Sorgu yazma ve filtreleme sınavı", "sql_u2_exam", True),
                ]
            },
            {
                "id": "sql_unit_3", "unitNumber": 3, "title": "Gruplama & Fonksiyonlar", "category": "Gruplama & Aggregate", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "SQL Gruplama Hile Kağıdı",
                "cheatSheetContent": "SELECT department, COUNT(*), AVG(salary)\nFROM employees\nGROUP BY department\nHAVING COUNT(*) > 5;",
                "lessons": [
                    ("Aggregate Fonksiyonlar (COUNT, SUM, AVG, MIN, MAX)", "Kümülatif hesaplamalar yapma", "sql_aggregate_functions", False),
                    ("GROUP BY ile Veri Kümeleri Oluşturma", "Ortak kategorilere göre özetleme", "sql_groupby_basics", False),
                    ("HAVING vs WHERE Arasındaki Kritik Fark", "Gruplama öncesi ve sonrası filtreleme", "sql_having_vs_where", False),
                    ("Koşullu İfadeler (CASE WHEN)", "Sorgu içinde if-else mantığı yürütme", "sql_case_when", False),
                    ("NULL Yönetimi ve COALESCE Fonksiyonu", "Eksik verileri varsayılan değerle doldurma", "sql_coalesce_null", False),
                    ("3. Ünite Gruplama & Fonksiyonlar Sınavı", "Veri analitiği ve gruplama sınavı", "sql_u3_exam", True),
                ]
            },
            {
                "id": "sql_unit_4", "unitNumber": 4, "title": "İlişkiler & JOIN Mimarisi", "category": "JOIN & İlişkiler", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "SQL JOIN Hile Kağıdı",
                "cheatSheetContent": "SELECT u.name, o.total\nFROM users u\nINNER JOIN orders o ON u.id = o.user_id\nLEFT JOIN profiles p ON u.id = p.user_id;",
                "lessons": [
                    ("İlişki Türleri (1-1, 1-N, N-N)", "Tabloların birbiriyle bağlantı mantığı", "sql_relationship_types", False),
                    ("INNER JOIN ile Eşleşen Kayıtları Birleştirme", "Kesişim kümesini getirme", "sql_inner_join", False),
                    ("LEFT JOIN ile Sol Tablonun Tamamını Alma", "Eşleşmeyen satırlar için NULL üretme", "sql_left_join", False),
                    ("RIGHT JOIN ve FULL OUTER JOIN", "Sağ tablo odaklı ve birleşim sorguları", "sql_right_outer_join", False),
                    ("Self Join & Kendi Kendine Birleştirme", "Hiyerarşik verileri (müdür-çalışan) sorgulama", "sql_self_join", False),
                    ("4. Ünite JOIN & İlişkiler Sınavı", "Tablo birleştirme ustalığı sınavı", "sql_u4_exam", True),
                ]
            },
            {
                "id": "sql_unit_5", "unitNumber": 5, "title": "İleri Seviye SQL, İndeksler & Mimariler", "category": "İndeksler & ACID", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "SQL İleri Mimari Hile Kağıdı",
                "cheatSheetContent": "CREATE INDEX idx_user_email ON users(email);\nBEGIN TRANSACTION;\nCOMMIT; -- veya ROLLBACK;",
                "lessons": [
                    ("Primary Key & Foreign Key Kısıtları", "Veri bütünlüğünü (integrity) sağlama", "sql_pk_fk_constraints", False),
                    ("İndeksleme (B-Tree Indexes) & Performans", "Arama sürelerini O(1)/O(log n)'e indirme", "sql_indexes_performance", False),
                    ("Alt Sorgular (Subqueries & CTE / WITH)", "İç içe sorgular ve geçici tablolar", "sql_subqueries_cte", False),
                    ("Transactions & ACID Prensipleri", "COMMIT ve ROLLBACK ile güvenli işlemler", "sql_transactions_acid", False),
                    ("Veritabanı Normalizasyonu (1NF, 2NF, 3NF)", "Veri tekrarını ve anomalileri önleme", "sql_normalization_rules", False),
                    ("5. Ünite SQL Ustalık Sınavı", "Kıdemli veritabanı mimarisi sınavı", "sql_u5_exam", True),
                ]
            }
        ]
    },
    {
        "track": "algorithms",
        "file": "algorithms_curriculum.dart",
        "var_name": "algorithmsUnits",
        "lang_enum": "CodeLanguage.algorithms",
        "units": [
            {
                "id": "algo_unit_1", "unitNumber": 1, "title": "Karmaşıklık Analizi & Big-O", "category": "Big-O & Karmaşıklık", "colorHex": "0xFFA855F7",
                "cheatSheetTitle": "Big-O Hile Kağıdı",
                "cheatSheetContent": "O(1) < O(log n) < O(n) < O(n log n) < O(n^2) < O(2^n)",
                "lessons": [
                    ("Big-O Nedir? Zaman & Alan Karmaşıklığı", "Algoritma verimliliğini matematiksel ölçme", "algo_big_o_intro", False),
                    ("O(1) Sabit ve O(n) Doğrusal Zaman", "Girdi boyutuyla orantılı büyüme", "algo_constant_linear", False),
                    ("O(log n) Logaritmik Büyüme & Böl-Yönet", "Arama uzayını her adımda yarıya indirme", "algo_logarithmic_time", False),
                    ("O(n^2) Karesel Zaman & İç İçe Döngüler", "Performans darboğazlarını tespit etme", "algo_quadratic_loops", False),
                    ("En İyi, Ortalama ve En Kötü Durum (Worst-Case)", "Big-Omega, Big-Theta ve Big-O farkları", "algo_cases_analysis", False),
                    ("1. Ünite Karmaşıklık Analizi Sınavı", "Big-O hesaplama değerlendirmesi", "algo_u1_exam", True),
                ]
            },
            {
                "id": "algo_unit_2", "unitNumber": 2, "title": "Doğrusal Veri Yapıları", "category": "Doğrusal Yapılar (Stack/Queue)", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "Doğrusal Yapılar Hile Kağıdı",
                "cheatSheetContent": "Stack: Push / Pop (LIFO)\nQueue: Enqueue / Dequeue (FIFO)\nLinked List: Head -> Node -> Null",
                "lessons": [
                    ("Diziler (Arrays) & Bellek Yerleşimi", "O(1) rastgele erişim ve boyut sınırları", "algo_arrays_memory", False),
                    ("Bağlı Listeler (Singly & Doubly Linked Lists)", "Düğümler arası işaretçi zinciri", "algo_linked_lists", False),
                    ("Yığınlar (Stacks - LIFO) & Kullanım Alanları", "Geri al (Undo) ve çağrı yığını simülasyonu", "algo_stacks_lifo", False),
                    ("Kuyruklar (Queues - FIFO) & Deque", "İş sıraları ve iki yönlü kuyruklar", "algo_queues_fifo", False),
                    ("Dizi vs Bağlı Liste Karşılaştırması", "Arama, ekleme ve silme maliyetleri", "algo_array_vs_linkedlist", False),
                    ("2. Ünite Doğrusal Yapılar Sınavı", "Temel veri yapıları sınavı", "algo_u2_exam", True),
                ]
            },
            {
                "id": "algo_unit_3", "unitNumber": 3, "title": "Hash Tabloları & Ağaçlar", "category": "Ağaçlar & BST", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Ağaçlar & Hash Hile Kağıdı",
                "cheatSheetContent": "Hash Table: O(1) avg lookup\nBST: Sol < Root < Sag\nTraversals: Inorder, Preorder, Postorder",
                "lessons": [
                    ("Hash Tabloları ve Hashing Fonksiyonları", "Anahtarı bellek indeksine dönüştürme", "algo_hash_tables", False),
                    ("Çarpışma Çözümü (Chaining & Open Addressing)", "Aynı hash'e düşen elemanları saklama", "algo_hash_collisions", False),
                    ("İkili Arama Ağacı (BST) Temelleri", "Sıralı ağaç yapısı ve arama", "algo_bst_basics", False),
                    ("Ağaç Dolaşma Türleri (Inorder, Preorder, Postorder)", "Düğümleri doğru sırayla ziyaret etme", "algo_tree_traversals", False),
                    ("Dengeli Ağaçlar (AVL & Red-Black)", "Ağacın bağlı listeye dönüşmesini engelleme", "algo_balanced_trees", False),
                    ("3. Ünite Hash & Ağaçlar Sınavı", "Ağaç ve tablo mimarisi sınavı", "algo_u3_exam", True),
                ]
            },
            {
                "id": "algo_unit_4", "unitNumber": 4, "title": "Sıralama & Arama Algoritmaları", "category": "Sıralama & Arama", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Sıralama Algoritmaları Hile Kağıdı",
                "cheatSheetContent": "Binary Search: O(log n)\nMerge Sort: O(n log n) stable\nQuick Sort: O(n log n) avg, O(n^2) worst",
                "lessons": [
                    ("İkili Arama (Binary Search) Algoritması", "Sıralı listede logaritmik arama", "algo_binary_search", False),
                    ("Basit Sıralamalar (Bubble, Insertion, Selection)", "O(n^2) temel sıralama mantıkları", "algo_simple_sorts", False),
                    ("Merge Sort (Birleştirmeli Sıralama)", "Böl-yönet felsefesi ve garantili O(n log n)", "algo_merge_sort", False),
                    ("Quick Sort (Hızlı Sıralama) & Pivot Seçimi", "In-place bölme ve en kötü durum senaryosu", "algo_quick_sort", False),
                    ("Sıralama Algoritmalarının Karşılaştırılması", "Kararlılık (stability) ve bellek tüketimi", "algo_sort_comparison", False),
                    ("4. Ünite Sıralama & Arama Sınavı", "Arama ve sıralama mülakat soruları sınavı", "algo_u4_exam", True),
                ]
            },
            {
                "id": "algo_unit_5", "unitNumber": 5, "title": "Grafikler & Algoritmik Stratejiler", "category": "Grafikler & Dinamik", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "Grafikler & DP Hile Kağıdı",
                "cheatSheetContent": "BFS: Queue (En kisa yol)\nDFS: Stack / Rekursiyon\nDP: Memoization / Tabulation",
                "lessons": [
                    ("Grafik (Graph) Temsili (Adjacency Matrix & List)", "Düğümler ve kenarlar mimarisi", "algo_graph_representation", False),
                    ("Genişlik Öncelikli Arama (BFS - Breadth-First)", "En kısa yolu bulmak için kuyruk kullanımı", "algo_bfs_search", False),
                    ("Derinlik Öncelikli Arama (DFS - Depth-First)", "Tüm yolları geri dönerek (backtracking) gezme", "algo_dfs_search", False),
                    ("Açgözlü (Greedy) Algoritmalar", "Her adımda yerel en iyi seçimi yapma", "algo_greedy_approach", False),
                    ("Dinamik Programlama (DP) & Memoization", "Fibonacci ve alt problemleri önbellekleme", "algo_dynamic_programming", False),
                    ("5. Ünite Algoritmalar Ustalık Sınavı", "Kıdemli algoritma ve problem çözme sınavı", "algo_u5_exam", True),
                ]
            }
        ]
    }
]

def generate_track(cfg):
    track_name = cfg["track"]
    units_list = []
    
    for u in cfg["units"]:
        lessons_list = []
        for l_idx, (l_title, l_desc, topic, is_exam) in enumerate(u["lessons"]):
            lesson_id = f"{u['id']}_l{l_idx+1}"
            questions = generate_lesson_questions(
                track=track_name,
                unit_num=u["unitNumber"],
                lesson_num=l_idx+1,
                lesson_id=lesson_id,
                topic=topic,
                title=l_title,
                is_exam=is_exam
            )
            lessons_list.append({
                "id": lesson_id,
                "title": l_title,
                "description": l_desc,
                "xpReward": 50 if is_exam else 35,
                "gemReward": 25 if is_exam else 12,
                "isUnitExam": is_exam,
                "questions": questions
            })
            
        units_list.append({
            "id": u["id"],
            "unitNumber": u["unitNumber"],
            "title": u["title"],
            "language": cfg["lang_enum"],
            "category": u["category"],
            "colorHex": u["colorHex"],
            "cheatSheetTitle": u["cheatSheetTitle"],
            "cheatSheetContent": u["cheatSheetContent"],
            "lessons": lessons_list
        })
        
    out_file = os.path.join(BASE_DIR, cfg["file"])
    write_curriculum_file(out_file, cfg["var_name"], units_list)

def main():
    total_q = 0
    print("Generating all 10 tracks...")
    for cfg in TRACK_CONFIGS:
        generate_track(cfg)
        track_questions = len(cfg["units"]) * 6 * 18
        total_q += track_questions
        print(f"-> {cfg['track'].upper()} generated: {track_questions} questions.")
        
    print(f"\nSUCCESS! Total questions generated across all tracks: {total_q}")

if __name__ == "__main__":
    main()
