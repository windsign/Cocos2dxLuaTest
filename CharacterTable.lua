function charBaseInfo(name, class, race, power, defence, magedefence, life, mana, speed, attackrange, image)
    local self = {}
    local function init()
        self.name = name
        self.class = class
        self.race = race
        self.power = power
        self.defence = defence
        self.magedefence = magedefence
        self.life = life
        self.mana = mana
        self.speed = speed
        self.attackrange = attackrange
        self.image = image
    end
    init()
    return self
end
--PC
BaseInfo = {}
BaseInfo.sophia = charBaseInfo("sophia", "saber", "human", 5, 2, 2, 10, 6, 2, 1, "char1.png")
BaseInfo.cloud = charBaseInfo("cloud", "saber", "human", 4, 2, 1, 9, 4, 2, 2, "char2.png")

--NPC
BaseInfo.skeletons = charBaseInfo("skeletons", "saber", "undead", 3, 1, 0, 7, 0, 1, 1, "char4.png")

return BaseInfo