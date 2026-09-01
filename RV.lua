RV — базовый Roblox Script

-- RV Script
-- Название: RV

local RV = {}

function RV.Start()
	print("RV Script запущен!")
end

function RV.Message(text)
	print("[RV]: " .. text)
end

RV.Start()
RV.Message("Добро пожаловать в RV!")

return RV
