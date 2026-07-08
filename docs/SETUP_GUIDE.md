# 📖 Panduan Setup Lengkap Teleport System

## ✅ Prerequisites

- Roblox Studio (versi terbaru)
- Basic knowledge tentang Roblox Studio
- Project Roblox sudah dibuat

---

## 🎮 Step-by-Step Setup

### Step 1: Buat 3 Part di Workspace

1. Buka Roblox Studio
2. Di **Workspace**, klik kanan → **Insert Object** → **Part**
3. **Buat 3 part dengan cara ini:**
   - Part pertama: Rename menjadi `Part1`
   - Part kedua: Rename menjadi `Part2`
   - Part ketiga: Rename menjadi `Part3`

4. **Posisikan di lokasi berbeda:**
   - Part1: (0, 10, -50)
   - Part2: (-50, 10, 0)
   - Part3: (50, 10, 0)

**Cara rename:**
- Klik kanan Part → Properties
- Ubah `Name` ke `Part1`, `Part2`, atau `Part3`

---

### Step 2: Tambahkan Script GUI

1. Di **StarterGui**, klik kanan → **Insert Object** → **LocalScript**
2. Beri nama: `TeleportGui`
3. Copy-paste isi dari file `TeleportGui.lua` ke dalam script ini

**Lokasi untuk LocalScript:**
```
StarierGui
└── TeleportGui (LocalScript)
```

---

### Step 3: Tambahkan Script Service (Opsional)

1. Di **ServerScriptService**, klik kanan → **Insert Object** → **Script**
2. Beri nama: `TeleportService`
3. Copy-paste isi dari file `TeleportService.lua` ke dalam script ini

**Lokasi untuk Script:**
```
ServerScriptService
└── TeleportService (Script)
```

---

## 🎯 Testing

### Cara Test:
1. Tekan tombol **Play** di Roblox Studio
2. GUI akan muncul di tengah layar dengan title **"🎯 Teleport System"
3. Klik salah satu tombol:
   - 📍 Teleport ke Part1
   - 📍 Teleport ke Part2
   - 📍 Teleport ke Part3

### Jika Tidak Berfungsi:

**Masalah:** GUI tidak muncul
- Cek apakah script ada di **StarterGui**
- Cek Output console untuk error message

**Masalah:** Teleport tidak bekerja
- Pastikan Part1, Part2, Part3 ada di Workspace
- Cek nama part (case-sensitive!)
- Lihat Output console → Output tab untuk warning messages

**Masalah:** Part tidak terdeteksi
- Pastikan nama part **PERSIS** sama (Part1, Part2, Part3)
- Tidak boleh "part1" atau "PART1"

---

## 🎨 Customization

### Ubah Warna GUI

Di `TeleportGui.lua`, cari bagian **Warna:**

```lua
-- Background frame
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- Button color
button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)

-- Close button
closeButton.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
```

**Kode warna RGB yang umum:**
- Biru: `(0, 120, 215)`
- Merah: `(220, 53, 69)`
- Hijau: `(40, 167, 69)`
- Kuning: `(255, 193, 7)`
- Ungu: `(111, 66, 193)`

### Ubah Ukuran GUI

Di `TeleportGui.lua`:
```lua
local GUI_SIZE = UDim2.new(0, 300, 0, 200) -- Lebar, Tinggi
```

### Ubah Nama Tombol

Di `TeleportGui.lua`, cari:
```lua
createButton("Button1", "📍 Teleport ke Part1", "Part1", 50)
```

Ubah text di tengah untuk mengubah tampilan tombol.

---

## 📝 Struktur Kode

### TeleportGui.lua (LocalScript)
- Berjalan di **client-side** (player)
- Membuat UI/GUI
- Menangani klik tombol
- Mengirim request teleport ke server

### TeleportService.lua (Script)
- Berjalan di **server-side**
- Verifikasi part ada
- Monitoring player join
- Debug logging

---

## 🐛 Debug Tips

### Melihat Output Console:
1. Buka Roblox Studio
2. Tekan **View** → **Output**
3. Jalankan game, lihat messages

### Pesan yang akan muncul:
- ✅ `Teleport GUI loaded successfully!` — GUI berhasil dimuat
- ✅ `Teleported to Part1` — Teleport berhasil
- ⚠️ `Part Part1 tidak ditemukan di Workspace!` — Part belum dibuat

---

## 🚀 Tips Lanjutan

### Tambah Part Baru:

1. Buat Part4, Part5, dst di Workspace
2. Di `TeleportGui.lua`, tambah:
```lua
createButton("Button4", "📍 Teleport ke Part4", "Part4", 200)
```

3. Ubah ukuran GUI:
```lua
local GUI_SIZE = UDim2.new(0, 300, 0, 250)
```

### Tambah Sound Effect:

Di `TeleportGui.lua`, sebelum teleport:
```lua
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://12221967"
sound.Volume = 0.5
sound.Parent = workspace
sound:Play()
```

---

## 📞 Support

Jika ada error, check:
1. ✅ Part1, Part2, Part3 sudah ada di Workspace
2. ✅ Script ada di tempat yang benar
3. ✅ Tidak ada typo di nama part
4. ✅ Output console untuk error messages

---

**Happy teleporting! 🎮✨**