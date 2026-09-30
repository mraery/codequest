# -*- coding: utf-8 -*-
"""
Git & Version Control Track Generator
5 Units x 6 Lessons x 18 Questions = 540 Questions
"""

import os
from track_generator_engine import write_curriculum_file

def build_git_units():
    units_data = [
        {
            "id": "git_unit_1",
            "unitNumber": 1,
            "title": "Git Temelleri & Versiyon Kontrolü",
            "category": "Temeller",
            "colorHex": "0xFFF05032",
            "cheatSheetTitle": "Git Temel Komutları Hile Kağıdı",
            "cheatSheetContent": """# Yeni bir Git deposu başlat
git init

# Uzak depoyu klonla
git clone <url>

# Çalışma ağacı durumunu gör
git status

# Dosyaları Staging Area'ya ekle
git add dosya.txt
git add .

# Değişiklikleri kaydet
git commit -m "feat: ilk commit"

# Dosya farklarını incele
git diff
git diff --staged""",
            "lessons": [
                {
                    "title": "Git Nedir & Dağıtık Versiyon Kontrol Felsefesi",
                    "desc": "Merkezi vs Dağıtık sistemler ve Git mimarisi",
                    "topic": "git_init_philosophy"
                },
                {
                    "title": "Çalışma Alanları (Working, Staging & Repo)",
                    "desc": "Git'in 3 temel aşaması ve dosya yaşam döngüsü",
                    "topic": "git_three_trees"
                },
                {
                    "title": "git status ve git diff ile Değişiklik İnceleme",
                    "desc": "Dosya farklarını satır satır terminalde analiz etme",
                    "topic": "git_status_diff"
                },
                {
                    "title": "git add ve .gitignore Kuralları",
                    "desc": "İzlenmeyen dosyaları sahneye alma ve yok sayma desenleri",
                    "topic": "git_add_gitignore"
                },
                {
                    "title": "git commit ve Mesaj Yazım Standartları",
                    "desc": "Atomik commitler ve Conventional Commits kuralları",
                    "topic": "git_commit_best_practices"
                },
                {
                    "title": "1. Ünite Kapsamlı Git Temelleri Sınavı",
                    "desc": "Temel Git komutları ve dosya durumları değerlendirmesi",
                    "topic": "git_u1_exam",
                    "isExam": True
                },
            ]
        },
        {
            "id": "git_unit_2",
            "unitNumber": 2,
            "title": "Dallanma (Branching) & Birleştirme",
            "category": "Dallanma & Branch",
            "colorHex": "0xFFF97316",
            "cheatSheetTitle": "Git Branch & Merge Hile Kağıdı",
            "cheatSheetContent": """# Dal listeleme ve oluşturma
git branch
git branch <yeni-dal>

# Dala geçiş yapma
git checkout <dal>
git switch <dal>

# Yeni dal açıp anında geçiş yapma
git checkout -b <yeni-dal>
git switch -c <yeni-dal>

# Dalı birleştirme (merge)
git merge <kaynak-dal>

# Dalı silme
git branch -d <dal>       # Güvenli silme
git branch -D <dal>       # Zorla silme""",
            "lessons": [
                {
                    "title": "Dallanma Felsefesi & git branch",
                    "desc": "Git'te dal nedir ve HEAD işaretçisi nasıl çalışır?",
                    "topic": "git_branch_basics"
                },
                {
                    "title": "git checkout ve Modern git switch",
                    "desc": "Dallar arasında geçiş yapma ve yeni dal açma",
                    "topic": "git_checkout_switch"
                },
                {
                    "title": "Fast-Forward vs 3-Way Merge",
                    "desc": "Dalları ana kola birleştirme mekanizmaları",
                    "topic": "git_merge_types"
                },
                {
                    "title": "Merge Çakışmaları (Conflicts) & Çözümü",
                    "desc": "<<<<<<< HEAD çakışma etiketlerini okuma ve çözme",
                    "topic": "git_merge_conflicts"
                },
                {
                    "title": "Dal Temizliği & git branch -d / -D",
                    "desc": "Birleşmiş ve birleşmemiş dalları güvenle temizleme",
                    "topic": "git_branch_cleanup"
                },
                {
                    "title": "2. Ünite Kapsamlı Branching Sınavı",
                    "desc": "Dallanma stratejileri ve çakışma yönetimi sınavı",
                    "topic": "git_u2_exam",
                    "isExam": True
                },
            ]
        },
        {
            "id": "git_unit_3",
            "unitNumber": 3,
            "title": "Uzak Depolar (Remotes) & GitHub İşbirliği",
            "category": "Uzak Depo & GitHub",
            "colorHex": "0xFFEA580C",
            "cheatSheetTitle": "Git Remotes & GitHub Hile Kağıdı",
            "cheatSheetContent": """# Uzak depo adreslerini listele ve ekle
git remote -v
git remote add origin <url>

# Uzak değişiklikleri indir (birleştirmeden)
git fetch origin

# Uzak değişiklikleri indir ve anında birleştir
git pull origin <dal>

# Yerel commitleri uzak depoya gönder
git push -u origin <dal>

# Uzak dalı sil
git push origin --delete <dal>""",
            "lessons": [
                {
                    "title": "Uzak Depo Mantığı & git remote",
                    "desc": "origin nedir, remote url ekleme ve kontrol etme",
                    "topic": "git_remote_origin"
                },
                {
                    "title": "git fetch vs git pull Farkı",
                    "desc": "Sadece indirmek ile otomatik merge etmenin farkları",
                    "topic": "git_fetch_vs_pull"
                },
                {
                    "title": "git push ve Upstream (-u) Parametresi",
                    "desc": "Yerel dalı uzak depoya bağlama ve commit gönderme",
                    "topic": "git_push_upstream"
                },
                {
                    "title": "Pull Request (PR) & Kod İnceleme Kültürü",
                    "desc": "GitHub/GitLab üzerinde profesyonel PR akışı",
                    "topic": "git_pr_code_review"
                },
                {
                    "title": "Fork & Açık Kaynak Katkı İş Akışı",
                    "desc": "Başka bir depoyu çatallama ve upstream senkronizasyonu",
                    "topic": "git_fork_workflow"
                },
                {
                    "title": "3. Ünite Kapsamlı Uzak Depolar Sınavı",
                    "desc": "GitHub akışları, fetch/pull ve PR süreçleri sınavı",
                    "topic": "git_u3_exam",
                    "isExam": True
                },
            ]
        },
        {
            "id": "git_unit_4",
            "unitNumber": 4,
            "title": "Gelişmiş Git & Zaman Yolculuğu",
            "category": "Rebase & Reset",
            "colorHex": "0xFFC2410C",
            "cheatSheetTitle": "Rebase, Reset & Stash Hile Kağıdı",
            "cheatSheetContent": """# Rebase ile tarihçeyi düzleştir
git rebase <hedef-dal>
git rebase -i HEAD~3

# Tek bir commiti cımbızla al
git cherry-pick <commit-hash>

# Commitleri geri al (farklı seviyeler)
git reset --soft HEAD~1   # Değişiklikler stage'de kalır
git reset --mixed HEAD~1  # Değişiklikler working dir'de kalır
git reset --hard HEAD~1   # TÜM değişiklikler SİLİNİR!

# Güvenli geri alma (yeni commit ile)
git revert <commit-hash>

# Geçici hafıza (stash)
git stash
git stash pop
git stash list""",
            "lessons": [
                {
                    "title": "git rebase ile Düzlemsel Tarihçe",
                    "desc": "Merge yerine rebase kullanmanın kuralları ve altın kural",
                    "topic": "git_rebase_basics"
                },
                {
                    "title": "İnteraktif Rebase (git rebase -i)",
                    "desc": "Commitleri ezme (squash), yeniden sıralama ve düzenleme",
                    "topic": "git_interactive_rebase"
                },
                {
                    "title": "git cherry-pick ile Seçici Commit Alma",
                    "desc": "Başka bir daldan tek bir commiti mevcut dala kopyalama",
                    "topic": "git_cherry_pick"
                },
                {
                    "title": "git reset Türleri (--soft, --mixed, --hard)",
                    "desc": "Zamanı geriye sararken dosyaların güvenliği",
                    "topic": "git_reset_types"
                },
                {
                    "title": "git revert, git stash & git reflog",
                    "desc": "Hataları güvenle tersine çevirme ve kayıp commitleri kurtarma",
                    "topic": "git_revert_stash_reflog"
                },
                {
                    "title": "4. Ünite Kapsamlı Zaman Yolculuğu Sınavı",
                    "desc": "Rebase, reset, stash ve acil durum kurtarma sınavı",
                    "topic": "git_u4_exam",
                    "isExam": True
                },
            ]
        },
        {
            "id": "git_unit_5",
            "unitNumber": 5,
            "title": "Git İç Mimarisi, Tagler & En İyi Pratikler",
            "category": "İleri Seviye & Stash",
            "colorHex": "0xFF9A3412",
            "cheatSheetTitle": "Git İleri Mimari & Tag Hile Kağıdı",
            "cheatSheetContent": """# Tag (Etiket) İşlemleri
git tag -a v1.0.0 -m "Sürüm 1.0.0 yayında"
git push origin --tags

# Kayıp commit ve dalları bulma
git reflog

# Hata arama (İkili arama)
git bisect start
git bisect bad
git bisect good <commit>

# Temizleme
git clean -fd

# Git Hooks dizini
.git/hooks/""",
            "lessons": [
                {
                    "title": "Git Objeleri (Blob, Tree, Commit, Tag)",
                    "desc": "SHA-1 / SHA-256 hashler ve içerik adreslenebilir dosya sistemi",
                    "topic": "git_objects_internals"
                },
                {
                    "title": "Git Tag & Anlamsal Sürümleme (SemVer)",
                    "desc": "Lightweight vs Annotated tagler ve release etiketleme",
                    "topic": "git_tag_semver"
                },
                {
                    "title": "Git Submodules & Çoklu Depo Yönetimi",
                    "desc": "Proje içinde başka bir git projesini bağımlılık olarak tutma",
                    "topic": "git_submodules"
                },
                {
                    "title": "Git Hooks & Otomasyon",
                    "desc": "pre-commit, commit-msg ile linter ve test entegrasyonu",
                    "topic": "git_hooks_automation"
                },
                {
                    "title": "git bisect ile Hata Avcılığı & Güvenlik",
                    "desc": "Regresyon hatalarını ikili arama ile dakikalar içinde bulma",
                    "topic": "git_bisect_security"
                },
                {
                    "title": "5. Ünite Kapsamlı Git Ustalık Sınavı",
                    "desc": "Kıdemli yazılımcı seviyesi Git mimari ve problem çözme sınavı",
                    "topic": "git_u5_exam",
                    "isExam": True
                },
            ]
        }
    ]

    # Generate the 18 questions for each of the 30 lessons (540 questions total)
    from question_bank_builder import generate_lesson_questions
    
    curriculum = []
    for u in units_data:
        unit_lessons = []
        for l_idx, l in enumerate(u["lessons"]):
            lesson_id = f"{u['id']}_l{l_idx+1}"
            questions = generate_lesson_questions(
                track="git",
                unit_num=u["unitNumber"],
                lesson_num=l_idx+1,
                lesson_id=lesson_id,
                topic=l["topic"],
                title=l["title"],
                is_exam=l.get("isExam", False)
            )
            unit_lessons.append({
                "id": lesson_id,
                "title": l["title"],
                "description": l["desc"],
                "xpReward": 50 if l.get("isExam") else 35,
                "gemReward": 25 if l.get("isExam") else 12,
                "isUnitExam": l.get("isExam", False),
                "questions": questions
            })
        
        curriculum.append({
            "id": u["id"],
            "unitNumber": u["unitNumber"],
            "title": u["title"],
            "language": "CodeLanguage.git",
            "category": u["category"],
            "colorHex": u["colorHex"],
            "cheatSheetTitle": u["cheatSheetTitle"],
            "cheatSheetContent": u["cheatSheetContent"],
            "lessons": unit_lessons
        })

    return curriculum

if __name__ == "__main__":
    units = build_git_units()
    out_path = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\lib\data\git_curriculum.dart"
    write_curriculum_file(out_path, "gitUnits", units)
