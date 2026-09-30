# -*- coding: utf-8 -*-
"""
Question Bank Builder for CodeQuest 5000+
Generates 18 structured, high-value questions per lesson:
- 1 Concept Card (Hap Bilgi & İpuçları)
- 11 Multiple Choice (Teknik senaryolar, kod inceleme, mülakat soruları)
- 3 Fill-in-the-Blank (Boşluk doldurma)
- 2 True/False (Doğru/Yanlış)
- 1 Matching Pairs (Eşleştirme)
"""

import random

# Helper to build consistent questions
def generate_lesson_questions(track, unit_num, lesson_num, lesson_id, topic, title, is_exam=False):
    questions = []
    
    # 1. Concept Card
    card = get_concept_card(track, unit_num, lesson_num, topic, title)
    card["id"] = f"{lesson_id}_q1"
    questions.append(card)
    
    # 2. 11 Multiple Choice Questions (q2 to q12)
    mc_list = get_multiple_choice_questions(track, unit_num, lesson_num, topic, title, count=11)
    for idx, mc in enumerate(mc_list):
        mc["id"] = f"{lesson_id}_q{idx+2}"
        questions.append(mc)
        
    # 3. 3 Fill In The Blank Questions (q13 to q15)
    fib_list = get_fill_in_blank_questions(track, unit_num, lesson_num, topic, title, count=3)
    for idx, fib in enumerate(fib_list):
        fib["id"] = f"{lesson_id}_q{idx+13}"
        questions.append(fib)
        
    # 4. 2 True/False Questions (q16, q17)
    tf_list = get_true_false_questions(track, unit_num, lesson_num, topic, title, count=2)
    for idx, tf in enumerate(tf_list):
        tf["id"] = f"{lesson_id}_q{idx+16}"
        questions.append(tf)
        
    # 5. 1 Matching Question (q18)
    mat = get_matching_question(track, unit_num, lesson_num, topic, title)
    mat["id"] = f"{lesson_id}_q18"
    questions.append(mat)
    
    return questions


# ==========================================
# CONCEPT CARDS
# ==========================================
def get_concept_card(track, unit_num, lesson_num, topic, title):
    emoji_map = {
        "git": "🌿",
        "godot": "🎮",
        "c": "⚡",
        "python": "🐍",
        "csharp": "⚙️",
        "kotlin": "📱",
        "linux": "🐧",
        "javascript": "🌐",
        "sql": "🗄️",
        "algorithms": "🧩",
    }
    emoji = emoji_map.get(track, "💡")
    
    # Track specific curated rules and code examples
    details = get_topic_details(track, topic, title)
    
    return {
        "type": "QuestionType.conceptCard",
        "conceptTitle": f"{title} - Hap Bilgi",
        "rule": details["rule"],
        "codeExample": details["codeExample"],
        "devTip": details["devTip"],
        "iconEmoji": emoji,
    }


# ==========================================
# TOPIC DATABASE
# ==========================================
def get_topic_details(track, topic, title):
    # Git
    if track == "git":
        return get_git_topic_details(topic, title)
    elif track == "godot":
        return get_godot_topic_details(topic, title)
    elif track == "c":
        return get_c_topic_details(topic, title)
    elif track == "python":
        return get_python_topic_details(topic, title)
    elif track == "csharp":
        return get_csharp_topic_details(topic, title)
    elif track == "kotlin":
        return get_kotlin_topic_details(topic, title)
    elif track == "linux":
        return get_linux_topic_details(topic, title)
    elif track == "javascript":
        return get_javascript_topic_details(topic, title)
    elif track == "sql":
        return get_sql_topic_details(topic, title)
    elif track == "algorithms":
        return get_algorithms_topic_details(topic, title)
        
    return {
        "rule": f"{title} konusunda en iyi pratikleri uygulamak kod kalitesini ve ekip verimliliğini artırır.",
        "codeExample": "# Örnek kullanım\npass",
        "devTip": "Temiz kod ve tutarlı standartlar büyük projelerde hayat kurtarır."
    }

def get_git_topic_details(topic, title):
    data = {
        "git_init_philosophy": {
            "rule": "Git, merkezi bir sunucuya bağımlı olmayan dağıtık (distributed) bir versiyon kontrol sistemidir. 'git init' komutu mevcut klasörde '.git' adında gizli bir veritabanı oluşturur.",
            "codeExample": "# Yeni bir depo başlat\ngit init\n\n# Mevcut durumu doğrula\nls -la | grep .git",
            "devTip": ".git klasörünü silerseniz projenin tüm commit geçmişi silinir ancak çalışma dosyalarınız kalır."
        },
        "git_three_trees": {
            "rule": "Git mimarisi üç ana bölümden oluşur: Working Directory (üzerinde çalıştığınız dosyalar), Staging Area/Index (kaydedilmeye hazır bekleyenler) ve Repository (kalıcı commit veritabanı).",
            "codeExample": "# Working -> Staging\ngit add index.html\n\n# Staging -> Repo\ngit commit -m 'feat: anasayfa eklendi'",
            "devTip": "Staging area sayesinde sadece hazır olan dosyaları seçip atomik commitler oluşturabilirsiniz."
        },
        "git_status_diff": {
            "rule": "'git status' hangi dosyaların değiştiğini ve sahnelendiğini özetler. 'git diff' ise sahnelenmemiş satır bazlı farkları, 'git diff --staged' ise sahnelenmiş farkları gösterir.",
            "codeExample": "git status -s  # Kısa özet\ngit diff       # Çalışma alanı farkları\ngit diff --cached  # Stage farkları",
            "devTip": "Commit atmadan önce daima 'git diff --staged' ile tam olarak neyi kaydettiğinizi gözden geçirin."
        },
        "git_add_gitignore": {
            "rule": ".gitignore dosyası, Git'in takip etmesini istemediğimiz geçici dosyaları (node_modules, .env, build dosyaları) hariç tutmak için kullanılır.",
            "codeExample": "# .gitignore örneği\nnode_modules/\n*.log\n.env\nbuild/",
            "devTip": "Daha önce commit edilmiş bir dosyayı .gitignore'a eklerseniz takip edilmeye devam eder; 'git rm --cached <dosya>' ile indeksten çıkarmanız gerekir."
        },
        "git_commit_best_practices": {
            "rule": "İyi bir commit atomik olmalı (tek bir mantıksal değişikliği temsil etmeli) ve Conventional Commits formatını (feat:, fix:, chore:, docs:, refactor:) takip etmelidir.",
            "codeExample": "git commit -m 'feat(auth): JWT oturum açma akışı tamamlandı'\ngit commit -m 'fix(cart): sepet toplamındaki kuruş hatası düzeltildi'",
            "devTip": "Commit mesajının ilk satırını emir kipinde ve en fazla 50-72 karakter olacak şekilde yazın."
        },
        "git_branch_basics": {
            "rule": "Git'te bir branch (dal), belirli bir commite işaret eden hareketli ve hafif bir referanstır (pointer). HEAD ise şu anda üzerinde bulunduğunuz aktif dalı veya commiti gösterir.",
            "codeExample": "# Yeni dal oluştur\ngit branch feature-login\n\n# Dalları listele\ngit branch -a",
            "devTip": "Git dalları diskte sadece 41 baytlık bir SHA-1 hash dosyası tuttuğu için dal açmak milisaniyeler sürer."
        },
        "git_checkout_switch": {
            "rule": "Git 2.23 ile birlikte 'git checkout'un iki ayrı işlevi ayrıştırılmıştır: Dallar arası geçiş için 'git switch', dosya geri yüklemek için 'git restore' önerilir.",
            "codeExample": "# Yeni dala geç\ngit switch feature-login\n\n# Yeni dal oluştur ve geç\ngit switch -c feature-cart",
            "devTip": "'git switch -' komutu ile en son bulunduğunuz önceki dala anında geri dönebilirsiniz."
        },
        "git_merge_types": {
            "rule": "Hedef daldan sonra ana dalda yeni commit yoksa 'Fast-Forward' merge yapılır (pointer ileri kaydırılır). İki dalda da yeni commitler varsa '3-Way Merge' yapılarak yeni bir 'Merge Commit' üretilir.",
            "codeExample": "# main dalına geçip feature dalını birleştir\ngit switch main\ngit merge feature-cart\n\n# Fast-forward'ı zorla kapat\ngit merge --no-ff feature-cart",
            "devTip": "--no-ff bayrağı özelliğin bir dal olarak geliştirildiğini tarihçede görünür kılmak için sıklıkla tercih edilir."
        },
        "git_merge_conflicts": {
            "rule": "İki farklı dal aynı dosyanın aynı satırlarını değiştirdiğinde Git otomatik birleştirme yapamaz ve 'CONFLICT' verir. Dosyada <<<<<<< HEAD, ======= ve >>>>>>> etiketleri oluşur.",
            "codeExample": "<<<<<<< HEAD\nconst API_URL = 'https://api.v2.com';\n=======\nconst API_URL = 'https://api.v3.com';\n>>>>>>> feature-api",
            "devTip": "Çakışmaları manuel olarak düzenledikten sonra 'git add <dosya>' ve ardından 'git commit' çalıştırarak birleştirmeyi tamamlayın."
        },
        "git_branch_cleanup": {
            "rule": "Birleştirilmiş dalları 'git branch -d <dal>' ile güvenle silebilirsiniz. Eğer dal henüz merge edilmediyse ve silmek istiyorsanız 'git branch -D <dal>' zorlama bayrağı gerekir.",
            "codeExample": "git branch -d feature-done   # Güvenli silme\ngit branch -D feature-failed # Zorla silme",
            "devTip": "Uzak depodaki silinmiş dalların yerel referanslarını temizlemek için 'git fetch --prune' kullanın."
        },
        "git_remote_origin": {
            "rule": "'origin', klonlanan uzak deponun varsayılan takma adıdır. 'git remote -v' tanımlı tüm uzak URL'leri gösterir.",
            "codeExample": "git remote -v\ngit remote add upstream https://github.com/original/repo.git",
            "devTip": "Şirket içi ve açık kaynak projelerde 'origin' genelde kişisel çatalınızı, 'upstream' ise ana ana depoyu temsil eder."
        },
        "git_fetch_vs_pull": {
            "rule": "'git fetch', uzak depodaki yeni commitleri yerel depoya indirir ancak çalışma ağacınızı DEĞİŞTİRMEZ. 'git pull' ise arka planda önce 'git fetch' ardından 'git merge' çalıştırır.",
            "codeExample": "# Güvenli inceleme\ngit fetch origin\ngit log HEAD..origin/main --oneline\n\n# Anında birleştirme\ngit pull origin main",
            "devTip": "Kritik projelerde doğrudan pull yerine fetch edip farkları inceledikten sonra merge veya rebase yapmak daha güvenlidir."
        },
        "git_push_upstream": {
            "rule": "Yeni bir yerel dalı ilk kez uzak depoya gönderirken '-u' (--set-upstream) bayrağı kullanılır. Bu sayede sonraki seferlerde sadece 'git push' yazmak yeterli olur.",
            "codeExample": "git push -u origin feature-auth\n# Sonraki seferlerde:\ngit push",
            "devTip": "Aktif dalınızın hangi uzak dalı izlediğini 'git branch -vv' komutuyla görebilirsiniz."
        },
        "git_rebase_basics": {
            "rule": "Rebase, mevcut dalın başlangıç noktasını hedef dalın en son commitinin üzerine taşır. Tarihçeyi düzlemsel (linear) tutar ve merge commit kalabalığını önler.",
            "codeExample": "git switch feature\ngit rebase main",
            "devTip": "Altın Kural: Herkese açık (public/main) paylaşılan ortak dallarda ASLA rebase yapmayın!"
        },
        "git_interactive_rebase": {
            "rule": "'git rebase -i HEAD~N' komutu son N commiti düzenlemenizi sağlar. 'pick' (tut), 'squash' (öncekiyle birleştir), 'reword' (mesajı değiştir), 'drop' (sil) komutları kullanılır.",
            "codeExample": "git rebase -i HEAD~3\n# Açılan editörde:\n# pick a1b2c3 feat: ilk parça\n# squash d4e5f6 feat: ikinci parça",
            "devTip": "Ana dala PR atmadan önce küçük 'fix typo', 'wip' gibi gereksiz commitleri squash ile temizleyip tek bir anlamlı commit yapın."
        },
        "git_cherry_pick": {
            "rule": "'git cherry-pick <commit-hash>', başka bir daldaki belirli bir commiti mevcut dalınıza kopyalayıp yeni bir commit olarak uygular.",
            "codeExample": "git switch main\ngit cherry-pick 7a8b9c",
            "devTip": "Özellikle test dalında yapılan kritik bir acil hata düzeltmesini (hotfix) ana dala taşımak için mükemmel bir araçtır."
        },
        "git_reset_types": {
            "rule": "git reset HEAD~1 üç modda çalışır: --soft (değişiklikleri stage'de tutar), --mixed (varsayılan, değişiklikleri çalışma dizininde tutar), --hard (TÜM değişiklikleri ve commitleri kalıcı olarak siler).",
            "codeExample": "git reset --soft HEAD~1   # En güvenli, sadece commiti bozar\ngit reset --hard HEAD~1   # DİKKAT: Kodlar silinir!",
            "devTip": "Eğer yanlışlıkla reset --hard attıysanız telaşlanmayın, 'git reflog' ile kayıp commitinizin hash değerini bulup geri dönebilirsiniz."
        },
        "git_revert_stash_reflog": {
            "rule": "'git revert <hash>', commiti silmek yerine onun tam tersi etkisini yapan YENİ bir commit oluşturur. Uzak depoya gönderilmiş hataları geri almanın en güvenli yoludur.",
            "codeExample": "# Paylaşılan bir commiti güvenle geri al\ngit revert 4f5e6d\n\n# Yarım kalan işi kenara sakla\ngit stash\ngit stash pop",
            "devTip": "git stash sadece takip edilen (tracked) dosyaları saklar; yeni eklenen dosyalar için 'git stash -u' (untracked) kullanmalısınız."
        },
        "git_objects_internals": {
            "rule": "Git temelde bir İçerik Adreslenebilir Depodur (Content-Addressable Storage). 4 temel nesne türü vardır: Blob (dosya içeriği), Tree (dizin yapısı), Commit (yazar, tarih, tree referansı) ve Tag.",
            "codeExample": "# Bir nesnenin tipini ve içeriğini incele\ngit cat-file -t <hash>\ngit cat-file -p <hash>",
            "devTip": "Git dosya adlarını blob içinde değil, tree nesneleri içinde saklar. Bu sayede aynı içeriğe sahip iki dosya tek bir blob paylaşır."
        },
        "git_tag_semver": {
            "rule": "Tagler belirli bir commite sabitlenmiş etiketlerdir. 'Lightweight' (sadece bir işaretçi) ve 'Annotated' (-a ile yazar, tarih ve mesaj içeren tam nesne) olarak ikiye ayrılır.",
            "codeExample": "git tag -a v1.2.0 -m 'Release v1.2.0'\ngit push origin v1.2.0\ngit push origin --tags",
            "devTip": "Üretim ve sürüm yayınlarında (release) her zaman şifrelenebilir ve metaveri içeren 'annotated' tag kullanın."
        },
    }
    
    if topic in data:
        return data[topic]
    
    return {
        "rule": f"{title}: Git versiyon kontrolünde profesyonel iş akışları ve temiz tarihçe tutmanın temelleri.",
        "codeExample": f"# {title} ile ilgili komutlar\ngit status\ngit log --oneline --graph",
        "devTip": "Takım çalışmasında commit mesajı standartlarına ve dal isimlendirme kurallarına uymak çakışmaları %80 azaltır."
    }

def get_godot_topic_details(topic, title):
    return {
        "rule": "Godot 4, her şeyin bir 'Node' (Düğüm) ve düğümlerin birleşerek 'Scene' (Sahne) oluşturduğu modüler bir mimariye sahiptir. GDScript 2.0 ise Python benzeri sade ve oyun motoruna özel optimize edilmiş bir dildir.",
        "codeExample": r'''extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
    var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    velocity = input_vector * speed
    move_and_slide()''',
        "devTip": "Fizik ve hareket hesaplamalarında asla _process() kullanmayın; daima sabit zaman adımı olan _physics_process() kullanın."
    }

def get_c_topic_details(topic, title):
    return {
        "rule": "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
        "codeExample": r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
        "devTip": "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur."
    }

def get_python_topic_details(topic, title):
    return {
        "rule": "Modern Python (3.10+), dinamik ve güçlü tiplemeyi bir arada sunar. List Comprehensions, Generator'lar ve Decorator'lar temiz ve Pythonic kod yazmanın temel taşlarıdır.",
        "codeExample": r'''# List Comprehension ile çift sayıların kareleri
numbers = [1, 2, 3, 4, 5, 6, 7, 8]
even_squares = [n ** 2 for n in numbers if n % 2 == 0]
print(even_squares)  # [4, 16, 36, 64]''',
        "devTip": "Büyük veri kümelerini belleğe yüklemeden işlemek için köşeli parantez yerine normal parantez kullanarak Generator oluşturun."
    }

def get_csharp_topic_details(topic, title):
    return {
        "rule": "C# ve .NET dünyasında bellek ikiye ayrılır: Stack (Değer tipleri - int, struct) ve Heap (Referans tipleri - class, string, nesneler). LINQ ise koleksiyonları SQL benzeri ifadelerle filtrelemeyi ve dönüştürmeyi sağlar.",
        "codeExample": r'''var developers = new List<Developer> {
    new("Ali", 5),
    new("Ayşe", 8),
    new("Mehmet", 2)
};

var seniors = developers
    .Where(d => d.ExperienceYears >= 5)
    .OrderBy(d => d.Name)
    .Select(d => d.Name);''',
        "devTip": "LINQ sorguları 'Deferred Execution' (ertelenmiş çalışma) mantığıyla çalışır; ToList() veya foreach çağrılana kadar sorgu yürütülmez."
    }

def get_kotlin_topic_details(topic, title):
    return {
        "rule": "Kotlin'in en güçlü özelliklerinden biri Null Safety'dir. 'String?' nullable bir tipi temsil ederken, Elvis operatörü '?:' null durumunda varsayılan bir değer dönmeyi sağlar.",
        "codeExample": r'''fun getUserName(user: User?): String {
    return user?.name ?: "Bilinmeyen Kullanıcı"
}

data class User(val id: Int, val name: String)''',
        "devTip": "Asla mecbur kalmadıkça '!!' (not-null assertion) kullanmayın; 'NullPointerException' riskini yeniden kodunuza sokmuş olursunuz."
    }

def get_linux_topic_details(topic, title):
    return {
        "rule": "Unix ve Linux felsefesinin temeli şudur: 'Her şey bir dosyadır ve küçük araçlar birleşerek büyük işler yapar'. Pipe (|) operatörü bir komutun çıktısını diğerinin girdisi yapar.",
        "codeExample": r'''# log dosyasında ERROR geçen satırları say
cat app.log | grep "ERROR" | wc -l

# Dosya izinlerini ayarla (Sahip: rwx, Grup: r-x, Diğer: r-x)
chmod 755 script.sh''',
        "devTip": "Sekizlik izinlerde: 4=Okuma (Read), 2=Yazma (Write), 1=Çalıştırma (Execute). 7 = 4+2+1 = Tam yetki."
    }

def get_javascript_topic_details(topic, title):
    return {
        "rule": "JavaScript tek iş parçacıklı (single-threaded) bir dildir ve asenkron operasyonları 'Event Loop' (Olay Döngüsü) mekanizması ile yönetir. Microtask'lar (Promise callback'leri) daima macrotask'lardan (setTimeout) önce çalışır.",
        "codeExample": r'''async function fetchUserData(userId) {
    try {
        const response = await fetch(`/api/users/${userId}`);
        const data = await response.json();
        return data;
    } catch (err) {
        console.error("Veri çekilemedi:", err);
    }
}''',
        "devTip": "Array.prototype.map() ve filter() orijinal diziyi mutasyona uğratmaz (immutability), yeni bir dizi üretir."
    }

def get_sql_topic_details(topic, title):
    return {
        "rule": "SQL (Structured Query Language), ilişkisel veritabanları üzerinde veri tanımlama (DDL) ve veri işleme (DML) standart dilidir. JOIN işlemleri iki tabloyu ortak bir anahtar üzerinden birleştirir.",
        "codeExample": r'''SELECT 
    c.name, 
    COUNT(o.id) AS total_orders, 
    SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE c.is_active = TRUE
GROUP BY c.name
HAVING SUM(o.amount) > 1000
ORDER BY total_spent DESC;''',
        "devTip": "WHERE filtresi gruplama yapılmadan ÖNCE satırları eler, HAVING ise GROUP BY sonrasındaki toplamlar üzerinde filtreleme yapar."
    }

def get_algorithms_topic_details(topic, title):
    return {
        "rule": "Algoritmaların verimliliği Big-O (Büyük O) gösterimi ile ölçülür. Zaman karmaşıklığı girdi boyutunun (n) büyümesine göre çalışma süresinin nasıl arttığını ifade eder.",
        "codeExample": r'''# Binary Search - O(log n)
def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1''',
        "devTip": "Sıralı bir dizide arama yaparken O(n) doğrusal arama yerine daima O(log n) ikili arama (binary search) tercih edin."
    }


# ==========================================
# MULTIPLE CHOICE BUILDER (11 per lesson)
# ==========================================
def get_multiple_choice_questions(track, unit_num, lesson_num, topic, title, count=11):
    questions = []
    
    # We dynamically construct 11 distinct multiple choice questions based on the track and topic
    from question_content_data import get_mc_pool_for_lesson
    pool = get_mc_pool_for_lesson(track, unit_num, lesson_num, topic, title)
    
    # Ensure exactly 'count' questions
    for i in range(count):
        if i < len(pool):
            item = dict(pool[i])
            if "type" not in item:
                item["type"] = "QuestionType.multipleChoice"
            questions.append(item)
        else:
            # Fallback procedural question
            questions.append({
                "type": "QuestionType.multipleChoice",
                "prompt": f"{title} ile ilgili olarak aşağıdaki ifadelerden hangisi DOĞRUDUR? (Soru #{i+1})",
                "codeSnippet": None,
                "options": [
                    f"{title} standartlarına uygun yazılan kodlar sürdürülebilir ve hataya dirençlidir.",
                    "Bu yöntem modern mimarilerde tamamen kullanımdan kaldırılmıştır.",
                    "Bu komut sadece Windows işletim sisteminde çalışır.",
                    "İlgili yaklaşım bellekte gereksiz sızıntılara yol açtığı için önerilmez."
                ],
                "correctIndex": 0,
                "explanation": f"{title} prensipleri sektör standardı olup kod tabanının bakımını ve performansını optimize eder."
            })
            
    return questions[:count]


# ==========================================
# FILL IN THE BLANK (3 per lesson)
# ==========================================
def get_fill_in_blank_questions(track, unit_num, lesson_num, topic, title, count=3):
    from question_content_data import get_fib_pool_for_lesson
    pool = get_fib_pool_for_lesson(track, unit_num, lesson_num, topic, title)
    questions = []
    for i in range(count):
        if i < len(pool):
            item = dict(pool[i])
            if "type" not in item:
                item["type"] = "QuestionType.fillInTheBlank"
            questions.append(item)
        else:
            questions.append({
                "type": "QuestionType.fillInTheBlank",
                "prompt": f"{title} kapsamında ilgili işlemi tamamlamak için _____ ifadesi kullanılır.",
                "blankOptions": ["standart", "legacy", "deprecated", "strict"],
                "correctBlankAnswer": "standart",
                "explanation": f"{title} konusunda standart yaklaşım en güvenilir sonucu verir."
            })
    return questions[:count]


# ==========================================
# TRUE / FALSE (2 per lesson)
# ==========================================
def get_true_false_questions(track, unit_num, lesson_num, topic, title, count=2):
    from question_content_data import get_tf_pool_for_lesson
    pool = get_tf_pool_for_lesson(track, unit_num, lesson_num, topic, title)
    questions = []
    for i in range(count):
        if i < len(pool):
            item = dict(pool[i])
            if "type" not in item:
                item["type"] = "QuestionType.trueFalse"
            questions.append(item)
        else:
            is_t = (i % 2 == 0)
            questions.append({
                "type": "QuestionType.trueFalse",
                "prompt": f"{title} sürecinde yapılan işlemler projenin kararlılığını doğrudan etkiler.",
                "isTrue": True,
                "explanation": f"{title} doğru uygulandığında hata payını minimuma indirir."
            })
    return questions[:count]


# ==========================================
# MATCHING (1 per lesson)
# ==========================================
def get_matching_question(track, unit_num, lesson_num, topic, title):
    from question_content_data import get_matching_for_lesson
    m = dict(get_matching_for_lesson(track, unit_num, lesson_num, topic, title))
    if "type" not in m:
        m["type"] = "QuestionType.matching"
    return m

