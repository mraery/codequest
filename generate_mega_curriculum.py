# -*- coding: utf-8 -*-
"""
Mega Curriculum Definitions for CodeQuest (11,520 Questions)
10 Tracks x 8 Units x 8 Lessons x 18 Questions = 11,520 Questions
"""

import os
from track_generator_engine import write_curriculum_file
from question_bank_builder import generate_lesson_questions

BASE_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\lib\data"

# Helper to generate an 8-unit track configuration
def create_track_config(track, file_name, var_name, lang_enum, units_data):
    return {
        "track": track,
        "file": file_name,
        "var_name": var_name,
        "lang_enum": lang_enum,
        "units": units_data
    }

print("Configuring all 10 tracks for 11,520 questions...")
