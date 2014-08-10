--dofile("battlecreate.lua")
--dofile("characterinfo.lua")
require("Cocos2d")
BatChars ={}
--战场角色
--角色状态分为等待，移动过，攻击过, 死亡
BattleChar =
{
    New = function(self, idx)
        local newChar = {}
        newChar.idx = idx
        newChar.state = "wait"
        setmetatable(newChar, self)
        return newChar
    end,

    SetPos = function(self, x, y)
        self.posx = x
        self.posy = y
        self.sx = self.psw*x + 0.5*self.psw
        self.sy = self.psh*y + 0.5*self.psh
        self.sprite:setPosition(self.sx,self.sy)
    end,

    Init = function(self, psw, psh)
        self.sx = self.posx*psw + 0.5*psw
        self.sy = self.posy*psh + 0.5*psh
        self.psw = psw
        self.psh = psh
    end,
}
BattleChar.__index = BattleChar

--战场地形
BattleField =
{
    New = function (self)
        local newBattle = {}
        newBattle.name = "test"
        setmetatable(newBattle, self)
        return newBattle
    end
    ,

    Print = function(self)
        print(self.name)
    end
    ,

    SetScreenField = function(self, w, h)
        self.sw = w
        self.sh = h
    end
    ,

    SetLogicField = function(self, w, h)
        self.lw = w
        self.lh = h
    end,

    Init = function(self)
        self.psw = self.sw / self.lw
        self.psh = self.sh / self.lh
    end,

    GetLogicPos = function(self, sw, sh)
        lx = math.floor(sw / self.psw)
        ly = math.floor(sh / self.psh)
        return lx,ly
    end,

}
BattleField.__index = BattleField


function CreateBattle(idx, sw, sh)
    --创建战场环境
    curBattle = BattleField:New(idx)
    curBattle:SetScreenField(sw,sh)
    curBattle:SetLogicField(6,5)
    curBattle:Init()
    --创建战场角色

    if idx >= 1 and idx <= #battles then
        BatChars = {}
        for _,v in pairs(battles[idx]) do
            local newChar = BattleChar:New(v.idx)
            newChar.name = v.name
            newChar.posx = v.posx
            newChar.posy = v.posy
            newChar.image = v.image
            newChar:Init(curBattle.psw, curBattle.psh)
            newChar.sprite = cc.Sprite:create(v.image)
            newChar.sprite:setPosition(newChar.sx,newChar.sy)
            BatChars[v.idx] = newChar
        end
        return 0
    else
        print("Error Battle Create")
        return idx
    end

end

function FindCharByLPos(lx, ly)
    for i, c in pairs(BatChars) do
        if (c.posx == lx and c.posy ==ly and c.state ~= "dead") then
            return i
        end
    end
    return 0
end
