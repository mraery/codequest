# -*- coding: utf-8 -*-
"""
Smart Technical Question Factory for CodeQuest (16,000 Questions)
Generates 25 high-quality, varied, non-repetitive questions per lesson.
100% of questions include rich, educational technical explanations.
Correct answer indices are evenly distributed (0, 1, 2, 3).
"""

import hashlib
import random
from track_kb_master import get_track_lesson_knowledge

def make_mc_question(q_id, prompt, code_snippet, correct_option, distractors, explanation):
    # Deterministic hash for reproducible, evenly distributed shuffling
    h = int(hashlib.md5(q_id.encode('utf-8')).hexdigest(), 16)
    options = [correct_option] + distractors[:3]
    
    perms = [
        [0,1,2,3], [0,1,3,2], [0,2,1,3], [0,2,3,1], [0,3,1,2], [0,3,2,1],
        [1,0,2,3], [1,0,3,2], [1,2,0,3], [1,2,3,0], [1,3,0,2], [1,3,2,0],
        [2,0,1,3], [2,0,3,1], [2,1,0,3], [2,1,3,0], [2,3,0,1], [2,3,1,0],
        [3,0,1,2], [3,0,2,1], [3,1,0,2], [3,1,2,0], [3,2,0,1], [3,2,1,0]
    ]
    p = perms[h % 24]
    shuffled_options = [options[idx] for idx in p]
    correct_idx = p.index(0)
    
    return {
        "id": q_id,
        "type": "QuestionType.multipleChoice",
        "prompt": prompt,
        "codeSnippet": code_snippet,
        "options": shuffled_options,
        "correctIndex": correct_idx,
        "explanation": explanation
    }

def make_fib_question(q_id, prompt, code_snippet, correct_token, distractors, explanation):
    h = int(hashlib.md5(q_id.encode('utf-8')).hexdigest(), 16)
    opts = [correct_token] + distractors[:3]
    random.Random(h).shuffle(opts)
    return {
        "id": q_id,
        "type": "QuestionType.fillInTheBlank",
        "prompt": prompt,
        "codeSnippet": code_snippet,
        "blankOptions": opts,
        "correctBlankAnswer": correct_token,
        "explanation": explanation
    }

def make_tf_question(q_id, prompt, is_true, explanation):
    return {
        "id": q_id,
        "type": "QuestionType.trueFalse",
        "prompt": prompt,
        "isTrue": is_true,
        "explanation": explanation
    }

def make_matching_question(q_id, prompt, pairs, explanation):
    return {
        "id": q_id,
        "type": "QuestionType.matching",
        "prompt": prompt,
        "matchingPairs": pairs,
        "explanation": explanation
    }

def make_concept_card(q_id, title, rule, code_example, dev_tip, emoji, explanation):
    return {
        "id": q_id,
        "type": "QuestionType.conceptCard",
        "conceptTitle": f"{title} - Hap Bilgi",
        "rule": rule,
        "codeExample": code_example,
        "devTip": dev_tip,
        "iconEmoji": emoji,
        "explanation": explanation
    }

def generate_lesson_questions_v2(track, unit_num, lesson_num, lesson_id, topic, title, desc, is_exam=False):
    questions = []
    kb = get_track_lesson_knowledge(track, unit_num, lesson_num, topic, title, desc)
    
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
        "algorithms": "🧩"
    }
    emoji = emoji_map.get(track, "💡")
    
    # 1. Concept Card (q1)
    card = make_concept_card(
        q_id=f"{lesson_id}_q1",
        title=title,
        rule=kb["rule"],
        code_example=kb["codeExample"],
        dev_tip=kb["devTip"],
        emoji=emoji,
        explanation=f"{title} konusundaki bu mimari kural ve hap bilgi, kod tabanınızda temiz ve sürdürülebilir geliştirme yapmanızı sağlar."
    )
    questions.append(card)
    
    # 2. 16 Multiple Choice Questions (q2 to q17)
    mc_list = kb["mc"]
    # Rotate dynamically per lesson so each lesson has a distinct sequence of questions
    shift = (unit_num * 7 + lesson_num * 11) % len(mc_list)
    rotated_mc = mc_list[shift:] + mc_list[:shift]
    
    for i in range(16):
        item = rotated_mc[i % len(rotated_mc)]
        q_id = f"{lesson_id}_q{i+2}"
        prompt = item["prompt"]
        if "{title}" in prompt:
            prompt = prompt.replace("{title}", title)
        mc_q = make_mc_question(
            q_id=q_id,
            prompt=prompt,
            code_snippet=item.get("code"),
            correct_option=item["correct"],
            distractors=item["distractors"],
            explanation=item["explanation"]
        )
        questions.append(mc_q)
        
    # 3. 4 Fill-in-the-Blank Questions (q18 to q21)
    fib_list = kb["fib"]
    fib_shift = (unit_num * 3 + lesson_num * 5) % len(fib_list)
    rotated_fib = fib_list[fib_shift:] + fib_list[:fib_shift]
    for i in range(4):
        f_item = rotated_fib[i % len(rotated_fib)]
        q_id = f"{lesson_id}_q{i+18}"
        fib_q = make_fib_question(
            q_id=q_id,
            prompt=f_item[0],
            code_snippet=None,
            correct_token=f_item[1],
            distractors=f_item[2],
            explanation=f_item[3]
        )
        questions.append(fib_q)
        
    # 4. 2 True/False Questions (q22, q23)
    tf_list = kb["tf"]
    for i in range(2):
        t_item = tf_list[i % len(tf_list)]
        q_id = f"{lesson_id}_q{i+22}"
        tf_q = make_tf_question(
            q_id=q_id,
            prompt=t_item[0],
            is_true=t_item[1],
            explanation=t_item[2]
        )
        questions.append(tf_q)
        
    # 5. 2 Matching Questions (q24, q25)
    mat_pairs1 = kb["mat1"]
    questions.append(make_matching_question(
        q_id=f"{lesson_id}_q24",
        prompt=f"{title} konusundaki temel kavram ve bileşenleri doğru tanımlarıyla eşleştirin.",
        pairs=mat_pairs1,
        explanation=f"{title} terminolojisi ve bileşen tanımları mimariyi anlamada kritiktir."
    ))
    mat_pairs2 = kb["mat2"]
    questions.append(make_matching_question(
        q_id=f"{lesson_id}_q25",
        prompt=f"{title} kapsamında sık kullanılan komut / metot ve sonuçlarını eşleştirin.",
        pairs=mat_pairs2,
        explanation=f"Metot ve operatörlerin çalışma prensiplerini bilmek kodlama hızınızı ve doğruluğunuzu optimize eder."
    ))
    
    return questions
