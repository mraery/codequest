# -*- coding: utf-8 -*-
"""
Process CodeQuest Icon into all Android mipmap resolutions and in-app assets.
"""

import os
from PIL import Image, ImageDraw

SOURCE_IMAGE = r"C:\Users\roy\.gemini\antigravity\brain\5b1d4f98-5fb9-431a-849f-b596d16e1ec9\codequest_icon_1790768711186.jpg"
RES_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\android\app\src\main\res"
ASSETS_DIR = r"C:\Users\roy\.gemini\antigravity\scratch\codequest\assets\images"

SIZES = {
    "mipmap-mdpi": 48,
    "mipmap-hdpi": 72,
    "mipmap-xhdpi": 96,
    "mipmap-xxhdpi": 144,
    "mipmap-xxxhdpi": 192,
}

def create_rounded_icon(img, size, radius_ratio=0.22):
    # Supersampling 4x for crystal clear anti-aliasing
    ss = size * 4
    scaled = img.resize((ss, ss), Image.Resampling.LANCZOS)
    
    mask = Image.new("L", (ss, ss), 0)
    draw = ImageDraw.Draw(mask)
    r = int(ss * radius_ratio)
    draw.rounded_rectangle([(0, 0), (ss - 1, ss - 1)], radius=r, fill=255)
    
    scaled.putalpha(mask)
    return scaled.resize((size, size), Image.Resampling.LANCZOS)

def create_round_icon(img, size):
    # Supersampling 4x for smooth circular edges
    ss = size * 4
    scaled = img.resize((ss, ss), Image.Resampling.LANCZOS)
    
    mask = Image.new("L", (ss, ss), 0)
    draw = ImageDraw.Draw(mask)
    draw.ellipse([(0, 0), (ss - 1, ss - 1)], fill=255)
    
    scaled.putalpha(mask)
    return scaled.resize((size, size), Image.Resampling.LANCZOS)

def main():
    print(f"Loading source image from: {SOURCE_IMAGE}")
    orig = Image.open(SOURCE_IMAGE).convert("RGBA")
    
    # The squircle bounding box in the 1024x1024 render is centered between (116, 116) and (908, 908)
    cropped = orig.crop((116, 116, 908, 908))
    
    # Process for each mipmap directory
    for folder, size in SIZES.items():
        target_dir = os.path.join(RES_DIR, folder)
        os.makedirs(target_dir, exist_ok=True)
        
        # 1. Standard rounded squircle icon
        sq_icon = create_rounded_icon(cropped, size, radius_ratio=0.22)
        sq_path = os.path.join(target_dir, "ic_launcher.png")
        sq_icon.save(sq_path, "PNG", optimize=True)
        print(f"Saved {sq_path} ({size}x{size})")
        
        # 2. Round circular icon
        rd_icon = create_round_icon(cropped, size)
        rd_path = os.path.join(target_dir, "ic_launcher_round.png")
        rd_icon.save(rd_path, "PNG", optimize=True)
        print(f"Saved {rd_path} ({size}x{size})")
        
    # Also save 512x512 high-res version for assets and play store
    os.makedirs(ASSETS_DIR, exist_ok=True)
    asset_icon = create_rounded_icon(cropped, 512, radius_ratio=0.22)
    asset_path = os.path.join(ASSETS_DIR, "app_icon.png")
    asset_icon.save(asset_path, "PNG", optimize=True)
    print(f"Saved in-app asset: {asset_path} (512x512)")
    
    # Also save in drawable
    drawable_dir = os.path.join(RES_DIR, "drawable")
    os.makedirs(drawable_dir, exist_ok=True)
    draw_path = os.path.join(drawable_dir, "ic_launcher_foreground.png")
    asset_icon.save(draw_path, "PNG", optimize=True)
    print(f"Saved drawable: {draw_path} (512x512)")
    
    print("\nAll launcher icons generated successfully!")

if __name__ == "__main__":
    main()
