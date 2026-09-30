# -*- coding: utf-8 -*-
"""
Full Technical Specifications for Kotlin, Linux, JavaScript, SQL, Algorithms
(8 Units x 8 Lessons each)
"""

TRACKS_DATA_PART3 = {
    # 6. KOTLIN
    "kotlin": {
        "file": "kotlin_curriculum.dart",
        "var_name": "kotlinUnits",
        "lang_enum": "CodeLanguage.kotlin",
        "units": [
            {
                "id": "kt_unit_1", "unitNumber": 1, "title": "Kotlin Temelleri, val vs var & Değişmezlik", "category": "Temeller", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Kotlin Temelleri Hile Kağıdı",
                "cheatSheetContent": "val a: Int = 10\nvar s: String? = null\nval len = s?.length ?: 0",
                "lessons": [
                    ("Kotlin Felsefesi & JVM Entegrasyonu", "Java ile %100 uyumluluk ve modern sentaks", "kt_philosophy_jvm", False),
                    ("val (Read-Only) vs var (Mutable) Ayrımı", "Değişmezlik felsefesi ve iş parçacığı güvenliği", "kt_val_var_mutability", False),
                    ("Temel Veri Tipleri & Otomatik Tip Çıkarımı", "Int, Double, Boolean, Char ve çıkarım kuralları", "kt_types_inference", False),
                    ("String Şablonları (Templates): $değer & ${ifade}", "String interpolasyonu ve okunaklı metinler", "kt_string_templates_deep", False),
                    ("Koşullu İfadeler: if-else İfadesi Olarak Kullanım", "val max = if (a > b) a else b sentaksı", "kt_if_expression", False),
                    ("when İfadesi ile Çoklu Koşul Dallanması", "Geleneksel switch yerine güçlü pattern matching", "kt_when_expression_deep", False),
                    ("Döngüler: for, while & Aralıklar (1..10, until, step)", "Ranges ve progression yapıları", "kt_ranges_loops", False),
                    ("1. Ünite Kotlin Temelleri Sınavı", "Temel Kotlin sözdizimi sınavı", "kt_u1_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_2", "unitNumber": 2, "title": "Null Safety, Safe Call (?.) & Elvis Operatörü (?:)", "category": "Null Safety", "colorHex": "0xFF7C3AED",
                "cheatSheetTitle": "Kotlin Null Safety Hile Kağıdı",
                "cheatSheetContent": "var s: String? = null\nval len = s?.length ?: 0\nval nonNull = s!! // Dikkat!",
                "lessons": [
                    ("Milyar Dolarlık Hata: NullPointerException (NPE)", "Kotlin'in derleme zamanı null kontrolü", "kt_npe_billion_dollar", False),
                    ("Nullable Tipler: String vs String?", "Tip sisteminde null olabilirlik ayrımı", "kt_nullable_types_def", False),
                    ("Güvenli Çağrı Operatörü (?.)", "Null ise zinciri kırmadan null dönme", "kt_safe_call_operator", False),
                    ("Elvis Operatörü (?:) ile Varsayılan Değer", "val name = user?.name ?: 'Misafir' sentaksı", "kt_elvis_operator_deep", False),
                    ("Not-Null Assertion (!!) & Tehlikeleri", "Neden !! kullanmaktan kaçınmalıyız?", "kt_not_null_assertion", False),
                    ("Smart Casts: is Kontrolü Sonrası Otomatik Çevrim", "Manuel casting yapmadan türe erişim", "kt_smart_casts_deep", False),
                    ("Güvenli Tür Dönüşümü: as? Operatörü", "Tip uyuşmazlığında ClassCastException önleme", "kt_safe_cast_as_question", False),
                    ("2. Ünite Null-Safety & Tip Güvenliği Sınavı", "Null güvenliği sınavı", "kt_u2_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_3", "unitNumber": 3, "title": "Fonksiyonlar, Extension Functions & Single Expression", "category": "Fonksiyonlar & Lambdalar", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "Kotlin Fonksiyon Hile Kağıdı",
                "cheatSheetContent": "fun sum(a: Int, b: Int) = a + b\nfun String.clean() = this.trim().lowercase()",
                "lessons": [
                    ("Fonksiyon Tanımlama (fun) & İsimlendirilmiş Argümanlar", "Named arguments ve parametre sırası bağımsızlığı", "kt_functions_named_args", False),
                    ("Varsayılan Parametre Değerleri (Default Arguments)", "Java overload karmaşasını tek fonksiyonda çözme", "kt_default_arguments", False),
                    ("Tek Satırlık Fonksiyonlar (Single-Expression)", "fun double(x: Int) = x * 2 zarafeti", "kt_single_expression_syntax", False),
                    ("Genişletme Fonksiyonları (Extension Functions)", "Mevcut sınıflara miras almadan yeni yetenek katma", "kt_extension_functions_deep", False),
                    ("Genişletme Özellikleri (Extension Properties)", "val String.lastChar: Char get() = this[length - 1]", "kt_extension_properties", False),
                    ("Değişken Sayıda Parametre: vararg Anahtarı", "Dizi elemanlarını yayma operatörü (*spread)", "kt_vararg_spread", False),
                    ("Infix Fonksiyonlar ile Doğal Dil Benzeri Sentaks", "1 to 'Bir' ve infix eğlencesi", "kt_infix_functions", False),
                    ("3. Ünite Fonksiyonlar & Genişletmeler Sınavı", "Fonksiyon mimarisi sınavı", "kt_u3_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_4", "unitNumber": 4, "title": "Yüksek Mertebeden Fonksiyonlar & Scope Fonksiyonları", "category": "Fonksiyonlar & Lambdalar", "colorHex": "0xFFDB2777",
                "cheatSheetTitle": "Kotlin Lambdalar Hile Kağıdı",
                "cheatSheetContent": "list.filter { it > 5 }\nuser?.let { sendEmail(it) }\nconfig.apply { timeout = 5000 }",
                "lessons": [
                    ("Higher-Order Functions: Fonksiyon Alan/Dönen Fonksiyonlar", "Fonksiyonları birinci sınıf vatandaş yapma", "kt_higher_order_intro", False),
                    ("Lambda İfadeleri & it Örtük İsimlendirmesi", "{ a, b -> a + b } ve tek parametrede it", "kt_lambdas_it_syntax", False),
                    ("Scope Fonksiyonu: let ile Null Kontrolü & Dönüşüm", "user?.let { ... } yaygın deseni", "kt_scope_let_deep", False),
                    ("Scope Fonksiyonu: apply ile Nesne Yapılandırma", "Kurucu sonrası builder benzeri blok açma", "kt_scope_apply_deep", False),
                    ("Scope Fonksiyonları: also, run ve with Ayrımı", "Hangi scope fonksiyonu nerede tercih edilir?", "kt_scope_also_run_with", False),
                    ("inline Fonksiyonlar ile Performans Optimizasyonu", "Lambda çağrılarındaki nesne tahsisini sıfırlama", "kt_inline_noinline_crossinline", False),
                    ("Fonksiyon Referansları: String::length & ::println", "Metotları doğrudan lambda yerine geçirme", "kt_function_references", False),
                    ("4. Ünite Lambdalar & Scope Fonksiyonları Sınavı", "Fonksiyonel Kotlin sınavı", "kt_u4_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_5", "unitNumber": 5, "title": "Data Classes, Sealed Classes & Sealed Interfaces", "category": "Data Class & OOP", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Kotlin Data & Sealed Hile Kağıdı",
                "cheatSheetContent": "data class Dev(val id: Int, val name: String)\nsealed interface UiState {\n    object Loading : UiState\n    data class Success(val data: String) : UiState\n}",
                "lessons": [
                    ("data class Mimarisi & Otomatik Metotlar", "toString, equals, hashCode ve copy() üretimi", "kt_data_classes_core", False),
                    ("copy() Metodu ile İmmutable Veri Güncelleme", "Değişmez modellerin tek alanını kopyalayarak değiştirme", "kt_data_class_copy", False),
                    ("Destructuring Declarations: componentN() Metotları", "val (id, name) = user ile parçalama", "kt_destructuring_components", False),
                    ("sealed class Mimarisi: Kısıtlı Sınıf Hiyerarşisi", "when kontrolünde else bloğu gerektirmeme gücü", "kt_sealed_classes_core", False),
                    ("sealed interface ile Çoklu Hiyerarşi Tasarımı", "Modern Android MVI ve UiState modelleme", "kt_sealed_interfaces_uistate", False),
                    ("Değer Sınıfları: value class & @JvmInline", "Ekstra bellek tahsisi yapmadan tip güvenliği", "kt_value_classes_inline", False),
                    ("Enum Sınıfları vs Sealed Classes Karşılaştırması", "Hangi durumda enum, hangi durumda sealed class?", "kt_enum_vs_sealed", False),
                    ("5. Ünite Data & Sealed Sınıflar Sınavı", "Model ve durum mimarisi sınavı", "kt_u5_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_6", "unitNumber": 6, "title": "Object (Singleton), Companion Object & Kalıtım (open)", "category": "Data Class & OOP", "colorHex": "0xFFEA580C",
                "cheatSheetTitle": "Kotlin Sınıf & Kalıtım Hile Kağıdı",
                "cheatSheetContent": "object Database { val url = '...' }\nclass User {\n    companion object { fun create() = User() }\n}\nopen class Base; class Derived : Base()",
                "lessons": [
                    ("Sınıf Tanımlama & Primary Constructor Sentaksı", "init blokları ve kurucu parametreleri", "kt_classes_primary_ctor_deep", False),
                    ("Secondary Constructors: constructor() Kullanımı", "Alternatif kurucular ve this() zinciri", "kt_secondary_constructors", False),
                    ("open Anahtarı: Kotlin'de Sınıflar Neden Varsayılan final'dır?", "Kalıtıma bilinçli izin verme prensibi", "kt_open_keyword_inheritance", False),
                    ("Arayüzler (Interfaces) & Varsayılan Metotlar", "Gövdesi olan arayüz metotları ve çoklu miras", "kt_interfaces_default_methods", False),
                    ("object Bildirimi ile Zahmetsiz Singleton Deseni", "Thread-safe tekil nesne tanımlama", "kt_object_singleton_deep", False),
                    ("companion object ile Statik Benzeri Üyeler", "Fabrika metotları (Factory pattern) inşa etme", "kt_companion_objects_deep", False),
                    ("Anonim Nesneler: object : OnClickListener", "Java benzeri yerinde arayüz uygulama", "kt_anonymous_objects", False),
                    ("6. Ünite Sınıflar, Kalıtım & Singleton Sınavı", "Nesne ve sınıf tasarımı sınavı", "kt_u6_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_7", "unitNumber": 7, "title": "Koleksiyonlar (listOf vs mutableListOf) & Sequences", "category": "Koleksiyonlar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Kotlin Koleksiyon Hile Kağıdı",
                "cheatSheetContent": "val list = listOf(1, 2, 3)\nval evens = list.filter { it % 2 == 0 }\nval seq = list.asSequence().map { it * 2 }.toList()",
                "lessons": [
                    ("Değişmez (listOf) vs Değiştirilebilir (mutableListOf)", "Kotlin koleksiyon hiyerarşisi", "kt_immutable_collections_deep", False),
                    ("Haritalar (Map) & Kümeler (Set): mapOf, setOf", "Anahtar-değer ve tekil eleman koleksiyonları", "kt_maps_sets_kotlin", False),
                    ("Filtreleme & Dönüşüm: filter, map, flatMap", "Koleksiyonları zincirleme işleme", "kt_filter_map_flatmap", False),
                    ("Arama & Doğrulama: find, any, all, none", "Eleman varlığını ve koşul testlerini yapma", "kt_find_any_all_none", False),
                    ("Gruplama & Sözlüğe Çevirme: groupBy, associateBy", "Veri analitiği ve gruplama fonksiyonları", "kt_groupby_associateby", False),
                    ("Kümülatif Fonksiyonlar: reduce, fold & sumOf", "Başlangıç değeriyle toplama ve katlama", "kt_reduce_fold_sumof", False),
                    ("Sequences (asSequence): Büyük Veride Tembel Değerlendirme", "Ara liste tahsislerini sıfıra indirme", "kt_sequences_lazy_deep", False),
                    ("7. Ünite Koleksiyonlar & Veri İşleme Sınavı", "Koleksiyon operasyonları sınavı", "kt_u7_mega_exam", True),
                ]
            },
            {
                "id": "kt_unit_8", "unitNumber": 8, "title": "Coroutines (launch, async, Dispatchers) & Reaktif Flow", "category": "Extensions & Coroutines", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Kotlin Coroutines Hile Kağıdı",
                "cheatSheetContent": "suspend fun fetch() = withContext(Dispatchers.IO) { ... }\nval deferred = async { load() }\nflow { emit(1) }.collect { println(it) }",
                "lessons": [
                    ("Coroutines Nedir? (Thread vs Coroutine Hafifliği)", "Milyonlarca coroutine'in tek thread'de çalışabilmesi", "kt_coroutines_philosophy", False),
                    ("suspend Fonksiyonlar & Kesintiye Uğrama (Continuation)", "Thread'i bloke etmeden duraklatma mekanizması", "kt_suspend_continuation", False),
                    ("CoroutineScope & Yapılandırılmış Eşzamanlılık", "Bellek sızıntılarını ve kayıp görevleri önleme", "kt_structured_concurrency", False),
                    ("launch vs async: Job vs Deferred<T>", "Sonuç beklemeyen vs değer dönen coroutine'ler", "kt_launch_vs_async_job", False),
                    ("Dispatchers: Main, IO, Default & Unconfined", "Doğru işi doğru thread havuzuna yönlendirme", "kt_dispatchers_threading_deep", False),
                    ("withContext ile Bağlam Değiştirme (Context Switching)", "Ağ çağrısını IO'da yapıp sonucu Main'e taşıma", "kt_withcontext_switching", False),
                    ("Reaktif Asenkron Akışlar: Flow & StateFlow", "Soğuk akışlar, emit() ve collect() kullanımı", "kt_flow_stateflow_reactive", False),
                    ("8. Ünite Kotlin Ustalık & Coroutines Sınavı", "Kıdemli Kotlin ve Coroutines sınavı", "kt_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 7. LINUX & BASH
    "linux": {
        "file": "linux_curriculum.dart",
        "var_name": "linuxUnits",
        "lang_enum": "CodeLanguage.linux",
        "units": [
            {
                "id": "lin_unit_1", "unitNumber": 1, "title": "Terminal Gezintisi (pwd, cd, ls -la) & FHS Dosya Sistemi", "category": "Temel Komutlar", "colorHex": "0xFFEAB308",
                "cheatSheetTitle": "Linux Temelleri Hile Kağıdı",
                "cheatSheetContent": "pwd\nls -lah\ncd /var/log\ncd ~",
                "lessons": [
                    ("Linux ve Unix Felsefesi: Her Şey Bir Dosyadır", "Modüler araçlar ve metin tabanlı arayüz", "lin_unix_philosophy", False),
                    ("Terminal Dünyasına Giriş: pwd & cd Komutları", "Mutlak (absolute) vs göreceli (relative) yollar", "lin_pwd_cd_navigation", False),
                    ("ls Komutu ve Detaylı Listeleme Bayrakları (-la, -lh)", "Gizli dosyalar, boyutlar ve izin formatı", "lin_ls_flags_deep", False),
                    ("FHS (Filesystem Hierarchy Standard): /bin, /etc, /var", "Linux dizin ağacının mantıksal mimarisi", "lin_fhs_hierarchy_deep", False),
                    ("Özel Dizinler: /home, /usr, /tmp, /dev, /proc", "Donanım, süreçler ve geçici dosyalar", "lin_special_directories", False),
                    ("Dizin Geçmişi Kısayolları (cd ~, cd -, cd ..)", "Hızlı terminal navigasyonu", "lin_cd_shortcuts", False),
                    ("which ve whereis ile Komutların Yerini Bulma", "Çalıştırılabilir ikililerin konumunu tespit", "lin_which_whereis", False),
                    ("1. Ünite Terminal & Dosya Sistemi Sınavı", "Navigasyon ve dizin mimarisi sınavı", "lin_u1_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_2", "unitNumber": 2, "title": "Dosya & Dizin Yönetimi (mkdir, cp, mv, rm -rf)", "category": "Temel Komutlar", "colorHex": "0xFFCA8A04",
                "cheatSheetTitle": "Dosya Yönetimi Hile Kağıdı",
                "cheatSheetContent": "mkdir -p a/b/c\ntouch file.txt\ncp -r src/ dst/\nmv old.txt new.txt\nrm -rf temp/",
                "lessons": [
                    ("mkdir ile Dizin Açma & -p (Parents) Bayrağı", "İç içe dizin ağacını tek seferde kurma", "lin_mkdir_parents", False),
                    ("touch ile Dosya Oluşturma & Zaman Damgası Güncelleme", "Boş dosya açma ve erişim tarihi", "lin_touch_timestamps", False),
                    ("cp ile Dosya & Dizin Kopyalama (-r Özyinelemeli)", "Klasörleri derinlemesine yedekleme", "lin_cp_recursive", False),
                    ("mv ile Dosya Taşıma & Yeniden İsimlendirme", "Dizinler arası taşıma mekanizması", "lin_mv_rename", False),
                    ("rm ile Güvenli Silme vs rm -rf Tehlikesi", "Geri dönüşü olmayan silme kuralları", "lin_rm_rf_safety", False),
                    ("Sembolik Linkler (Symlinks: ln -s) Mimarisi", "Yumuşak (soft) vs katı (hard) link farkları", "lin_symlinks_hardlinks", False),
                    ("stat Komutu ile Dosya Metaverilerini İnceleme", "Inode, erişim ve değiştirilme detayları", "lin_stat_metadata", False),
                    ("2. Ünite Dosya & Dizin Yönetimi Sınavı", "Dosya manipülasyonu sınavı", "lin_u2_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_3", "unitNumber": 3, "title": "Dosya İçeriklerini Okuma (cat, less, head, tail -f)", "category": "Temel Komutlar", "colorHex": "0xF59E0B",
                "cheatSheetTitle": "Dosya Okuma Hile Kağıdı",
                "cheatSheetContent": "cat file.txt\nless big.log\nhead -n 20 file.txt\ntail -f /var/log/syslog",
                "lessons": [
                    ("cat ile Dosyaları Ekrana Basma & Birleştirme", "Küçük dosyaları hızlıca terminalde görme", "lin_cat_display", False),
                    ("less ve more ile Sayfa Sayfa Gezinme", "Büyük log dosyalarını belleği şişirmeden okuma", "lin_less_navigation", False),
                    ("head ile Dosyanın Başlangıcını Okuma (-n 10)", "İlk N satırı çekme ve format denetleme", "lin_head_first_lines", False),
                    ("tail ile Dosyanın Sonunu Okuma (-n 50)", "En son eklenen kayıtları hızlıca bulma", "lin_tail_last_lines", False),
                    ("Canlı Log İzleme: tail -f & tail -F", "Log akarken terminale anlık düşürme", "lin_tail_follow_deep", False),
                    ("nl ile Satır Numaralı Görüntüleme", "Kod ve metin satırlarını numaralandırma", "lin_nl_numbering", False),
                    ("wc ile Kelime, Satır ve Bayt Sayımı", "wc -l ile dosyadaki toplam satırı bulma", "lin_wc_counting", False),
                    ("3. Ünite Dosya İçeriklerini Okuma Sınavı", "Dosya görüntüleme araçları sınavı", "lin_u3_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_4", "unitNumber": 4, "title": "Standart Akışlar (stdin, stdout, stderr) & Yönlendirme", "category": "Pipe & Yönlendirme", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Linux Akışlar Hile Kağıdı",
                "cheatSheetContent": "cmd > out.txt\ncmd >> out.txt\ncmd 2> err.txt\ncmd > out.txt 2>&1\ncmd < in.txt",
                "lessons": [
                    ("Dosya Tanımlayıcıları (File Descriptors): 0, 1, 2", "stdin (0), stdout (1), stderr (2) kavramları", "lin_file_descriptors", False),
                    ("Standart Çıktı Yönlendirmesi: > (Üzerine Yaz)", "Komut sonucunu dosyaya aktarma", "lin_redirect_overwrite", False),
                    ("Sonuna Ekleme Yönlendirmesi: >> (Append)", "Mevcut dosyayı koruyarak log ekleme", "lin_redirect_append", False),
                    ("Hata Çıktısını Yakalama: 2> ve 2>>", "Hataları ayrı bir log dosyasına yönlendirme", "lin_redirect_stderr", False),
                    ("Tüm Çıktıları Birleştirme: 2>&1 ve &>", "Hem stdout hem stderr'i tek dosyaya basma", "lin_redirect_combined", False),
                    ("Girdiyi Dosyadan Besleme: < Operatörü", "Dosya içeriğini komutun stdin'ine besleme", "lin_redirect_stdin", False),
                    ("Çıktıları Sessize Alma: /dev/null Karadeliği", "cmd > /dev/null 2>&1 ile sessiz çalıştırma", "lin_dev_null_blackhole", False),
                    ("4. Ünite Giriş/Çıkış & Yönlendirme Sınavı", "Akışlar ve yönlendirmeler sınavı", "lin_u4_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_5", "unitNumber": 5, "title": "Pipe (|) Mimarisi & tee ile Komut Zincirleme", "category": "Pipe & Yönlendirme", "colorHex": "0xFFEA580C",
                "cheatSheetTitle": "Linux Pipe Hile Kağıdı",
                "cheatSheetContent": "ls | grep txt\ncat log.txt | grep 404 | wc -l\necho 'test' | sudo tee /etc/cfg",
                "lessons": [
                    ("Pipe (|) Nedir? Bir Komutun Çıktısını Diğerinin Girdisi Yapma", "Unix felsefesinin en büyük gücü", "lin_pipe_concept", False),
                    ("Çoklu Pipe Zincirleri (Pipelining)", "Üç veya daha fazla aracı birbirine bağlama", "lin_multi_pipes", False),
                    ("grep ile Pipe Filtreleme Kombinasyonu", "Gereksiz satırları süzgeçten geçirme", "lin_pipe_with_grep", False),
                    ("tee Komutu ile Çıktıyı Çatallama", "Hem ekrana basıp hem dosyaya kaydetme", "lin_tee_branching", False),
                    ("sudo tee ile Korumalı Dosyalara Yazma", "sudo echo > /etc/ dosya izni hatasını çözme", "lin_sudo_tee_trick", False),
                    ("xargs: Pipe Çıktısını Komut Argümanına Çevirme", "find çıktısındaki dosyaları rm'ye parametre yapma", "lin_xargs_arguments", False),
                    ("FIFO / Named Pipes (mkfifo) Mimarisi", "Süreçler arası geçici boru hatları", "lin_named_pipes_fifo", False),
                    ("5. Ünite Pipe & Zincirleme Sınavı", "Boru hatları ve tee komutu sınavı", "lin_u5_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_6", "unitNumber": 6, "title": "Metin Filtreleme (grep, sed, awk, cut, sort, uniq)", "category": "Metin Filtreleme (grep)", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Linux Metin İşleme Hile Kağıdı",
                "cheatSheetContent": "grep -rn 'ERROR' .\nawk '{print $1, $9}' access.log\nsed -i 's/old/new/g' f.txt\nsort | uniq -c",
                "lessons": [
                    ("grep ile Regex ve Kelime Arama", "-i (büyük/küçük harf), -v (tersleme), -n (satır no)", "lin_grep_mastery", False),
                    ("Özyinelemeli Arama: grep -rn 'desen' .", "Tüm proje dosyalarında hızlı kod/hata arama", "lin_grep_recursive", False),
                    ("sed (Stream Editor) ile Bul ve Değiştir", "s/eski/yeni/g ve in-place (-i) düzenleme", "lin_sed_find_replace", False),
                    ("awk Temelleri: Sütun Bazlı Veri Ayrıştırma", "print $1, $NF ve boşluk ayırıcılar", "lin_awk_columns_deep", False),
                    ("cut ile Belirli Karakter/Sütunları Kesme (-d, -f)", "CSV ve passwd formatlarını parçalama", "lin_cut_delimiters", False),
                    ("sort ve uniq ile Sıralama & Tekilleştirme", "uniq -c ile tekrar eden kayıtları sayma", "lin_sort_uniq_counting", False),
                    ("tr ile Karakter Değiştirme ve Silme", "Büyük harfe çevirme (tr '[:lower:]' '[:upper:]')", "lin_tr_translation", False),
                    ("6. Ünite Metin Filtreleme & Arama Sınavı", "grep, awk ve sed ustalık sınavı", "lin_u6_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_7", "unitNumber": 7, "title": "İzinler (chmod 755/644), Sahiplik (chown) & Süreçler", "category": "İzinler (chmod)", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "Linux İzinler & Süreç Hile Kağıdı",
                "cheatSheetContent": "chmod 755 script.sh\nchown deploy:www-data app/\nps aux | grep node\nkill -9 <PID>",
                "lessons": [
                    ("Linux Kullanıcı ve Grup Modeli: User, Group, Others", "Dosya sahipliği ve yetki sınırları", "lin_user_group_model", False),
                    ("rwx İzinleri: Read (4), Write (2), Execute (1)", "Sekizlik matematiksel izin hesaplama", "lin_rwx_octal_math", False),
                    ("chmod ile İzin Değiştirme (755, 644, 600, 777)", "Scriptleri çalıştırılabilir yapma (+x)", "lin_chmod_permissions", False),
                    ("chown ile Kullanıcı ve Grup Sahipliğini Aktarma", "chown -R user:group klasor/ kullanımı", "lin_chown_ownership_deep", False),
                    ("ps aux ve top/htop ile Süreçleri İzleme", "PID, CPU ve RAM tüketen işlemleri bulma", "lin_process_monitoring", False),
                    ("Süreç Sinyalleri: SIGTERM (15) vs SIGKILL (9)", "kill, killall ve pkill komutları", "lin_signals_kill_deep", False),
                    ("Arka Planda Çalıştırma (&) ve nohup", "Terminal kapansa bile sürecin devam etmesi", "lin_background_nohup", False),
                    ("7. Ünite İzinler, Güvenlik & Süreç Sınavı", "Sistem izinleri ve süreç yönetimi sınavı", "lin_u7_mega_exam", True),
                ]
            },
            {
                "id": "lin_unit_8", "unitNumber": 8, "title": "Bash Scripting, Ağ Araçları (curl, SSH) & Arşivleme", "category": "Shell Scripting", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "Linux Scripting & Ağ Hile Kağıdı",
                "cheatSheetContent": "#!/bin/bash\ncurl -s https://api.com\nssh -i key.pem user@host\ntar -czvf archive.tar.gz src/",
                "lessons": [
                    ("Bash Script Temelleri: Shebang (#!/bin/bash)", "Değişkenler, çalıştırma yetkisi ve çalıştırma", "lin_bash_shebang_vars", False),
                    ("Bash Koşulları: if [ $x -eq 10 ]; then", "Sayısal ve string karşılaştırma bayrakları", "lin_bash_if_conditions", False),
                    ("Bash Döngüleri: for dosya in *.txt; do", "Otomasyon döngüleri ve dosya tarama", "lin_bash_loops_automation", False),
                    ("curl ve wget ile HTTP İstekleri Gönderme", "API sorgulama, header ekleme ve dosya indirme", "lin_curl_wget_http", False),
                    ("SSH ile Uzak Sunucuya Güvenli Bağlantı", "id_rsa anahtarları, ssh-copy-id ve config", "lin_ssh_keys_config", False),
                    ("Arşivleme: tar (-cvf, -xvf) ve gzip/bzip2", ".tar.gz yedekleme paketleri oluşturma", "lin_tar_gzip_compression", False),
                    ("find ile Gelişmiş Dosya Arama (-name, -mtime, -size)", "Belirli kriterlere uyan dosyaları bulup silme", "lin_find_exec_advanced", False),
                    ("8. Ünite Linux Ustalık & Sistem Yöneticisi Sınavı", "Kapsamlı Linux ve DevOps sınavı", "lin_u8_mega_exam", True),
                ]
            }
        ]
    }
}

print("Part 3 Specs loaded.")
