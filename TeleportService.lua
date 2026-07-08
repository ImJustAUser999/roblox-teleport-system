-- TeleportService.lua
-- Script ini ditempatkan di ServerScriptService
-- Menangani logika teleport server-side

local TeleportService = {}

-- Konfigurasi
local TELEPORT_PARTS = {"Part1", "Part2", "Part3"}
local TELEPORT_DELAY = 0.5 -- Delay untuk animasi

-- Fungsi untuk memverifikasi part ada di workspace
local function verifyParts()
	print("🔍 Memverifikasi keberadaan part...")
	for _, partName in ipairs(TELEPORT_PARTS) do
		local part = workspace:FindFirstChild(partName)
		if part then
			print("✅ Part ditemukan: " .. partName .. " di posisi " .. tostring(part.Position))
		else
			warn("⚠️ Part tidak ditemukan: " .. partName)
		end
	end
end

-- Fungsi teleport
function TeleportService:Teleport(player, targetPartName)
	if not player or not player.Character then
		warn("Player atau character tidak valid")
		return false
	end

	local targetPart = workspace:FindFirstChild(targetPartName)
	if not targetPart then
		warn("Target part tidak ditemukan: " .. targetPartName)
		return false
	end

	local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		warn("HumanoidRootPart tidak ditemukan untuk player: " .. player.Name)
		return false
	end

	-- Teleport dengan smooth effect
	humanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
	print("✅ " .. player.Name .. " teleported ke " .. targetPartName)
	return true
end

-- Verifikasi saat server startup
verifyParts()

-- Monitoring part changes
workspace.DescendantAdded:Connect(function(instance)
	if table.find(TELEPORT_PARTS, instance.Name) then
		print("✅ Deteksi part baru: " .. instance.Name)
	end
end)

-- Error handling untuk player yang respawn
game.Players.PlayerAdded:Connect(function(player)
	print("👤 Player joined: " .. player.Name)
	player.CharacterAdded:Connect(function(character)
		print("✨ Character loaded untuk " .. player.Name)
	end)
end)

print("🚀 TeleportService initialized!")