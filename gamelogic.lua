--dofile("battle.lua")
ClickedChar = 0

OperateMsg = nil

function Distance(a, b, c, d)
	x = math.abs(a-c)
	y = math.abs(b-d)
	return (x+y)
end

function CharAttack(attackerID, targetID)
	BatChars[attackerID].state = "attacked"
end

function HandleLuaClick(sw, sh)
    local lx, ly = curBattle:GetLogicPos(sw, sh)
    local charID = FindCharByLPos(lx, ly)
    if ClickedChar == 0 then
        ClickedChar = charID
        return 1
    else
        if charID == 0 then
            if(BatChars[ClickedChar].state == "wait") then
                curPosx = BatChars[ClickedChar].posx
                curPosy = BatChars[ClickedChar].posy
                d = Distance(curPosx, curPosy, lx, ly)

                BatChars[ClickedChar]:SetPos(lx, ly)
                return 2
            end
        else
            if(BatChars[ClickedChar].state == "attacked") then
                ClickedChar = charID
                return 3
            else
                CharAttack(ClickedChar, charID)
                return 4
            end
        end
    end
end
--[[
function HandleLeftClick(sw, sh)
	OperateMsg = {}
	local lx, ly = curBattle:GetLogicPos(sw, sh)
	local charID = FindCharByLPos(lx, ly)
	if ClickedChar == 0 then
		ClickedChar = charID
		OperateMsg.event = "clickchar"
		OperateMsg.charidx = ClickedChar
		OperateMsg.sx = lx
		OperateMsg.sy = ly
		return 1
	else
		if charID == 0 then
			if(BatChars[ClickedChar].state == "wait") then
				curPosx = BatChars[ClickedChar].posx
				curPosy = BatChars[ClickedChar].posy
				d = Distance(curPosx, curPosy, lx, ly)

				BatChars[ClickedChar]:SetPos(lx, ly)
				OperateMsg.event = "charmove"
				OperateMsg.charidx = ClickedChar
				OperateMsg.sx = BatChars[ClickedChar].sx
				OperateMsg.sy = BatChars[ClickedChar].sy
				return 2
			end
		else
			if(BatChars[ClickedChar].state == "attacked") then
				ClickedChar = charID
				OperateMsg.event = "clickchar"
				return 3
			else
				CharAttack(ClickedChar, charID)
				OperateMsg.event = "attack"
				return 4
			end
		end
	end
end
]]
