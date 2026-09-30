# -*- coding: utf-8 -*-
"""
Track Generator Engine for CodeQuest 5000+
Generates high quality, syntactically correct Dart curriculum files.
"""

import os
import json

def clean_dart_str(text):
    if text is None:
        return ""
    # In Dart multiline or raw strings, ensure no unescaped single quotes break things if needed
    # We will use r'''...''' for snippets and passages, and escaped standard strings for prompts
    return text.replace('\\', '\\\\').replace('"', '\\"').replace('$', '\\$')

def dart_raw_str(text):
    if text is None:
        return "null"
    # Format as r'''...'''
    # Escape any triple single quotes if present
    escaped = text.replace("'''", r"\'\'\'")
    if escaped.endswith("'") or escaped.endswith("\\"):
        escaped += " "
    return f"r'''{escaped}'''"

def dart_str(text):
    if text is None:
        return "null"
    cleaned = text.replace('\\', '\\\\').replace('"', '\\"').replace('$', '\\$').replace('\n', '\\n')
    return f'"{cleaned}"'

def format_question(q):
    q_type = q['type'] # e.g. 'QuestionType.multipleChoice'
    lines = ["          Question("]
    lines.append(f"            id: {dart_str(q['id'])},")
    lines.append(f"            type: {q_type},")
    
    if 'prompt' in q and q['prompt']:
        lines.append(f"            prompt: {dart_str(q['prompt'])},")
    if 'codeSnippet' in q and q['codeSnippet']:
        lines.append(f"            codeSnippet: {dart_raw_str(q['codeSnippet'])},")
    if 'options' in q and q['options']:
        opts = ", ".join([dart_str(opt) for opt in q['options']])
        lines.append(f"            options: [{opts}],")
    if 'correctIndex' in q and q['correctIndex'] is not None:
        lines.append(f"            correctIndex: {q['correctIndex']},")
    if 'explanation' in q and q['explanation']:
        lines.append(f"            explanation: {dart_str(q['explanation'])},")
    if 'isTrue' in q and q['isTrue'] is not None:
        lines.append(f"            isTrue: {'true' if q['isTrue'] else 'false'},")
    if 'blankOptions' in q and q['blankOptions']:
        bopts = ", ".join([dart_str(opt) for opt in q['blankOptions']])
        lines.append(f"            blankOptions: [{bopts}],")
    if 'correctBlankAnswer' in q and q['correctBlankAnswer']:
        lines.append(f"            correctBlankAnswer: {dart_str(q['correctBlankAnswer'])},")
    if 'conceptTitle' in q and q['conceptTitle']:
        lines.append(f"            conceptTitle: {dart_str(q['conceptTitle'])},")
    if 'rule' in q and q['rule']:
        lines.append(f"            rule: {dart_str(q['rule'])},")
    if 'codeExample' in q and q['codeExample']:
        lines.append(f"            codeExample: {dart_raw_str(q['codeExample'])},")
    if 'devTip' in q and q['devTip']:
        lines.append(f"            devTip: {dart_str(q['devTip'])},")
    if 'iconEmoji' in q and q['iconEmoji']:
        lines.append(f"            iconEmoji: {dart_str(q['iconEmoji'])},")
    if 'matchingPairs' in q and q['matchingPairs']:
        pairs_str = ", ".join([f"MatchingPair(left: {dart_str(p[0])}, right: {dart_str(p[1])})" for p in q['matchingPairs']])
        lines.append(f"            matchingPairs: [{pairs_str}],")
        
    lines.append("          ),")
    return "\n".join(lines)

def format_lesson(lesson):
    lines = ["      Lesson("]
    lines.append(f"        id: {dart_str(lesson['id'])},")
    lines.append(f"        title: {dart_str(lesson['title'])},")
    lines.append(f"        description: {dart_str(lesson['description'])},")
    lines.append(f"        xpReward: {lesson.get('xpReward', 40)},")
    lines.append(f"        gemReward: {lesson.get('gemReward', 15)},")
    lines.append(f"        isUnitExam: {'true' if lesson.get('isUnitExam', False) else 'false'},")
    lines.append("        questions: [")
    for q in lesson['questions']:
        lines.append(format_question(q))
    lines.append("        ],")
    lines.append("      ),")
    return "\n".join(lines)

def format_unit(unit):
    lines = ["  LearningUnit("]
    lines.append(f"    id: {dart_str(unit['id'])},")
    lines.append(f"    unitNumber: {unit['unitNumber']},")
    lines.append(f"    title: {dart_str(unit['title'])},")
    lines.append(f"    language: {unit['language']},")
    lines.append(f"    category: {dart_str(unit['category'])},")
    lines.append(f"    colorHex: {unit['colorHex']},")
    lines.append(f"    cheatSheetTitle: {dart_str(unit['cheatSheetTitle'])},")
    lines.append(f"    cheatSheetContent: {dart_raw_str(unit['cheatSheetContent'])},")
    lines.append("    lessons: [")
    for lesson in unit['lessons']:
        lines.append(format_lesson(lesson))
    lines.append("    ],")
    lines.append("  ),")
    return "\n".join(lines)

def write_curriculum_file(filepath, var_name, units):
    header = """import '../models/code_track_model.dart';
import '../models/curriculum_models.dart';

final List<LearningUnit> """ + var_name + """ = [
"""
    footer = """];
"""
    body = "\n".join([format_unit(u) for u in units])
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(header + body + footer)
    print(f"Generated {filepath} with {sum(len(l['questions']) for u in units for l in u['lessons'])} questions.")
