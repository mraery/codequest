# -*- coding: utf-8 -*-
"""
Deep Technical Knowledge Base for Git Track (8 Units x 8 Lessons)
Provides authentic code snippets, realistic options, and detailed educational explanations.
"""

def get_git_lesson_knowledge(unit_num, lesson_num, topic, title, desc):
    # Specialized data based on topic and unit
    kb = {
        "rule": f"Git mimarisinde '{title}' konusu, verilerin güvenli, atomik ve izlenebilir biçimde kaydedilmesinde kilit rol oynar. Git bir dosya sistemi snapshot veritabanı gibi çalışır.",
        "codeExample": "# Temel terminal iş akışı\ngit status -s\ngit diff --staged",
        "devTip": "Commit geçmişini temiz tutmak ekip çalışmasında hata ayıklama süresini yarı yarıya azaltır.",
        "mc": [
            {
                "prompt": f"'{title}' bağlamında Git'in varsayılan davranışıyla ilgili aşağıdakilerden hangisi DOĞRUDUR?",
                "code": "git status -s",
                "correct": "İşlemler yerel depoda anlık snapshot (enstantane) referansları oluşturarak çalışır.",
                "distractors": [
                    "Git her işlemde tüm proje dosyalarını uzak sunucuya otomatik olarak yükler.",
                    "Yapılan değişiklikler doğrudan silinir ve geri alınamaz.",
                    "Sadece kök dizindeki dosyalar izlenebilir, alt klasörler desteklenmez."
                ],
                "explanation": "Git dağıtık bir versiyon kontrol sistemidir. İşlemler yerel depodaki DAG (Directed Acyclic Graph) yapısında snapshot referansları oluşturur."
            },
            {
                "prompt": f"Aşağıdaki Git komut dizisi çalıştırıldığında ne gerçekleşir?",
                "code": "git add -A\ngit commit -m 'feat: yeni modül entegrasyonu'",
                "correct": "Mevcut dizindeki tüm yeni, değiştirilmiş ve silinmiş dosyalar sahnelenip yeni bir commit oluşturulur.",
                "distractors": [
                    "Sadece yeni oluşturulan dosyalar commit edilir, silinenler yok sayılır.",
                    "Komut sözdizimi hatası verir çünkü -A bayrağı git commit ile kullanılmalıdır.",
                    "Değişiklikler doğrudan GitHub'a push edilir."
                ],
                "explanation": "'git add -A' tüm değişiklikleri (yeni, modifiye, silinmiş) Staging Area'ya alır. Ardından 'git commit -m' bu sahneyi kalıcı bir commit olarak kaydeder."
            },
            {
                "prompt": f"'{title}' sürecinde Staging Area (Sahne) kullanmanın temel avantajı nedir?",
                "code": "git add -p dosya.py",
                "correct": "Değişiklikleri seçici ve atomik parçalar halinde inceleyip bağımsız commitler yapabilmeyi sağlar.",
                "distractors": [
                    "Dosyaların diskteki boyutunu otomatik olarak sıkıştırıp küçültür.",
                    "Uzak sunucuya parola girmeden erişim izni tanır.",
                    "Kodlardaki sözdizimi hatalarını derleme öncesi otomatik düzeltir."
                ],
                "explanation": "Staging Area sayesinde bir dosyadaki 10 farklı satır değişikliğinin sadece 3'ünü seçip ('git add -p') bağımsız, atomik bir commit oluşturabilirsiniz."
            },
            {
                "prompt": "Git'te son yapılan commitin mesajını veya unutulan bir dosyayı eklemek için hangi bayrak kullanılır?",
                "code": "git commit --_____ -m 'fix: doğru mesaj'",
                "correct": "amend",
                "distractors": ["modify", "update", "redo"],
                "explanation": "'--amend' bayrağı en son yapılan commiti yeni bir commit üretmeden günceller; yeni hash üretir ve eski commitin yerini alır."
            },
            {
                "prompt": "İki farklı branch arasındaki satır satır farkları terminalde incelemek için hangi komut kullanılır?",
                "code": "git diff main..feature-auth",
                "correct": "İki dal arasındaki tüm eklenen ve çıkarılan satırları diff formatında listeler.",
                "distractors": [
                    "İki dalı otomatik olarak birbirine merge eder.",
                    "Farklı olan dosyaları tamamen diskten siler.",
                    "Uzak depodaki en son commitleri çeker."
                ],
                "explanation": "'git diff dal1..dal2' komutu iki referans arasındaki kod farklarını yeşil (+ eklenen) ve kırmızı (- silinen) satırlarla gösterir."
            },
            {
                "prompt": "Takip edilmek istenmeyen derleme çıktıları ve gizli dosyalar (.env) için en iyi pratik nedir?",
                "code": "# .gitignore\n*.env\nbuild/\nnode_modules/",
                "correct": ".gitignore dosyasına desenleri eklemek ve önceden takip edildiyse 'git rm --cached' ile indeksten çıkarmak.",
                "distractors": [
                    "Dosyaları manuel olarak gizli dosya (hidden) yapmak yeterlidir.",
                    "Her commit öncesi dosyaları silip commit sonrası tekrar oluşturmak.",
                    "Git'in bu dosyaları fark etmesini engellemek mümkün değildir."
                ],
                "explanation": ".gitignore dosyası Git'in belirli dosya ve klasörleri izleme dışı bırakmasını sağlar. Önceden commit edilmişlerse 'git rm --cached' gereklidir."
            },
            {
                "prompt": "Git'te 'Fast-Forward' merge hangi durumda gerçekleşebilir?",
                "code": "git merge feature-login",
                "correct": "Hedef daldan (main) ayrıldıktan sonra hedef dalda hiçbir yeni commit atılmamışsa.",
                "distractors": [
                    "İki dalda da aynı dosyalar değiştirildiğinde.",
                    "Uzak sunucuya internet bağlantısı olmadığında.",
                    "Sadece commit sayısı 10'dan az olduğunda."
                ],
                "explanation": "Fast-Forward, hedef dalın göstericisinin (pointer) doğrudan kaynak dalın son commitine ileri sarılmasıdır; çakışma riski yoktur ve yeni merge commit üretilmez."
            },
            {
                "prompt": "Bir merge çakışması (merge conflict) oluştuğunda dosyada görülen '<<<<<<< HEAD' etiketi neyi ifade eder?",
                "code": "<<<<<<< HEAD\nconst PORT = 3000;\n=======\nconst PORT = 8080;\n>>>>>>> feature-api",
                "correct": "Mevcut aktif dalda bulunan satırların başlangıcını ifade eder.",
                "distractors": [
                    "Birleştirilmek istenen diğer daldaki satırları gösterir.",
                    "Git'in otomatik olarak sildiği satırları temsil eder.",
                    "Dosyanın derleyici hatası verdiğini belirtir."
                ],
                "explanation": "'<<<<<<< HEAD' ile '=======' arasındaki kodlar mevcut dalınızdaki koddur. '=======' ile '>>>>>>>' arası ise birleştirilen daldan gelen koddur."
            },
            {
                "prompt": "Geliştirme yaparken yarım kalan işleri commit etmeden geçici bir hafızaya almak için ne kullanılır?",
                "code": "git stash push -m 'yarım kalan form'",
                "correct": "git stash, çalışma dizini ve sahneyi temizleyerek değişiklikleri geçici bir yığında saklar.",
                "distractors": [
                    "Değişiklikleri kalıcı olarak siler ve geri alınamaz hale getirir.",
                    "Değişiklikleri doğrudan production sunucusuna deploy eder.",
                    "Tüm branchleri silip tek bir dala indirger."
                ],
                "explanation": "'git stash', commit etmeye henüz hazır olmayan değişiklikleri güvenli bir yığında (stash stack) tutar ve çalışma alanınızı temizler."
            },
            {
                "prompt": "Saklanan en son stash kaydını geri yüklemek ve stash listesinden çıkarmak için hangi komut kullanılır?",
                "code": "git stash pop",
                "correct": "En son stash'i çalışma alanına uygular ve yığından siler.",
                "distractors": [
                    "Stash'i sadece okur ama uygulamaz.",
                    "Tüm stash geçmişini geri yüklemeden tamamen temizler.",
                    "Stash'i yeni bir GitHub reposu olarak yayınlar."
                ],
                "explanation": "'git stash pop' en son saklanan değişikliği mevcut koda uygular ve stash listesinden düşürür. Listede tutmak için 'git stash apply' kullanılır."
            },
            {
                "prompt": "Yanlışlıkla silinen bir commit veya dalı kurtarmak için Git'in hangi zaman yolculuğu günlüğü kullanılır?",
                "code": "git reflog",
                "correct": "HEAD göstericisinin yerel depodaki tüm hareket geçmişini kaydeden reflog mekanizması.",
                "distractors": [
                    "git status geçmişi",
                    "git diff önbelleği",
                    "GitHub e-posta bildirimleri"
                ],
                "explanation": "'git reflog' (reference log), HEAD'in dokunduğu her commitin SHA-1 hashini tutar; 'git reset --hard' ile silinen commitler bile reflog ile kurtarılabilir."
            },
            {
                "prompt": "'git reset --hard HEAD~1' komutunun potansiyel tehlikesi nedir?",
                "code": "git reset --hard HEAD~1",
                "correct": "Son commiti ve çalışma alanındaki sahnelenmemiş tüm değişiklikleri kalıcı olarak geri alır ve siler.",
                "distractors": [
                    "Uzak depodaki projeyi anında siler.",
                    "Sadece commit mesajını düzenleme modunu açar.",
                    "Hiçbir etkisi yoktur, geçersiz bir sözdizimidir."
                ],
                "explanation": "'--hard' bayrağı hem Git veritabanındaki işaretçiyi geri çeker hem de çalışma dizinindeki dosyaları o commite eşitler; kaydedilmemiş veriler kaybolabilir."
            },
            {
                "prompt": "Bir dalı ana dalın üzerine 'rebase' etmenin merge işlemine göre temel farkı nedir?",
                "code": "git switch feature\ngit rebase main",
                "correct": "Feature dalındaki commitleri main dalının en ucuna yeniden uygulayarak doğrusal (linear) bir tarihçe sunar.",
                "distractors": [
                    "İki dalı tamamen silip yeni boş bir repo oluşturur.",
                    "Commitlerin tarihlerini ve hash değerlerini asla değiştirmez.",
                    "Sadece remote sunucularda çalışır, yerelde çalışmaz."
                ],
                "explanation": "Rebase, dalın tabanını (base) hedef dalın son commitine taşır. Commitler yeniden oluşturulduğu için SHA-1 hashleri değişir ve temiz doğrusal tarihçe sağlar."
            },
            {
                "prompt": "Başka bir daldan yalnızca belirli bir commiti seçip mevcut dala aktarmak için hangi komut kullanılır?",
                "code": "git cherry-pick <commit-hash>",
                "correct": "Belirtilen commitin içerdiği değişiklikleri mevcut aktif dala yeni bir commit olarak uygular.",
                "distractors": [
                    "Tüm dalı eksiksiz olarak mevcut dala merge eder.",
                    "Seçilen commiti depodan tamamen siler.",
                    "Sadece dosya isimlerini kopyalar, içerik kopyalamaz."
                ],
                "explanation": "'git cherry-pick <hash>', başka bir koldaki spesifik bir hata düzeltmesini veya özelliği tüm dalı merge etmeden mevcut dala taşımak için kullanılır."
            },
            {
                "prompt": "Hatalı bir commiti tersine çeviren yeni bir 'telafi edici commit' oluşturmak için ne tercih edilir?",
                "code": "git revert <commit-hash>",
                "correct": "git revert, geçmişi değiştirmeden hatayı düzelten ters yönde yeni bir commit ekler.",
                "distractors": [
                    "git reset --hard ile geçmişi tamamen silmek.",
                    "Depoyu silip baştan klonlamak.",
                    "git branch -D ile ana dalı silmek."
                ],
                "explanation": "Özellikle ortak kullanılan dallarda (main/develop) geçmişi silmemek için 'git revert' kullanılır; böylece ekip üyelerinin geçmişi bozulmaz."
            },
            {
                "prompt": "Git deposunun diskteki '.git' klasöründe bulunan temel nesne (object) türleri nelerdir?",
                "code": "git cat-file -t <hash>",
                "correct": "blob (dosya içeriği), tree (dizin yapısı), commit (tarihçe metaverisi) ve tag (etiket).",
                "distractors": [
                    "file, folder, zip ve exe",
                    "json, xml, yaml ve toml",
                    "user, password, token ve ssh"
                ],
                "explanation": "Git'in içeriğe göre adreslenen (content-addressable) veritabanı 4 temel nesneye dayanır: blob, tree, commit ve annotated tag."
            }
        ],
        "fib": [
            ("Mevcut dizinde versiyon kontrolü başlatmak için 'git _____' komutu kullanılır.", "init", ["clone", "start", "create"], "'git init' yeni bir Git reposu başlatır."),
            ("Değişiklikleri sahneye almak için 'git _____ .' komutu çalıştırılır.", "add", ["stage", "push", "save"], "'git add .' tüm güncel değişiklikleri sahneye aktarır."),
            ("Aktif dalı değiştirmek için modern Git standartlarında 'git _____ <dal>' önerilir.", "switch", ["checkout", "move", "goto"], "Git 2.23+ ile dallar arası geçişte 'switch' komutu standartlaşmıştır."),
            ("Uzak depodaki değişiklikleri yerel depoyla birleştirmeden sadece indirmek için 'git _____' kullanılır.", "fetch", ["pull", "clone", "download"], "'git fetch' verileri indirir ancak çalışma dalınıza otomatik merge yapmaz.")
        ],
        "tf": [
            (f"Git'te bir branch oluşturmak diskte sadece 41 baytlık bir SHA-1 referans dosyası yaratır.", True, "Git dalları ağır kopya klasörler değil, commite işaret eden çok hafif göstericilerdir (pointer)."),
            (f"Daha önce commit edilmiş gizli bir dosyayı .gitignore'a yazmak onu commit geçmişinden otomatik siler.", False, "Daha önce kaydedilmiş dosyalar geçmişte kalmaya devam eder; 'git rm --cached' ve BFG/Filter-repo gerekir.")
        ],
        "mat1": [
            ("Working Tree", "Üzerinde çalışılan güncel dosyalar"),
            ("Staging Area", "Commit edilmek üzere seçilen değişiklikler"),
            ("Repository", "Kalıcı commit snapshot veritabanı"),
            ("HEAD", "Şu an aktif olan dal veya commit göstericisi")
        ],
        "mat2": [
            ("git diff", "Sahnelenmemiş satır farklarını gösterir"),
            ("git diff --staged", "Sahnelenmiş değişiklikleri gösterir"),
            ("git log --oneline", "Commit geçmişini tek satırda özetler"),
            ("git status -s", "Dosya durumlarını kısa bayraklarla gösterir")
        ]
    }
    return kb
