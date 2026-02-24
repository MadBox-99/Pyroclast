"""
Generate Foxhole-inspired icons for the Pyroclast mod.
Style: thick dark outlines, clean silhouettes, military/industrial look,
strong saturated colors, simple recognizable shapes on transparent background.
"""

from PIL import Image, ImageDraw, ImageFont, ImageFilter
import math
import os

SIZE = 64
OUT = os.path.join(os.path.dirname(__file__), "graphics", "icons")
os.makedirs(OUT, exist_ok=True)

# ─── color palette (Foxhole-inspired, strong & saturated) ──────────
C_OUTLINE  = (20, 20, 20, 255)         # near-black outline
C_SCRAP    = (140, 130, 110, 255)       # grey-brown (salvage)
C_SCRAP_HI = (175, 165, 140, 255)      # highlight
C_COMP     = (60, 140, 180, 255)        # steel-blue (components)
C_COMP_HI  = (90, 175, 210, 255)       # highlight
C_BMAT     = (220, 180, 50, 255)       # golden yellow
C_BMAT_HI  = (245, 210, 80, 255)
C_CMAT     = (100, 160, 200, 255)      # construction blue
C_CMAT_HI  = (140, 195, 230, 255)
C_EMAT     = (210, 60, 40, 255)        # explosive red
C_EMAT_HI  = (240, 100, 70, 255)
C_RMAT     = (150, 90, 190, 255)       # refined purple
C_RMAT_HI  = (185, 125, 220, 255)
C_HEMAT    = (170, 30, 30, 255)        # dark crimson
C_HEMAT_HI = (210, 60, 50, 255)
C_ASS1     = (80, 180, 80, 255)        # green tier1
C_ASS1_HI  = (120, 210, 120, 255)
C_ASS2     = (50, 150, 180, 255)       # teal tier2
C_ASS2_HI  = (90, 185, 210, 255)
C_ASS3     = (180, 140, 50, 255)       # bronze tier3
C_ASS3_HI  = (215, 175, 80, 255)
C_ASS4     = (190, 60, 60, 255)        # red tier4
C_ASS4_HI  = (225, 95, 90, 255)
C_REF      = (180, 100, 40, 255)       # refinery orange
C_REF_HI   = (215, 135, 65, 255)

OL = 3  # outline width


def new_img():
    return Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))


def outline_polygon(draw, points, fill, outline=C_OUTLINE, width=OL):
    """Draw a filled polygon with thick outline."""
    draw.polygon(points, fill=fill)
    # Draw thick outline by drawing lines between consecutive points
    pts = list(points) + [points[0]]
    for i in range(len(pts) - 1):
        draw.line([pts[i], pts[i + 1]], fill=outline, width=width)


def outline_ellipse(draw, bbox, fill, outline=C_OUTLINE, width=OL):
    """Draw filled ellipse with thick outline."""
    draw.ellipse(bbox, fill=fill, outline=outline, width=width)


def outline_rect(draw, bbox, fill, outline=C_OUTLINE, width=OL):
    """Draw filled rectangle with thick outline."""
    draw.rectangle(bbox, fill=fill, outline=outline, width=width)


def outline_line(draw, pts, fill=C_OUTLINE, width=OL):
    draw.line(pts, fill=fill, width=width)


# ═══════════════════════════════════════════════════════════════════
# SCRAP - pile of metal scraps / junk metal pieces
# ═══════════════════════════════════════════════════════════════════
def gen_scrap():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Several overlapping angular metal pieces (scrap pile)
    # Bottom large piece - flat plate
    outline_polygon(d, [(8, 48), (56, 48), (52, 38), (12, 36)], C_SCRAP)
    # Middle piece - angled beam
    outline_polygon(d, [(14, 40), (50, 36), (46, 26), (18, 28)], C_SCRAP_HI)
    # Top piece - bent metal
    outline_polygon(d, [(20, 30), (44, 28), (48, 18), (38, 14), (22, 16)], C_SCRAP)
    # Small piece on top
    outline_polygon(d, [(26, 20), (36, 16), (40, 10), (30, 10)], C_SCRAP_HI)
    # Rivet dots for industrial feel
    for cx, cy in [(18, 44), (46, 44), (24, 34), (42, 32), (32, 22)]:
        d.ellipse([cx-2, cy-2, cx+2, cy+2], fill=C_OUTLINE)
    img.save(os.path.join(OUT, "scrap.png"))


# ═══════════════════════════════════════════════════════════════════
# COMPONENTS - mechanical/electronic parts (gears + circuit)
# ═══════════════════════════════════════════════════════════════════
def gen_components():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Main gear (large, left-center)
    cx, cy, r = 24, 32, 14
    # Gear body
    outline_ellipse(d, [cx-r, cy-r, cx+r, cy+r], C_COMP)
    # Gear hole
    outline_ellipse(d, [cx-4, cy-4, cx+4, cy+4], C_COMP_HI)
    # Gear teeth (8 teeth)
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
    # Circuit traces
    d.line([(40, 42), (54, 42)], fill=C_COMP_HI, width=2)
    d.line([(40, 46), (54, 46)], fill=C_COMP_HI, width=2)
    d.line([(40, 50), (54, 50)], fill=C_COMP_HI, width=2)
    # Circuit board outline
    d.rectangle([38, 38, 56, 52], outline=C_OUTLINE, width=2)
    img.save(os.path.join(OUT, "components.png"))


# ═══════════════════════════════════════════════════════════════════
# BMAT (Basic Materials) - simple crate/box with "B" marking
# ═══════════════════════════════════════════════════════════════════
def gen_bmat():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Main crate body (slightly 3D perspective)
    # Front face
    outline_rect(d, [8, 18, 52, 54], C_BMAT)
    # Top face (parallelogram for 3D effect)
    outline_polygon(d, [(8, 18), (16, 10), (58, 10), (52, 18)], C_BMAT_HI)
    # Right face
    outline_polygon(d, [(52, 18), (58, 10), (58, 46), (52, 54)], C_BMAT)
    # Crate slats (horizontal lines on front)
    for y in [26, 34, 42]:
        outline_line(d, [(10, y), (50, y)], C_OUTLINE, 2)
    # "B" letter silhouette - drawn with rectangles
    outline_rect(d, [22, 22, 26, 50], (30, 30, 30, 200), width=0)
    outline_rect(d, [26, 22, 38, 26], (30, 30, 30, 200), width=0)
    outline_rect(d, [26, 34, 38, 38], (30, 30, 30, 200), width=0)
    outline_rect(d, [26, 46, 38, 50], (30, 30, 30, 200), width=0)
    outline_rect(d, [36, 26, 40, 34], (30, 30, 30, 200), width=0)
    outline_rect(d, [36, 38, 40, 46], (30, 30, 30, 200), width=0)
    img.save(os.path.join(OUT, "bmat.png"))


# ═══════════════════════════════════════════════════════════════════
# CMAT (Construction Materials) - I-beam / building materials
# ═══════════════════════════════════════════════════════════════════
def gen_cmat():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Two overlapping I-beams
    # Back beam (angled)
    outline_polygon(d, [
        (12, 14), (20, 14), (20, 18), (18, 18),
        (18, 44), (20, 44), (20, 48), (12, 48),
        (12, 44), (14, 44), (14, 18), (12, 18)
    ], C_CMAT)
    # Front beam (angled, crossing)
    outline_polygon(d, [
        (28, 8), (52, 8), (52, 14), (44, 14),
        (44, 50), (52, 50), (52, 56), (28, 56),
        (28, 50), (36, 50), (36, 14), (28, 14)
    ], C_CMAT_HI)
    # Cross brace
    outline_polygon(d, [(16, 28), (42, 22), (44, 28), (18, 34)], C_CMAT)
    # Bolt dots
    for cx, cy in [(16, 16), (16, 46), (32, 12), (48, 12), (32, 52), (48, 52)]:
        d.ellipse([cx-2, cy-2, cx+2, cy+2], fill=C_OUTLINE)
    img.save(os.path.join(OUT, "cmat.png"))


# ═══════════════════════════════════════════════════════════════════
# EMAT (Explosive Materials) - artillery shell / bomb shape
# ═══════════════════════════════════════════════════════════════════
def gen_emat():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Shell body (vertical, pointed top)
    # Main cylinder body
    outline_rect(d, [18, 22, 46, 52], C_EMAT)
    # Pointed nose cone
    outline_polygon(d, [(18, 22), (46, 22), (32, 6)], C_EMAT_HI)
    # Bottom fin ring
    outline_rect(d, [14, 48, 50, 56], C_EMAT)
    # Fins (4 small triangles at bottom)
    outline_polygon(d, [(14, 56), (10, 60), (18, 60)], C_EMAT)
    outline_polygon(d, [(50, 56), (54, 60), (46, 60)], C_EMAT)
    # Hazard band
    outline_rect(d, [18, 34, 46, 40], C_BMAT)
    # Center stripe
    outline_line(d, [(32, 22), (32, 52)], (30, 30, 30, 120), 2)
    # Highlight on nose
    outline_line(d, [(28, 14), (32, 8)], C_EMAT_HI, 2)
    img.save(os.path.join(OUT, "emat.png"))


# ═══════════════════════════════════════════════════════════════════
# RMAT (Refined Materials) - refined ingot / crystal bar
# ═══════════════════════════════════════════════════════════════════
def gen_rmat():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Stack of refined ingots (3D perspective)
    # Bottom ingot
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
    img.save(os.path.join(OUT, "rmat.png"))


# ═══════════════════════════════════════════════════════════════════
# HEMAT (Heavy Explosive Materials) - large bomb/warhead
# ═══════════════════════════════════════════════════════════════════
def gen_hemat():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Large bomb/warhead shape - wider than emat
    # Main bomb body (oval)
    outline_ellipse(d, [10, 14, 54, 48], C_HEMAT)
    # Nose cone (top)
    outline_polygon(d, [(24, 16), (40, 16), (32, 4)], C_HEMAT_HI)
    # Tail section
    outline_rect(d, [24, 44, 40, 54], C_HEMAT)
    # Tail fins
    outline_polygon(d, [(20, 48), (14, 58), (24, 54)], C_HEMAT)
    outline_polygon(d, [(44, 48), (50, 58), (40, 54)], C_HEMAT)
    outline_polygon(d, [(30, 52), (34, 52), (32, 60)], C_HEMAT)
    # Hazard stripes (diagonal yellow bands)
    for offset in range(0, 40, 8):
        x1 = 16 + offset
        x2 = x1 + 4
        if x1 < 50 and x2 > 14:
            d.line([(max(14, x1), 28), (max(14, x2), 36)], fill=C_BMAT, width=2)
    # Skull-like marking (simple: two dots + line)
    d.ellipse([26, 26, 30, 30], fill=C_OUTLINE)
    d.ellipse([34, 26, 38, 30], fill=C_OUTLINE)
    d.line([(28, 34), (36, 34)], fill=C_OUTLINE, width=2)
    img.save(os.path.join(OUT, "hemat.png"))


# ═══════════════════════════════════════════════════════════════════
# ASSMAT 1-4 - Foxhole-style wavy sheet metal (traced from reference)
# Uses foxhole_assmat1.png silhouette as shape mask, recolored per tier
# ═══════════════════════════════════════════════════════════════════

# Reference image path (Foxhole assmat1 white silhouette)
ASSMAT_REF = os.path.join(os.path.dirname(__file__), "foxhole_assmat1.png")


def gen_assmat(tier, fill, fill_hi):
    # Load the Foxhole reference silhouette and resize to 64x64
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

    # Dilate mask by ~2px for outer outline
    dilated = mask.filter(ImageFilter.MaxFilter(5))
    # Erode mask by ~2px for inner outline
    eroded = mask.filter(ImageFilter.MinFilter(5))

    dil_px = dilated.load()
    ero_px = eroded.load()

    # Build outline mask: outer ring + inner ring
    outline = Image.new("L", (64, 64), 0)
    out_px = outline.load()
    for y in range(64):
        for x in range(64):
            # Outer outline: in dilated but not in original
            if dil_px[x, y] > 0 and mask_px[x, y] == 0:
                out_px[x, y] = 255
            # Inner outline: in original but not in eroded
            elif mask_px[x, y] > 0 and ero_px[x, y] == 0:
                out_px[x, y] = 255

    # Find shape bounding box for gradient calculation
    y_min, y_max = 64, 0
    for y in range(64):
        for x in range(64):
            if mask_px[x, y] > 0:
                y_min = min(y_min, y)
                y_max = max(y_max, y)
                break

    # Create output image
    img = new_img()
    img_px = img.load()

    # Fill shape with tier-colored vertical gradient
    # Top = fill_hi (lighter), bottom = fill (darker), with extra darkening at very bottom
    h_range = max(1, y_max - y_min)
    for y in range(64):
        for x in range(64):
            if mask_px[x, y] > 0:
                t = (y - y_min) / h_range  # 0 at top, 1 at bottom
                cr = int(fill_hi[0] * (1 - t) + fill[0] * t)
                cg = int(fill_hi[1] * (1 - t) + fill[1] * t)
                cb = int(fill_hi[2] * (1 - t) + fill[2] * t)
                # Extra darkening at the bottom 25%
                if t > 0.75:
                    darken = 1.0 - (t - 0.75) * 0.5
                    cr = int(cr * darken)
                    cg = int(cg * darken)
                    cb = int(cb * darken)
                img_px[x, y] = (cr, cg, cb, 255)

    # Add highlight band across the wave "crest" (upper-middle area, rows ~18-28)
    # This gives the 3D wavy appearance - lighter stripe where the sheet curves toward the light
    crest_top = y_min + int(h_range * 0.25)
    crest_bot = y_min + int(h_range * 0.45)
    for y in range(crest_top, crest_bot):
        for x in range(64):
            if mask_px[x, y] > 0 and out_px[x, y] == 0:
                r, g, b, a = img_px[x, y]
                # Gaussian-ish brightness boost centered on the band
                mid = (crest_top + crest_bot) / 2
                dist = abs(y - mid) / ((crest_bot - crest_top) / 2)
                factor = 1.0 + 0.25 * (1.0 - dist * dist)  # up to +25% brightness
                r = min(255, int(r * factor))
                g = min(255, int(g * factor))
                b = min(255, int(b * factor))
                img_px[x, y] = (r, g, b, a)

    # Apply dark outline
    for y in range(64):
        for x in range(64):
            if out_px[x, y] > 0:
                img_px[x, y] = C_OUTLINE

    img.save(os.path.join(OUT, f"assmat{tier}.png"))


def _draw_roman(d, cx, cy, text):
    """Draw Roman numeral text centered at (cx,cy) using pixel lines."""
    white = (240, 240, 240, 255)
    w = 2
    chars = list(text)
    total_w = len(chars) * 5 + (len(chars) - 1) * 1
    start_x = cx - total_w // 2

    for i, ch in enumerate(chars):
        x = start_x + i * 6
        if ch == "I":
            d.line([(x + 2, cy - 4), (x + 2, cy + 4)], fill=white, width=w)
            d.line([(x, cy - 4), (x + 4, cy - 4)], fill=white, width=1)
            d.line([(x, cy + 4), (x + 4, cy + 4)], fill=white, width=1)
        elif ch == "V":
            d.line([(x, cy - 4), (x + 2, cy + 4)], fill=white, width=w)
            d.line([(x + 4, cy - 4), (x + 2, cy + 4)], fill=white, width=w)


def gen_roman_numerals():
    """Generate separate 64x64 Roman numeral badge icons (roman-1..4.png).
    Badge is large and centered so it scales well as an overlay."""
    for tier in range(1, 5):
        img = new_img()
        d = ImageDraw.Draw(img)
        roman = {1: "I", 2: "II", 3: "III", 4: "IV"}[tier]
        # Large badge that fills most of the 64x64 canvas
        badge_w = 14 + len(roman) * 10
        badge_h = 22
        bx = (64 - badge_w) // 2
        by = (64 - badge_h) // 2
        # Fully opaque background to avoid blending issues
        d.rectangle([bx, by, bx + badge_w, by + badge_h], fill=(30, 30, 30, 255),
                    outline=C_OUTLINE, width=2)
        _draw_roman_large(d, bx + badge_w // 2, by + badge_h // 2, roman)
        img.save(os.path.join(OUT, f"roman-{tier}.png"))


def _draw_roman_large(d, cx, cy, text):
    """Draw large Roman numeral text centered at (cx,cy)."""
    white = (240, 240, 240, 255)
    w = 3
    chars = list(text)
    total_w = len(chars) * 10 + (len(chars) - 1) * 2
    start_x = cx - total_w // 2

    for i, ch in enumerate(chars):
        x = start_x + i * 12
        if ch == "I":
            d.line([(x + 4, cy - 8), (x + 4, cy + 8)], fill=white, width=w)
            # Serifs
            d.line([(x, cy - 8), (x + 8, cy - 8)], fill=white, width=2)
            d.line([(x, cy + 8), (x + 8, cy + 8)], fill=white, width=2)
        elif ch == "V":
            d.line([(x, cy - 8), (x + 4, cy + 8)], fill=white, width=w)
            d.line([(x + 8, cy - 8), (x + 4, cy + 8)], fill=white, width=w)


# ═══════════════════════════════════════════════════════════════════
# REFINERY - factory/refinery building icon
# ═══════════════════════════════════════════════════════════════════
def gen_refinery():
    img = new_img()
    d = ImageDraw.Draw(img)
    # Refinery building silhouette: furnace/smelter shape
    # Main body (rectangular building)
    outline_rect(d, [8, 24, 44, 56], C_REF)
    # Chimney / smoke stack (tall, right side)
    outline_rect(d, [46, 8, 56, 56], C_REF_HI)
    # Second shorter chimney
    outline_rect(d, [36, 16, 44, 24], C_REF)
    # Window/opening on main body
    outline_rect(d, [14, 32, 28, 42], C_OUTLINE)
    # Glow inside window (lava glow - orange-yellow)
    d.rectangle([16, 34, 26, 40], fill=(255, 160, 40, 220))
    # Pipe coming out left
    outline_rect(d, [2, 38, 8, 44], C_REF_HI)
    # Smoke puffs from chimney
    outline_ellipse(d, [44, 2, 54, 8], (180, 180, 180, 160), C_OUTLINE, 2)
    outline_ellipse(d, [48, -2, 58, 6], (160, 160, 160, 120), C_OUTLINE, 2)
    # Foundation line
    outline_line(d, [(4, 56), (58, 56)], C_OUTLINE, 3)
    img.save(os.path.join(OUT, "refinery.png"))


# ═══════════════════════════════════════════════════════════════════
# Generate all icons
# ═══════════════════════════════════════════════════════════════════
if __name__ == "__main__":
    gen_scrap()
    gen_components()
    # gen_bmat() — bmat uses tinted base-game steel-plate
    # gen_cmat() — cmat uses tinted base-game iron-stick
    pass  # placeholder after commented-out calls
    gen_emat()
    gen_rmat()
    gen_hemat()
    gen_assmat(1, C_ASS1, C_ASS1_HI)
    gen_assmat(2, C_ASS2, C_ASS2_HI)
    gen_assmat(3, C_ASS3, C_ASS3_HI)
    gen_assmat(4, C_ASS4, C_ASS4_HI)
    gen_roman_numerals()
    gen_refinery()
    print("Generated 12 icons in", OUT)
    for f in sorted(os.listdir(OUT)):
        if f.endswith(".png"):
            im = Image.open(os.path.join(OUT, f))
            print(f"  {f}: {im.size[0]}x{im.size[1]} {im.mode}")
