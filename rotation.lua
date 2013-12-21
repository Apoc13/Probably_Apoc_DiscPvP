-- ProbablyEngine Rotation Packager
-- Custom Discipline Priest Rotation
-- Created on Nov 19th 2013 11:02 am

ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for unit,_ in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end
  end,
})
ProbablyEngine.rotation.register_custom(256, "Apoc_DiscPvP", {

--In Combat

   {"588",
     "!player.buff(588)"}, 
        --Inner Fire 
   {"89485", 
      "!spell(89485).cooldown"},  
        --Inner Focus
   {"81700",
      "player.buff(81662).count=5"},    
        --Archangel/Evangelism
   {"21562",
      "!player.buff(21562)"}, 
        --Power Word: Fortitude 
   {"!17",{
     "!lowest.debuff(6788)",
     "lowest.health < 100"},
     "lowest"},  
       --Power Word: Shield/Weakened Soul
   {"6346",
     "!player.buff(6346)"}, 
        --Fear Ward 

--Survival

   {"33206",
     "!player.buff(33206)",
     "player.health <= 80"},  
       --Pain Suppression 
   {"33076",
     "!lowest.buff(33076).cooldown",
     "lowest.health <= 50"},  
       --Prayer of Mending
   {"!2060", 
	"lowest.health <= 60"},  
       --Greater Heal
   {"!139",
     "!lowest.buff(139)",
     "lowest.health <= 80"},  
       --Renew
   {"!2061",
     "lowest.health <= 70"}, 
       --Flash Heal 
    {"32546", 
	"lowest.health <= 40"}, 
       --Binding Heal
   {"!19236", 
	"spell(19236).cooldown",
	"player.health <= 30"}, 
       --Desperate Prayer    
   {"73325",
     "lowest.health <= 20",
     "lowest.range <= 40"},
   {"527", 
     "player.mana > 30",
     "@coreHealing.needsDispelled(527)"},
       --Purify
   {"528",
     "target.dispellable(528)",
     "target"},  
       --Dispell Magic 

   --Mana

   {"123040",{
     "player.mana <= 80",
     "target.range <= 40"}}, 
       --Mindbender 
   {"64901",
     "player.mana <= 25"}, 
       --Hymn of Hope  

--Survival Aoe's

   {"!8122",
     "!target.immune.fear",
     "target.range <= 5"}, 
       --Psychic Scream 
   {"108921",
     "modifier.cooldown",
     "ground"}, 
       --Psyfiend 
   {"62618",
     "modifier.lalt",
     "ground"}, --DomeHeal

--Deeps Rotation

   {"32379",{
     "!target.health <= 20",
     "!modifier.last(32379)"},
     "target"}, 
       --Shadow Word: Death 
   {"589",{
     "!target.debuff(589)",
     "!target.health > 20"},
     "target"}, 
       --Shadow Word: Pain 
   {"121135"}, 
       --Cascade 
   {"10060"}, 
       --Power Infusion 
   {"14914"}, 
       --Holy Fire 
   {"47540"}, 
       --Penance 
   {"585"}, 
       --Smite   

},{

--Out of Combat    

  --Buffs

   {"588",
     "!player.buff(588)"}, 
       --Inner Fire 
   {"89485",
      "!spell(89485)"}, 
       --Inner Focus
   {"21562",
     "!player.buff(21562)"}, 
       --Power Word: Fortitude 21562

  --Healing OOC Rotation

   {"17",{ 
	"!lowest.debuff(6788)",
     "lowest.health <= 90"},
     "lowest"}, 
       --Power Word: Shield
   {"139", {
	"!lowest.buff(139)", 
	"lowest.health <= 90",
	"lowest.range <= 40"}, 
     "lowest"}, 
       --Renew
   {"2061", {
	"lowest.range <= 40",
	"lowest.health <= 20"}, 
     "lowest"}, 
       --Flash Heal
   {"32546", {
	"lowest.range <= 40",
	"lowest.health <= 40"},
     "lowest"}, 
       --Binding Heal

 --Mana

   {"64901",
     "player.mana <= 50"}, 
       --Hymn of Hope  
  })
