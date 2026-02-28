"""
Generate Foxhole-inspired icons for the Pyroclast mod.
Style: thick dark outlines, clean silhouettes, military/industrial look,
strong saturated colors, simple recognizable shapes on transparent background.
"""

from contextlib import contextmanager
from PIL import Image, ImageDraw, ImageFilter
import math
import os

SIZE = 64
OUT = os.path.join(os.path.dirname(__file__), "graphics", "icons")
os.makedirs(OUT, exist_ok=True)

# ─── color palette (Foxhole-inspired, strong & saturated) ──────────
C_OUTLINE  = (20, 20, 20, 255)         # near-black outline
C_SCRAP    = (140, 130, 110, 255)       # grey-brown (salvage)
C_SCRAP_HI = (175, 165, 140, 255)
C_COMP     = (60, 140, 180, 255)        # steel-blue (components)
C_COMP_HI  = (90, 175, 210, 255)
C_BMAT     = (220, 180, 50, 255)        # golden yellow (used for hazard markings)
C_EMAT     = (210, 60, 40, 255)         # explosive red
C_EMAT_HI  = (240, 100, 70, 255)
C_RMAT     = (150, 90, 190, 255)        # refined purple
C_RMAT_HI  = (185, 125, 220, 255)
C_HEMAT    = (170, 30, 30, 255)         # dark crimson
C_HEMAT_HI = (210, 60, 50, 255)
C_REF      = (180, 100, 40, 255)        # refinery orange
C_REF_HI   = (215, 135, 65, 255)
C_COAL     = (60, 60, 70, 255)          # dark coal grey
C_COAL_HI  = (100, 100, 115, 255)
C_FLAME    = (240, 140, 30, 255)        # furnace flame orange
C_AMMO     = (90, 120, 60, 255)         # military olive green
C_AMMO_HI  = (130, 160, 85, 255)
C_BRASS    = (200, 170, 60, 255)        # brass/bullet casing

# Assembly material tiers: (fill, highlight)
ASSMAT_TIERS = [
    ((80, 180, 80, 255),  (120, 210, 120, 255)),   # tier 1 green
    ((50, 150, 180, 255), (90, 185, 210, 255)),     # tier 2 teal
    ((180, 140, 50, 255), (215, 175, 80, 255)),     # tier 3 bronze
    ((190, 60, 60, 255),  (225, 95, 90, 255)),      # tier 4 red
]

OL = 3  # outline width


@contextmanager
def icon(filename):
    img = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    yield img, d
    img.save(os.path.join(OUT, filename))


def outline_polygon(draw, points, fill, outline=C_OUTLINE, width=OL):
    draw.polygon(points, fill=fill)
    pts = list(points) + [points[0]]
    for i in range(len(pts) - 1):
        draw.line([pts[i], pts[i + 1]], fill=outline, width=width)


def outline_ellipse(draw, bbox, fill, outline=C_OUTLINE, width=OL):
    draw.ellipse(bbox, fill=fill, outline=outline, width=width)


def outline_rect(draw, bbox, fill, outline=C_OUTLINE, width=OL):
    draw.rectangle(bbox, fill=fill, outline=outline, width=width)


def outline_line(draw, pts, fill=C_OUTLINE, width=OL):
    draw.line(pts, fill=fill, width=width)


def draw_rivets(draw, positions):
    for cx, cy in positions:
        draw.ellipse([cx-2, cy-2, cx+2, cy+2], fill=C_OUTLINE)


# ═══════════════════════════════════════════════════════════════════
# SCRAP - pile of metal scraps / junk metal pieces
# ═══════════════════════════════════════════════════════════════════
def gen_scrap():
    with icon("scrap.png") as (_, d):
        # Several overlapping angular metal pieces (scrap pile)
        outline_polygon(d, [(8, 48), (56, 48), (52, 38), (12, 36)], C_SCRAP)
        outline_polygon(d, [(14, 40), (50, 36), (46, 26), (18, 28)], C_SCRAP_HI)
        outline_polygon(d, [(20, 30), (44, 28), (48, 18), (38, 14), (22, 16)], C_SCRAP)
        outline_polygon(d, [(26, 20), (36, 16), (40, 10), (30, 10)], C_SCRAP_HI)
        draw_rivets(d, [(18, 44), (46, 44), (24, 34), (42, 32), (32, 22)])


# ═══════════════════════════════════════════════════════════════════
# COMPONENTS - mechanical/electronic parts (gears + circuit)
# ═══════════════════════════════════════════════════════════════════
def gen_components():
    with icon("components.png") as (_, d):
        # Main gear (large, left-center)
        cx, cy, r = 24, 32, 14
        outline_ellipse(d, [cx-r, cy-r, cx+r, cy+r], C_COMP)
        outline_ellipse(d, [cx-4, cy-4, cx+4, cy+4], C_COMP_HI)
        for i in range(8):
            angle = i * math.pi / 4
            tx = cx + int((r + 3) * math.cos(angle))
            ty = cy + int((r + 3) * math.sin(angle))
            outline_rect(d, [tx-3, ty-3, tx+3, ty+3], C_COMP)

        # Small gear (top-right)
        cx2, cy2, r2 = 44, 20, 9
        outline_ellipse(d, [cx2-r2, cy2-r2, cx2+r2, cy2+r2], C_COMP_HI)
        outline_ellipse(d, [cx2-3, cy2-3, cx2+3, cy2+3], C_COMP)
        for i in range(6):
            angle = i * math.pi / 3
            tx = cx2 + int((r2 + 2) * math.cos(angle))
            ty = cy2 + int((r2 + 2) * math.sin(angle))
            outline_rect(d, [tx-2, ty-2, tx+2, ty+2], C_COMP_HI)

        # Small circuit board piece (bottom-right)
        outline_rect(d, [38, 38, 56, 52], C_COMP)
        for y in [42, 46, 50]:
            d.line([(40, y), (54, y)], fill=C_COMP_HI, width=2)
        d.rectangle([38, 38, 56, 52], outline=C_OUTLINE, width=2)


# ═══════════════════════════════════════════════════════════════════
# EMAT (Explosive Materials) - artillery shell / bomb shape
# ═══════════════════════════════════════════════════════════════════
def gen_emat():
    with icon("emat.png") as (_, d):
        outline_rect(d, [18, 22, 46, 52], C_EMAT)
        outline_polygon(d, [(18, 22), (46, 22), (32, 6)], C_EMAT_HI)
        outline_rect(d, [14, 48, 50, 56], C_EMAT)
        outline_polygon(d, [(14, 56), (10, 60), (18, 60)], C_EMAT)
        outline_polygon(d, [(50, 56), (54, 60), (46, 60)], C_EMAT)
        outline_rect(d, [18, 34, 46, 40], C_BMAT)
        outline_line(d, [(32, 22), (32, 52)], (30, 30, 30, 120), 2)
        outline_line(d, [(28, 14), (32, 8)], C_EMAT_HI, 2)


# ═══════════════════════════════════════════════════════════════════
# RMAT (Refined Materials) - refined ingot / crystal bar
# ═══════════════════════════════════════════════════════════════════
def gen_rmat():
    with icon("rmat.png") as (_, d):
        # Bottom ingot (3D perspective)
        outline_polygon(d, [(6, 44), (32, 54), (58, 44), (32, 34)], C_RMAT)
        outline_polygon(d, [(6, 44), (6, 38), (32, 28), (32, 34)], C_RMAT_HI)
        outline_polygon(d, [(32, 34), (32, 28), (58, 38), (58, 44)], C_RMAT)
        # Top ingot
        outline_polygon(d, [(10, 32), (32, 42), (54, 32), (32, 22)], C_RMAT_HI)
        outline_polygon(d, [(10, 32), (10, 26), (32, 16), (32, 22)], C_RMAT)
        outline_polygon(d, [(32, 22), (32, 16), (54, 26), (54, 32)], C_RMAT_HI)
        # Sparkle/quality marks
        for cx, cy in [(20, 28), (44, 28), (32, 18)]:
            d.line([(cx-3, cy), (cx+3, cy)], fill=(255, 255, 255, 180), width=1)
            d.line([(cx, cy-3), (cx, cy+3)], fill=(255, 255, 255, 180), width=1)


# ═══════════════════════════════════════════════════════════════════
# HEMAT (Heavy Explosive Materials) - large bomb/warhead
# ═══════════════════════════════════════════════════════════════════
def gen_hemat():
    with icon("hemat.png") as (_, d):
        outline_ellipse(d, [10, 14, 54, 48], C_HEMAT)
        outline_polygon(d, [(24, 16), (40, 16), (32, 4)], C_HEMAT_HI)
        outline_rect(d, [24, 44, 40, 54], C_HEMAT)
        outline_polygon(d, [(20, 48), (14, 58), (24, 54)], C_HEMAT)
        outline_polygon(d, [(44, 48), (50, 58), (40, 54)], C_HEMAT)
        outline_polygon(d, [(30, 52), (34, 52), (32, 60)], C_HEMAT)
        # Hazard stripes
        for offset in range(0, 40, 8):
            x1 = 16 + offset
            if x1 < 50:
                d.line([(x1, 28), (x1 + 4, 36)], fill=C_BMAT, width=2)
        # Skull-like marking
        d.ellipse([26, 26, 30, 30], fill=C_OUTLINE)
        d.ellipse([34, 26, 38, 30], fill=C_OUTLINE)
        d.line([(28, 34), (36, 34)], fill=C_OUTLINE, width=2)


# ═══════════════════════════════════════════════════════════════════
# ASSMAT 1-4 - Foxhole-style wavy sheet metal (traced from reference)
# ═══════════════════════════════════════════════════════════════════

ASSMAT_REF = os.path.join(os.path.dirname(__file__), "foxhole_assmat1.png")


def gen_assmat(tier, fill, fill_hi):
    ref = Image.open(ASSMAT_REF).convert("RGBA").resize((64, 64), Image.LANCZOS)

    # Create binary mask from alpha channel (threshold at 30)
    mask = Image.new("L", (64, 64), 0)
    ref_px = ref.load()
    mask_px = mask.load()
    for y in range(64):
        for x in range(64):
            if ref_px[x, y][3] > 30:
                mask_px[x, y] = 255

    # Remove the canister cluster and its trailing artifacts in the upper-left
    for y in range(17):
        for x in range(25 if y < 12 else 20):
            mask_px[x, y] = 0

    dilated = mask.filter(ImageFilter.MaxFilter(5))
    eroded = mask.filter(ImageFilter.MinFilter(5))
    dil_px = dilated.load()
    ero_px = eroded.load()

    # Build outline mask: outer ring + inner ring
    outline = Image.new("L", (64, 64), 0)
    out_px = outline.load()
    y_min, y_max = 64, 0
    for y in range(64):
        for x in range(64):
            if dil_px[x, y] > 0 and mask_px[x, y] == 0:
                out_px[x, y] = 255
            elif mask_px[x, y] > 0 and ero_px[x, y] == 0:
                out_px[x, y] = 255
            if mask_px[x, y] > 0:
                y_min = min(y_min, y)
                y_max = max(y_max, y)

    with icon(f"assmat{tier}.png") as (img, _):
        img_px = img.load()
        h_range = max(1, y_max - y_min)

        # Fill shape with tier-colored vertical gradient
        for y in range(64):
            for x in range(64):
                if mask_px[x, y] > 0:
                    t = (y - y_min) / h_range
                    cr = int(fill_hi[0] * (1 - t) + fill[0] * t)
                    cg = int(fill_hi[1] * (1 - t) + fill[1] * t)
                    cb = int(fill_hi[2] * (1 - t) + fill[2] * t)
                    if t > 0.75:
                        darken = 1.0 - (t - 0.75) * 0.5
                        cr = int(cr * darken)
                        cg = int(cg * darken)
                        cb = int(cb * darken)
                    img_px[x, y] = (cr, cg, cb, 255)

        # Highlight band across the wave crest
        crest_top = y_min + int(h_range * 0.25)
        crest_bot = y_min + int(h_range * 0.45)
        mid = (crest_top + crest_bot) / 2
        half_h = (crest_bot - crest_top) / 2
        for y in range(crest_top, crest_bot):
            for x in range(64):
                if mask_px[x, y] > 0 and out_px[x, y] == 0:
                    r, g, b, a = img_px[x, y]
                    dist = abs(y - mid) / half_h
                    factor = 1.0 + 0.25 * (1.0 - dist * dist)
                    img_px[x, y] = (min(255, int(r * factor)),
                                    min(255, int(g * factor)),
                                    min(255, int(b * factor)), a)

        # Apply dark outline
        for y in range(64):
            for x in range(64):
                if out_px[x, y] > 0:
                    img_px[x, y] = C_OUTLINE


# ═══════════════════════════════════════════════════════════════════
# Roman numeral badges (roman-1..4.png)
# ═══════════════════════════════════════════════════════════════════
def _draw_roman_large(d, cx, cy, text):
    white = (240, 240, 240, 255)
    w = 3
    chars = list(text)
    total_w = len(chars) * 10 + (len(chars) - 1) * 2
    start_x = cx - total_w // 2

    for i, ch in enumerate(chars):
        x = start_x + i * 12
        if ch == "I":
            d.line([(x + 4, cy - 8), (x + 4, cy + 8)], fill=white, width=w)
            d.line([(x, cy - 8), (x + 8, cy - 8)], fill=white, width=2)
            d.line([(x, cy + 8), (x + 8, cy + 8)], fill=white, width=2)
        elif ch == "V":
            d.line([(x, cy - 8), (x + 4, cy + 8)], fill=white, width=w)
            d.line([(x + 8, cy - 8), (x + 4, cy + 8)], fill=white, width=w)


ROMAN = {1: "I", 2: "II", 3: "III", 4: "IV"}


def gen_roman_numerals():
    for tier in range(1, 5):
        with icon(f"roman-{tier}.png") as (_, d):
            roman = ROMAN[tier]
            badge_w = 14 + len(roman) * 10
            badge_h = 22
            bx = (64 - badge_w) // 2
            by = (64 - badge_h) // 2
            d.rectangle([bx, by, bx + badge_w, by + badge_h],
                        fill=(30, 30, 30, 255), outline=C_OUTLINE, width=2)
            _draw_roman_large(d, bx + badge_w // 2, by + badge_h // 2, roman)


# ═══════════════════════════════════════════════════════════════════
# REFINERY - factory/refinery building icon
# ═══════════════════════════════════════════════════════════════════
def gen_refinery():
    with icon("refinery.png") as (_, d):
        outline_rect(d, [8, 24, 44, 56], C_REF)
        outline_rect(d, [46, 8, 56, 56], C_REF_HI)
        outline_rect(d, [36, 16, 44, 24], C_REF)
        outline_rect(d, [14, 32, 28, 42], C_OUTLINE)
        d.rectangle([16, 34, 26, 40], fill=(255, 160, 40, 220))
        outline_rect(d, [2, 38, 8, 44], C_REF_HI)
        outline_ellipse(d, [44, 2, 54, 8], (180, 180, 180, 160), C_OUTLINE, 2)
        outline_ellipse(d, [48, -2, 58, 6], (160, 160, 160, 120), C_OUTLINE, 2)
        outline_line(d, [(4, 56), (58, 56)], C_OUTLINE, 3)


# ═══════════════════════════════════════════════════════════════════
# COAL GENERATOR - furnace/boiler with flame, coal-dark tones
# ═══════════════════════════════════════════════════════════════════
def gen_coal_generator():
    with icon("coal-generator.png") as (_, d):
        # Main boiler body
        outline_rect(d, [8, 26, 48, 56], C_COAL)
        # Top section (lighter)
        outline_rect(d, [10, 20, 46, 30], C_COAL_HI)
        # Chimney / smokestack
        outline_rect(d, [38, 4, 48, 22], C_COAL)
        outline_rect(d, [36, 2, 50, 6], C_COAL_HI)
        # Furnace opening with flame
        outline_rect(d, [14, 36, 32, 50], C_OUTLINE)
        d.rectangle([16, 38, 30, 48], fill=(40, 20, 10, 255))
        # Flame inside
        outline_polygon(d, [(19, 48), (23, 38), (27, 48)], C_FLAME)
        outline_polygon(d, [(21, 48), (23, 42), (25, 48)], (255, 220, 80, 255))
        # Coal pile indicator
        outline_polygon(d, [( 36, 50), (44, 50), (46, 44), (38, 42), (34, 46)], C_COAL)
        # Smoke puffs
        outline_ellipse(d, [36, -2, 46, 4], (160, 160, 160, 120), C_OUTLINE, 2)
        outline_ellipse(d, [42, -4, 52, 2], (140, 140, 140, 100), C_OUTLINE, 2)
        # Ground line
        outline_line(d, [(4, 56), (58, 56)], C_OUTLINE, 3)
        # Rivets
        draw_rivets(d, [(12, 24), (44, 24), (12, 52), (44, 52)])


# ═══════════════════════════════════════════════════════════════════
# AMMO FACILITY - military factory with bullet/shell motif
# ═══════════════════════════════════════════════════════════════════
def gen_ammo_facility():
    with icon("ammo-facility.png") as (_, d):
        # Main building body (olive green)
        outline_rect(d, [6, 22, 50, 56], C_AMMO)
        # Roof / upper section
        outline_polygon(d, [(4, 24), (52, 24), (48, 14), (8, 14)], C_AMMO_HI)
        # Chimney
        outline_rect(d, [44, 4, 52, 16], C_AMMO)
        # Bullet/shell icon on building face
        outline_rect(d, [16, 32, 24, 50], C_BRASS)
        outline_polygon(d, [(16, 32), (24, 32), (20, 26)], C_BRASS)
        outline_rect(d, [28, 32, 36, 50], C_BRASS)
        outline_polygon(d, [(28, 32), (36, 32), (32, 26)], C_BRASS)
        # Door / loading bay
        outline_rect(d, [38, 40, 48, 54], C_OUTLINE)
        d.rectangle([40, 42, 46, 52], fill=(50, 70, 40, 255))
        # Hazard stripe on roof edge
        for x in range(8, 48, 8):
            d.line([(x, 14), (x + 4, 24)], fill=C_BMAT, width=2)
        # Ground line
        outline_line(d, [(2, 56), (60, 56)], C_OUTLINE, 3)
        # Rivets
        draw_rivets(d, [(10, 18), (46, 18), (10, 52), (38, 52)])


# ═══════════════════════════════════════════════════════════════════
# Generate all icons
# ═══════════════════════════════════════════════════════════════════
if __name__ == "__main__":
    gen_scrap()
    gen_components()
    gen_emat()
    gen_rmat()
    gen_hemat()
    for tier, (fill, fill_hi) in enumerate(ASSMAT_TIERS, 1):
        gen_assmat(tier, fill, fill_hi)
    gen_roman_numerals()
    gen_refinery()
    gen_coal_generator()
    gen_ammo_facility()
    print("Generated 14 icons in", OUT)
    for f in sorted(os.listdir(OUT)):
        if f.endswith(".png"):
            im = Image.open(os.path.join(OUT, f))
            print(f"  {f}: {im.size[0]}x{im.size[1]} {im.mode}")
