------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Tavarok"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Tavarok",

	prison = "Crystal Prison",
	prison_desc = "Warn when someone is put in a Crystal Prison",
	prison_message = "Crystal Prison: %s",

	icon = "Raid Icon",
	icon_desc = "Place a Raid Icon on the player in a Crystal Prison(requires leader).",
} end )

L:RegisterTranslations("zhCN", function() return {
	prison = "ˮ������",
	prison_desc = "����������ˮ������ʱ����������",
	prison_message = "ˮ�����Σ�>%s<��",

	icon = "�Ŷӱ��",
	icon_desc = "Ϊ����ˮ�����εĶ��Ѵ����Ŷӱ�ǡ�����ҪȨ�ޣ�",
} end )

L:RegisterTranslations("koKR", function() return {
	prison = "���� ����",
	prison_desc = "���� ������ �ɸ� �÷��̾ �˸��ϴ�.",
	prison_message = "Crystal Prison: %s",

	icon = "���ݴ� ������",
	icon_desc = "���� ������ �ɸ� �÷��̾�� ���� ǥ�ø� �����մϴ�. (�±��� �̻� ���� �䱸)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.partyContent = true
mod.otherMenu = "Auchindoun"
mod.zonename = BZ["Mana-Tombs"]
mod.enabletrigger = boss 
mod.guid = 18343
mod.toggleoptions = {"prison", "icon", "bosskill"}
mod.revision = tonumber(("$Revision$"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_SUCCESS", "Prison", 32361)
	self:AddCombatListener("UNIT_DIED", "BossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Prison(player, spellId)
	if self.db.profile.prison then
		self:IfMessage(L["prison_message"]:format(player), "Important", 32361)
	end
	self:Icon(player, "icon")
end
