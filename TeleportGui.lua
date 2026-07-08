-- TeleportGui.lua
-- Script ini ditempatkan di StarterGui
-- Membuat GUI untuk teleport system dengan 3 tombol

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Konfigurasi GUI
local GUI_SIZE = UDim2.new(0, 300, 0, 200)
local BUTTON_SIZE = UDim2.new(0, 250, 0, 40)
local BUTTON_SPACING = 10

-- Membuat Frame utama
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = GUI_SIZE
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Center screen
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
mainFrame.Parent = screenGui

-- Membuat UICorner untuk round corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Membuat Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0, 250, 0, 30)
titleLabel.Position = UDim2.new(0.5, -125, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🎯 Teleport System"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Fungsi untuk membuat tombol
local function createButton(name, displayName, part, yPosition)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = BUTTON_SIZE
	button.Position = UDim2.new(0.5, -125, 0, yPosition)
	button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Text = displayName
	button.TextSize = 14
	button.Font = Enum.Font.Gotham
	button.Parent = mainFrame

	-- Tambah UICorner ke tombol
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 6)
	buttonCorner.Parent = button

	-- Hover effect
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
	end)

	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
	end)

	-- Click event
	button.MouseButton1Click:Connect(function()
		local teleportPart = workspace:FindFirstChild(part)
		if teleportPart then
			-- Teleport karakter ke part
			local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				humanoidRootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 5, 0) -- 5 studs di atas part
				print("Teleported to " .. part)
			end
		else
			warn("Part " .. part .. " tidak ditemukan di Workspace!")
		end
	end)

	return button
end

-- Membuat 3 tombol teleport
createButton("Button1", "📍 Teleport ke Part1", "Part1", 50)
createButton("Button2", "📍 Teleport ke Part2", "Part2", 100)
createButton("Button3", "📍 Teleport ke Part3", "Part3", 150)

-- Membuat tombol close (opsional)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(0.5, 110, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "×"
closeButton.TextSize = 20
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

print("✅ Teleport GUI loaded successfully!")