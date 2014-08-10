function BattleCharInit(idx, name, x, y, image)
    local self = {}

    self.idx = idx
    self.name = name
    self.posx = x
    self.posy = y
    self.image = image

    return self
end


battle_1 = {BattleCharInit(1, "sophia", 0, 1, "char1.png"),
    BattleCharInit(2, "cloud", 0, 2, "char2.png"),
    BattleCharInit(3, "skeletons", 4, 2, "char4.png"),
    BattleCharInit(4, "skeletons", 4, 3, "char4.png")}

battles = {battle_1}

return battles