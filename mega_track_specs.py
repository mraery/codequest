# -*- coding: utf-8 -*-
"""
Full Technical Specifications for All 10 Tracks (8 Units x 8 Lessons each)
"""

TRACKS_DATA = {
    # 1. GIT
    "git": {
        "file": "git_curriculum.dart",
        "var_name": "gitUnits",
        "lang_enum": "CodeLanguage.git",
        "units": [
            {
                "id": "git_unit_1", "unitNumber": 1, "title": "Git Temelleri & Versiyon Kontrol Felsefesi", "category": "Temeller", "colorHex": "0xFFF05032",
                "cheatSheetTitle": "Git Temelleri Hile Kağıdı",
                "cheatSheetContent": "git init\ngit config --global user.name 'Dev'\ngit config --global user.email 'dev@code.com'\ngit status -s\ngit add .",
                "lessons": [
                    ("Versiyon Kontrol Nedir & Neden Dağıtık?", "Merkezi vs Dağıtık (Git) mimarisi farkları", "git_vcs_intro", False),
                    ("git init & .git Gizli Klasör Mimarisi", "Depo veritabanının diskteki yapısı", "git_init_internals", False),
                    ("git config ile Kimlik & Editör Ayarları", "user.name, user.email ve core.editor", "git_config_identity", False),
                    ("Git'in 3 Temel Ağacı (Trees)", "Working Directory, Staging Area ve Repository", "git_three_trees_depth", False),
                    ("Dosya Yaşam Döngüsü (Untracked, Modified, Staged)", "Dosya durum geçişleri ve yaşam döngüsü", "git_file_lifecycle", False),
                    ("git status & Kısa Özet Formatı (-s)", "Terminalde dosya durumlarını hızlı okuma", "git_status_flags", False),
                    ("git add Mantığı & Sahnelemeye Giriş", "Değişiklikleri seçici olarak sahneye alma", "git_add_staging", False),
                    ("1. Ünite Git Temelleri Ustalık Sınavı", "Temel Git kavramları değerlendirme sınavı", "git_u1_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_2", "unitNumber": 2, "title": "Dosya İnceleme, Farklar & Yok Sayma (.gitignore)", "category": "İnceleme & Diff", "colorHex": "0xFFF97316",
                "cheatSheetTitle": "Git Diff & Gitignore Hile Kağıdı",
                "cheatSheetContent": "git diff\ngit diff --staged\ngit diff HEAD~1\ngit rm --cached <file>\ngit commit -m 'feat: yeni ozellik'",
                "lessons": [
                    ("git diff ile Çalışma Ağacı Farkları", "Sahnelenmemiş satır satır kod farklarını okuma", "git_diff_working", False),
                    ("git diff --staged ile Sahne Farkları", "Bir sonraki committe kaydedilecekleri denetleme", "git_diff_staged", False),
                    ("İki Commit Arasındaki Farkları Kıyaslama", "git diff hash1..hash2 ve log kıyaslamaları", "git_diff_commits", False),
                    (".gitignore Sözdizimi & Wildcard Desenleri", "*.log, node_modules/, !important.txt kuralları", "git_gitignore_syntax", False),
                    ("Zaten Commit Edilmiş Dosyaları Hariç Tutma", "git rm --cached ile takip listesinden çıkarma", "git_rm_cached", False),
                    ("Atomik Commit Prensibi & Conventional Commits", "feat:, fix:, chore:, refactor: mesaj standartları", "git_conventional_commits", False),
                    ("git commit --amend ile Son Commiti Düzeltme", "Unutulan dosyaları veya mesajı son commite ekleme", "git_commit_amend", False),
                    ("2. Ünite Değişiklik İnceleme & Diff Sınavı", "Diff, gitignore ve commit standartları sınavı", "git_u2_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_3", "unitNumber": 3, "title": "Dallanma (Branching) & HEAD İşaretçisi", "category": "Dallanma & Branch", "colorHex": "0xFFEA580C",
                "cheatSheetTitle": "Git Branching Hile Kağıdı",
                "cheatSheetContent": "git branch\ngit branch feature-auth\ngit switch feature-auth\ngit switch -c feature-cart\ngit branch -d feature-done",
                "lessons": [
                    ("Git'te Branch Nedir? (Pointer Mantığı)", "Dalların hafif (41 baytlık) işaretçi yapısı", "git_branch_pointer", False),
                    ("git branch ile Listeleme & Filtreleme", "Lokal ve uzak dalları terminalde inceleme", "git_branch_listing", False),
                    ("HEAD İşaretçisi & Detached HEAD Durumu", "HEAD nedir ve ne zaman daldan kopar?", "git_head_detached", False),
                    ("Eski git checkout vs Modern git switch", "Git 2.23+ ile gelen net görev ayrımı", "git_switch_vs_checkout", False),
                    ("git switch -c ile Anında Dal Açıp Geçiş", "Yeni geliştirme dalına hızlı geçiş akışı", "git_switch_create", False),
                    ("Güvenli Dal Silme: git branch -d", "Merge edilmiş dalları temizleme kuralları", "git_branch_safe_delete", False),
                    ("Zorla Dal Silme: git branch -D", "Merge edilmemiş dalları kalıcı temizleme", "git_branch_force_delete", False),
                    ("3. Ünite Kapsamlı Branching Sınavı", "Dallanma ve HEAD yönetimi sınavı", "git_u3_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_4", "unitNumber": 4, "title": "Birleştirme (Merge) & Çakışma (Conflict) Çözümü", "category": "Birleştirme & Merge", "colorHex": "0xFFC2410C",
                "cheatSheetTitle": "Git Merge Hile Kağıdı",
                "cheatSheetContent": "git merge feature\ngit merge --no-ff feature\ngit merge --abort\n<<<<<<< HEAD\n=======\n>>>>>>> feature",
                "lessons": [
                    ("Fast-Forward Merge Nedir?", "Tarihçenin doğrudan ileri kaydırılması", "git_fast_forward", False),
                    ("3-Way Merge & Merge Commit Mantığı", "Ortak ata (common ancestor) ile üç yollu birleşim", "git_three_way_merge", False),
                    ("--no-ff Bayrağı ile Dal Tarihçesini Koruma", "Özellik dalı bütünlüğünü merge commit ile belgeleme", "git_no_ff_flag", False),
                    ("Merge Conflict (Çakışma) Neden Çıkar?", "Aynı satırların farklı dallarda değişmesi", "git_conflict_causes", False),
                    ("Çakışma Etiketlerini Okuma (<<<<<<< HEAD)", "Gelen ve mevcut değişiklikleri ayırt etme", "git_conflict_markers", False),
                    ("Çakışmaları Manuel Çözme & Birleştirme", "Kodu düzenleme, add ve commit adımları", "git_conflict_resolution", False),
                    ("Birleştirmeyi İptal Etme (git merge --abort)", "Tıkanan birleştirmeyi güvenle geri alma", "git_merge_abort", False),
                    ("4. Ünite Merge & Çakışma Ustalık Sınavı", "Birleştirme stratejileri ve çakışma çözümü sınavı", "git_u4_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_5", "unitNumber": 5, "title": "Uzak Depolar (Remotes), GitHub & GitLab", "category": "Uzak Depo & GitHub", "colorHex": "0xFF9A3412",
                "cheatSheetTitle": "Git Remotes Hile Kağıdı",
                "cheatSheetContent": "git remote -v\ngit remote add origin <url>\ngit fetch origin\ngit pull origin main\ngit push -u origin main\ngit push origin --delete <branch>",
                "lessons": [
                    ("Uzak Depo (Remote) Mantığı & origin", "Uzak sunucu adresleri ve protokoller (HTTPS, SSH)", "git_remote_intro", False),
                    ("git remote -v & remote Ekleme/Kaldırma", "Uzak depo adreslerini yönetme komutları", "git_remote_management", False),
                    ("git fetch vs git pull Arasındaki Hayati Fark", "Sadece indirme vs indirme + otomatik birleştirme", "git_fetch_pull_diff", False),
                    ("git push ve -u (--set-upstream) Parametresi", "Lokal dalı uzak dala bağlama ve takip", "git_push_upstream_deep", False),
                    ("Uzak Depodaki Dalı Silme", "git push origin --delete <dal> kullanımı", "git_remote_branch_delete", False),
                    ("git fetch --prune ile Ölü Dalları Temizleme", "Silinmiş uzak referansları temizleme", "git_fetch_prune", False),
                    ("Pull Request (PR) & Code Review Kültürü", "GitHub üzerinde profesyonel inceleme adımları", "git_pull_requests", False),
                    ("5. Ünite Uzak Depolar & GitHub Sınavı", "Ekip çalışması ve uzak depo yönetimi sınavı", "git_u5_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_6", "unitNumber": 6, "title": "Zaman Yolculuğu: Rebase, Cherry-Pick & Reset", "category": "Rebase & Reset", "colorHex": "0xFF7C2D12",
                "cheatSheetTitle": "Git Rebase & Reset Hile Kağıdı",
                "cheatSheetContent": "git rebase main\ngit rebase -i HEAD~3\ngit cherry-pick <hash>\ngit reset --soft HEAD~1\ngit reset --mixed HEAD~1\ngit reset --hard HEAD~1",
                "lessons": [
                    ("git rebase Mantığı & Düzlemsel Tarihçe", "Mevcut dalın tabanını hedef dalın ucuna taşıma", "git_rebase_core", False),
                    ("Rebase'in Altın Kuralı (Public Branch Tabusu)", "Neden main dalında asla rebase yapılmaz?", "git_rebase_golden_rule", False),
                    ("İnteraktif Rebase: git rebase -i HEAD~N", "Commitleri düzenleme, yeniden sıralama ve ezme", "git_interactive_rebase_deep", False),
                    ("squash & fixup ile Temiz PR Hazırlama", "Ufak 'wip' commitlerini tekilleştirme sanatı", "git_squash_fixup", False),
                    ("git cherry-pick ile Seçici Commit Alma", "Başka daldan tek bir düzeltmeyi mevcut dala alma", "git_cherry_pick_deep", False),
                    ("git reset --soft: Sadece Commiti Geri Alma", "Değişiklikleri Staging Area'da tutarak geri alma", "git_reset_soft", False),
                    ("git reset --mixed & --hard Ayrımı", "Varsayılan mod vs kalıcı silme tehlikesi", "git_reset_mixed_hard", False),
                    ("6. Ünite Rebase, Reset & Zaman Yolculuğu Sınavı", "Gelişmiş tarihçe manipülasyonu sınavı", "git_u6_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_7", "unitNumber": 7, "title": "Acil Durum Kurtarma: Stash, Reflog & Revert", "category": "Kurtarma & Reflog", "colorHex": "0xFFB45309",
                "cheatSheetTitle": "Git Kurtarma Hile Kağıdı",
                "cheatSheetContent": "git stash\ngit stash pop\ngit stash list\ngit revert <hash>\ngit reflog\ngit clean -fd",
                "lessons": [
                    ("git stash: Yarım Kalan İşi Rafa Kaldırma", "Temiz çalışma dizinine anında dönüş", "git_stash_basics", False),
                    ("git stash pop, apply, list & drop", "Saklanan değişiklikleri geri yükleme ve silme", "git_stash_management", False),
                    ("İzlenmeyen Dosyaları da Saklama (git stash -u)", "Yeni açılmış dosyaları da rafa kaldırma", "git_stash_untracked", False),
                    ("git revert ile Güvenli ve İz Bırakan Geri Alma", "Ters commit oluşturarak hataları düzeltme", "git_revert_deep", False),
                    ("git reflog: Git'in Güvenlik Ağı", "HEAD işaretçisinin tüm hareket günlüğü", "git_reflog_deep", False),
                    ("Hard Reset ile Silinen Commiti Kurtarma", "Reflog hash'i ile kayıp veriyi geri getirme", "git_reflog_recovery", False),
                    ("git clean -fd ile Artık Dosyaları Temizleme", "Derleme kalıntılarını ve gereksiz dosyaları silme", "git_clean_fd", False),
                    ("7. Ünite Acil Durum & Kurtarma Sınavı", "Reflog, stash ve revert uzmanlığı sınavı", "git_u7_mega_exam", True),
                ]
            },
            {
                "id": "git_unit_8", "unitNumber": 8, "title": "Git İç Mimarisi, Tagler, Bisect & Hooks", "category": "İleri Seviye & Mimarisi", "colorHex": "0xFF92400E",
                "cheatSheetTitle": "Git İleri Mimari Hile Kağıdı",
                "cheatSheetContent": "git tag -a v1.0.0 -m 'v1.0.0'\ngit bisect start\ngit bisect bad\ngit bisect good <hash>\n.git/hooks/pre-commit",
                "lessons": [
                    ("Git Nesneleri: Blob, Tree, Commit & Tag", "Git'in içerik adreslenebilir nesne veritabanı", "git_objects_architecture", False),
                    ("SHA Hashleme & İçerik Adresleme Felsefesi", "Dosya içeriğinin hash ile temsil edilmesi", "git_sha_content_addressing", False),
                    ("Lightweight vs Annotated Tagler", "Sürümleri kalıcı etiketleme ve sürüm notları", "git_tags_annotated", False),
                    ("SemVer (Anlamsal Sürümleme) & Release", "MAJOR.MINOR.PATCH kuralları ve git tag", "git_semver_releases", False),
                    ("git bisect ile İkili Arama Hata Avcılığı", "Bozuk commiti dakikalar içinde tespit etme", "git_bisect_debugging", False),
                    ("Git Hooks ile pre-commit & Otomasyon", "Commit öncesi test ve linter çalıştırma", "git_hooks_architecture", False),
                    ("Git Submodules ile Bağımlılık Yönetimi", "Proje içine başka Git depolarını bağlama", "git_submodules_advanced", False),
                    ("8. Ünite Git Ustalık & Kıdemli Mimar Sınavı", "Kapsamlı Git ekosistem değerlendirmesi", "git_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 2. GODOT
    "godot": {
        "file": "godot_curriculum.dart",
        "var_name": "godotUnits",
        "lang_enum": "CodeLanguage.godot",
        "units": [
            {
                "id": "godot_unit_1", "unitNumber": 1, "title": "Godot 4 Mimarisi & Düğüm/Sahne Ağacı", "category": "Temeller & Düğümler", "colorHex": "0xFF478CBF",
                "cheatSheetTitle": "Godot Düğüm Mimarisi Hile Kağıdı",
                "cheatSheetContent": "$Sprite2D\nget_node('Sprite2D')\nget_tree().change_scene_to_file('res://Game.tscn')",
                "lessons": [
                    ("Godot 4 Felsefesi: Her Şey Bir Node'dur", "Düğüm temelli motor felsefesi", "godot_nodes_philosophy", False),
                    ("Sahne (Scene) & Sahne Ağacı (SceneTree)", "Sahneleri modüler birleştirme", "godot_scenes_tree_deep", False),
                    ("Düğüm Hiyerarşisi ($Node & get_node)", "Ağaç üzerinde gezinme ve erişim", "godot_node_hierarchy", False),
                    ("Sahne Örnekleme (Instantiation)", "Mermileri ve düşmanları kodla üretme", "godot_instancing_scenes", False),
                    ("Sahne Mirası (Inheritance)", "Temel düşmandan yeni tipler türetme", "godot_scene_inheritance", False),
                    ("Proje Ayarları & 2D Koordinat Sistemi", "Pencere modu ve çözünürlük", "godot_project_coords", False),
                    ("Node Yaşam Döngüsü: _enter_tree & _ready", "Düğümlerin sahneye giriş sıralaması", "godot_node_lifecycle", False),
                    ("1. Ünite Godot Düğüm Mimarisi Sınavı", "Düğümler ve sahneler sınavı", "godot_u1_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_2", "unitNumber": 2, "title": "GDScript 2.0 Syntax, Tipler & Fonksiyonlar", "category": "GDScript 2.0", "colorHex": "0xFF3B82F6",
                "cheatSheetTitle": "GDScript 2.0 Hile Kağıdı",
                "cheatSheetContent": "var speed: float = 300.0\nconst MAX_HP: int = 100\nfunc calc(damage: float) -> void: pass",
                "lessons": [
                    ("GDScript 2.0 Nedir & Neden Python Benzeri?", "Oyun motoru için optimize dil mimarisi", "godot_gdscript_intro", False),
                    ("Değişkenler (var), Sabitler (const) & Tipleme", "Statik tipleme (float, int, Vector2)", "godot_static_typing", False),
                    ("Aritmetik ve Vektör İşlemleri (Vector2/3)", "Vektör toplama ve normalizasyon", "godot_vectors_math", False),
                    ("Fonksiyon Tanımlama & Dönüş Tipleri", "Tip güvenli fonksiyon yapıları", "godot_functions_typing", False),
                    ("Lambdalar & Callable Nesneleri", "Anonim metotlar ve callables", "godot_callables_lambdas", False),
                    ("Koşullar ve Mantıksal Karar Yapıları", "Oyun mantığında karar kontrolleri", "godot_if_conditions", False),
                    ("Döngüler (for, while) ve Dizi İterasyonu", "Diziler ve sözlükler üzerinde döngü", "godot_loops_collections", False),
                    ("2. Ünite GDScript 2.0 Syntax Sınavı", "GDScript dil temelleri sınavı", "godot_u2_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_3", "unitNumber": 3, "title": "@export, @onready, Enums & Match İfadesi", "category": "GDScript 2.0", "colorHex": "0xFF2563EB",
                "cheatSheetTitle": "GDScript İleri Sözdizimi Hile Kağıdı",
                "cheatSheetContent": "@export var speed: float = 200.0\n@onready var sprite = $Sprite2D\nenum State { IDLE, RUN }\nmatch state:\n    State.IDLE: pass",
                "lessons": [
                    ("@export Annotasyonu ile Inspector Entegrasyonu", "Değişkenleri editör paneline açma", "godot_export_annotation", False),
                    ("@export_range, @export_file & Özel Tipler", "Inspector üzerinde slider ve seçiciler", "godot_export_types", False),
                    ("@onready Direktifi & Hazır Düğüm Referansları", "Sahne yüklendiğinde düğüm yakalama", "godot_onready_directive", False),
                    ("Enums (Numaralandırmalar) ile Durum Tanımlama", "Okunabilir sabitler ve enum yapıları", "godot_enums_states", False),
                    ("match İfadesi ile Durum Makineleri (FSM)", "Pattern matching ile durum yönetimi", "godot_match_fsm", False),
                    ("Diziler ve Sözlükler Derinlemesine", "Envanter ve veri saklama yapıları", "godot_arrays_dicts", False),
                    ("String Biçimlendirme & Çok Satırlı Metinler", "Metin birleştirme ve format belirteçleri", "godot_strings_formatting", False),
                    ("3. Ünite GDScript İleri Sözdizimi Sınavı", "Export, match ve enum sınavı", "godot_u3_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_4", "unitNumber": 4, "title": "2D Fizik, CharacterBody2D & move_and_slide()", "category": "Fizik & Hareket", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "Godot 2D Fizik Hile Kağıdı",
                "cheatSheetContent": "velocity.y += gravity * delta\nmove_and_slide()\nis_on_floor()",
                "lessons": [
                    ("_physics_process(delta) & Sabit Kare Hızı", "Fizik adımları ve delta çarpanı", "godot_physics_process_deep", False),
                    ("CharacterBody2D Mimarisi & velocity Özelliği", "Godot 4 ile karakter kontrolü", "godot_characterbody_core", False),
                    ("move_and_slide() ile Çarpışmalı Hareket", "Parametresiz hareket ve zemin tepkisi", "godot_move_and_slide", False),
                    ("is_on_floor(), is_on_wall() Kontrolleri", "Zemin ve duvar temaslarını denetleme", "godot_ground_checks", False),
                    ("Yerçekimi Hesaplama ve Zıplama Mekaniği", "Dikey ivmelenme ve zıplama", "godot_gravity_jump", False),
                    ("Yatay Hareket & Input.get_axis() Kullanımı", "Klavye ve joystick eksen okuması", "godot_input_axis_movement", False),
                    ("Karakter Sürtünmesi ve Hızlanma (move_toward)", "Pürüzsüz duruş ve ivmelenme hesapları", "godot_friction_acceleration", False),
                    ("4. Ünite 2D Karakter Fiziği Sınavı", "CharacterBody2D hareket sınavı", "godot_u4_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_5", "unitNumber": 5, "title": "Çarpışma Katmanları (Layers/Masks) & Area2D", "category": "Fizik & Hareket", "colorHex": "0xFF059669",
                "cheatSheetTitle": "Godot Çarpışma Hile Kağıdı",
                "cheatSheetContent": "func _on_body_entered(body):\n    if body.is_in_group('players'):\n        queue_free()",
                "lessons": [
                    ("CollisionShape2D & Çarpışma Geometrileri", "Circle, Rectangle ve Capsule şekilleri", "godot_collision_shapes_deep", False),
                    ("Collision Layers vs Collision Masks Farkı", "Kim nerede bulunur, kim kimi tarar?", "godot_layers_vs_masks", False),
                    ("Area2D: Kütlesiz Tetikleyici Bölgeler", "Altın toplama ve kapı dedektörleri", "godot_area2d_core", False),
                    ("body_entered & body_exited Sinyalleri", "Fiziksel gövde temaslarını yakalama", "godot_body_signals", False),
                    ("Gruplar (Groups): is_in_group() ile Nesne Tanıma", "Düşman ve oyuncuları etiketleme", "godot_groups_system", False),
                    ("RigidBody2D: Tam Fizik Simülasyonu", "Kütle, darbe ve yerçekimi fiziği", "godot_rigidbody_deep", False),
                    ("StaticBody2D: Zeminler ve Yıkılmaz Duvarlar", "Statik harita engelleri tasarlama", "godot_staticbody_deep", False),
                    ("5. Ünite Çarpışmalar & Area2D Sınavı", "Katmanlar ve tetikleyiciler sınavı", "godot_u5_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_6", "unitNumber": 6, "title": "Sinyaller (Signals), Event Bus & Gevşek Bağlılık", "category": "Sinyaller & Olaylar", "colorHex": "0xFFF59E0B",
                "cheatSheetTitle": "Godot Sinyal Hile Kağıdı",
                "cheatSheetContent": "signal coin_collected(amount)\ncoin_collected.emit(10)\ncoin_collected.connect(_on_coin)",
                "lessons": [
                    ("Sinyal Mimarisi & Observer Tasarım Deseni", "Sıkı bağımlılıkları önleme", "godot_signals_architecture", False),
                    ("Özel Sinyal Tanımlama (signal my_signal)", "Parametreli ve parametresiz deklarasyon", "godot_custom_signals_def", False),
                    ("Sinyal Tetikleme: my_signal.emit()", "Dinleyicilere anında veri fırlatma", "godot_signal_emit", False),
                    ("Kodla Sinyal Bağlama: .connect(Callable)", "Çalışma zamanında dinamik dinleyici", "godot_signal_connect_deep", False),
                    ("Editör Panelinden Sinyal Bağlama", "Arayüzle sahne düğümlerini bağlama", "godot_signal_ui_connect", False),
                    ("Event Bus Deseni: Global Olay Yönetimi", "Merkezi sinyal yöneticisi kurgulama", "godot_event_bus_pattern", False),
                    ("Autoload (Singletons) ile Global Durum", "Oyun boyunca yaşayan kalıcı servisler", "godot_autoload_singletons", False),
                    ("6. Ünite Sinyaller & Mimari Sınavı", "Sinyal ve Event Bus mimarisi sınavı", "godot_u6_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_7", "unitNumber": 7, "title": "UI Mimarisi (Control Nodes, Anchors, Containers)", "category": "UI & Animasyon", "colorHex": "0xFF8B5CF6",
                "cheatSheetTitle": "Godot UI Hile Kağıdı",
                "cheatSheetContent": "VBoxContainer, HBoxContainer, MarginContainer\nTextureProgressBar, Label, Button",
                "lessons": [
                    ("Control Düğümleri Felsefesi & CanvasItem", "Oyun içi HUD ve menü tasarımı", "godot_control_nodes_intro", False),
                    ("Anchors & Margins ile Responsive Arayüz", "Farklı ekranlara uyum sağlama", "godot_anchors_margins", False),
                    ("VBoxContainer & HBoxContainer ile Düzen", "Dikey ve yatay kutu hizalama", "godot_containers_vbox_hbox", False),
                    ("MarginContainer & GridContainer Kullanımı", "İç boşluklar ve ızgara menüleri", "godot_containers_grid_margin", False),
                    ("Label, Button & TextureButton Etkileşimleri", "pressed sinyalleri ve durumlar", "godot_buttons_labels", False),
                    ("ProgressBar & TextureProgressBar ile Can Barı", "Değer bağlama ve dolum efektleri", "godot_progress_bars", False),
                    ("Themes & Stil Kutuları (StyleBoxFlat)", "Tüm oyun için ortak UI teması", "godot_ui_themes_stylebox", False),
                    ("7. Ünite UI & Arayüz Mimarisi Sınavı", "Kullanıcı arayüzü sınavı", "godot_u7_mega_exam", True),
                ]
            },
            {
                "id": "godot_unit_8", "unitNumber": 8, "title": "Animasyon, Tweens, Ses Yönetimi & Shaders", "category": "UI & Animasyon", "colorHex": "0xFF7C3AED",
                "cheatSheetTitle": "Godot Animasyon & Ses Hile Kağıdı",
                "cheatSheetContent": "var tween = create_tween()\ntween.tween_property($Sprite2D, 'modulate:a', 0.0, 0.5)\n$AudioStreamPlayer.play()",
                "lessons": [
                    ("AnimationPlayer Düğümü & Zaman Çizelgesi", "Sprite kareleri ve pozisyon animasyonu", "godot_animation_player_deep", False),
                    ("Tween İle Kodla Akıcı İnterpolasyon", "create_tween() ile pürüzsüz geçişler", "godot_tweens_deep", False),
                    ("Ease & Transition Tipleri (EASE_OUT)", "Doğal animasyon hissi yakalama", "godot_tween_curves", False),
                    ("AudioStreamPlayer2D & Konumsal Ses", "Mesafe ve pan özellikli sesler", "godot_audio_positional", False),
                    ("Audio Buses: Master, Music ve SFX Kanalları", "Ses mikseri ve ses seviyesi kontrolü", "godot_audio_buses", False),
                    ("Shader Temelleri (CanvasItem Shader)", "Piksel bazlı görsel efektler", "godot_shaders_intro", False),
                    ("Platform Dışa Aktarma (Export Presets)", "APK ve masaüstü derleme paketleme", "godot_export_builds", False),
                    ("8. Ünite Godot Ustalık & Oyun Geliştirici Sınavı", "Kapsamlı Godot uzmanlık sınavı", "godot_u8_mega_exam", True),
                ]
            }
        ]
    },

    # 3. C DILI
    "c": {
        "file": "c_curriculum.dart",
        "var_name": "cUnits",
        "lang_enum": "CodeLanguage.c",
        "units": [
            {
                "id": "c_unit_1", "unitNumber": 1, "title": "C Dili Temelleri & GCC Derleme Boru Hattı", "category": "Temeller & Tipler", "colorHex": "0xFF0284C7",
                "cheatSheetTitle": "C Derleme Hile Kağıdı",
                "cheatSheetContent": "#include <stdio.h>\nint main(int argc, char *argv[]) {\n    printf('Merhaba C!\\n');\n    return 0;\n}",
                "lessons": [
                    ("C Dilinin Tarihi & Sistem Programlama Felsefesi", "Donanıma doğrudan erişim ve performans", "c_history_philosophy", False),
                    ("main() Fonksiyonu & Çıkış Kodları (exit codes)", "argc, argv ve return 0 standartları", "c_main_anatomy", False),
                    ("GCC Derleme Aşaması 1: Preprocessor (Önişlemci)", "#include, #define ve makro genişlemeleri", "c_gcc_preprocessor", False),
                    ("GCC Derleme Aşaması 2: Compiler (Derleme)", "C kodunun assembly'ye (.s) çevrimi", "c_gcc_compiler", False),
                    ("GCC Derleme Aşaması 3: Assembler (Birleştirici)", "Assembly'nin makine koduna (.o) çevrimi", "c_gcc_assembler", False),
                    ("GCC Derleme Aşaması 4: Linker (Bağlayıcı)", "Nesne dosyaları ve standart kütüphane bağı", "c_gcc_linker", False),
                    ("Derleyici Bayrakları: -Wall, -Wextra, -O2, -g", "Uyarıları açma, hata ayıklama ve optimizasyon", "c_compiler_flags", False),
                    ("1. Ünite C Temelleri & Derleme Sınavı", "C derleme boru hattı sınavı", "c_u1_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_2", "unitNumber": 2, "title": "İlkel Veri Tipleri, Boyutlar & Formatlı G/Ç", "category": "Temeller & Tipler", "colorHex": "0xFF0369A1",
                "cheatSheetTitle": "C Tipler & G/Ç Hile Kağıdı",
                "cheatSheetContent": "int a; float b; double c; char d;\nprintf('%d, %.2f, %p\\n', a, b, (void*)&a);\nscanf('%d', &a);",
                "lessons": [
                    ("Tamsayı Tipleri: char, short, int, long", "İşaretli (signed) vs işaretsiz (unsigned)", "c_integer_types", False),
                    ("Kayan Noktalı Tipler: float vs double", "IEEE 754 standardı ve hassasiyet farkları", "c_float_double_precision", False),
                    ("sizeof Operatörü & 32/64-Bit Mimari Farkları", "Veri tiplerinin bellekteki bayt boyutları", "c_sizeof_architectures", False),
                    ("Formatlı Çıktı: printf() Format Belirteçleri", "%d, %f, %s, %p, %x formatları ve hizalama", "c_printf_specifiers", False),
                    ("Formatlı Girdi: scanf() & Adres Geçişi (&)", "Kullanıcıdan veri alma ve tampon tuzakları", "c_scanf_safety", False),
                    ("Aritmetik, Karşılaştırma & Mantık Operatörleri", "Tamsayı bölmesi ve mod operatörü", "c_operators_arithmetic", False),
                    ("Açık ve Örtük Tür Dönüşümleri (Type Casting)", "Hassasiyet kaybı ve (type) casting kuralları", "c_type_casting", False),
                    ("2. Ünite Veri Tipleri & Formatlı Girdi/Çıktı Sınavı", "Tip boyutları ve G/Ç sınavı", "c_u2_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_3", "unitNumber": 3, "title": "Bellek Adresleri & İşaretçi (Pointer) Temelleri", "category": "İşaretçiler (Pointers)", "colorHex": "0xFF38BDF8",
                "cheatSheetTitle": "C Pointer Hile Kağıdı",
                "cheatSheetContent": "int x = 42;\nint *p = &x;  // Adresi al\n*p = 100;     // Dereference\nint **pp = &p;// Cift isaretci",
                "lessons": [
                    ("RAM Mimarisi & Bellek Adresi Kavramı", "Bayt bayt adreslenebilir bellek modeli", "c_memory_addressing", False),
                    ("Address-of (&) Operatörü ile Adres Yakalama", "Değişkenlerin RAM'deki konumunu bulma", "c_addressof_operator", False),
                    ("İşaretçi (Pointer) Tanımlama & Syntax (*)", "İşaretçinin kendisinin de bir değişken olması", "c_pointer_syntax", False),
                    ("Dereferencing (*) ile Adresteki Değeri Okuma/Yazma", "İşaret edilen bellek hücresine müdahale", "c_dereferencing_deep", False),
                    ("NULL İşaretçi & Neden NULL Atamalıyız?", "Tanımsız bellek erişimlerini (Segfault) önleme", "c_null_pointer_safety", False),
                    ("void* (Jenerik İşaretçi) Mimarisi", "Tipten bağımsız bellek işaretçisi ve cast kuralları", "c_void_pointer_cast", False),
                    ("Çift İşaretçiler (Pointers to Pointers - int**)", "İşaretçinin adresini tutma ve matrisler", "c_double_pointers", False),
                    ("3. Ünite Bellek Adresleri & İşaretçiler Sınavı", "İşaretçi temelleri sınavı", "c_u3_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_4", "unitNumber": 4, "title": "İşaretçi Aritmetiği, Diziler & Stringler", "category": "İşaretçiler (Pointers)", "colorHex": "0xFF0284C7",
                "cheatSheetTitle": "C Dizi & String Hile Kağıdı",
                "cheatSheetContent": "int arr[5] = {1, 2, 3, 4, 5};\nint *p = arr;\n*(p + 2) == arr[2];\nchar str[] = 'Hello'; // \\0 ile biter",
                "lessons": [
                    ("İşaretçi Aritmetiği: ptr + 1 Neden Tip Boyutu Kadar Atlar?", "Ölçekleme faktörü ve sizeof adımı", "c_pointer_arithmetic_deep", False),
                    ("Diziler ve İşaretçi İlişkisi (Array Decay)", "Dizi adının ilk elemanın adresine dönüşmesi", "c_array_decay", False),
                    ("İşaretçilerle Dizi Elemanlarını Gezme", "*(arr + i) vs arr[i] yazım denkliği", "c_pointer_array_traversal", False),
                    ("C Stringleri: Null-Terminated (\\0) Karakter Dizileri", "Stringlerin sonundaki 0 baytı kuralı", "c_cstrings_null_terminator", False),
                    ("string.h Kütüphanesi: strlen, strcpy, strcmp, strcat", "Standart string fonksiyonları ve tehlikeleri", "c_string_library_funcs", False),
                    ("Tampon Taşması (Buffer Overflow) Tehlikesi", "Dizi sınırlarının dışına yazma açıkları", "c_buffer_overflow_vuln", False),
                    ("const İşaretçiler (const int* vs int* const)", "Değerin mi adresin mi sabit olduğunu belirleme", "c_const_pointers", False),
                    ("4. Ünite İşaretçi Aritmetiği & Diziler Sınavı", "Diziler ve string işaretçileri sınavı", "c_u4_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_5", "unitNumber": 5, "title": "Dinamik Bellek Yönetimi (Heap, malloc, free)", "category": "Dinamik Bellek & Malloc", "colorHex": "0xFF6366F1",
                "cheatSheetTitle": "C Dinamik Bellek Hile Kağıdı",
                "cheatSheetContent": "int *arr = malloc(10 * sizeof(int));\nif (arr == NULL) exit(1);\nfree(arr);\narr = NULL;",
                "lessons": [
                    ("Stack vs Heap Bellek Bölgeleri", "Fonksiyon çerçevesi vs dinamik küme ömrü", "c_stack_vs_heap_deep", False),
                    ("malloc() ile Bayt Tahsisi & void* Dönüşü", "Heap üzerinde dinamik alan açma kuralları", "c_malloc_allocation", False),
                    ("malloc Dönüşünü NULL Kontrolü Yapma Kuralı", "Bellek yetersizliği durumunu yakalama", "c_malloc_null_check", False),
                    ("free() Fonksiyonu & Belleği Geri Verme", "Tahsis edilen alanı sisteme iade etme", "c_free_deallocation", False),
                    ("calloc() ile Sıfırlanmış Bellek Tahsisi", "Tüm baytları otomatik 0 ile başlatma", "c_calloc_zeroed", False),
                    ("realloc() ile Bloğu Büyütme/Küçültme", "Dinamik dizileri genişletme ve veri kopyalama", "c_realloc_resizing", False),
                    ("Çift Free (Double Free) Hatası & Çözümü", "Aynı bloğu iki kez serbest bırakma tuzağı", "c_double_free_bug", False),
                    ("5. Ünite Dinamik Bellek Yönetimi Sınavı", "malloc, free ve heap yönetimi sınavı", "c_u5_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_6", "unitNumber": 6, "title": "Bellek Güvenliği, Sızıntılar & Valgrind Analizi", "category": "Dinamik Bellek & Malloc", "colorHex": "0xFF4F46E5",
                "cheatSheetTitle": "C Bellek Güvenliği Hile Kağıdı",
                "cheatSheetContent": "valgrind --leak-check=full ./prog\nfree(p); p = NULL; // Dangling onle",
                "lessons": [
                    ("Bellek Sızıntısı (Memory Leak) Nedir?", "free edilmeyen belleğin programı şişirmesi", "c_memory_leak_core", False),
                    ("Dangling Pointer (Askıda Kalan İşaretçi)", "Serbest bırakılan adresi kullanmaya devam etme", "c_dangling_pointer_bug", False),
                    ("Segmentation Fault (Segfault) Neden Olur?", "İşletim sisteminin geçersiz bellek müdahalesi", "c_segfault_causes", False),
                    ("Valgrind Memcheck Aracını Kurma & Çalıştırma", "Linux ortamında sızıntıları otomatik tarama", "c_valgrind_setup", False),
                    ("Valgrind Çıktılarını Okuma (Definitely / Indirectly Lost)", "Hangi satırda sızıntı olduğunu bulma", "c_valgrind_reports", False),
                    ("Use-After-Free ve Uninitialized Memory Hataları", "Başlatılmamış değişken okuma tehlikeleri", "c_use_after_free", False),
                    ("Güvenli Bellek Sarmalayıcıları (Safe Wrappers)", "xmalloc ve otomatik NULL atayan makrolar", "c_safe_memory_wrappers", False),
                    ("6. Ünite Bellek Güvenliği & Valgrind Sınavı", "Bellek analizi ve sızıntı avı sınavı", "c_u6_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_7", "unitNumber": 7, "title": "Structs, Unions, Struct Padding & Bellek Hizalama", "category": "Structs & Unions", "colorHex": "0xFF10B981",
                "cheatSheetTitle": "C Struct Hile Kağıdı",
                "cheatSheetContent": "typedef struct {\n    int id;\n    char name[32];\n} Student;\nStudent s; Student *p = &s;\np->id = 1;",
                "lessons": [
                    ("struct Nedir & Özel Veri Tipleri Oluşturma", "Farklı tipleri tek bir blokta paketleme", "c_struct_definition", False),
                    ("typedef ile Struct İsimlerini Kısaltma", "struct anahtarını her yerde yazmaktan kurtulma", "c_struct_typedef_deep", False),
                    ("Struct Elemanlarına Erişim: Nokta (.) vs Ok (->)", "Değişken üzerinden vs işaretçi üzerinden erişim", "c_dot_arrow_operators", False),
                    ("Struct Padding & Bellek Hizalama (Alignment)", "İşlemcinin bayt hizalaması için bıraktığı boşluklar", "c_struct_padding_alignment", False),
                    ("#pragma pack ile Padding'i Kapatma", "Ağ paketleri için sıkıştırılmış structlar", "c_pragma_pack_packed", False),
                    ("union Mimarisi: Ortak Bellek Alanı Paylaşımı", "Tüm üyelerin aynı adresi paylaştığı yapılar", "c_union_architecture", False),
                    ("enum: Tip Güvenli ve Okunabilir Durum Sabitleri", "0, 1, 2 yerine anlamlı durum isimleri verme", "c_enum_states", False),
                    ("7. Ünite Structs, Unions & Padding Sınavı", "Veri modelleme ve bellek hizalama sınavı", "c_u7_mega_exam", True),
                ]
            },
            {
                "id": "c_unit_8", "unitNumber": 8, "title": "Düşük Seviye, Bitwise, Dosya I/O & Header Guards", "category": "Bitwise & Dosya", "colorHex": "0xFFEC4899",
                "cheatSheetTitle": "C Bitwise & Dosya Hile Kağıdı",
                "cheatSheetContent": "flags |= (1 << 3);  // 3. biti 1 yap\nflags &= ~(1 << 3); // 3. biti 0 yap\nFILE *f = fopen('d.bin', 'rb');\nfread(buf, 1, sz, f); fclose(f);",
                "lessons": [
                    ("Bit Düzeyi Operatörler: &, |, ^, ~, <<, >>", "İkili sistemde bit manipulation işlemleri", "c_bitwise_operators_deep", False),
                    ("Bit Maskeleme: Biti Açma (Set), Kapama (Clear), Tersleme", "Bayrak (flags) yönetiminde bit manipülasyonu", "c_bit_masking_flags", False),
                    ("Bit Fields: Struct İçinde Biti Sınırlandırma", "int field : 3 ile bayt tasarrufu yapma", "c_bit_fields_struct", False),
                    ("Dosya İşlemleri: fopen(), fclose() & Modlar (r, w, a, rb)", "Dosya işaretçisi (FILE*) yönetimi", "c_file_io_modes", False),
                    ("İkili Dosya Okuma/Yazma: fread() & fwrite()", "Structları doğrudan diske yazıp okuma", "c_binary_io_fread", False),
                    ("Önişlemci: #define, Makrolar & Header Guards", "#ifndef, #define koruyucuları ve yan etkiler", "c_macros_header_guards", False),
                    ("Fonksiyon İşaretçileri (Function Pointers)", "Metot referanslarını parametre geçirme ve qsort()", "c_function_pointers_deep", False),
                    ("8. Ünite C Dili Ustalık & Sistem Programlama Sınavı", "Kıdemli C yazılımcısı değerlendirme sınavı", "c_u8_mega_exam", True),
                ]
            }
        ]
    }
}

print("Specs for Git, Godot, and C loaded.")
