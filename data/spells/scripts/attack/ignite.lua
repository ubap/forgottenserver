local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onTargetCreature(creature, target)
	local min = (creature:getLevel() * 0.03) + (creature:getMagicLevel() * 0.3) + 2
	local max = (creature:getLevel() * 0.03) + (creature:getMagicLevel() * 0.55) + 4
	local rounds = math.random(math.floor(min), math.floor(max))
	local damage = target:isPlayer() and 5 or 10
	creature:addDamageCondition(target, CONDITION_FIRE, 2, damage, {8, 10}, rounds)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
