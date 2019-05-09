local getui = ui.get
local setui = ui.set
local checkbox = ui.new_checkbox
local reference = ui.reference

local enable = ui.new_checkbox("Rage", "Other", "Disable head hitbox while fakeducking")

local targetHitbox = reference("Rage", "Aimbot", "Target hitbox")
local infiniteDuck = reference("AA", "Other", "Infinite duck")
local duckPeekAssist = reference("Rage", "Other", "Duck peek assist")

local function disable_head()
	local hitboxes = getui(targetHitbox)

	for i=1, #hitboxes do
		if hitboxes[i] == "Head" then
			table.remove(hitboxes, i)
			break
		end
	end

	setui(targetHitbox, hitboxes)
end

local function enable_head()
	local hitboxes = getui(targetHitbox)

	table.insert(hitboxes, "Head")
	setui(targetHitbox, hitboxes)
end

local function run_cmd()
	if getui(enable, true) then
		if getui(infiniteDuck, true) and getui(duckPeekAssist, true) then
			disable_head()
		else
			enable_head()
		end
	end
end

client.set_event_callback('run_command', run_cmd)
