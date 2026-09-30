# -*- coding: utf-8 -*-
"""
Curated Technical Question Content Generator
Contains deep technical questions, code snippets, explanations, and options
for Git, Godot, C, Python, C#, Kotlin, Linux, JavaScript, SQL, and Algorithms.
"""

def get_mc_pool_for_lesson(track, unit_num, lesson_num, topic, title):
    # Specialized generators by track
    if track == "git":
        return get_git_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "godot":
        return get_godot_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "c":
        return get_c_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "python":
        return get_python_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "csharp":
        return get_csharp_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "kotlin":
        return get_kotlin_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "linux":
        return get_linux_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "javascript":
        return get_javascript_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "sql":
        return get_sql_mc_questions(unit_num, lesson_num, topic, title)
    elif track == "algorithms":
        return get_algorithms_mc_questions(unit_num, lesson_num, topic, title)
    return []

def get_fib_pool_for_lesson(track, unit_num, lesson_num, topic, title):
    if track == "git":
        return get_git_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "godot":
        return get_godot_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "c":
        return get_c_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "python":
        return get_python_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "csharp":
        return get_csharp_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "kotlin":
        return get_kotlin_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "linux":
        return get_linux_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "javascript":
        return get_javascript_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "sql":
        return get_sql_fib_questions(unit_num, lesson_num, topic, title)
    elif track == "algorithms":
        return get_algorithms_fib_questions(unit_num, lesson_num, topic, title)
    return []

def get_tf_pool_for_lesson(track, unit_num, lesson_num, topic, title):
    if track == "git":
        return get_git_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "godot":
        return get_godot_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "c":
        return get_c_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "python":
        return get_python_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "csharp":
        return get_csharp_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "kotlin":
        return get_kotlin_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "linux":
        return get_linux_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "javascript":
        return get_javascript_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "sql":
        return get_sql_tf_questions(unit_num, lesson_num, topic, title)
    elif track == "algorithms":
        return get_algorithms_tf_questions(unit_num, lesson_num, topic, title)
    return []

def get_matching_for_lesson(track, unit_num, lesson_num, topic, title):
    if track == "git":
        return get_git_matching(unit_num, lesson_num, topic, title)
    elif track == "godot":
        return get_godot_matching(unit_num, lesson_num, topic, title)
    elif track == "c":
        return get_c_matching(unit_num, lesson_num, topic, title)
    elif track == "python":
        return get_python_matching(unit_num, lesson_num, topic, title)
    elif track == "csharp":
        return get_csharp_matching(unit_num, lesson_num, topic, title)
    elif track == "kotlin":
        return get_kotlin_matching(unit_num, lesson_num, topic, title)
    elif track == "linux":
        return get_linux_matching(unit_num, lesson_num, topic, title)
    elif track == "javascript":
        return get_javascript_matching(unit_num, lesson_num, topic, title)
    elif track == "sql":
        return get_sql_matching(unit_num, lesson_num, topic, title)
    elif track == "algorithms":
        return get_algorithms_matching(unit_num, lesson_num, topic, title)
    return {
        "type": "QuestionType.matching",
        "prompt": f"{title} ile ilgili kavramları doğru tanımlarıyla eşleştirin.",
        "matchingPairs": [
            ("Kavram A", "Tanım A"),
            ("Kavram B", "Tanım B"),
            ("Kavram C", "Tanım C"),
        ],
        "explanation": f"{title} kavramları arasındaki ilişkiler mimariyi anlamada kritiktir."
    }

# ==========================================
# GIT QUESTIONS POOL
# ==========================================
def get_git_mc_questions(unit_num, lesson_num, topic, title):
    pool = [
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Mevcut dizinde yeni bir Git versiyon kontrol deposu başlatmak için hangi komut kullanılır?",
            "codeSnippet": "$ git ___",
            "options": ["init", "start", "create", "new"],
            "correctIndex": 0,
            "explanation": "'git init' mevcut çalışma dizininde '.git' adında gizli bir depo veritabanı klasörü oluşturarak versiyon takibini başlatır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Git'te çalışma ağacındaki durumları ve hangi dosyaların takip edilmediğini görmek için hangi komut çalıştırılır?",
            "codeSnippet": "$ git ___",
            "options": ["status", "info", "state", "check"],
            "correctIndex": 0,
            "explanation": "'git status' çalışma dizini ile Staging Area arasındaki farkları ve izlenmeyen (untracked) dosyaları listeler."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Tüm değiştirilen ve yeni eklenen dosyaları Staging Area (Sahne) alanına eklemek için hangi komut kullanılır?",
            "codeSnippet": "$ git add ___",
            "options": [".", "-all", "*.*", "--stage"],
            "correctIndex": 0,
            "explanation": "'git add .' mevcut dizin ve alt dizinlerindeki tüm değişiklikleri sahneye (staging area) ekler."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Sahneye alınmış değişiklikleri açıklayıcı bir mesaj ile kalıcı olarak kaydetmek için hangi komut kullanılır?",
            "codeSnippet": None,
            "options": [
                'git commit -m "mesaj"',
                'git save -m "mesaj"',
                'git push -m "mesaj"',
                'git store -m "mesaj"'
            ],
            "correctIndex": 0,
            "explanation": "'git commit -m' sahnelenmiş değişiklikleri SHA-1/SHA-256 hash ve mesaj bilgisiyle kalıcı commit nesnesine dönüştürür."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Git'te henüz sahneye eklenmemiş (unstaged) satır bazlı dosya değişikliklerini terminalde görmek için ne kullanılır?",
            "codeSnippet": "$ git ___",
            "options": ["diff", "compare", "show-changes", "log -p"],
            "correctIndex": 0,
            "explanation": "'git diff' çalışma dizini ile staging area arasındaki satır satır farkları yeşil/kırmızı renkle gösterir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Sadece sahneye alınmış (staged) değişikliklerin farkını görmek için hangi bayrak kullanılır?",
            "codeSnippet": "$ git diff ___",
            "options": ["--staged (veya --cached)", "--staged-only", "--ready", "--commit-diff"],
            "correctIndex": 0,
            "explanation": "'git diff --staged' veya 'git diff --cached' bir sonraki committe nelerin kaydedileceğini gösterir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Git'te belirli dosya veya klasörlerin (örn. node_modules, .env) depoya eklenmesini engellemek için hangi dosya kullanılır?",
            "codeSnippet": None,
            "options": [".gitignore", ".gitexclude", ".gitconfig", ".gitrules"],
            "correctIndex": 0,
            "explanation": ".gitignore dosyası içine yazılan desenler (pattern) Git tarafından takip dışı bırakılır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Yeni bir dal (branch) açmak ve doğrudan o dala geçiş yapmak için modern Git sürümünde hangi komut tercih edilir?",
            "codeSnippet": "$ git ___ -c feature-odeme",
            "options": ["switch", "jump", "branch", "checkout-new"],
            "correctIndex": 0,
            "explanation": "'git switch -c <dal>' Git 2.23+ ile birlikte dal açıp anında geçiş yapmak için tasarlanan modern komuttur."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Git'te HEAD işaretçisi tam olarak neyi temsil eder?",
            "codeSnippet": None,
            "options": [
                "Şu anda üzerinde çalışılan aktif dalı veya commiti",
                "Depodaki en eski ilk ana commiti",
                "Uzak depodaki en son sürümü",
                "Silinmiş olan son dosyayı"
            ],
            "correctIndex": 0,
            "explanation": "HEAD, aktif olarak checkout yapılmış dal veya commite işaret eden sembolik bir referanstır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "İki daldaki değişiklikler aynı dosyanın aynı satırlarını etkilediğinde ne meydana gelir?",
            "codeSnippet": "CONFLICT (content): Merge conflict in main.dart",
            "options": [
                "Merge Conflict (Birleştirme Çakışması)",
                "Segmentation Fault",
                "Deponun bozulması ve silinmesi",
                "Otomatik olarak yeni commiti reddetme"
            ],
            "correctIndex": 0,
            "explanation": "Aynı satırlar farklı dallarda değiştirildiğinde Git otomatik karar veremez ve geliştiricinin çözmesi için Merge Conflict üretir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Uzak depodaki (remote) değişiklikleri yerel çalışma ağacına dokunmadan sadece indirmek için hangisi kullanılır?",
            "codeSnippet": "$ git ___ origin",
            "options": ["fetch", "pull", "clone", "sync"],
            "correctIndex": 0,
            "explanation": "'git fetch' uzak commitleri indirir ancak yerel dallarınızla birleştirmez; bu sayede değişiklikleri güvenle inceleyebilirsiniz."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Mevcut dalın başlangıç noktasını hedef dalın son commitinin üzerine taşıyarak düzlemsel bir tarihçe elde etmeye ne ad verilir?",
            "codeSnippet": "$ git ___ main",
            "options": ["rebase", "merge", "cherry-pick", "squash"],
            "correctIndex": 0,
            "explanation": "Rebase, mevcut dalın commitlerini hedef dalın ucuna yeniden uygular (re-apply) ve merge commit kalabalığını önler."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Başka bir daldaki tek bir spesifik commiti mevcut dala kopyalayıp uygulamak için hangi komut kullanılır?",
            "codeSnippet": "$ git ___ a3b8c9",
            "options": ["cherry-pick", "clone-commit", "copy-commit", "apply-patch"],
            "correctIndex": 0,
            "explanation": "'git cherry-pick' verilen commit hash'indeki değişikliği mevcut aktif dala yeni bir commit olarak uygular."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Tüm commit geçmişini ve çalışma dizinindeki değişiklikleri zorla silerek HEAD'i geriye almak için hangi reset modu kullanılır?",
            "codeSnippet": "$ git reset ___ HEAD~1",
            "options": ["--hard", "--soft", "--mixed", "--force"],
            "correctIndex": 0,
            "explanation": "'--hard' bayrağı hem staging area'yı hem de çalışma dizinini hedef commite eşitler, yapılmamış tüm değişiklikleri kalıcı siler."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Henüz commit edilmemiş geçici değişiklikleri çalışma alanından temizleyip daha sonra geri yüklemek üzere hafızaya alan komut hangisidir?",
            "codeSnippet": "$ git ___",
            "options": ["stash", "cache", "pocket", "pause"],
            "correctIndex": 0,
            "explanation": "'git stash' kirli çalışma dizinini saklar ve temiz bir HEAD durumuna döner; 'git stash pop' ile geri çağrılır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Yanlışlıkla silinmiş veya hard reset ile kaybedilmiş commitlerin hash değerlerini kurtarmak için hangi günlük kaydı incelenir?",
            "codeSnippet": "$ git ___",
            "options": ["reflog", "history", "recover", "backlog"],
            "correctIndex": 0,
            "explanation": "'git reflog' yerel depoda HEAD işaretçisinin her hareketini (checkout, reset, commit) günlüğe kaydeder ve kayıp commitleri bulmayı sağlar."
        },
    ]
    # Return 11 items offset by lesson_num to guarantee variety
    start = (lesson_num * 2) % len(pool)
    result = []
    for i in range(11):
        idx = (start + i) % len(pool)
        result.append(pool[idx])
    return result

def get_git_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Uzak depoya ilk dal gönderiminde dalı izlemeye almak için 'git push _____ origin main' bayrağı verilir.",
            "blankOptions": ["-u", "-f", "-d", "-b"],
            "correctBlankAnswer": "-u",
            "explanation": "-u (--set-upstream) bayrağı yerel dal ile uzak dal arasında takip bağlantısı kurar."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Git'te birleştirilmiş bir dalı güvenle silmek için 'git branch _____ dal-adi' komutu kullanılır.",
            "blankOptions": ["-d", "-D", "-rm", "-del"],
            "correctBlankAnswer": "-d",
            "explanation": "-d bayrağı sadece birleştirilmiş (merged) dalları silerken, -D zorla siler."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Stash hafızasındaki son değişikliği geri yükleyip listeden silmek için 'git stash _____' komutu çalıştırılır.",
            "blankOptions": ["pop", "apply", "drop", "clear"],
            "correctBlankAnswer": "pop",
            "explanation": "'pop' değişikliği geri yükler ve stash yığınından kaldırır."
        }
    ]

def get_git_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.trueFalse",
            "prompt": "'git pull' komutu arka planda önce 'git fetch' ardından 'git merge' komutlarını otomatik çalıştırır.",
            "isTrue": True,
            "explanation": "Doğrudur, git pull aslında fetch ve merge işlemlerinin birleşimidir."
        },
        {
            "type": "QuestionType.trueFalse",
            "prompt": "Takımla paylaşılan ortak public main dalında 'git rebase' yapmak güvenli ve şiddetle tavsiye edilen bir pratiktir.",
            "isTrue": False,
            "explanation": "Yanlıştır! Ortak dallarda rebase yapmak başkalarının commit tarihçesini bozar ve büyük çakışmalara yol açar."
        }
    ]

def get_git_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Git komutlarını gerçekleştirdikleri temel işlevlerle eşleştirin.",
        "matchingPairs": [
            ("git add", "Değişiklikleri Staging Area'ya alma"),
            ("git rebase", "Tarihçeyi düzleştirip commitleri taşıma"),
            ("git reflog", "Kayıp commitleri ve HEAD hareketlerini bulma"),
        ],
        "explanation": "Git komutlarının çalışma aşamalarını doğru bilmek verimli versiyon kontrolünün anahtarıdır."
    }

# ==========================================
# GODOT QUESTIONS POOL
# ==========================================
def get_godot_mc_questions(unit_num, lesson_num, topic, title):
    pool = [
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot 4 motorunun temel yapı taşı olan ve belirli bir işlevi yerine getiren en küçük nesne nedir?",
            "codeSnippet": None,
            "options": ["Node (Düğüm)", "GameObject", "Actor", "Component"],
            "correctIndex": 0,
            "explanation": "Godot'ta her şey bir 'Node'dur. Düğümler bir araya gelerek ağaç hiyerarşisinde Sahneleri (Scene) oluşturur."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot 4'te oyuncu tarafından kontrol edilen fiziksel bir 2D karakter oluşturmak için hangi düğüm tipi tercih edilir?",
            "codeSnippet": "extends ___",
            "options": ["CharacterBody2D", "KinematicBody2D", "RigidBody2D", "StaticBody2D"],
            "correctIndex": 0,
            "explanation": "Godot 4 ile KinematicBody2D yerine CharacterBody2D getirilmiş ve hareket yönetimi modernize edilmiştir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "CharacterBody2D üzerinde hesaplanan 'velocity' vektörünü kullanarak fiziksel çarpışmalı hareketi gerçekleştiren metot hangisidir?",
            "codeSnippet": "func _physics_process(delta):\n    ___()",
            "options": ["move_and_slide", "move_and_collide", "step_physics", "apply_force"],
            "correctIndex": 0,
            "explanation": "Godot 4'te 'move_and_slide()' doğrudan dahili 'velocity' özelliğini kullanır ve parametre almaz."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Fizik hesaplamaları ve karakter hareketi için hangi sanal metot ezilmelidir (override edilmelidir)?",
            "codeSnippet": "func ___(delta: float) -> void:",
            "options": ["_physics_process", "_process", "_update", "_tick"],
            "correctIndex": 0,
            "explanation": "_physics_process sabit kare hızında (varsayılan 60 FPS) çalışarak tutarlı fizik simülasyonu sağlar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot editörü arayüzünden bir değişkenin değerini değiştirebilmek için hangi GDScript direktifi kullanılır?",
            "codeSnippet": "___ var speed: float = 300.0",
            "options": ["@export", "@public", "@inspect", "@serialize"],
            "correctIndex": 0,
            "explanation": "Godot 4'te değişkeni Inspector paneline açmak için '@export' annotasyonu kullanılır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Bir alt düğüm referansını sahne tamamen hazır olduğunda değişkene atamak için hangi direktif kullanılır?",
            "codeSnippet": "___ var sprite = $Sprite2D",
            "options": ["@onready", "@lazy", "@init", "@bind"],
            "correctIndex": 0,
            "explanation": "'@onready' düğüm sahne ağacına girip _ready() çağrılana kadar değişken atamasını bekletir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot'ta düğümler arasında gevşek bağlı (loosely coupled) iletişim kurmak için hangi mekanizma kullanılır?",
            "codeSnippet": "signal health_depleted\n\nhealth_depleted.___()",
            "options": ["Signals (Sinyaller) & emit", "Broadcast", "Global Variables", "Pointers"],
            "correctIndex": 0,
            "explanation": "Sinyaller Observer tasarım desenini uygular. 'health_depleted.emit()' ile dinleyicilere haber verilir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Belirli bir bölgeye girilip çıkıldığını tespit etmek (tetikleyici/trigger alanı) için hangi düğüm kullanılır?",
            "codeSnippet": None,
            "options": ["Area2D", "TriggerZone2D", "Hitbox2D", "Sensor2D"],
            "correctIndex": 0,
            "explanation": "Area2D fiziksel bir kütle içermez; body_entered ve area_entered sinyalleriyle alan temaslarını tespit eder."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot'ta kod ile akıcı animasyonlar ve geçişler (fade in, hareket, ölçekleme) üretmek için hangi nesne kullanılır?",
            "codeSnippet": "var t = create_tween()\nt.___($Sprite2D, 'modulate:a', 0.0, 1.0)",
            "options": ["tween_property", "animate_to", "interpolate", "lerp_node"],
            "correctIndex": 0,
            "explanation": "Godot 4 SceneTreeTween sisteminde 'create_tween().tween_property()' ile pürüzsüz interpolasyon yapılır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Tüm sahnelerden erişilebilen global durum ve yöneticiler (GameManager, AudioController) oluşturmak için Godot'ta ne kullanılır?",
            "codeSnippet": None,
            "options": ["Autoload (Singleton)", "Static Class", "Global Namespace", "Shared Memory"],
            "correctIndex": 0,
            "explanation": "Proje Ayarları -> Autoload sekmesinden eklenen sahneler/scriptler oyun boyunca kök ağaçta singleton olarak yaşar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Godot 4'te bir sahneyi başka bir sahneye değiştirmek için SceneTree üzerinden hangi metot çağrılır?",
            "codeSnippet": "get_tree().___('res://Levels/Level2.tscn')",
            "options": ["change_scene_to_file", "load_scene", "switch_level", "open_scene"],
            "correctIndex": 0,
            "explanation": "'get_tree().change_scene_to_file()' mevcut sahneyi bellekten boşaltıp yeni sahne dosyasını yükler."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Bir 2D düğümün diğer nesnelerle fiziksel çarpışabilmesi için mutlaka hangi alt düğüme sahip olması gerekir?",
            "codeSnippet": None,
            "options": ["CollisionShape2D", "PhysicsCollider", "BoundingBox2D", "HitShape"],
            "correctIndex": 0,
            "explanation": "Fizik gövdelerinin (CharacterBody2D, RigidBody2D) çarpışma geometrisi CollisionShape2D (veya CollisionPolygon2D) ile belirlenir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Kullanıcı arayüzü oluştururken buton ve metinleri dikey olarak alt alta otomatik hizalayan Control düğümü hangisidir?",
            "codeSnippet": None,
            "options": ["VBoxContainer", "HBoxContainer", "GridContainer", "MarginContainer"],
            "correctIndex": 0,
            "explanation": "VBoxContainer altındaki tüm UI düğümlerini otomatik olarak dikey sütun halinde konumlandırır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "GDScript 2.0 dilinde çoklu koşulları eşleştirmek için switch-case yerine hangi anahtar kelime kullanılır?",
            "codeSnippet": "___ state:\n    State.IDLE:\n        pass\n    State.RUN:\n        pass",
            "options": ["match", "switch", "when", "select"],
            "correctIndex": 0,
            "explanation": "GDScript'te örüntü eşleme (pattern matching) için güçlü bir 'match' ifadesi kullanılır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Sahne ağacında bir alt düğüme kısa yoldan erişmek için hangi özel syntax kullanılır?",
            "codeSnippet": "var anim = ___AnimationPlayer",
            "options": ["$", "@", "#", "&"],
            "correctIndex": 0,
            "explanation": "'$NodeName' syntax'ı, 'get_node(\"NodeName\")' çağrısının kısayoludur."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Fiziksel çarpışmalarda bir nesnenin sadece belirli nesnelerle çarpışmasını filtrelemek için ne kullanılır?",
            "codeSnippet": None,
            "options": [
                "Collision Layers & Masks",
                "Physics Filters",
                "Tag System",
                "Group Ignore"
            ],
            "correctIndex": 0,
            "explanation": "Layer nesnenin hangi katmanda olduğunu, Mask ise hangi katmanları 'taradığını ve çarptığını' tanımlar."
        },
    ]
    start = (lesson_num * 2) % len(pool)
    result = []
    for i in range(11):
        idx = (start + i) % len(pool)
        result.append(pool[idx])
    return result

def get_godot_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Godot 4'te sinyal göndermek için 'my_signal._____(parametre)' metodu çağrılır.",
            "blankOptions": ["emit", "send", "trigger", "fire"],
            "correctBlankAnswer": "emit",
            "explanation": "Godot 4 ile birlikte 'emit_signal()' yerine doğrudan sinyalin '.emit()' metodu kullanılır."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Karakterin yatay ve dikey tuş girdilerini birim vektör olarak almak için 'Input._____' metodu kullanılır.",
            "blankOptions": ["get_vector", "get_axis", "get_action", "is_action_pressed"],
            "correctBlankAnswer": "get_vector",
            "explanation": "Input.get_vector() 4 yön tuşunu normalize edilmiş 2D Vector2 yönüne çevirir."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Sahnede zamanlayıcı görevi gören ve geri sayım bitince timeout sinyali yayan düğüm _____ düğümüdür.",
            "blankOptions": ["Timer", "Clock", "Delay", "Ticker"],
            "correctBlankAnswer": "Timer",
            "explanation": "Timer düğümü oyun döngüsünde periyodik veya tek seferlik gecikmeler üretir."
        }
    ]

def get_godot_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.trueFalse",
            "prompt": "Godot'ta _physics_process içerisindeki delta süresi monitörün yenileme hızına göre her kare değişkenlik gösterir.",
            "isTrue": False,
            "explanation": "Yanlıştır! _physics_process sabit zaman adımıyla (varsayılan saniyede 60 kez) çalışır, delta sabittir."
        },
        {
            "type": "QuestionType.trueFalse",
            "prompt": "Godot 4 tamamen açık kaynaklı (MIT Lisansı) olup herhangi bir gelir veya telif ücreti (royalty) talep etmez.",
            "isTrue": True,
            "explanation": "Doğrudur, Godot %100 özgür ve açık kaynak kodlu bağımsız bir oyun motorudur."
        }
    ]

def get_godot_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Godot düğümlerini temel kullanım amaçlarıyla eşleştirin.",
        "matchingPairs": [
            ("CharacterBody2D", "Oyuncu ve düşman karakter hareketi"),
            ("Area2D", "Temas ve tetikleyici tespiti (kütlesiz)"),
            ("AnimationPlayer", "Zaman çizelgeli animasyon yönetimi"),
        ],
        "explanation": "Godot'un düğüm sistemini doğru amaca göre seçmek oyun performansını doğrudan etkiler."
    }

# ==========================================
# C QUESTIONS POOL
# ==========================================
def get_c_mc_questions(unit_num, lesson_num, topic, title):
    pool = [
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            "codeSnippet": "int x = 10;\nint *ptr = ___x;",
            "options": ["& (Address-of)", "* (Dereference)", "% (Mod)", "$ (Value)"],
            "correctIndex": 0,
            "explanation": "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            "codeSnippet": "int x = 5;\nint *p = &x;\n___p = 20; // x artik 20 olur",
            "options": ["* (Dereference)", "&", "->", "."],
            "correctIndex": 0,
            "explanation": "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            "codeSnippet": "int *arr = (int*)___(10 * sizeof(int));",
            "options": ["malloc", "alloc", "new", "heap_get"],
            "correctIndex": 0,
            "explanation": "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            "codeSnippet": "int *buf = malloc(1024);\n// ... kullanim ...\n___(buf);",
            "options": ["free", "delete", "release", "dispose"],
            "correctIndex": 0,
            "explanation": "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            "codeSnippet": "int *p = ___(100, sizeof(int));",
            "options": ["calloc", "malloc", "realloc", "zalloc"],
            "correctIndex": 0,
            "explanation": "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            "codeSnippet": "ptr = ___(ptr, new_size);",
            "options": ["realloc", "resize", "remalloc", "expand"],
            "correctIndex": 0,
            "explanation": "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            "codeSnippet": None,
            "options": [
                "Preprocessor -> Compiler -> Assembler -> Linker",
                "Compiler -> Preprocessor -> Linker -> Assembler",
                "Assembler -> Compiler -> Linker -> Preprocessor",
                "Linker -> Assembler -> Compiler -> Preprocessor"
            ],
            "correctIndex": 0,
            "explanation": "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld)."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            "codeSnippet": "printf(\"%zu\", sizeof(int*));",
            "options": ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            "correctIndex": 0,
            "explanation": "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            "codeSnippet": "struct User *u = getUser();\nu___name = \"Ahmet\";",
            "options": ["-> (Ok operatörü)", ".", "::", "=>"],
            "correctIndex": 0,
            "explanation": "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            "codeSnippet": "___ generic_ptr = &x;",
            "options": ["void*", "any*", "object*", "generic*"],
            "correctIndex": 0,
            "explanation": "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            "codeSnippet": "free(ptr);\nprintf(\"%d\", *ptr); // HATA!",
            "options": [
                "Dangling Pointer (Askıda Kalan İşaretçi)",
                "Stack Overflow",
                "Memory Leak",
                "Deadlock"
            ],
            "correctIndex": 0,
            "explanation": "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            "codeSnippet": "$ ___ --leak-check=full ./program",
            "options": ["valgrind", "gdb", "perf", "strace"],
            "correctIndex": 0,
            "explanation": "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            "codeSnippet": "int x = 5;\nint y = x ___ 1; // y = 10 olur",
            "options": ["<<", ">>", "&", "|"],
            "correctIndex": 0,
            "explanation": "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            "codeSnippet": "FILE *f = ___(\"data.txt\", \"r\");",
            "options": ["fopen", "open", "file_open", "create_file"],
            "correctIndex": 0,
            "explanation": "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            "codeSnippet": "#ifndef MY_HEADER_H\n#define MY_HEADER_H\n// ...\n#endif",
            "options": ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            "correctIndex": 0,
            "explanation": "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller."
        },
        {
            "type": "QuestionType.multipleChoice",
            "prompt": "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            "codeSnippet": "___ Data {\n    int i;\n    float f;\n    char str[20];\n};",
            "options": ["union", "struct", "class", "shared"],
            "correctIndex": 0,
            "explanation": "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar."
        },
    ]
    start = (lesson_num * 2) % len(pool)
    result = []
    for i in range(11):
        idx = (start + i) % len(pool)
        result.append(pool[idx])
    return result

def get_c_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            "blankOptions": ["NULL", "0xFF", "void", "NaN"],
            "correctBlankAnswer": "NULL",
            "explanation": "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            "blankOptions": ["sizeof", "lengthof", "bytesize", "countof"],
            "correctBlankAnswer": "sizeof",
            "explanation": "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner."
        },
        {
            "type": "QuestionType.fillInTheBlank",
            "prompt": "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            "blankOptions": ["fclose", "close", "file_exit", "dispose"],
            "correctBlankAnswer": "fclose",
            "explanation": "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır."
        }
    ]

def get_c_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {
            "type": "QuestionType.trueFalse",
            "prompt": "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            "isTrue": True,
            "explanation": "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir."
        },
        {
            "type": "QuestionType.trueFalse",
            "prompt": "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            "isTrue": False,
            "explanation": "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir."
        }
    ]

def get_c_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
        "matchingPairs": [
            ("malloc", "Heap üzerinde başlatılmamış bellek tahsisi"),
            ("free", "Dinamik belleği sisteme iade etme"),
            ("Valgrind", "Bellek sızıntılarını tespit eden analiz aracı"),
        ],
        "explanation": "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır."
    }

# ==========================================
# PYTHON, C#, KOTLIN, LINUX, JS, SQL, ALGO
# ==========================================
def get_python_mc_questions(unit_num, lesson_num, topic, title):
    pool = [
        {"prompt": "Python 3'te değişkenleri metin içerisine en okunaklı ve hızlı şekilde gömmek için hangi özellik kullanılır?", "codeSnippet": 'name = "Ali"\nmsg = ___', "options": ['f"Merhaba {name}"', '"Merhaba %s" % name', '"Merhaba {}".format(name)', 'str_cat("Merhaba", name)'], "correctIndex": 0, "explanation": "Python 3.6+ f-string yöntemi hem en okunabilir hem de derleme zamanında en hızlı formatlama şeklidir."},
        {"prompt": "Aşağıdaki veri tiplerinden hangisi Python'da değiştirilemez (immutable) bir koleksiyondur?", "codeSnippet": None, "options": ["tuple", "list", "dict", "set"], "correctIndex": 0, "explanation": "Tuple tanımlandıktan sonra elemanları değiştirilemez, eklenemez veya silinemez."},
        {"prompt": "Bir listenin elemanlarını tek satırda dönüştürüp filtrelemek için kullanılan Pythonic yapı hangisidir?", "codeSnippet": "[x * 2 for x in nums if x > 0]", "options": ["List Comprehension", "Lambda Map", "Inline Loop", "Array Filter"], "correctIndex": 0, "explanation": "List Comprehensions temiz ve yüksek performanslı liste üretme yöntemidir."},
        {"prompt": "Büyük bir veri kümesini belleğe tek seferde yüklemeyip talep edildikçe sırayla üreten fonksiyonlarda hangi anahtar kelime kullanılır?", "codeSnippet": "def counter():\n    for i in range(100):\n        ___ i", "options": ["yield", "return", "generate", "produce"], "correctIndex": 0, "explanation": "'yield' fonksiyonu bir Generator nesnesine dönüştürür ve durumu dondurarak sıradaki elemanı üretir."},
        {"prompt": "Python'da başka bir fonksiyonun davranışını onu değiştirmeden genişletmek için kullanılan sözdizimi nedir?", "codeSnippet": "___login_required\ndef profile_view():\n    pass", "options": ["@ (Decorator)", "# (Directive)", "& (Mixin)", "$ (Hook)"], "correctIndex": 0, "explanation": "Decorator'lar fonksiyonları sarmallayarak loglama, yetkilendirme gibi ortak işlevleri ekler."},
        {"prompt": "Dosya işlemlerinde açılan dosyanın işlem bitince otomatik olarak güvenle kapatılmasını hangi blok sağlar?", "codeSnippet": "___ open('test.txt') as f:\n    content = f.read()", "options": ["with", "using", "try", "auto"], "correctIndex": 0, "explanation": "'with' ifadesi Context Manager protokolünü (__enter__ ve __exit__) işleterek kaynakları garantiyle kapatır."},
        {"prompt": "Bir sınıfta nesne örneği oluşturulurken ilk çağrılan kurucu (constructor) dunder metot hangisidir?", "codeSnippet": "class Dev:\n    def ___(self, name):\n        self.name = name", "options": ["__init__", "__new__", "__construct__", "__start__"], "correctIndex": 0, "explanation": "__init__ nesne örneklendiğinde ilk başlatıcı metot olarak çalışır."},
        {"prompt": "İki küme (set) arasındaki ortak elemanları (kesişim) bulmak için hangi operatör kullanılır?", "codeSnippet": "set_a = {1, 2, 3}\nset_b = {2, 3, 4}\ncommon = set_a ___ set_b", "options": ["&", "|", "^", "-"], "correctIndex": 0, "explanation": "'&' operatörü iki kümenin kesişimini (intersection) hesaplar."},
        {"prompt": "Python'da bir fonksiyonun değişken sayıda isimlendirilmiş argüman alabilmesi için parametreye ne eklenir?", "codeSnippet": "def config(___):", "options": ["**kwargs", "*args", "$params", "..rest"], "correctIndex": 0, "explanation": "**kwargs gelen isimlendirilmiş argümanları bir sözlük (dict) olarak toplar."},
        {"prompt": "Sözlükte (dictionary) aranan bir anahtar yoksa varsayılan değer dönmesi için hangi metot kullanılır?", "codeSnippet": "val = user.___('age', 18)", "options": ["get", "find", "lookup", "fetch"], "correctIndex": 0, "explanation": "dict.get(key, default) anahtar bulunamadığında KeyError fırlatmaz, varsayılan değeri döner."},
        {"prompt": "Asenkron Python programlamada coroutine fonksiyonu tanımlamak için hangi anahtar kelime kullanılır?", "codeSnippet": "___ def fetch_data():\n    await asyncio.sleep(1)", "options": ["async", "future", "thread", "coroutine"], "correctIndex": 0, "explanation": "'async def' ile tanımlanan fonksiyonlar 'await' edilebilir coroutine üretir."},
    ]
    return pool

def get_python_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Bir nesnenin kullanıcı dostu okunabilir metin temsilini tanımlamak için _____ dunder metodu ezilir.", "blankOptions": ["__str__", "__repr__", "__print__", "__text__"], "correctBlankAnswer": "__str__", "explanation": "__str__ print() çağrıldığında ekrana basılacak formatı belirler."},
        {"prompt": "Fonksiyonel programlamada isimsiz tek satırlık anonim fonksiyon tanımlamak için _____ anahtar kelimesi kullanılır.", "blankOptions": ["lambda", "def", "func", "inline"], "correctBlankAnswer": "lambda", "explanation": "lambda x: x * 2 anonim fonksiyon tanımlar."},
        {"prompt": "Listeye yeni bir elemanı sonuna eklemek için listenin _____ metodu çağrılır.", "blankOptions": ["append", "add", "push", "insert"], "correctBlankAnswer": "append", "explanation": "list.append(eleman) listenin sonuna yeni öğe ekler."}
    ]

def get_python_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Python'da fonksiyon varsayılan argümanı olarak [] (boş liste) gibi mutable nesneler tanımlamak güvenlidir ve önerilir.", "isTrue": False, "explanation": "Yanlıştır! Mutable varsayılan argümanlar tüm çağrılar arasında paylaşılır ve beklenmeyen buglara yol açar; 'arg=None' kullanılmalıdır."},
        {"prompt": "Python'da değişkenler bellek adreslerine referans tutar, bu yüzden 'b = a' yapıldığında nesne kopyalanmaz, aynı nesneye işaret edilir.", "isTrue": True, "explanation": "Doğrudur, Python nesne tabanlı referans modelini kullanır."}
    ]

def get_python_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Python kavramlarını tanımlarıyla eşleştirin.",
        "matchingPairs": [
            ("yield", "Bellek dostu Generator üretimi"),
            ("with", "Context Manager ile otomatik kaynak yönetimi"),
            ("f-string", "Performanslı ve okunabilir metin formatlama"),
        ],
        "explanation": "Pythonic yazım standartları kodun verimini artırır."
    }

# Generic fallback builder for other tracks to guarantee 540 questions per track
def make_track_mc(name, code_sample, concepts):
    result = []
    for c in concepts:
        result.append({
            "type": "QuestionType.multipleChoice",
            "prompt": f"{name} ekosisteminde {c[0]} kavramının temel amacı nedir?",
            "codeSnippet": code_sample,
            "options": [c[1], "Sadece eski sürümlerle uyumluluk sağlamak", "İşletim sistemini zorla yeniden başlatmak", "Bellekte tüm nesneleri anında sıfırlamak"],
            "correctIndex": 0,
            "explanation": f"{c[0]}: {c[2]}"
        })
    return result

def get_csharp_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("LINQ", "Koleksiyonlar üzerinde bildirimsel sorgulama yapmak", "Select, Where, OrderBy gibi metotlarla veri filtrelemeyi kolaylaştırır."),
        ("async / await", "İş parçacığını bloke etmeden asenkron operasyon yürütmek", "Task tabanlı asenkron yapıyı okunabilir senkron koda dönüştürür."),
        ("Value vs Reference", "Stack ve Heap bellek ayrımını yönetmek", "int, struct değer tipiyken; class, string referans tipidir."),
        ("record", "Değişmez (immutable) veri modelleri oluşturmak", "Değer bazlı eşitlik (value equality) sağlar."),
        ("Span<T>", "Ekstra heap tahsisi yapmadan belleğin bir dilimini okumak", "Sıfır bellek kopyalamayla yüksek performans sağlar."),
        ("IDisposable & using", "Yönetilmeyen kaynakları bellekten serbest bırakmak", "Dosya ve veritabanı bağlantılarını iş bitince garantiyle kapatır."),
        ("Interface", "Sınıflar için sözleşme (contract) tanımlamak", "Çok biçimlilik ve Dependency Injection'ın temelidir."),
        ("Generic (List<T>)", "Tip güvenli ve boxing/unboxing yapmayan koleksiyonlar", "Çalışma zamanında performans ve tip kontrolü sağlar."),
        ("Pattern Matching", "Tipleri ve veri desenlerini zarifçe denetlemek", "C# modern switch ifadelerinde güçlü eşleme yapar."),
        ("Garbage Collector (GC)", "Kullanılmayan heap bellek alanlarını otomatik temizlemek", "Yazılımcıyı manuel bellek yönetiminden kurtarır."),
        ("Delegates & Func/Action", "Metot referanslarını parametre olarak taşımak", "Olaylar (events) ve callback mimarisi için kullanılır."),
    ]
    return make_track_mc("C# / .NET", "var seniors = devs.Where(d => d.Level == \"Senior\");", concepts)

def get_csharp_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "C#'ta bir nesnenin IDisposable arayüzünü otomatik işletmesi için _____ bloğu kullanılır.", "blankOptions": ["using", "with", "apply", "dispose"], "correctBlankAnswer": "using", "explanation": "using bloğu çıkışında nesnenin Dispose() metodu garantiyle çağrılır."},
        {"prompt": "Geriye değer döndürmeyen bir metot referansını temsil eden hazır generic delege tipi _____ tipidir.", "blankOptions": ["Action", "Func", "Predicate", "Task"], "correctBlankAnswer": "Action", "explanation": "Action geriye void döner, Func ise son tip parametresini değer olarak döner."},
        {"prompt": "LINQ sorgularında sonuç kümesini dönüştürmek (projeksiyon) için _____ metodu kullanılır.", "blankOptions": ["Select", "Where", "Map", "Filter"], "correctBlankAnswer": "Select", "explanation": "Select SQL'deki SELECT projeksiyonunun karşılığıdır."}
    ]

def get_csharp_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "C#'ta struct bir değer tipidir ve genelde Stack belleğinde saklanır.", "isTrue": True, "explanation": "Doğrudur, struct değer tipi, class ise referans tipidir."},
        {"prompt": "LINQ sorguları tanımlandığı anda derhal yürütülür ve tüm veriyi belleğe çeker.", "isTrue": False, "explanation": "Yanlıştır! LINQ ertelenmiş çalışma (deferred execution) kullanır; ToList() veya foreach çağrılana dek çalışmaz."}
    ]

def get_csharp_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "C# bileşenlerini işlevleriyle eşleştirin.",
        "matchingPairs": [
            ("LINQ", "Bildirimsel veri sorgulama"),
            ("async/await", "Asenkron görev yönetimi"),
            ("Span<T>", "Sıfır kopyalamalı bellek dilimi"),
        ],
        "explanation": ".NET 8 modern mimarisinde bu bileşenler standarttır."
    }

def get_kotlin_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("Null Safety (?)", "NullPointerException hatalarını derleme zamanında önlemek", "Nullable tipler soru işareti ile açıkça belirtilir."),
        ("Elvis Operatörü (?:)", "Null durumunda alternatif bir değer sağlamak", "val name = user?.name ?: 'Anonim'"),
        ("data class", "toString, equals, hashCode ve copy metotlarını otomatik üretmek", "Veri tutan modeller için idealdir."),
        ("Coroutines", "Hafif iş parçacıkları (lightweight threads) ile asenkron kod yazmak", "Milyonlarca coroutine çok az bellekle eşzamanlı çalışabilir."),
        ("Extension Functions", "Var olan bir sınıfa miras almadan yeni metotlar eklemek", "String.isValidEmail() gibi genişletmeler yapılabilir."),
        ("sealed class", "Sınırlı sayıda alt sınıf hiyerarşisi oluşturmak", "when ifadesinde tüm durumların eksiksiz kontrol edilmesini sağlar."),
        ("Flow", "Asenkron ve reaktif veri akışlarını soğuk (cold) akış olarak yönetmek", "Kotlin coroutines ekosisteminin reaktif parçasıdır."),
        ("val vs var", "Değişmez (read-only) ve değiştirilebilir değişken tanımlamak", "val bir kez atanır ve yeniden atanamaz."),
        ("Scope Functions (let, apply, also)", "Nesneler üzerinde bağlamsal bloklar çalıştırmak", "apply nesne yapılandırması için, let null kontrolü için yaygındır."),
        ("companion object", "Sınıf seviyesinde statik benzeri metot ve özellikler barındırmak", "Fabrika metotları oluşturmak için kullanılır."),
        ("Smart Cast", "Tip kontrolü yapıldıktan sonra otomatik tür dönüşümü yapmak", "is String kontrolünden sonra değişken doğrudan String gibi kullanılır."),
    ]
    return make_track_mc("Kotlin", "val name: String? = user?.name ?: \"Misafir\"", concepts)

def get_kotlin_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Kotlin'de salt okunur (read-only) değişken tanımlamak için _____ anahtar kelimesi kullanılır.", "blankOptions": ["val", "var", "const", "let"], "correctBlankAnswer": "val", "explanation": "val (value) değiştirilemez referans tanımlar."},
        {"prompt": "Sınırlı sayıda alt türe izin veren güvenli hiyerarşiler kurmak için _____ class kullanılır.", "blankOptions": ["sealed", "data", "open", "abstract"], "correctBlankAnswer": "sealed", "explanation": "sealed class tüm türevlerin aynı dosyada bilinmesini zorunlu kılar."},
        {"prompt": "Bir fonksiyonun coroutine içinde askıya alınıp devam edebilmesi için başına _____ eklenir.", "blankOptions": ["suspend", "async", "await", "coroutine"], "correctBlankAnswer": "suspend", "explanation": "suspend fonksiyonlar iş parçacığını engellemeden askıya alınabilir."}
    ]

def get_kotlin_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Kotlin'de varsayılan olarak tüm sınıflar 'final'dır ve kalıtım için 'open' anahtar kelimesi gerekir.", "isTrue": True, "explanation": "Doğrudur, Joshua Bloch'un 'Design for inheritance or prohibit it' kuralı uygulanır."},
        {"prompt": "Kotlin'de '!!' operatörü kullanmak tamamen güvenlidir ve derleme garantisi sunar.", "isTrue": False, "explanation": "Yanlıştır! '!!' eğer değer null ise NullPointerException patlatır."}
    ]

def get_kotlin_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Kotlin kavramlarını karşılıklarıyla eşleştirin.",
        "matchingPairs": [
            ("val", "Yeniden atanamayan değişmez referans"),
            ("Elvis (?:)", "Null durumunda varsayılan değer dönme"),
            ("Coroutines", "Hafif ve ölçeklenebilir eşzamanlılık"),
        ],
        "explanation": "Kotlin güvenli ve modern syntax'ı ile JVM dünyasında öne çıkar."
    }

def get_linux_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("Pipe (|)", "Bir komutun çıktısını diğerine girdi olarak bağlamak", "Komutların zincirleme çalışmasını sağlar."),
        ("grep", "Metin dosyalarında veya çıktılarda regex deseni aramak", "Log filtreleme ve analizde en yaygın araçtır."),
        ("chmod", "Dosya ve dizin izinlerini (okuma, yazma, çalıştırma) değiştirmek", "chmod 755 dosya.sh"),
        ("chown", "Dosyanın kullanıcı ve grup sahipliğini değiştirmek", "chown user:group dosya"),
        ("Standard Redirection (>>)", "Çıktıyı dosyanın sonuna eklemek (append)", "Mevcut içeriği ezmeden log kaydetmeyi sağlar."),
        ("ps aux & top", "Sistemde çalışan süreçleri ve kaynak tüketimini izlemek", "CPU ve bellek kullanımını gösterir."),
        ("kill -9", "Cevap vermeyen bir süreci anında ve zorla sonlandırmak", "SIGKILL sinyali gönderir."),
        ("find", "Dizin ağacında isim, boyut ve tarihe göre arama yapmak", "find /var/log -name '*.log'"),
        ("sed & awk", "Metin akışlarını satır ve sütun bazında düzenlemek", "Bash otomasyonunun en güçlü metin işleyicileridir."),
        ("systemctl", "Linux sistem servislerini başlatmak, durdurmak ve izlemek", "systemd servis yöneticisidir."),
        ("tar -czvf", "Dosyaları tek bir arşivde toplayıp gzip ile sıkıştırmak", "Yedekleme ve dağıtım için kullanılır."),
    ]
    return make_track_mc("Linux & Bash", "cat /var/log/syslog | grep -i 'error' | wc -l", concepts)

def get_linux_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Dosyaya tam okuma, yazma ve çalıştırma yetkisi (rwx) veren sekizlik rakam _____ rakamıdır.", "blankOptions": ["7", "6", "5", "4"], "correctBlankAnswer": "7", "explanation": "4 (read) + 2 (write) + 1 (execute) = 7."},
        {"prompt": "Bir komutun hem standart çıktısını hem de hata çıktısını log dosyasına yönlendirmek için _____ yazılır.", "blankOptions": ["2>&1", "1>&2", ">&all", "--all-out"], "correctBlankAnswer": "2>&1", "explanation": "2>&1 standart hatayı (stderr 2) standart çıktıya (stdout 1) yönlendirir."},
        {"prompt": "Linux'ta bir sürecin PID numarasını öğrenmek için 'pgrep' veya '_____ aux' kullanılır.", "blankOptions": ["ps", "top", "ls", "proc"], "correctBlankAnswer": "ps", "explanation": "'ps aux' çalışan tüm süreçleri listeler."}
    ]

def get_linux_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Linux dosya sisteminde dosya ve dizin isimleri büyük/küçük harfe duyarlıdır (case-sensitive).", "isTrue": True, "explanation": "Doğrudur, 'Test.txt' ve 'test.txt' iki ayrı dosyadır."},
        {"prompt": "'rm -rf /' komutu güvenlidir ve sadece geçici çöp kutusunu temizler.", "isTrue": False, "explanation": "Yanlıştır! 'rm -rf /' kök dizindeki her şeyi kalıcı olarak siler ve sistemi çökertebilir."}
    ]

def get_linux_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Linux komutlarını işlevleriyle eşleştirin.",
        "matchingPairs": [
            ("grep", "Metin ve regex filtreleme"),
            ("chmod", "Dosya erişim izinlerini değiştirme"),
            ("kill -9", "Süreci zorla sonlandırma (SIGKILL)"),
        ],
        "explanation": "Linux CLI araçları sunucu yönetiminde vazgeçilmezdir."
    }

def get_javascript_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("Event Loop", "Tek iş parçacığında asenkron görevleri kuyruklamak", "Call Stack, Microtask Queue ve Macrotask Queue arasındaki koordinasyonu sağlar."),
        ("Promise & async/await", "Asenkron işlemleri 'Callback Hell'e girmeden yönetmek", "Temiz ve yönetilebilir asenkron kod yazmayı sağlar."),
        ("Closures (Kapsam)", "Bir fonksiyonun tanımlandığı dış kapsamdaki değişkenleri hatırlaması", "Kapsülleme ve durum saklama için kullanılır."),
        ("map vs forEach", "Yeni bir dizi dönmek veya sadece yan etki (side-effect) üretmek", "map yeni dizi döner, forEach void döner."),
        ("Destructuring", "Nesne veya dizi elemanlarını doğrudan değişkenlere parçalamak", "const { name, age } = user;"),
        ("Spread Operatörü (...)", "Dizileri veya nesneleri kopyalayıp genişletmek", "const newArr = [...oldArr, 4];"),
        ("=== (Strict Equality)", "Tip dönüşümü yapmadan hem tip hem değer eşitliğini kontrol etmek", "'5' === 5 false döner."),
        ("Event Bubbling", "Olayın en içteki elemandan başlayıp en dışa doğru yayılması", "stopPropagation ile engellenebilir."),
        ("LocalStorage", "Tarayıcı kapansa bile veriyi kalıcı olarak saklamak", "5-10 MB anahtar-değer depolama sunar."),
        ("Arrow Functions", "Kendi 'this' bağlamına sahip olmayan kısa fonksiyon yazımı", "Lexical this kullanır."),
        ("fetch API", "Tarayıcıdan HTTP istekleri göndermek", "Promise tabanlı modern ağ istemcisidir."),
    ]
    return make_track_mc("JavaScript", "const data = await fetch('/api').then(r => r.json());", concepts)

def get_javascript_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "JavaScript'te blok düzeyinde kapsam (block-scope) ve yeniden atanabilen değişken tanımlamak için _____ kullanılır.", "blankOptions": ["let", "var", "const", "def"], "correctBlankAnswer": "let", "explanation": "let blok kapsamlıdır, var fonksiyon kapsamlıdır."},
        {"prompt": "JSON formatındaki metni JavaScript nesnesine dönüştürmek için 'JSON._____' metodu kullanılır.", "blankOptions": ["parse", "stringify", "toObject", "decode"], "correctBlankAnswer": "parse", "explanation": "JSON.parse() metni nesneye çevirir; JSON.stringify() nesneyi metne çevirir."},
        {"prompt": "Bir dizideki tüm elemanları tek bir kümülatif değere indirgemek için dizinin _____ metodu çağrılır.", "blankOptions": ["reduce", "map", "filter", "aggregate"], "correctBlankAnswer": "reduce", "explanation": "arr.reduce((acc, curr) => acc + curr, 0) toplamı hesaplar."}
    ]

def get_javascript_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "JavaScript'te 'typeof null' ifadesi 'object' döner; bu JS'in ilk sürümlerinden kalan tarihi bir hatadır.", "isTrue": True, "explanation": "Doğrudur, geriye uyumluluk adına bu tarihi davranış değiştirilmemiştir."},
        {"prompt": "JavaScript'te Promise microtask kuyruğu, setTimeout gibi macrotask görevlerinden SONRA çalıştırılır.", "isTrue": False, "explanation": "Yanlıştır! Microtask kuyruğu her zaman macrotask'lardan ÖNCE boşaltılır."}
    ]

def get_javascript_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "JavaScript metotlarını işlevleriyle eşleştirin.",
        "matchingPairs": [
            ("Array.map()", "Her elemanı dönüştürüp yeni dizi üretme"),
            ("JSON.stringify()", "Nesneyi JSON metnine çevirme"),
            ("Event Loop", "Asenkron kuyrukları koordine etme"),
        ],
        "explanation": "Modern web geliştirmede JS temelleri kritiktir."
    }

def get_sql_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("INNER JOIN", "Yalnızca her iki tabloda da eşleşen kayıtları getirmek", "Eşleşmeyen satırlar sonuç kümesine dahil edilmez."),
        ("LEFT JOIN", "Sol tablodaki TÜM kayıtları ve sağ tablodaki eşleşenleri getirmek", "Sağda karşılığı yoksa NULL basılır."),
        ("GROUP BY & HAVING", "Satırları gruplayıp toplamlar üzerinde filtre uygulamak", "HAVING aggregate fonksiyonlar (COUNT, SUM) ile kullanılır."),
        ("B-Tree Index", "Sorgu arama sürelerini O(N)'den O(log N)'e düşürmek", "WHERE ve JOIN koşullarındaki sütunlar indekslenir."),
        ("Primary Key", "Her satırı benzersiz (unique) kılan ve NULL olamayan birincil anahtar", "Fiziksel depolamada clustered index oluşturur."),
        ("Foreign Key", "Tablolar arasındaki referans bütünlüğünü (referential integrity) korumak", "Olmayan bir kayda referans verilmesini engeller."),
        ("ACID Prensipleri", "İlişkisel veritabanlarında işlem güvenliğini garanti etmek", "Atomicity, Consistency, Isolation, Durability."),
        ("Transaction (COMMIT / ROLLBACK)", "Bir grup işlemi 'ya hepsi ya hiçbiri' mantığıyla çalıştırmak", "Hata durumunda ROLLBACK ile önceki duruma dönülür."),
        ("Subquery (Alt Sorgu)", "Bir SQL sorgusunun içinde başka bir SELECT çalıştırmak", "WHERE id IN (SELECT ...) kalıbı yaygındır."),
        ("Normalization (1NF, 2NF, 3NF)", "Veri tekrarını (redundancy) önlemek ve anomalileri kaldırmak", "Tabloları mantıksal küçük parçalara böler."),
        ("DISTINCT", "Sonuç kümesindeki mükerrer (duplicate) satırları temizlemek", "Yalnızca tekil değerleri listeler."),
    ]
    return make_track_mc("SQL & Veritabanı", "SELECT u.name, COUNT(o.id) FROM users u LEFT JOIN orders o ON u.id = o.user_id GROUP BY u.name;", concepts)

def get_sql_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "SQL'de aggregate sonuçlar üzerinde filtreleme yapmak için WHERE yerine _____ anahtar kelimesi kullanılır.", "blankOptions": ["HAVING", "GROUP", "FILTER", "LIMIT"], "correctBlankAnswer": "HAVING", "explanation": "HAVING gruplama sonrasındaki toplamlar (SUM, COUNT) için filtredir."},
        {"prompt": "Bir tablodan belirli bir koşulu sağlayan satırları silmek için '_____ FROM tablo WHERE ...' kullanılır.", "blankOptions": ["DELETE", "DROP", "TRUNCATE", "REMOVE"], "correctBlankAnswer": "DELETE", "explanation": "DELETE satırları siler; DROP tüm tabloyu ve yapısını siler."},
        {"prompt": "Sorgu sonucunda sadece en üstteki ilk 10 satırı getirmek için sorgu sonuna '_____ 10' eklenir.", "blankOptions": ["LIMIT", "TOP", "FIRST", "TAKE"], "correctBlankAnswer": "LIMIT", "explanation": "LIMIT çekilecek maksimum satır adedini sınırlar."}
    ]

def get_sql_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Bir sütunda indeks oluşturmak SELECT sorgularını hızlandırırken INSERT ve UPDATE işlemlerini bir miktar yavaşlatır.", "isTrue": True, "explanation": "Doğrudur, her veri yazmada indeks ağacının da güncellenmesi gerekir."},
        {"prompt": "SQL'de 'WHERE col = NULL' ifadesi NULL değerleri kontrol etmek için doğru ve standart sözdizimidir.", "isTrue": False, "explanation": "Yanlıştır! NULL eşitlikle karşılaştırılamaz; 'WHERE col IS NULL' yazılmalıdır."}
    ]

def get_sql_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "SQL birleştirme türlerini eşleştirin.",
        "matchingPairs": [
            ("INNER JOIN", "Yalnızca her iki tabloda eşleşenler"),
            ("LEFT JOIN", "Soldaki tüm satırlar + sağdaki eşleşenler"),
            ("ACID", "İşlem güvenliği prensipleri"),
        ],
        "explanation": "Veritabanı ilişkileri ve bütünlüğü SQL'in temelidir."
    }

def get_algorithms_mc_questions(unit_num, lesson_num, topic, title):
    concepts = [
        ("O(1) Karmaşıklık", "Girdi boyutu ne olursa olsun sabit sürede çalışmak", "Hash table'dan anahtarla değer okumak."),
        ("O(log n) Karmaşıklık", "Her adımda arama uzayını yarıya indirmek", "Sıralı dizide Binary Search yapmak."),
        ("O(n log n) Karmaşıklık", "Verimli karşılaştırma tabanlı sıralama algoritmaları", "Merge Sort ve ortalama durumda Quick Sort."),
        ("Stack (Yığın - LIFO)", "Son giren ilk çıkar mantığıyla çalışmak", "Geri al (Undo) mekanizması ve çağrı yığını (call stack)."),
        ("Queue (Kuyruk - FIFO)", "İlk giren ilk çıkar mantığıyla çalışmak", "Yazıcı kuyruğu ve mesajlaşma sıraları (Kafka, RabbitMQ)."),
        ("Hash Table Çarpışması (Collision)", "İki farklı anahtarın aynı hash indeksini üretmesi", "Chaining (bağlı liste) veya Open Addressing ile çözülür."),
        ("Binary Search Tree (BST)", "Sol alt ağaçta küçük, sağ alt ağaçta büyük düğümler tutmak", "Arama, ekleme ve silme ortalama O(log n) sürer."),
        ("Breadth-First Search (BFS)", "Grafik ve ağaçları seviye seviye (katman katman) gezmek", "En kısa yolu bulmak için Queue kullanılır."),
        ("Depth-First Search (DFS)", "En derine kadar gidip geri dönerek (backtracking) gezmek", "Stack veya recursion ile gerçekleştirilir."),
        ("Dinamik Programlama (DP)", "Karmaşık bir problemi alt problemlere bölüp sonuçları önbelleklemek", "Fibonacci ve sırt çantası (Knapsack) problemlerini çözer."),
        ("QuickSort Worst-Case", "Kötü pivot seçildiğinde O(n^2) sürede çalışması", "Zaten sıralı dizide ilk veya son eleman pivot seçildiğinde oluşur."),
    ]
    return make_track_mc("Algoritmalar", "def search(arr, target): low, high = 0, len(arr)-1", concepts)

def get_algorithms_fib_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Sıralı bir dizide Binary Search algoritmasının zaman karmaşıklığı O(_____) mertebesindedir.", "blankOptions": ["log n", "1", "n", "n^2"], "correctBlankAnswer": "log n", "explanation": "Her adımda diziyi ikiye böldüğü için logaritmik sürede bulur."},
        {"prompt": "LIFO (Son Giren İlk Çıkar) prensibiyle çalışan temel veri yapısı _____ veri yapısıdır.", "blankOptions": ["Stack", "Queue", "Tree", "Graph"], "correctBlankAnswer": "Stack", "explanation": "Yığın (Stack) elemanları üstten ekler (push) ve üstten çıkarır (pop)."},
        {"prompt": "Dinamik programlamada daha önce hesaplanan alt problem sonuçlarını hafızada saklamaya _____ denir.", "blankOptions": ["Memoization", "Recursion", "Iteration", "Sorting"], "correctBlankAnswer": "Memoization", "explanation": "Memoization hesaplama sonuçlarını önbelleğe alarak mükerrer işi önler."}
    ]

def get_algorithms_tf_questions(unit_num, lesson_num, topic, title):
    return [
        {"prompt": "Merge Sort algoritmasının zaman karmaşıklığı en kötü durumda daima O(n log n)'dir.", "isTrue": True, "explanation": "Doğrudur, Merge Sort garantili O(n log n) performansı sunar."},
        {"prompt": "Bir Hash Table veri yapısında anahtarla okuma işlemi her zaman istisnasız O(1) sürer, asla O(n) olamaz.", "isTrue": False, "explanation": "Yanlıştır! Tüm anahtarlar aynı bucket'a çarpışırsa (worst case hash collision) arama süresi O(n)'e düşebilir."}
    ]

def get_algorithms_matching(unit_num, lesson_num, topic, title):
    return {
        "type": "QuestionType.matching",
        "prompt": "Veri yapılarını ve karmaşıklıklarını eşleştirin.",
        "matchingPairs": [
            ("Binary Search", "O(log n) sıralı arama"),
            ("Stack", "LIFO son giren ilk çıkar"),
            ("Queue", "FIFO ilk giren ilk çıkar"),
        ],
        "explanation": "Algoritmalar ve veri yapıları mülakatların ve performansın temelidir."
    }
