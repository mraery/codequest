# -*- coding: utf-8 -*-
"""
Full Technical Specifications for JavaScript, SQL, and Algorithms
(8 Units x 8 Lessons each)
"""

TRACKS_DATA_PART4 = {
    # 8. JAVASCRIPT & WEB
    "javascript": {
        "file": "javascript_curriculum.dart",
        "var_name": "javascriptUnits",
        "lang_enum": "CodeLanguage.javascript",
        "units": [
            {
                "id": "js_unit_1", "unitNumber": 1, "title": "Modern ES6+ Temelleri (let, const, Arrow Functions)", "category": "ES6+ Temelleri", "colorHex": "0xFFF7DF1E",
                "cheatSheetTitle": "JS ES6+ Hile Kağıdı",
                "cheatSheetContent": "const pi = 3.14;\nlet score = 10;\nconst add = (a, b) => a + b;\nconst greet = name => `Hi ${name}`;",
                "lessons": [
                    ("JavaScript'in Evrimi: ES5'ten Modern ES6+'a", "ECMAScript standartları ve V8 motoru", "js_es6_evolution", False),
                    ("let ve const vs Eski var Ayrımı", "Block scope vs Function scope ve TDZ", "js_let_const_var_deep", False),
                    ("Değişmezlik Felsefesi: const Dizi ve Nesneleri Korur mu?", "Referans değişmezliği vs içerik mutasyonu", "js_const_mutability", False),
                    ("Arrow Functions: Kısa Sözdizimi & Lexical this", "Kendi this bağlamı olmayan fonksiyonlar", "js_arrow_functions_this", False),
                    ("Template Literals (`${ifade}`): Gelişmiş Metin İnşası", "Çok satırlı metinler ve HTML şablonları", "js_template_literals_deep", False),
                    ("Varsayılan Parametre Değerleri (Default Parameters)", "Parametre tanımlarında varsayılan değer atama", "js_default_parameters", False),
                    ("Veri Tipleri & typeof Operatörü: typeof null Tuzağı", "İlkel tipler vs Nesneler ve tarihi bug", "js_types_typeof_null", False),
                    ("1. Ünite JavaScript ES6+ Temelleri Sınavı", "Modern JS sözdizimi sınavı", "js_u1_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_2", "unitNumber": 2, "title": "Template Literals, Destructuring & Spread/Rest", "category": "ES6+ Temelleri", "colorHex": "0xFFEAB308",
                "cheatSheetTitle": "JS Destructuring Hile Kağıdı",
                "cheatSheetContent": "const { id, name } = user;\nconst [first, ...rest] = arr;\nconst merged = { ...obj1, ...obj2 };",
                "lessons": [
                    ("Nesne Parçalama (Object Destructuring)", "const { name, age } = user sentaksı", "js_destructuring_objects", False),
                    ("Dizi Parçalama (Array Destructuring)", "const [first, second] = list ile eleman alma", "js_destructuring_arrays", False),
                    ("Varsayılan Değerli ve Yeniden İsimlendirmeli Destructuring", "const { name: userName = 'Misafir' } kullanımı", "js_destructuring_aliases", False),
                    ("Spread Operatörü (...): Dizi ve Nesne Kopyalama", "Sığ kopyalama (shallow copy) ve birleştirme", "js_spread_operator_deep", False),
                    ("Rest Parametreleri (...): Kalan Argümanları Toplama", "Fonksiyonlarda sınırsız parametre yakalama", "js_rest_parameters_deep", False),
                    ("Optional Chaining (?.) ile Güvenli Gezinme", "user?.address?.city ile undefined hatasını önleme", "js_optional_chaining", False),
                    ("Nullish Coalescing (??) vs Mantıksal VEYA (||)", "0 ve false değerlerinde doğru varsayılan seçimi", "js_nullish_coalescing", False),
                    ("2. Ünite Destructuring & Operatörler Sınavı", "Nesne parçalama ve operatörler sınavı", "js_u2_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_3", "unitNumber": 3, "title": "Fonksiyonel Dizi Metotları (map, filter, reduce, find)", "category": "Diziler & Nesneler", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "JS Dizi Metotları Hile Kağıdı",
                "cheatSheetContent": "arr.map(x => x * 2)\narr.filter(x => x > 0)\narr.reduce((acc, x) => acc + x, 0)",
                "lessons": [
                    ("Array.prototype.map(): Veri Dönüştürme (Projeksiyon)", "Orijinal diziyi bozmadan yeni dizi üretme", "js_array_map_deep", False),
                    ("Array.prototype.filter(): Şartlı Ayıklama", "Koşulu sağlayan elemanlardan alt küme oluşturma", "js_array_filter_deep", False),
                    ("Array.prototype.reduce(): Tek Değere İndirgeme", "Akümülatör, başlangıç değeri ve hesaplamalar", "js_array_reduce_deep", False),
                    ("Array.prototype.forEach(): Sadece Yan Etki Üretme", "forEach vs map arasındaki kritik farklar", "js_array_foreach_vs_map", False),
                    ("Arama Metotları: find(), findIndex() & includes()", "Elemanı ve indeksini doğrudan bulma", "js_array_find_includes", False),
                    ("Doğrulama Metotları: some() ve every()", "En az biri mi yoksa hepsi mi şartı sağlıyor?", "js_array_some_every", False),
                    ("Dizi Düzleştirme: flat() ve flatMap()", "İç içe dizileri tek boyuta indirme", "js_array_flat_flatmap", False),
                    ("3. Ünite Fonksiyonel Dizi Metotları Sınavı", "Dizi işleme ve dönüşüm sınavı", "js_u3_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_4", "unitNumber": 4, "title": "Kapsam (Scope), Hoisting & Closures (Kapanışlar)", "category": "Diziler & Nesneler", "colorHex": "0xFFD97706",
                "cheatSheetTitle": "JS Scope & Closures Hile Kağıdı",
                "cheatSheetContent": "function makeCounter() {\n    let c = 0;\n    return () => ++c;\n}\nconst count = makeCounter();",
                "lessons": [
                    ("Kapsam Hiyerarşisi: Global, Function & Block Scope", "Değişkenlerin görünürlük sınırları", "js_scope_hierarchy", False),
                    ("Hoisting (Yukarı Çekilme) Davranışı", "var vs function bildirimlerinin derleme anı davranışı", "js_hoisting_internals", False),
                    ("Geçici Ölü Bölge: Temporal Dead Zone (TDZ)", "let ve const'un ilklendirilmeden önce erişilememesi", "js_tdz_dead_zone", False),
                    ("Closures (Kapanışlar) Nedir & Nasıl Çalışır?", "Dış kapsamı hafızasında tutan fonksiyonlar", "js_closures_core", False),
                    ("Closures ile Kapsülleme & Özel (Private) Değişkenler", "Veri saklama ve modül deseni", "js_closures_data_privacy", False),
                    ("Döngülerde Closure Tuzağı (for var i vs let i)", "setTimeout içinde indeksin yanlış yazılması bug'ı", "js_closure_loop_var_bug", False),
                    ("Lexical Environment & Scope Chain (Kapsam Zinciri)", "JavaScript motorunun değişken arama adımları", "js_lexical_scope_chain", False),
                    ("4. Ünite Scope & Closures Ustalık Sınavı", "Kapsam ve kapanışlar değerlendirmesi", "js_u4_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_5", "unitNumber": 5, "title": "Asenkron JS & Event Loop (Call Stack, Micro/Macrotask)", "category": "Asenkron & Promise", "colorHex": "0xFF38BDF8",
                "cheatSheetTitle": "JS Event Loop Hile Kağıdı",
                "cheatSheetContent": "Call Stack -> Microtasks (Promise) -> Render -> Macrotasks (setTimeout)",
                "lessons": [
                    ("JavaScript Tek İş Parçacıklıdır (Single-Threaded)", "Engellemeyen (Non-blocking) G/Ç felsefesi", "js_single_threaded_io", False),
                    ("Call Stack (Çağrı Yığını) & Stack Overflow", "Fonksiyonların LIFO yığıtında çalışması", "js_call_stack_overflow", False),
                    ("Web APIs & Tarayıcı/Node.js Arka Planı", "Ağ istekleri, DOM ve zamanlayıcıların yürütülmesi", "js_web_apis_background", False),
                    ("Event Loop (Olay Döngüsü) Çarkı Nasıl Döner?", "Call Stack boşalınca kuyruklardan görev alma", "js_event_loop_rotation", False),
                    ("Microtask Queue: Promise Callback'lerinin Önceliği", "Neden Promise her zaman setTimeout'tan önce biter?", "js_microtask_priority", False),
                    ("Macrotask Queue (Task Queue): setTimeout & setInterval", "Zamanlayıcıların asgari gecikme garantisi", "js_macrotask_timers", False),
                    ("requestAnimationFrame & Render Aşaması", "Ekran kare yenilemesi ve animasyon sırası", "js_raf_render_loop", False),
                    ("5. Ünite Event Loop & Asenkron Mimari Sınavı", "Olay döngüsü ve görev kuyrukları sınavı", "js_u5_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_6", "unitNumber": 6, "title": "Promises & Modern async / await Mimarisi", "category": "Asenkron & Promise", "colorHex": "0xFF0284C7",
                "cheatSheetTitle": "JS Async/Await Hile Kağıdı",
                "cheatSheetContent": "const res = await fetch('/api');\nconst data = await res.json();\nconst all = await Promise.all([p1, p2]);",
                "lessons": [
                    ("Callback Hell (Geri Çağrı Cehennemi) ve Nedenleri", "Piramit şeklinde iç içe callback felaketi", "js_callback_hell_intro", False),
                    ("Promise Mimarisi: pending, fulfilled, rejected", "Gelecekteki değerlerin 3 temel durumu", "js_promise_states", False),
                    (".then(), .catch() ve .finally() Zincirleme", "Hataları merkezi yakalama ve kaynak temizliği", "js_promise_chaining", False),
                    ("async / await Sentaksı: Senkron Görünümlü Asenkron Kod", "Promise tabanlı kodları okunaklı yazma", "js_async_await_clean", False),
                    ("try...catch ile Asenkron Hata Yönetimi", "Ağ ve ayrıştırma hatalarını zarifçe yakalama", "js_async_try_catch", False),
                    ("Promise.all() vs Promise.allSettled()", "Biri hata verince durma vs hepsinin sonucunu bekleme", "js_promise_all_vs_allsettled", False),
                    ("Promise.race() ve Promise.any()", "İlk biteni alma ve zaman aşımı (timeout) deseni", "js_promise_race_any", False),
                    ("6. Ünite Promises & Async/Await Sınavı", "Asenkron JavaScript sınavı", "js_u6_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_7", "unitNumber": 7, "title": "DOM Seçicileri, Manipülasyon, Olaylar & Event Bubbling", "category": "DOM & Olaylar", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "JS DOM Hile Kağıdı",
                "cheatSheetContent": "const btn = document.querySelector('.btn');\nbtn.addEventListener('click', e => {\n    e.stopPropagation();\n});",
                "lessons": [
                    ("DOM (Document Object Model) Ağacı Nedir?", "HTML dokümanının nesne hiyerarşisi olarak temsili", "js_dom_tree_intro", False),
                    ("DOM Seçicileri: querySelector & querySelectorAll", "Modern CSS seçicileriyle eleman yakalama", "js_query_selectors", False),
                    ("Eleman Manipülasyonu: innerHTML, textContent, classList", "Stil ve sınıf ekleme/çıkarma (toggle)", "js_dom_element_manipulation", False),
                    ("addEventListener() ile Olay Dinleme", "click, submit, keydown, input olayları", "js_event_listeners_deep", False),
                    ("Event Bubbling & Capturing (Olay Yayılımı)", "Olayın yukarı doğru kabarması mekanizması", "js_event_bubbling_capturing", False),
                    ("e.stopPropagation() ve e.preventDefault()", "Olay yayılımını durdurma ve form yenilenmesini önleme", "js_stop_propagation_prevent_default", False),
                    ("Event Delegation (Olay Yetkilendirme) Deseni", "Yüzlerce eleman yerine ortak ata elemanı dinleme", "js_event_delegation_pattern", False),
                    ("7. Ünite DOM Manipülasyonu & Web Olayları Sınavı", "DOM ve tarayıcı olayları sınavı", "js_u7_mega_exam", True),
                ]
            },
            {
                "id": "js_unit_8", "unitNumber": 8, "title": "Modern Web: LocalStorage, ES Modülleri, Hata Yakalama & Güvenlik", "category": "Modern Web & Modüller", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "JS Web APIs Hile Kağıdı",
                "cheatSheetContent": "localStorage.setItem('k', JSON.stringify(v));\nimport { func } from './module.js';\nexport default App;",
                "lessons": [
                    ("Web Depolama: localStorage vs sessionStorage", "Kalıcı depolama vs sekme kapanınca silinen veri", "js_localstorage_sessionstorage", False),
                    ("JSON Serileştirme: JSON.stringify() & JSON.parse()", "Nesneleri metne ve metni nesneye çevirme", "js_json_serialization", False),
                    ("ES Modülleri: import, export ve export default", "Dosya bazlı modüler mimari kurma", "js_es_modules_deep", False),
                    ("Hata Yakalama: Error Nesnesi & Özel Hata Sınıfları", "throw new Error('Geçersiz işlem')", "js_custom_error_classes", False),
                    ("Web Güvenliği: XSS (Cross-Site Scripting) Koruması", "innerHTML tehlikesi ve metin temizleme (sanitization)", "js_security_xss_prevention", False),
                    ("Web Güvenliği: CSRF (Cross-Site Request Forgery)", "SameSite cookie ve CSRF token mantığı", "js_security_csrf_protection", False),
                    ("CORS (Cross-Origin Resource Sharing) Çözüm Yolları", "Farklı alan adları arası API istek kısıtlamaları", "js_cors_headers_handling", False),
                    ("8. Ünite JavaScript Ustalık & Kıdemli Web Mimarı Sınavı", "Kapsamlı JS ve web güvenliği sınavı", "js_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 9. SQL & VERİTABANI
    "sql": {
        "file": "sql_curriculum.dart",
        "var_name": "sqlUnits",
        "lang_enum": "CodeLanguage.sql",
        "units": [
            {
                "id": "sql_unit_1", "unitNumber": 1, "title": "İlişkisel Veritabanları (RDBMS) & DDL (CREATE TABLE)", "category": "Temel CRUD", "colorHex": "0xFF06B6D4",
                "cheatSheetTitle": "SQL DDL Hile Kağıdı",
                "cheatSheetContent": "CREATE TABLE users (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    name VARCHAR(100) NOT NULL,\n    email VARCHAR(255) UNIQUE\n);",
                "lessons": [
                    ("İlişkisel Model (RDBMS) Felsefesi & Tablolar", "Tablolar, satırlar, sütunlar ve ilişkiler", "sql_rdbms_philosophy", False),
                    ("DDL vs DML Komutları Ayrımı", "Veri tanımı (Schema) vs Veri manipülasyonu", "sql_ddl_dml_difference", False),
                    ("CREATE TABLE & Veri Tipleri (INT, VARCHAR, TEXT, DATE)", "Sütun tanımlama ve doğru tip seçimi", "sql_create_table_types", False),
                    ("Birincil Anahtar (PRIMARY KEY) & Benzersizlik", "Her satırı tekil kılan sütun ve indeks", "sql_primary_key_concept", False),
                    ("Kısıtlamalar (Constraints): NOT NULL, UNIQUE, DEFAULT", "Veri kalitesini sütun seviyesinde sağlama", "sql_constraints_not_null", False),
                    ("ALTER TABLE ile Tablo Yapısını Değiştirme", "Sütun ekleme, silme ve tip değiştirme", "sql_alter_table_columns", False),
                    ("DROP TABLE vs TRUNCATE TABLE Farkı", "Tabloyu tamamen silme vs satırları sıfırlama", "sql_drop_vs_truncate", False),
                    ("1. Ünite Veritabanı Mimarisi & DDL Sınavı", "Tablo oluşturma ve DDL sınavı", "sql_u1_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_2", "unitNumber": 2, "title": "Temel DML İşlemleri (INSERT, UPDATE, DELETE & WHERE)", "category": "Temel CRUD", "colorHex": "0xFF0891B2",
                "cheatSheetTitle": "SQL DML Hile Kağıdı",
                "cheatSheetContent": "INSERT INTO users (name) VALUES ('Ali');\nUPDATE users SET name = 'Veli' WHERE id = 1;\nDELETE FROM users WHERE id = 1;",
                "lessons": [
                    ("INSERT INTO ile Tabloya Yeni Satır Ekleme", "Tek satır ekleme sentaksı ve sütun eşleme", "sql_insert_single_row", False),
                    ("Toplu Veri Ekleme: Bulk INSERT", "Tek sorguda yüzlerce satır ekleyerek hız kazanma", "sql_bulk_insert_performance", False),
                    ("UPDATE Komutu ile Mevcut Verileri Güncelleme", "SET sütun = değer sentaksı", "sql_update_records", False),
                    ("WHERE Olmadan UPDATE ve DELETE Yapmama Kuralı", "Tüm tabloyu yanlışlıkla ezme felaketini önleme", "sql_where_clause_safety", False),
                    ("DELETE FROM ile Şartlı Satır Silme", "Kriteri sağlayan kayıtları tablodan kaldırma", "sql_delete_conditions", False),
                    ("Soft Delete Deseni: is_deleted Bayrağı", "Veriyi fiziksel silmek yerine pasife alma", "sql_soft_delete_pattern", False),
                    ("UPSERT (ON CONFLICT / ON DUPLICATE KEY)", "Varsa güncelle yoksa ekle akışı", "sql_upsert_merge_logic", False),
                    ("2. Ünite Temel DML & CRUD İşlemleri Sınavı", "Kayıt ekleme, güncelleme ve silme sınavı", "sql_u2_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_3", "unitNumber": 3, "title": "Sorgulama (SELECT, Takma Adlar AS & DISTINCT)", "category": "Filtreleme & Sıralama", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "SQL SELECT Hile Kağıdı",
                "cheatSheetContent": "SELECT name, email AS contact FROM users;\nSELECT DISTINCT department FROM employees;\nSELECT 1 + 1 AS result;",
                "lessons": [
                    ("SELECT ile Sütun Projeksiyonu Yapma", "Neden SELECT * yerine sütunları açıkça yazmalıyız?", "sql_select_projection", False),
                    ("Sütun ve Tablo Takma Adları: AS Anahtarı", "Okunabilir çıktı başlıkları ve kısa tablo isimleri", "sql_aliases_as_keyword", False),
                    ("Mükerrer Satırları Temizleme: DISTINCT", "Sorgu sonucunda yalnızca tekil değerleri listeleme", "sql_distinct_unique_rows", False),
                    ("Aritmetik Hesaplamalar & Sütun Birleştirme", "SELECT salary * 1.20 AS zamli_maas sentaksı", "sql_select_expressions", False),
                    ("Metin Fonksiyonları: CONCAT, UPPER, LOWER, SUBSTRING", "Metinleri formatlayarak çekme", "sql_string_functions_sql", False),
                    ("Tarih ve Saat Fonksiyonları: NOW(), DATEDIFF()", "Zaman damgası filtreleme ve yaş hesapları", "sql_datetime_functions", False),
                    ("Sorgu Yürütme Sırası (Query Execution Order)", "SQL motorunun sorguyu hangi sırada işlediği", "sql_execution_order_flow", False),
                    ("3. Ünite SELECT & Projeksiyon Sınavı", "Sorgu yazma temelleri sınavı", "sql_u3_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_4", "unitNumber": 4, "title": "Filtreleme & Sıralama (BETWEEN, IN, LIKE, ORDER BY, LIMIT)", "category": "Filtreleme & Sıralama", "colorHex": "0xFF2563EB",
                "cheatSheetTitle": "SQL Filtre Hile Kağıdı",
                "cheatSheetContent": "WHERE age BETWEEN 18 AND 30\nWHERE status IN ('A', 'B')\nWHERE name LIKE 'A%'\nORDER BY id DESC LIMIT 10 OFFSET 20;",
                "lessons": [
                    ("WHERE ile Mantıksal Filtreleme (AND, OR, NOT)", "Parantez öncelikleri ve mantık kuralları", "sql_where_logical_operators", False),
                    ("Aralık Filtreleme: BETWEEN ... AND ...", "Sayısal ve tarihsel aralık sorguları", "sql_between_operator", False),
                    ("Liste Kontrolü: IN ('değer1', 'değer2')", "Çoklu OR yerine temiz liste filtreleme", "sql_in_operator_lists", False),
                    ("Metin Arama & Wildcard Karakterler: LIKE, %, _", "Kısmi kelime arama ve desen eşleme", "sql_like_wildcard_patterns", False),
                    ("NULL Kontrolü: IS NULL vs IS NOT NULL", "Neden '= NULL' yazılmaz, 'IS NULL' yazılır?", "sql_is_null_check_rules", False),
                    ("Sonuçları Sıralama: ORDER BY (ASC / DESC)", "Tekli ve çoklu sütuna göre alfabetik/sayısal sıralama", "sql_order_by_sorting", False),
                    ("Sayfalama (Pagination): LIMIT ve OFFSET", "Büyük verileri 10'ar 20'şer sayfalara bölme", "sql_limit_offset_pagination", False),
                    ("4. Ünite Filtreleme & Sıralama Sınavı", "WHERE ve ORDER BY uzmanlık sınavı", "sql_u4_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_5", "unitNumber": 5, "title": "Gruplama & Kümülatif Fonksiyonlar (COUNT, SUM, GROUP BY, HAVING)", "category": "Gruplama & Aggregate", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "SQL Gruplama Hile Kağıdı",
                "cheatSheetContent": "SELECT dept, COUNT(*), AVG(salary)\nFROM employees\nGROUP BY dept\nHAVING COUNT(*) > 5;",
                "lessons": [
                    ("Aggregate Fonksiyonları: COUNT(), COUNT(*), COUNT(col)", "Satır sayma ve NULL elemanların sayımı", "sql_count_aggregates", False),
                    ("Kümülatif Toplam ve Ortalama: SUM() & AVG()", "Finansal ve istatistiksel özetleme", "sql_sum_avg_functions", False),
                    ("Uç Değerleri Bulma: MIN() ve MAX()", "En düşük ve en yüksek değerleri çekme", "sql_min_max_functions", False),
                    ("GROUP BY: Ortak Özelliklere Göre Satırları Gruplama", "Departmanlara veya şehirlere göre özet tablolar", "sql_group_by_mastery", False),
                    ("HAVING vs WHERE Arasındaki Kritik Fark", "Filtre gruplamadan önce mi sonra mı çalışmalı?", "sql_having_vs_where_deep", False),
                    ("Çok Sütunlu Gruplama (Multi-Column GROUP BY)", "Yıl ve aya göre iki kademeli özetleme", "sql_multi_column_grouping", False),
                    ("Koşullu İfadeler: CASE WHEN ... THEN ... ELSE", "Sorgu içinde dinamik kategorizasyon üretme", "sql_case_when_conditional", False),
                    ("5. Ünite Gruplama & Analitik Fonksiyonlar Sınavı", "GROUP BY ve aggregate hesaplama sınavı", "sql_u5_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_6", "unitNumber": 6, "title": "Tablo İlişkileri & Birleştirmeler (INNER JOIN, LEFT JOIN)", "category": "JOIN & İlişkiler", "colorHex": "0xFF059669",
                "cheatSheetTitle": "SQL JOIN Hile Kağıdı",
                "cheatSheetContent": "SELECT u.name, o.total\nFROM users u\nINNER JOIN orders o ON u.id = o.user_id\nLEFT JOIN logs l ON u.id = l.user_id;",
                "lessons": [
                    ("İlişki Mimarisi: 1-to-1, 1-to-Many & Many-to-Many", "İlişkisel veritabanlarının temel bağlantı modelleri", "sql_relationships_architecture", False),
                    ("Yabancı Anahtar (Foreign Key) & Referans Bütünlüğü", "Yetim kayıtların (orphan rows) oluşmasını engelleme", "sql_foreign_key_integrity", False),
                    ("INNER JOIN Mimarisi: Kesişim Kümesini Getirme", "Yalnızca her iki tabloda da eşleşen kayıtları çekme", "sql_inner_join_deep", False),
                    ("ON Koşulu vs WHERE Filtresi Ayrımı", "Tabloları bağlama koşulu vs sonuç filtreleme", "sql_join_on_vs_where", False),
                    ("LEFT JOIN (LEFT OUTER JOIN): Sol Tablonun Tamamı", "Eşleşmeyen sağ kayıtlar için NULL basma mantığı", "sql_left_join_deep", False),
                    ("LEFT JOIN ile Eşleşmeyen Kayıtları Bulma (WHERE r.id IS NULL)", "Siparişi olmayan kullanıcıları tespit etme", "sql_left_join_null_filter", False),
                    ("Çoklu JOIN Zincirleri: 3 veya Daha Fazla Tabloyu Bağlama", "Kullanıcı -> Sipariş -> Ürün zincir sorguları", "sql_multi_table_joins", False),
                    ("6. Ünite JOIN & Tablo Birleştirme Sınavı", "İlişkiler ve JOIN temelleri sınavı", "sql_u6_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_7", "unitNumber": 7, "title": "İleri JOIN Türleri (RIGHT JOIN, FULL OUTER JOIN, Self Join)", "category": "JOIN & İlişkiler", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "İleri JOIN Hile Kağıdı",
                "cheatSheetContent": "SELECT e.name, m.name AS manager\nFROM employees e\nLEFT JOIN employees m ON e.manager_id = m.id\nCROSS JOIN calendar;",
                "lessons": [
                    ("RIGHT JOIN (RIGHT OUTER JOIN) Kullanımı", "Sağ tablo odaklı birleştirme ve LEFT JOIN denkliği", "sql_right_join_usage", False),
                    ("FULL OUTER JOIN ile Kümelerin Birleşimi", "Her iki tablodaki tüm satırları eşleşmese de getirme", "sql_full_outer_join", False),
                    ("Self Join: Tablonun Kendisiyle Birleştirilmesi", "Yönetici-Çalışan hiyerarşisi sorgulama", "sql_self_join_hierarchy", False),
                    ("CROSS JOIN & Kartezyen Çarpım (Cartesian Product)", "Tablo satırlarının tüm permütasyonları", "sql_cross_join_cartesian", False),
                    ("Alt Sorgular (Subqueries): WHERE IN (SELECT ...)", "Sorgu içinde dinamik sorgu çalıştırma", "sql_subqueries_in_where", False),
                    ("Korelasyonlu Alt Sorgular (Correlated Subqueries)", "Dış sorgunun satırına bağımlı alt sorgu", "sql_correlated_subqueries", False),
                    ("EXISTS ve NOT EXISTS ile Performanslı Varlık Kontrolü", "IN yerine EXISTS kullanarak indeks gücünden yararlanma", "sql_exists_vs_in", False),
                    ("7. Ünite İleri JOIN & Alt Sorgular Sınavı", "Kompleks birleştirmeler ve alt sorgular sınavı", "sql_u7_mega_exam", True),
                ]
            },
            {
                "id": "sql_unit_8", "unitNumber": 8, "title": "İleri Mimari: B-Tree İndeksler, Transactions (ACID), Normalizasyon", "category": "İndeksler & ACID", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "SQL İleri Mimari Hile Kağıdı",
                "cheatSheetContent": "CREATE INDEX idx_email ON users(email);\nBEGIN TRANSACTION;\nCOMMIT; -- veya ROLLBACK;",
                "lessons": [
                    ("İndeksleme (Indexing) Mimarisi: B-Tree Nasıl Çalışır?", "O(N) Full Table Scan'den O(log N) aramaya geçiş", "sql_btree_indexes_internals", False),
                    ("Clustered vs Non-Clustered İndeks Farkları", "Fiziksel depolama sırası ve yaprak düğümler", "sql_clustered_vs_nonclustered", False),
                    ("Kompozit (Bileşik) İndeksler & Sol Kuralı (Leftmost Prefix)", "Birden çok sütunu indeksleme sırasının önemi", "sql_composite_indexes_leftmost", False),
                    ("Transactions (İşlemler) & ACID Prensipleri", "Atomicity, Consistency, Isolation, Durability", "sql_acid_transactions_core", False),
                    ("COMMIT ve ROLLBACK ile Finansal Güvenlik", "Hata anında işlemi geri sarma (rollback)", "sql_commit_rollback_flow", False),
                    ("Veritabanı İzolasyon Seviyeleri & Kilitlenme (Deadlock)", "Dirty Read, Phantom Read ve Serializable seviyeleri", "sql_isolation_levels_deadlocks", False),
                    ("Veritabanı Normalizasyonu: 1NF, 2NF, 3NF Kuralları", "Veri tekrarını ve güncelleme anomalilerini önleme", "sql_normalization_normal_forms", False),
                    ("8. Ünite SQL Ustalık & Kıdemli Veri Mimarı Sınavı", "Kapsamlı SQL ve veritabanı mimarisi sınavı", "sql_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 10. ALGORITMALAR & VERI YAPILARI
    "algorithms": {
        "file": "algorithms_curriculum.dart",
        "var_name": "algorithmsUnits",
        "lang_enum": "CodeLanguage.algorithms",
        "units": [
            {
                "id": "algo_unit_1", "unitNumber": 1, "title": "Algoritma Analizi, Big-O Zaman & Alan Karmaşıklığı", "category": "Big-O & Karmaşıklık", "colorHex": "0xFFA855F7",
                "cheatSheetTitle": "Big-O Temelleri Hile Kağıdı",
                "cheatSheetContent": "O(1) < O(log n) < O(n) < O(n log n) < O(n^2)\nTime Complexity: Islem adimi\nSpace Complexity: Ekstra bellek",
                "lessons": [
                    ("Algoritma Nedir & Neden Verimlilik Önemlidir?", "Bilgisayar bilimlerinde hız ve kaynak optimizasyonu", "algo_intro_efficiency", False),
                    ("Big-O Gösterimi Mimarisi: Asimptotik Analiz", "Girdi boyutu (n) sonsuza giderken büyüme hızı", "algo_big_o_notation", False),
                    ("Zaman Karmaşıklığı (Time Complexity) Hesaplama", "Kod bloklarındaki temel işlem adımlarını sayma", "algo_time_complexity_calc", False),
                    ("Alan Karmaşıklığı (Space Complexity) Hesaplama", "Algoritmanın tükettiği ekstra yardımcı bellek", "algo_space_complexity_calc", False),
                    ("Sabitleri ve Düşük Dereceli Terimleri Atma Kuralı", "O(2n + 5) neden O(n) olarak sadeleştirilir?", "algo_simplifying_big_o", False),
                    ("En İyi (Best), Ortalama (Average) ve En Kötü (Worst-Case)", "Big-Omega (Ω), Big-Theta (Θ) ve Big-O (O) ayrımları", "algo_best_avg_worst_cases", False),
                    ("Bellek Hiyerarşisi & CPU Cache (L1/L2/L3) Dostu Kod", "Dizilerin önbellek uyumluluğunun önemi", "algo_cpu_cache_locality", False),
                    ("1. Ünite Karmaşıklık Analizi & Big-O Sınavı", "Big-O hesaplama ve analiz sınavı", "algo_u1_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_2", "unitNumber": 2, "title": "O(1), O(log n), O(n), O(n log n) ve O(n^2) Büyüme Hızları", "category": "Big-O & Karmaşıklık", "colorHex": "0xFF9333EA",
                "cheatSheetTitle": "Big-O Karşılaştırma Hile Kağıdı",
                "cheatSheetContent": "O(1): Hash lookup\nO(log n): Binary search\nO(n): Single loop\nO(n^2): Nested loops",
                "lessons": [
                    ("O(1) Sabit Zaman (Constant Time): Her Boyutta Aynı Hız", "Dizi indeksiyle okuma ve hash lookup", "algo_o1_constant_time", False),
                    ("O(log n) Logaritmik Zaman: İkiye Bölerek Arama", "Arama uzayını her adımda yarıya düşürme", "algo_ologn_logarithmic", False),
                    ("O(n) Doğrusal Zaman (Linear Time): Tek Döngü", "Girdi boyutuyla doğru orantılı işlem süresi", "algo_on_linear_time", False),
                    ("O(n log n) Doğrusal Logaritmik Zaman: Verimli Sıralama", "Merge Sort ve Quick Sort'un altın standardı", "algo_onlogn_efficient_sorting", False),
                    ("O(n^2) Karesel Zaman (Quadratic Time): İç İçe Döngüler", "Büyük verilerde kilitlenmeye yol açan darboğazlar", "algo_on2_quadratic_bottlenecks", False),
                    ("O(2^n) Üstel ve O(n!) Faktöriyel Zaman Felaketleri", "Kaba kuvvet (Brute Force) algoritmalarının sınırları", "algo_exponential_factorial_disasters", False),
                    ("Zaman-Alan Takası (Time-Space Tradeoff)", "Bellek harcayarak işlem süresini kısaltma sanatı", "algo_time_space_tradeoff", False),
                    ("2. Ünite Büyüme Hızları & Karşılaştırma Sınavı", "Karmaşıklık sınıfları karşılaştırma sınavı", "algo_u2_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_3", "unitNumber": 3, "title": "Doğrusal Veri Yapıları: Diziler (Arrays) & Bellek Düzeni", "category": "Doğrusal Yapılar (Stack/Queue)", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "Dizi & Bellek Hile Kağıdı",
                "cheatSheetContent": "Array: Adres = Base + Index * Size\nO(1) Access, O(n) Search, O(n) Insert",
                "lessons": [
                    ("Dizi (Array) Mimarisi & Bitişik (Contiguous) Bellek", "RAM üzerinde yan yana tahsis ve matematiksel adresleme", "algo_arrays_contiguous_memory", False),
                    ("Dizilerde O(1) Rastgele Erişim (Random Access) Formülü", "Base_Address + (Index * Element_Size) ispatı", "algo_array_random_access_math", False),
                    ("Dinamik Diziler (Dynamic Arrays) Nasıl Büyür?", "Kapasite dolunca yeni dizi açıp ikiye katlama maliyeti", "algo_dynamic_arrays_amortized", False),
                    ("Amortized O(1) Zaman Kavramı", "Nadir gerçekleşen kopyalamanın ortalama maliyeti", "algo_amortized_analysis", False),
                    ("Diziye Eleman Ekleme ve Silme Maliyetleri", "Elemanları sağa/sola kaydırma (shifting) O(n) yükü", "algo_array_insert_delete_shift", False),
                    ("İki Boyutlu Diziler (2D Arrays / Matrices)", "Row-Major vs Column-Major bellek yerleşimi", "algo_matrices_row_column_major", False),
                    ("Prefix Sum (Ön Ek Toplamı) Algoritmik Deseni", "Aralık toplamı sorgularını O(1)'e düşürme", "algo_prefix_sum_pattern", False),
                    ("3. Ünite Diziler & Bellek Düzeni Sınavı", "Dizi veri yapısı sınavı", "algo_u3_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_4", "unitNumber": 4, "title": "Bağlı Listeler (Singly & Doubly Linked Lists)", "category": "Doğrusal Yapılar (Stack/Queue)", "colorHex": "0xFFDB2777",
                "cheatSheetTitle": "Bağlı Liste Hile Kağıdı",
                "cheatSheetContent": "Node: val, next\nDoubly: prev, val, next\nO(1) Head Insert, O(n) Access",
                "lessons": [
                    ("Bağlı Liste (Linked List) Felsefesi: Düğümler & İşaretçiler", "Dağınık bellekte zincirleme referanslar", "algo_linked_list_nodes", False),
                    ("Tek Yönlü Bağlı Liste (Singly Linked List) Mimarisi", "Head işaretçisi, next adresi ve null sonlandırma", "algo_singly_linked_list", False),
                    ("Başa Eleman Ekleme: O(1) Head Insertion", "Dizilere kıyasla kaydırma yapmadan anında ekleme", "algo_ll_head_insertion", False),
                    ("Araya ve Sona Eleman Ekleme/Silme", "İşaretçileri yeniden yönlendirme operasyonları", "algo_ll_pointer_rewiring", False),
                    ("İki Yönlü Bağlı Liste (Doubly Linked List)", "prev ve next işaretçileriyle ileri-geri gezinme", "algo_doubly_linked_list", False),
                    ("Dairesel Bağlı Liste (Circular Linked List)", "Son düğümün tekrar başa dönmesi ve tur yönetimi", "algo_circular_linked_list", False),
                    ("Dizi vs Bağlı Liste: Ne Zaman Hangisi Tercih Edilir?", "Önbellek uyumluluğu vs dinamik ekleme hızı", "algo_array_vs_ll_comparison", False),
                    ("4. Ünite Bağlı Listeler Sınavı", "Bağlı liste işlemleri ve işaretçi yönetimi sınavı", "algo_u4_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_5", "unitNumber": 5, "title": "Yığınlar (Stacks - LIFO) & Kuyruklar (Queues - FIFO)", "category": "Doğrusal Yapılar (Stack/Queue)", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Stack & Queue Hile Kağıdı",
                "cheatSheetContent": "Stack: Push, Pop, Peek (LIFO)\nQueue: Enqueue, Dequeue (FIFO)\nDeque: Cift uclu kuyruk",
                "lessons": [
                    ("Yığın (Stack) Veri Yapısı: LIFO Prensibi", "Son giren ilk çıkar kuralı ve push/pop/peek", "algo_stack_lifo_core", False),
                    ("Çağrı Yığını (Call Stack) & Rekürsiyon Mantığı", "Fonksiyonların geri dönüş adreslerini saklama", "algo_call_stack_recursion", False),
                    ("Parantez Eşleştirme Algoritması (Balanced Parentheses)", "Mülakatların klasik stack sorusu çözümü", "algo_balanced_parentheses_stack", False),
                    ("Kuyruk (Queue) Veri Yapısı: FIFO Prensibi", "İlk giren ilk çıkar mantığı ve enqueue/dequeue", "algo_queue_fifo_core", False),
                    ("Dairesel Kuyruk (Circular Queue) Mimarisi", "Dizi tabanlı kuyruklarda bellek israfını önleme", "algo_circular_queue_modulo", False),
                    ("İki Uçlu Kuyruk (Deque - Double-Ended Queue)", "Her iki uçtan O(1) ekleme ve çıkarma yapabilme", "algo_deque_double_ended", False),
                    ("Öncelikli Kuyruk (Priority Queue) Temelleri", "Önem derecesine göre elemanları öne alma", "algo_priority_queue_intro", False),
                    ("5. Ünite Stacks & Queues Sınavı", "Yığın ve kuyruk algoritmaları sınavı", "algo_u5_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_6", "unitNumber": 6, "title": "Hash Tabloları, Hashing & Çarpışma (Collision) Çözümü", "category": "Ağaçlar & BST", "colorHex": "0xFFEA580C",
                "cheatSheetTitle": "Hash Tablosu Hile Kağıdı",
                "cheatSheetContent": "Hash(Key) -> Index\nO(1) Avg Lookup, O(n) Worst Collision\nChaining vs Open Addressing",
                "lessons": [
                    ("Hash Tablosu (Hash Table) Nedir?", "Anahtar-değer eşleşmesini O(1) sürede arama gücü", "algo_hash_table_concept", False),
                    ("Hash Fonksiyonları (Hash Functions) Nasıl Çalışır?", "Herhangi bir metni sabit uzunlukta dizi indeksine eşleme", "algo_hash_functions_math", False),
                    ("Çarpışma (Collision) Nedir & Neden Kaçınılmazdır?", "Doğum günü paradoksu ve güvercin yuvası ilkesi", "algo_hash_collisions_causes", False),
                    ("Ayrı Zincirleme (Separate Chaining) Çözümü", "Aynı hash'e düşen kayıtları bağlı listede tutma", "algo_separate_chaining_ll", False),
                    ("Açık Adresleme (Open Addressing): Linear Probing", "Çarpışma olunca bir sonraki boş hücreyi arama", "algo_linear_probing_open", False),
                    ("Yük Faktörü (Load Factor) & Yeniden Hashleme (Rehashing)", "Tablo %75 dolunca kapasiteyi ikiye katlama", "algo_load_factor_rehashing", False),
                    ("Hash Saldırıları (Hash DoS) ve Güvenlik", "Kasıtlı çarpışmalarla O(N) saldırılarını engelleme", "algo_hash_dos_security", False),
                    ("6. Ünite Hash Tabloları & Çarpışma Sınavı", "Hash algoritmaları ve bellek sınavı", "algo_u6_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_7", "unitNumber": 7, "title": "İkili Arama Ağaçları (BST) & Ağaç Dolaşma (Inorder/Pre/Post)", "category": "Ağaçlar & BST", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Ağaç & BST Hile Kağıdı",
                "cheatSheetContent": "Sol Alt Ağaç < Kök < Sağ Alt Ağaç\nInorder: Sol -> Kök -> Sağ (Sirali)\nO(log n) Avg, O(n) Skewed",
                "lessons": [
                    ("Ağaç (Tree) Mimarisi: Kök, Düğümler, Yapraklar ve Derinlik", "Hiyerarşik veri modelleri", "algo_tree_terminology", False),
                    ("İkili Ağaç (Binary Tree) vs İkili Arama Ağacı (BST)", "Sol küçük, sağ büyük kuralı", "algo_bst_property_rules", False),
                    ("BST Üzerinde Arama (Search) & O(log n) Hızı", "Her adımda ağacın yarısını eleyerek bulma", "algo_bst_search_ologn", False),
                    ("BST Eleman Ekleme (Insert) ve Silme (Delete) Mantığı", "İki çocuklu düğümü silerken Inorder Successor seçimi", "algo_bst_insert_delete", False),
                    ("Ağaç Dolaşma: Inorder (İçten Dolaşma - Sıralı Çıktı)", "Sol -> Kök -> Sağ kuralı ile küçükten büyüğe sıralama", "algo_inorder_traversal_sorted", False),
                    ("Ağaç Dolaşma: Preorder ve Postorder", "Klonlama ve silme işlemlerinde dolaşma sıraları", "algo_preorder_postorder_traversals", False),
                    ("Dengesiz Ağaç Sorunu & Dengeli Ağaçlara Giriş (AVL / Red-Black)", "Ağacın bağlı listeye dönüşüp O(n) olma riski", "algo_balanced_trees_avl_rb", False),
                    ("7. Ünite Ağaçlar & BST Sınavı", "İkili arama ağaçları ve dolaşma sınavı", "algo_u7_mega_exam", True),
                ]
            },
            {
                "id": "algo_unit_8", "unitNumber": 8, "title": "Sıralama & Arama (Binary Search, Merge Sort, Quick Sort, BFS/DFS, DP)", "category": "Sıralama & Arama", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "Sıralama & Grafik Hile Kağıdı",
                "cheatSheetContent": "Binary Search: O(log n)\nMerge Sort: O(n log n) stable\nQuick Sort: O(n log n) avg\nBFS: Queue, DFS: Stack",
                "lessons": [
                    ("İkili Arama (Binary Search): O(log n) Mülakat Klasiği", "Sıralı dizide iki işaretçi (low, high) algoritması", "algo_binary_search_mastery", False),
                    ("Merge Sort (Birleştirmeli Sıralama): Garantili O(n log n)", "Böl ve yönet (Divide & Conquer) mimarisi", "algo_merge_sort_deep", False),
                    ("Quick Sort (Hızlı Sıralama) & Pivot Seçim Stratejileri", "In-place bölme (partitioning) ve worst-case O(n^2)", "algo_quick_sort_deep", False),
                    ("Sıralama Algoritmalarında Kararlılık (Stability)", "Eşit anahtarlı kayıtların sırasını koruma", "algo_sorting_stability", False),
                    ("Grafik Gezinmesi: BFS (Breadth-First Search) & Kuyruk", "En kısa yolu bulmak için katman katman arama", "algo_bfs_shortest_path", False),
                    ("Grafik Gezinmesi: DFS (Depth-First Search) & Rekürsiyon", "Tüm alternatifleri geri dönerek (backtracking) deneme", "algo_dfs_backtracking", False),
                    ("Dinamik Programlama (DP): Memoization & Tabulation", "Örtüşen alt problemleri hafızaya alıp tek sefer çözme", "algo_dp_memoization_tabulation", False),
                    ("8. Ünite Algoritmalar & Mülakat Soruları Ustalık Sınavı", "Kapsamlı algoritma mühendisliği sınavı", "algo_u8_mega_exam", True),
                ]
            }
        ]
    }
}

print("Part 4 Specs loaded.")
