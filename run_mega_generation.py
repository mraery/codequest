# -*- coding: utf-8 -*-
"""
Master Curriculum Generator for CodeQuest
10 Tracks x 8 Units x 8 Lessons x 18 Questions = 11,520 Questions
"""

import os
import sys
import time
import mega_track_specs as s1
import mega_track_specs_part2 as s2
import mega_track_specs_part3 as s3
import mega_track_specs_part4 as s4
from track_generator_engine import write_curriculum_file
from question_bank_builder import generate_lesson_questions

BASE_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\lib\data"

all_tracks = {
    **s1.TRACKS_DATA,
    **s2.TRACKS_DATA_PART2,
    **s3.TRACKS_DATA_PART3,
    **s4.TRACKS_DATA_PART4
}

def generate_mega_track(track_name, cfg):
    t0 = time.time()
    units_list = []
    total_q = 0
    
    for u in cfg["units"]:
        lessons_list = []
        for l_idx, (l_title, l_desc, topic, is_exam) in enumerate(u["lessons"]):
            lesson_id = f"{u['id']}_l{l_idx+1}"
            questions = generate_lesson_questions(
                track=track_name,
                unit_num=u["unitNumber"],
                lesson_num=l_idx+1,
                lesson_id=lesson_id,
                topic=topic,
                title=l_title,
                is_exam=is_exam
            )
            total_q += len(questions)
            lessons_list.append({
                "id": lesson_id,
                "title": l_title,
                "description": l_desc,
                "xpReward": 50 if is_exam else 35,
                "gemReward": 25 if is_exam else 12,
                "isUnitExam": is_exam,
                "questions": questions
            })
            
        units_list.append({
            "id": u["id"],
            "unitNumber": u["unitNumber"],
            "title": u["title"],
            "language": cfg["lang_enum"],
            "category": u["category"],
            "colorHex": u["colorHex"],
            "cheatSheetTitle": u["cheatSheetTitle"],
            "cheatSheetContent": u["cheatSheetContent"],
            "lessons": lessons_list
        })
        
    out_file = os.path.join(BASE_DIR, cfg["file"])
    write_curriculum_file(out_file, cfg["var_name"], units_list)
    dt = time.time() - t0
    print(f"[{track_name.upper()}] Generated {len(units_list)} units, {len(units_list)*8} lessons, {total_q} questions in {dt:.2f}s -> {cfg['file']}")
    return total_q

def main():
    start_total = time.time()
    grand_total_questions = 0
    print("=" * 60)
    print("Starting generation of 11,520 questions across 10 tracks...")
    print("=" * 60)
    
    for track_name, cfg in all_tracks.items():
        q_count = generate_mega_track(track_name, cfg)
        grand_total_questions += q_count
        
    total_time = time.time() - start_total
    print("=" * 60)
    print(f"COMPLETED! Generated {grand_total_questions} questions across {len(all_tracks)} tracks in {total_time:.2f}s.")
    print("=" * 60)

if __name__ == "__main__":
    main()
