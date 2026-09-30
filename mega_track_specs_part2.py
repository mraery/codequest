# -*- coding: utf-8 -*-
"""
Full Technical Specifications for Remaining Tracks:
Python, C#, Kotlin, Linux, JavaScript, SQL, Algorithms
(8 Units x 8 Lessons each)
"""

TRACKS_DATA_PART2 = {
    # 4. PYTHON
    "python": {
        "file": "python_curriculum.dart",
        "var_name": "pythonUnits",
        "lang_enum": "CodeLanguage.python",
        "units": [
            {
                "id": "py_unit_1", "unitNumber": 1, "title": "Python 3 Temelleri, Değişkenler & f-String", "category": "Temeller", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Python Temelleri Hile Kağıdı",
                "cheatSheetContent": "name = 'Ada'\nprint(f'Selam {name}')\nsayi = int('42')\ntam_bolme = 15 // 4",
                "lessons": [
                    ("Python'ın Felsefesi: The Zen of Python (PEP 20)", "Okunabilirlik ve Pythonic kod yazma", "py_zen_philosophy", False),
                    ("Değişkenler, Dinamik Tipleme & type()", "Python'ın nesne referans modeli", "py_variables_dynamic", False),
                    ("print() ve Modern f-String Biçimlendirme", "İfade gömme ve sayı yuvarlama (:.2f)", "py_fstrings_deep", False),
                    ("İlkel Tipler: int, float, bool, str", "Tip dönüşümleri (casting) ve sınırları", "py_primitive_types", False),
                    ("Aritmetik ve Mantık Operatörleri", "//, %, ** ve and/or/not mantığı", "py_operators_logic_deep", False),
                    ("String İpuçları: strip, split, join, replace", "Metin parçalama ve birleştirme metotları", "py_string_methods", False),
                    ("Kullanıcıdan Girdi Alma: input() & Dönüşüm", "Konsol etkileşimi ve sayı okuma", "py_input_parsing", False),
                    ("1. Ünite Python Temelleri Sınavı", "Python temel sözdizimi sınavı", "py_u1_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_2", "unitNumber": 2, "title": "Kontrol Akışı, Koşullar & Döngüler", "category": "Kontrol Yapıları", "colorHex": "0xFF2563EB",
                "cheatSheetTitle": "Python Kontrol Hile Kağıdı",
                "cheatSheetContent": "if x > 10: pass\nfor i in range(5): pass\nwhile running: pass",
                "lessons": [
                    ("Koşullu İfadeler: if, elif, else & Girintileme", "Indentation kuralları ve kod blokları", "py_if_elif_else", False),
                    ("Karşılaştırma ve Mantık Zincirleme (10 < x < 20)", "Pythonik çoklu karşılaştırma sentaksı", "py_chained_comparisons", False),
                    ("for Döngüsü ve range() Fonksiyonu", "Başlangıç, bitiş ve adım (step) değerleri", "py_for_range_deep", False),
                    ("while Döngüleri ve Sonsuz Döngü Tehlikesi", "Koşula bağlı döngüler ve bayraklar", "py_while_loops", False),
                    ("Döngü Kontrolü: break ve continue", "Döngüyü kırma ve adım atlama mantığı", "py_break_continue", False),
                    ("Döngülerde else Bloğu Kullanımı", "break çalışmadığında çalışan özel else", "py_loop_else_clause", False),
                    ("enumerate() ve zip() ile Akıllı İterasyon", "İndeks ve çoklu liste eşleştirme", "py_enumerate_zip", False),
                    ("2. Ünite Kontrol Akışı & Döngüler Sınavı", "Karar ve döngü yapıları sınavı", "py_u2_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_3", "unitNumber": 3, "title": "Listeler, Tuple'lar & Dilimleme (Slicing)", "category": "Koleksiyonlar", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "Python Liste & Slicing Hile Kağıdı",
                "cheatSheetContent": "lst = [1, 2, 3]\nlst.append(4)\nters = lst[::-1]\ntpl = (1, 2)",
                "lessons": [
                    ("Listeler (List) Mimarisi & Mutability", "Dinamik diziler ve bellekte büyüme", "py_lists_mutability", False),
                    ("Liste Dilimleme (Slicing): [start:stop:step]", "Listeyi ters çevirme ([::-1]) ve alt kümeler", "py_slicing_mastery", False),
                    ("Temel Liste Metotları: append, extend, insert, pop", "Eleman ekleme ve çıkarma operasyonları", "py_list_methods_core", False),
                    ("Listeleri Sıralama: sort() vs sorted()", "In-place sıralama ve key=lambda kullanımı", "py_sorting_lists", False),
                    ("Demetler (Tuples) & İmmutability Güvencesi", "Değişmez veri paketleri ve tuple packing", "py_tuples_packing", False),
                    ("Tuple Unpacking (Değişkenlere Dağıtma)", "a, b = b, a takası ve *rest kullanımı", "py_tuple_unpacking", False),
                    ("Liste Kopyalama: Shallow vs Deep Copy", "copy.deepcopy() ve referans tuzakları", "py_shallow_deep_copy", False),
                    ("3. Ünite Listeler & Tuple'lar Sınavı", "Diziler ve dilimleme sınavı", "py_u3_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_4", "unitNumber": 4, "title": "Sözlükler, Kümeler & Comprehensions", "category": "Comprehension", "colorHex": "0xFFD97706",
                "cheatSheetTitle": "Python Dict & Set Hile Kağıdı",
                "cheatSheetContent": "d = {'a': 1, 'b': 2}\nd.get('c', 0)\ns = {1, 2, 3}\nkareler = [x**2 for x in nums if x > 0]",
                "lessons": [
                    ("Sözlükler (Dict) & Hash Map Mimarisi", "O(1) anahtar-değer eşleşmesi prensibi", "py_dicts_hashmap", False),
                    ("Sözlük Okuma: get(), setdefault() & KeyError", "Eksik anahtar hatalarından kaçınma", "py_dicts_safe_access", False),
                    ("Sözlük İterasyonu: keys(), values(), items()", "Anahtar ve değerleri döngüyle tarama", "py_dicts_iteration", False),
                    ("Kümeler (Set) & Benzersiz Eleman Garantisi", "Mükerrer kayıtları temizleme ve O(1) arama", "py_sets_unique", False),
                    ("Küme Operasyonları: &, |, -, ^", "Kesişim, birleşim ve fark hesapları", "py_set_math_ops", False),
                    ("List Comprehensions ile Temiz Kod", "Döngü ve filtreyi tek satırda birleştirme", "py_list_comprehensions", False),
                    ("Dict & Set Comprehensions Kullanımı", "Sözlükleri ters çevirme ve küme üretimi", "py_dict_set_comprehensions", False),
                    ("4. Ünite Sözlükler, Kümeler & Comprehensions Sınavı", "Veri yapıları ve filtreleme sınavı", "py_u4_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_5", "unitNumber": 5, "title": "Fonksiyonlar, *args, **kwargs & Lambdalar", "category": "Fonksiyonlar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Python Fonksiyon Hile Kağıdı",
                "cheatSheetContent": "def func(a, b=10, *args, **kwargs):\n    return a + b\nlmb = lambda x: x * 2",
                "lessons": [
                    ("Fonksiyon Tanımlama (def) & Dönüş Değerleri", "Geriye birden fazla değer dönme", "py_def_returns", False),
                    ("Varsayılan Parametreler & Mutable Varsayılan Tuzağı", "Neden arg=[] yazılmamalıdır?", "py_mutable_default_trap", False),
                    ("*args ile Esnek Sayıda Pozisyonel Argüman", "Demet olarak parametre toplama", "py_args_positional", False),
                    ("**kwargs ile İsimlendirilmiş Argüman Toplama", "Sözlük formatında ayar parametreleri", "py_kwargs_keyword", False),
                    ("Kapsam Kuralları: LEGB (Local, Enclosing, Global, Builtin)", "global ve nonlocal anahtarları", "py_scope_legb_deep", False),
                    ("Anonim Fonksiyonlar: lambda İfadeleri", "Tek satırlık fonksiyonlar ve kullanım yerleri", "py_lambdas_deep", False),
                    ("Fonksiyonel Araçlar: map(), filter() & reduce()", "Fonksiyonel programlama fonksiyonları", "py_map_filter_reduce", False),
                    ("5. Ünite Fonksiyonlar & Parametreler Sınavı", "Fonksiyon mimarisi sınavı", "py_u5_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_6", "unitNumber": 6, "title": "Nesne Yönelimli Programlama (OOP), Sınıflar & Kalıtım", "category": "OOP", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Python OOP Hile Kağıdı",
                "cheatSheetContent": "class Animal:\n    def speak(self): pass\nclass Dog(Animal):\n    def speak(self): return 'Hav'",
                "lessons": [
                    ("OOP Felsefesi: Sınıf (Class) vs Nesne (Instance)", "Veri ve davranışları bir araya getirme", "py_oop_intro", False),
                    ("__init__() Kurucusu & self Parametresi", "Nesne değişkenlerini ilklendirme", "py_init_self_deep", False),
                    ("Sınıf Nitelikleri (Class) vs Örnek Nitelikleri (Instance)", "Bellek paylaşımı ve sınıf değişkenleri", "py_class_vs_instance_attrs", False),
                    ("Kalıtım (Inheritance) & super() Kullanımı", "Üst sınıf davranışlarını devralma", "py_inheritance_super_deep", False),
                    ("Çok Biçimlilik (Polymorphism) & Duck Typing", "If it quacks like a duck, it is a duck", "py_polymorphism_duck_typing", False),
                    ("Çoklu Kalıtım (Multiple Inheritance) & MRO", "Method Resolution Order kuralları", "py_mro_multiple_inheritance", False),
                    ("Sınıf Metotları (@classmethod) & Statik Metotlar (@staticmethod)", "Alternatif kurucular ve yardımcı metotlar", "py_classmethod_staticmethod", False),
                    ("6. Ünite Nesne Yönelimli Programlama Sınavı", "OOP ve sınıf mimarisi sınavı", "py_u6_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_7", "unitNumber": 7, "title": "Dunder Metotlar, @property & Kapsülleme", "category": "OOP", "colorHex": "0xFF7C3AED",
                "cheatSheetTitle": "Python Dunder & Property Hile Kağıdı",
                "cheatSheetContent": "class User:\n    @property\n    def email(self): return self._email\n    def __str__(self): return 'User'",
                "lessons": [
                    ("Kapsülleme (Encapsulation) & _gizli, __cokgizli İsimlendirme", "Name Mangling mekanizması", "py_encapsulation_name_mangling", False),
                    ("@property Decorator'ı ile Getter/Setter Mantığı", "Nitelik erişimini fonksiyonla kontrol etme", "py_property_getters_setters", False),
                    ("Metin Temsili Dunder'lar: __str__ vs __repr__", "Kullanıcı dostu vs geliştiriciye yönelik metin", "py_str_vs_repr", False),
                    ("Matematiksel Dunder'lar: __add__, __sub__, __mul__", "Operatör aşırı yükleme (operator overloading)", "py_dunder_math_ops", False),
                    ("Koleksiyon Dunder'ları: __len__, __getitem__, __contains__", "Kendi sınıflarımızı liste/sözlük gibi davranma", "py_dunder_containers", False),
                    ("Çağrılabilir Nesneler: __call__ Metodu", "Nesne örneklerini fonksiyon gibi çağırma", "py_dunder_call", False),
                    ("Karşılaştırma Dunder'ları: __eq__, __lt__, __hash__", "Nesneleri sıralama ve set/dict anahtarı yapma", "py_dunder_comparisons_hash", False),
                    ("7. Ünite Dunder Metotlar & Kapsülleme Sınavı", "İleri OOP ve sihirli metotlar sınavı", "py_u7_mega_exam", True),
                ]
            },
            {
                "id": "py_unit_8", "unitNumber": 8, "title": "İleri Python: Generators, Decorators, with & Asyncio", "category": "Hata & Dosya", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "Python İleri Düzey Hile Kağıdı",
                "cheatSheetContent": "def gen(): yield 1\nwith open('f.txt') as f: pass\n@my_dec\ndef f(): pass",
                "lessons": [
                    ("Generators & yield: Bellek Dostu Tembel Değerlendirme", "Büyük verileri akış halinde işleme", "py_generators_yield_deep", False),
                    ("Generator İfadeleri: (x for x in data)", "Köşeli vs normal parantez bellek farkı", "py_generator_expressions", False),
                    ("Context Manager Protokolü: __enter__ & __exit__", "with bloğunun arkasındaki mekanizma", "py_context_managers_protocol", False),
                    ("Hata Yönetimi: try, except, else, finally", "Özel Exception sınıfları fırlatma (raise)", "py_exception_handling_deep", False),
                    ("Decorator Geliştirme: Parametreli Fonksiyon Sarmalama", "functools.wraps ve loglama decorator'ı", "py_decorators_development", False),
                    ("Tip Belirteçleri (Type Hints) & typing Modülü", "Union, Optional, Any ve mypy kontrolü", "py_typing_hints", False),
                    ("dataclasses Modülü ile Temiz Veri Sınıfları", "Otomatik __init__, __repr__ üretimi", "py_dataclasses_module", False),
                    ("8. Ünite Python Ustalık & Kıdemli Geliştirici Sınavı", "Kapsamlı Python mimarisi sınavı", "py_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 5. C# & .NET 8
    "csharp": {
        "file": "csharp_curriculum.dart",
        "var_name": "csharpUnits",
        "lang_enum": "CodeLanguage.csharp",
        "units": [
            {
                "id": "cs_unit_1", "unitNumber": 1, "title": "C# & .NET 8 Temelleri, Stack vs Heap", "category": "Temeller", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "C# Temelleri Hile Kağıdı",
                "cheatSheetContent": "int a = 10; // Stack\nstring s = 'Hello'; // Heap\nConsole.WriteLine($'{s} {a}');",
                "lessons": [
                    (".NET 8 Çalışma Zamanı (CLR) & CIL Ara Dili", "C# kodunun makine koduna JIT derleme süreci", "cs_clr_jit_architecture", False),
                    ("Değer Tipleri (Value Types - int, bool, struct)", "Stack bellek tahsisi ve kopyalama davranışı", "cs_value_types_stack", False),
                    ("Referans Tipleri (Reference Types - class, string)", "Heap bellek tahsisi ve işaretçi referansı", "cs_reference_types_heap", False),
                    ("Boxing ve Unboxing Performans Tuzakları", "Değer tipini object'e sarmalama maliyeti", "cs_boxing_unboxing", False),
                    ("Değişkenler, var Anahtarı & Statik Tipleme", "Derleme zamanı tip çıkarımı kuralları", "cs_var_type_inference", False),
                    ("String İnterpolasyonu ($) & String.Format", "Metin birleştirme ve performans faktörleri", "cs_string_interpolation", False),
                    ("StringBuilder ile Yüksek Hızlı Metin İnşası", "Döngülerde string immutable kopyalama sorununu çözme", "cs_stringbuilder_perf", False),
                    ("1. Ünite C# Temelleri & Bellek Sınavı", "C# tip sistemi ve bellek sınavı", "cs_u1_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_2", "unitNumber": 2, "title": "Nullable Tipler, Null-Safety & Pattern Matching", "category": "Karar Yapıları", "colorHex": "0xFF4F46E5",
                "cheatSheetTitle": "C# Null Safety & Patterns Hile Kağıdı",
                "cheatSheetContent": "string? name = null;\nint len = name?.Length ?? 0;\nif (obj is Person { Age: >= 18 }) pass;",
                "lessons": [
                    ("Nullable Referans Tipleri (NRT): string vs string?", "C# 8+ ile gelen derleme null uyarıları", "cs_nullable_reference_types", False),
                    ("Null-Coalescing Operatörü (?? ve ??=)", "Varsayılan değer atama ve lazy assignment", "cs_null_coalescing", False),
                    ("Null-Conditional (?.) ve Null-Forgiving (!) Operatörü", "Güvenli çağrı ve derleyici susturma riski", "cs_null_forgiving_safety", False),
                    ("Pattern Matching: is Tür Denetimi", "if (obj is string s) ile tip güvenli yakalama", "cs_pattern_is_type", False),
                    ("Modern switch İfadeleri (Switch Expressions)", "Lambda benzeri zarif çoklu koşul dallanması", "cs_switch_expressions", False),
                    ("Property Patterns & Positional Patterns", "Nesne özelliklerini koşullarda eşleme", "cs_property_patterns", False),
                    ("Döngüler: for, foreach, while & do-while", "Koleksiyonlar üzerinde gezinme sentaksı", "cs_loops_control", False),
                    ("2. Ünite Null-Safety & Pattern Matching Sınavı", "Null güvenliği ve desen eşleme sınavı", "cs_u2_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_3", "unitNumber": 3, "title": "OOP: Sınıflar, Primary Constructors & Kalıtım", "category": "Sınıflar & OOP", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "C# OOP Hile Kağıdı",
                "cheatSheetContent": "public class Dev(string name, int exp) {\n    public string Name => name;\n}",
                "lessons": [
                    ("Sınıf Tanımlama & C# 12 Primary Constructors", "Sınıf başlığında kurucu parametreleri alma", "cs_primary_constructors", False),
                    ("Özellikler (Properties): { get; set; } & init-only", "Değişmez nesneler için init anahtarı", "cs_properties_init_only", False),
                    ("Kalıtım (Inheritance) & base Anahtarı", "Üst sınıf kurucusunu ve metotlarını çağırma", "cs_inheritance_base", False),
                    ("virtual, override ve sealed Metotlar", "Sanal metot tablosu (vtable) ve polimorfizm", "cs_virtual_override_sealed", False),
                    ("Soyut Sınıflar (abstract class) & Şablon Metot", "Kısmi gövdeli temel sınıflar inşa etme", "cs_abstract_classes", False),
                    ("Kapsülleme & Erişim Belirteçleri (public, private, internal)", "Bileşen sınırlarını koruma", "cs_access_modifiers", False),
                    ("Kısmi Sınıflar (partial classes) & Kaynak Üreteçleri", "Sınıfı birden çok dosyaya bölme", "cs_partial_classes", False),
                    ("3. Ünite Nesne Yönelimli C# Sınavı", "OOP ve sınıf mimarisi sınavı", "cs_u3_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_4", "unitNumber": 4, "title": "Arayüzler (Interfaces), Abstract & Dependency Injection", "category": "Sınıflar & OOP", "colorHex": "0xFF7C3AED",
                "cheatSheetTitle": "C# Interface & DI Hile Kağıdı",
                "cheatSheetContent": "public interface IService { Task Run(); }\nservices.AddScoped<IService, Service>();",
                "lessons": [
                    ("Interface Mimarisi: Sözleşmeler (Contracts)", "Çoklu arayüz uygulama ve polimorfizm", "cs_interfaces_core", False),
                    ("Default Interface Methods (Varsayılan Metot Gövdesi)", "Arayüzleri kırmadan yeni metot ekleme", "cs_default_interface_methods", False),
                    ("Explicit Interface Implementation", "Aynı isimli metotları ayırt ederek uygulama", "cs_explicit_interface_impl", False),
                    ("Dependency Injection (DI) Prensipleri", "Inversion of Control (IoC) ve gevşek bağlılık", "cs_dependency_injection_core", False),
                    ("Servis Ömürleri: Transient, Scoped, Singleton", "AddTransient, AddScoped, AddSingleton farkları", "cs_service_lifetimes", False),
                    ("Factory Deseni & Interface Ayrıştırma", "SOLID prensiplerinin C# uyarlaması", "cs_solid_interface_segregation", False),
                    ("Mocklama & Test Edilebilir Mimari Kurma", "Birim testler için interface kullanımı", "cs_interfaces_unit_testing", False),
                    ("4. Ünite Interfaces & Dependency Injection Sınavı", "Servis mimarisi ve arayüzler sınavı", "cs_u4_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_5", "unitNumber": 5, "title": "Güçlü LINQ: Where, Select, OrderBy, GroupBy", "category": "Koleksiyonlar & LINQ", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "C# LINQ Hile Kağıdı",
                "cheatSheetContent": "var q = items.Where(x => x.Active)\n             .OrderBy(x => x.Name)\n             .Select(x => x.Id)\n             .ToList();",
                "lessons": [
                    ("LINQ Nedir? (Language Integrated Query)", "Koleksiyonları SQL gibi sorgulama gücü", "cs_linq_intro", False),
                    ("Ertelenmiş Çalışma (Deferred Execution) Mantığı", "ToList() çağrılana dek sorgunun bekletilmesi", "cs_linq_deferred_deep", False),
                    ("Where & Filtreleme Operatörleri", "Yüksek performanslı şartlı filtreleme", "cs_linq_where_filters", False),
                    ("Select & SelectMany ile Projeksiyon", "Veriyi dönüştürme ve iç içe listeleri düzleştirme", "cs_linq_select_selectmany", False),
                    ("OrderBy, OrderByDescending & ThenBy", "Çoklu kriterlere göre sıralama yapma", "cs_linq_ordering", False),
                    ("GroupBy ile Veri Kümeleri Oluşturma", "Ortak anahtarlara göre gruplama ve listeleme", "cs_linq_groupby", False),
                    ("Aggregate Fonksiyonları: Count, Sum, Average, Min, Max", "Kümülatif hesaplamalar", "cs_linq_aggregates", False),
                    ("5. Ünite LINQ & Sorgulama Sınavı", "LINQ metotları ve veri işleme sınavı", "cs_u5_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_6", "unitNumber": 6, "title": "Koleksiyonlar (List<T>, Dictionary) & Generic Mimarisi", "category": "Koleksiyonlar & LINQ", "colorHex": "0xFF059669",
                "cheatSheetTitle": "C# Koleksiyon Hile Kağıdı",
                "cheatSheetContent": "List<int> lst = [1, 2, 3];\nDictionary<string, int> dict = new();\ndict['Ali'] = 95;",
                "lessons": [
                    ("Generic Mimarisi: public class Repo<T>", "Tip güvenli ve boxing yapmayan yapılar", "cs_generics_architecture", False),
                    ("Generic Kısıtlamaları (Generic Constraints: where T : class)", "T'nin türünü sınırlandırma kuralları", "cs_generic_constraints", False),
                    ("List<T> İç Yapısı: Dinamik Dizi Nasıl Büyür?", "Capacity, Count ve bellek ikiye katlanması", "cs_list_capacity_growth", False),
                    ("Dictionary<TKey, TValue> & Hash Algoritması", "GetHashCode(), Equals() ve O(1) erişim", "cs_dictionary_internals", False),
                    ("HashSet<T> ile Benzersiz Kümeler", "Hızlı kümeleme ve kesişim operasyonları", "cs_hashset_collections", False),
                    ("Kuyruk (Queue<T>) ve Yığın (Stack<T>) Yapıları", "FIFO ve LIFO koleksiyonları", "cs_queue_stack_csharp", False),
                    ("ReadOnlyCollection & Immutable Collections", "Dışarıya değiştirilemez liste sunma", "cs_immutable_collections", False),
                    ("6. Ünite Koleksiyonlar & Generics Sınavı", "Generic koleksiyonlar sınavı", "cs_u6_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_7", "unitNumber": 7, "title": "Asenkron C#: async/await, Task & CancellationToken", "category": "Asenkron & Hata", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "C# Async Hile Kağıdı",
                "cheatSheetContent": "async Task<int> GetDataAsync(CancellationToken ct) {\n    return await Task.FromResult(42);\n}",
                "lessons": [
                    ("Thread vs Task Ayrımı & ThreadPool", "İş parçacığı havuzu ve hafif görev mimarisi", "cs_thread_vs_task", False),
                    ("async / await ve Durum Makinesi (State Machine)", "Derleyicinin arka planda ürettiği struct makine", "cs_async_state_machine", False),
                    ("Task<T> vs ValueTask<T> ile Sıfır Tahsis", "Senkron sonuçlarda heap yükünü azaltma", "cs_valuetask_optimization", False),
                    ("CancellationToken ile Güvenli İptal Akışı", "İstek zaman aşımları ve ThrowIfCancellationRequested", "cs_cancellation_tokens_deep", False),
                    ("Task.WhenAll ve Task.WhenAny ile Paralel İşler", "Birden çok asenkron görevi eşzamanlı bekletme", "cs_whenall_whenany", False),
                    ("Deadlock Tuzakları & ConfigureAwait(false)", "Senkronizasyon bağlamı ve kilitlenmelerden kaçınma", "cs_deadlocks_configureawait_deep", False),
                    ("IAsyncEnumerable<T> ile Asenkron Veri Akışı", "await foreach ile parça parça veri tüketme", "cs_iasyncenumerable_streams", False),
                    ("7. Ünite Asenkron Programlama Sınavı", "Async, Task ve iptal yönetimi sınavı", "cs_u7_mega_exam", True),
                ]
            },
            {
                "id": "cs_unit_8", "unitNumber": 8, "title": "İleri .NET: Span<T>, Memory<T>, IDisposable & GC", "category": "Asenkron & Hata", "colorHex": "0xFF0891B2",
                "cheatSheetTitle": "C# İleri Bellek Hile Kağıdı",
                "cheatSheetContent": "using var res = new Resource();\nSpan<byte> span = stackalloc byte[128];\npublic record Dev(string Name);",
                "lessons": [
                    ("IDisposable Deseni & using Bildirimi", "Yönetilmeyen kaynakları bellekten temizleme", "cs_idisposable_pattern", False),
                    ("Garbage Collector (GC) Nesilleri: Gen0, Gen1, Gen2", "LOH (Large Object Heap) ve çöp toplama maliyetleri", "cs_gc_generations_loh", False),
                    ("Span<T> & ReadOnlySpan<T> Mimarisi", "Heap tahsisi yapmadan bellek pencereleri açma", "cs_span_readonlyspan", False),
                    ("Memory<T> ile Asenkron Bellek Dilimleri", "Heap üzerinde güvenli bellek segmentleri", "cs_memory_async_buffers", False),
                    ("record & record struct: Değer Tabanlı Eşitlik", "Değişmez (immutable) veri modelleri ve with ifadesi", "cs_records_record_structs", False),
                    ("Delegates, Func<T>, Action<T> ve Olaylar (Events)", "Tip güvenli fonksiyon işaretçileri", "cs_delegates_events_deep", False),
                    ("BenchmarkDotNet ile Kod Performansını Ölçme", "Milisaniyeler ve nanosaniseler mertebesinde hız analizi", "cs_benchmarking_performance", False),
                    ("8. Ünite C# & .NET Ustalık Sınavı", "Kıdemli .NET mimarisi değerlendirme sınavı", "cs_u8_mega_exam", True),
                ]
            }
        ]
    }
}

print("Part 2 Specs loaded.")
