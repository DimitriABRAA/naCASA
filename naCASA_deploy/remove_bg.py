from PIL import Image

# Load the image
img = Image.open(r"C:\Users\Pichau\Desktop\naCASA\DNA brand\Captura de tela 2026-05-06 131150.png").convert("RGBA")
datas = img.getdata()

newData = []
# We will make pixels with high RGB values (white/off-white background) transparent.
# But wait, if "na" is ALSO white/off-white, how do we tell them apart?
# Let's inspect the top-left pixel to get the exact background color.
bg_color = datas[0]
print(f"Background color detected: {bg_color}")

# "na" might be slightly different or outline.
# Let's just make the EXACT background color transparent, with a small tolerance.
for item in datas:
    # item is (R, G, B, A)
    diff = abs(item[0] - bg_color[0]) + abs(item[1] - bg_color[1]) + abs(item[2] - bg_color[2])
    if diff < 15:
        newData.append((item[0], item[1], item[2], 0))  # Transparent
    else:
        newData.append(item)

img.putdata(newData)
img.save(r"C:\Users\Pichau\Desktop\naCASA_deploy\logo.png", "PNG")
print("Saved transparent logo.png")
