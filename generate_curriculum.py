# -*- coding: utf-8 -*-
"""
CodeQuest 5000+ Question Generator
Generates comprehensive curriculums for:
1. Git & Version Control (git_curriculum.dart)
2. Godot 4 & GDScript (godot_curriculum.dart)
3. C Language & Systems (c_curriculum.dart)
4. Python 3 & Algorithms (python_curriculum.dart)
5. C# & .NET 8 (csharp_curriculum.dart)
6. Kotlin & Android (kotlin_curriculum.dart)
7. Linux & Bash CLI (linux_curriculum.dart)
8. JavaScript & Web (javascript_curriculum.dart)
9. SQL & Databases (sql_curriculum.dart)
10. Algorithms & Data Structures (algorithms_curriculum.dart)

Total: 10 tracks x 5 units x 6 lessons x 18 questions = 5,400 questions!
"""

import os
import json

BASE_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\lib\data"

def escape_dart_str(s):
    if s is None:
        return ""
    # Escape backslashes, double quotes, and dollar signs for Dart string literals
    return s.replace('\\', '\\\\').replace('"', '\\"').replace('$', '\\$').replace('\n', '\\n')

print("Starting generator setup...")
