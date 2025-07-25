local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

if not AS:IsAddonLODorEnabled("AtlasLoot") then return end

local select = select
local unpack = unpack

--
--https://github.com/Mr-Dan/AtlasLoot-Sirus

S:AddCallbackForAddon("AtlasLoot", "AtlasLoot", function()
	if not E.private.addOnSkins.AtlasLoot then return end

	AtlasLootTooltip:HookScript("OnShow", function(self)
		self:SetTemplate("Transparent", nil, true)

		local r, g, b = self:GetBackdropColor()
		self:SetBackdropColor(r, g, b, E.db.tooltip.colorAlpha)

		local iLink = select(2, self:GetItem())
		local quality = iLink and select(3, GetItemInfo(iLink))
		if quality and quality >= 2 then
			self:SetBackdropBorderColor(GetItemQualityColor(quality))
		else
			self:SetBackdropBorderColor(unpack(E.media.bordercolor))
		end
	end)

	AtlasLootDefaultFrame:StripTextures()
	AtlasLootDefaultFrame:SetTemplate("Transparent")

	S:HandleCloseButton(AtlasLootDefaultFrame_CloseButton, AtlasLootDefaultFrame)

	S:HandleButton(AtlasLootDefaultFrame_Options)
	S:HandleButton(AtlasLootDefaultFrame_LoadModules)
	S:HandleButton(AtlasLootDefaultFrame_Menu)
	S:HandleButton(AtlasLootDefaultFrame_SubMenu)

	AtlasLootDefaultFrame_LootBackground_Back:SetTexture()
	AtlasLootDefaultFrame_LootBackground:SetTemplate("Transparent")

	S:HandleButton(AtlasLootDefaultFrame_Preset1)
	S:HandleButton(AtlasLootDefaultFrame_Preset2)
	S:HandleButton(AtlasLootDefaultFrame_Preset3)
	S:HandleButton(AtlasLootDefaultFrame_Preset4)
	S:HandleButton(AtlasLootDefaultFrame_Preset5)
	S:HandleButton(AtlasLootDefaultFrame_Preset6)
	S:HandleButton(AtlasLootDefaultFrame_Preset7)
	S:HandleButton(AtlasLootDefaultFrame_Preset8)
	S:HandleButton(AtlasLootDefaultFrame_Preset9)
	S:HandleButton(AtlasLootDefaultFrame_Preset10)

	S:HandleButton(AtlasLootDefaultFrameWishListButton)
	S:HandleEditBox(AtlasLootDefaultFrameSearchBox)
	S:HandleButton(AtlasLootDefaultFrameSearchButton)
	S:HandleNextPrevButton(AtlasLootDefaultFrameSearchOptionsButton)
	S:HandleButton(AtlasLootDefaultFrameSearchClearButton)
	S:HandleButton(AtlasLootDefaultFrameLastResultButton)

	AtlasLootDefaultFrame_Options:Point("TOPLEFT", 43, -11)
	AtlasLootDefaultFrame_LoadModules:Point("TOPRIGHT", -42, -11)

	AtlasLootDefaultFrame_Preset1:Point("BOTTOMLEFT", 83, 59)

	AtlasLootDefaultFrameSearchBox:Height(22)
	AtlasLootDefaultFrameSearchBox:Point("BOTTOM", AtlasLootDefaultFrame, "BOTTOM", -83, 29)

	AtlasLootDefaultFrameSearchButton:Point("LEFT", AtlasLootDefaultFrameSearchBox, "RIGHT", 6, 0)

	AtlasLootDefaultFrameSearchOptionsButton:Size(24)
	AtlasLootDefaultFrameSearchOptionsButton:Point("LEFT", AtlasLootDefaultFrameSearchButton, "RIGHT", 5, 0)
	AtlasLootDefaultFrameSearchClearButton:Point("LEFT", AtlasLootDefaultFrameSearchOptionsButton, "RIGHT", 5, 0)
	AtlasLootDefaultFrameLastResultButton:Point("LEFT", AtlasLootDefaultFrameSearchClearButton, "RIGHT", 5, 0)
	AtlasLootDefaultFrameWishListButton:Point("RIGHT", AtlasLootDefaultFrameSearchBox, "LEFT", -6, 0)

	AtlasLootDefaultFrame_Notice:Point("BOTTOM", 0, 9)

	S:HandleCloseButton(AtlasLootItemsFrame_CloseButton)

	S:HandleButton(AtlasLootInfoHidePanel)

	for i = 1, 30 do
		_G["AtlasLootItem_" .. i .. "_Icon"]:SetTexCoord(unpack(E.TexCoords))
		_G["AtlasLootItem_" .. i]:CreateBackdrop("Default")
		_G["AtlasLootItem_" .. i].backdrop:SetOutside(_G["AtlasLootItem_" .. i .. "_Icon"])

		_G["AtlasLootMenuItem_" .. i .. "_Icon"]:SetTexCoord(unpack(E.TexCoords))
		_G["AtlasLootMenuItem_" .. i]:CreateBackdrop("Default")
		_G["AtlasLootMenuItem_" .. i].backdrop:SetOutside(_G["AtlasLootMenuItem_" .. i .. "_Icon"])
	end

	S:HandleButton(AtlasLoot10Man25ManSwitch)
	S:HandleButton(AtlasLootServerQueryButton)
	S:HandleCheckBox(AtlasLootItemsFrame_Heroic)
	S:HandleCheckBox(AtlasLootFilterCheck)
	S:HandleButton(AtlasLootItemsFrame_BACK)
	S:HandleNextPrevButton(AtlasLootQuickLooksButton)
	S:HandleNextPrevButton(AtlasLootItemsFrame_PREV)
	S:HandleNextPrevButton(AtlasLootItemsFrame_NEXT)

	-- AtlasLootItemsFrame_Back:SetTexture()

	AtlasLoot10Man25ManSwitch:Height(24)
	AtlasLootServerQueryButton:Height(24)
	AtlasLootItemsFrame_BACK:Height(24)

	AtlasLoot10Man25ManSwitch:Point("BOTTOM", -130, 3)
	AtlasLootServerQueryButton:Point("BOTTOM", 131, 3)
	AtlasLootItemsFrame_BACK:Point("BOTTOM", 0, 3)

	AtlasLootItemsFrame_Heroic:Point("BOTTOM", -185, 28)
	AtlasLootFilterCheck:Point("BOTTOM", 115, 28)
	AtlasLootQuickLooksButton:Point("BOTTOM", 58, 32)

	AtlasLootItemsFrame_PREV:Point("BOTTOMLEFT", 7, 6)
	AtlasLootItemsFrame_NEXT:Point("BOTTOMRIGHT", -6, 6)

	S:HandleCheckBox(AtlasLootOptionsFrameDefaultTT)
	S:HandleCheckBox(AtlasLootOptionsFrameLootlinkTT)
	S:HandleCheckBox(AtlasLootOptionsFrameItemSyncTT)
	S:HandleCheckBox(AtlasLootOptionsFrameOpaque)
	S:HandleCheckBox(AtlasLootOptionsFrameItemID)
	S:HandleCheckBox(AtlasLootOptionsFrameLoDStartup)
	S:HandleCheckBox(AtlasLootOptionsFrameSafeLinks)
	S:HandleCheckBox(AtlasLootOptionsFrameEquipCompare)
	S:HandleCheckBox(AtlasLootOptionsFrameItemSpam)
	S:HandleCheckBox(AtlasLootOptionsFrameHidePanel)
	-- if AtlasLootWishlistOwnOptionsScrollFrameSharedCheckBox then
	-- -- S:HandleCheckBox(AtlasLootWishlistOwnOptionsScrollFrameSharedCheckBox)
	-- end

	-- S:HandleCheckBox(AtlasLootOptionsCheckAxeWeaponsMeele)

	S:HandleDropDownBox(AtlasLoot_SelectLootBrowserStyle)
	S:HandleDropDownBox(AtlasLoot_CraftingLink)

	S:HandleSliderFrame(AtlasLootOptionsFrameLootBrowserScale)

	S:HandleButton(AtlasLootOptionsFrame_ResetWishlist)
	S:HandleButton(AtlasLootOptionsFrame_ResetAtlasLoot)
	S:HandleButton(AtlasLootOptionsFrame_ResetQuicklooks)
	S:HandleButton(AtlasLootOptionsFrame_FuBarShow)
	S:HandleButton(AtlasLootOptionsFrame_FuBarHide)

	AtlasLootPanel:StripTextures()
	AtlasLootPanel:SetTemplate("Transparent")

	S:HandleButton(AtlasLootPanel_WorldEvents)
	AtlasLootPanel_WorldEvents:Point("LEFT", AtlasLootPanel, "LEFT", 7, 29)
	S:HandleButton(AtlasLootPanel_Sets)
	AtlasLootPanel_Sets:Point("LEFT", AtlasLootPanel_WorldEvents, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootPanel_Reputation)
	AtlasLootPanel_Reputation:Point("LEFT", AtlasLootPanel_Sets, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootPanel_PvP)
	AtlasLootPanel_PvP:Point("LEFT", AtlasLootPanel_Reputation, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootPanel_Crafting)
	AtlasLootPanel_Crafting:Point("LEFT", AtlasLootPanel_PvP, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootPanel_WishList)
	AtlasLootPanel_WishList:Point("LEFT", AtlasLootPanel_Crafting, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootPanel_Options)
	S:HandleButton(AtlasLootPanel_LoadModules)
	S:HandleButton(AtlasLootPanel_Preset1)
	S:HandleButton(AtlasLootPanel_Preset2)
	S:HandleButton(AtlasLootPanel_Preset3)
	S:HandleButton(AtlasLootPanel_Preset4)

	S:HandleEditBox(AtlasLootSearchBox)
	AtlasLootSearchBox:Height(20)
	S:HandleButton(AtlasLootSearchButton)
	AtlasLootSearchButton:Height(22)
	AtlasLootSearchButton:Point("LEFT", AtlasLootSearchBox, "RIGHT", 3, 0)
	S:HandleNextPrevButton(AtlasLootSearchOptionsButton)
	AtlasLootSearchOptionsButton:Point("LEFT", AtlasLootSearchButton, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootSearchClearButton)
	AtlasLootSearchClearButton:Height(22)
	AtlasLootSearchClearButton:Point("LEFT", AtlasLootSearchOptionsButton, "RIGHT", 2, 0)
	S:HandleButton(AtlasLootLastResultButton)
	AtlasLootLastResultButton:Height(22)
	AtlasLootLastResultButton:Point("LEFT", AtlasLootSearchClearButton, "RIGHT", 2, 0)

	if AS:IsAddonEnabled("Atlas") then
		hooksecurefunc("AtlasLoot_SetupForAtlas", function()
			AtlasLootInfo:Point("TOPLEFT", 546, 15)
			AtlasLootPanel:Point("TOP", "AtlasFrame", "BOTTOM", 0, 1)
		end)

		hooksecurefunc("AtlasLoot_SetItemInfoFrame", function(pFrame)
			if not pFrame or pFrame == AtlasFrame then
				AtlasLootItemsFrame:Point("TOPLEFT", 15, -74)
			end
		end)
	end

	AS:SkinLibrary("Dewdrop-2.0")


--- 2st frame
	local optcheckboxes = {
		"AtlasLootOptionsCheckClothArmor",
		"AtlasLootOptionsCheckLeatherArmor",
		"AtlasLootOptionsCheckMailArmor",
		"AtlasLootOptionsCheckPlateArmor",

		"AtlasLootOptionsCheckHeld in Off-HandWeaponsMeele",
		"AtlasLootOptionsCheckDaggerWeaponsMeele",
		"AtlasLootOptionsCheckMaceWeaponsMeele",
		"AtlasLootOptionsCheckStaffWeaponsMeele",
		"AtlasLootOptionsCheckAxeWeaponsMeele",
		"AtlasLootOptionsCheckPolearmWeaponsMeele",
		"AtlasLootOptionsCheckSwordWeaponsMeele",
		"AtlasLootOptionsCheckShieldWeaponsMeele",
		"AtlasLootOptionsCheckFist WeaponWeaponsMeele",
		"AtlasLootOptionsCheckMaceWeaponsMeeleTwoHand",
		"AtlasLootOptionsCheckSwordWeaponsMeeleTwoHand",
		"AtlasLootOptionsCheckWandWeaponsRanged",
		"AtlasLootOptionsCheckCrossbowWeaponsRanged",
		"AtlasLootOptionsCheckThrownWeaponsRanged",
		"AtlasLootOptionsCheckIdolRelics",
		"AtlasLootOptionsCheckLibramRelics",
		"AtlasLootOptionsCheckRingOther",
		"AtlasLootOptionsCheckNeckOther",

		"AtlasLootOptionsCheckAxeWeaponsMeeleTwoHand",
		"AtlasLootOptionsCheckBowWeaponsRanged",
		"AtlasLootOptionsCheckGunWeaponsRanged",
		"AtlasLootOptionsCheckTotemRelics",
		"AtlasLootOptionsCheckSigilsRelics",
		"AtlasLootOptionsCheckTrinketOther",
		"AtlasLootOptionsCheckBackOther",

		-- spisok need
		"AtlasLootOptionsWishListMark",
		"AtlasLootOptionsWishListMarkOwn",
		"AtlasLootOptionsWishListMarkAll",
		"AtlasLootOptionsWishListShare",
		"AtlasLootOptionsWishListShareInCombat",
		"AtlasLootOptionsWishListAutoAdd",

		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",
		-- "AtlasLootOptionsCheckThrownWeaponsRanged",

		}
		for _,optcheckbox in ipairs(optcheckboxes) do
			optcheckbox = _G[optcheckbox]
					if optcheckbox then
						S:HandleButton(optcheckbox)
						optcheckbox:Size(21)
					end
		end

	local optscrollframes = {
		"AtlasLootFilterOptionsScrollFrameScrollBar",
		--2snd frame
		"AtlasLootWishlistOwnOptionsScrollFrameScrollBar",

		"AtlasLootWishlistAddFrameIconListScrollBar",

		}
		for _,scrollframe in ipairs(optscrollframes) do
			scrollframe = _G[scrollframe]
					if scrollframe then
						S:HandleScrollBar(scrollframe)
					end
		end

	local buttons = {
		"AtlasLootFilterOptionsFilterDisableButton",
		"AtlasLootFilterOptionsClassFilterLoadButton",
		"AtlasLootWishlistOwnOptionsScrollFrameShowAllWishlistsButton",
		"AtlasLootWishlistOwnOptionsScrollFrameShowOwnWishlistsButton",
		"AtlasLootWishlistOwnOptionsScrollFrameShowSharedWishlistsButton",
		"AtlasLootWishlistOwnOptionsScrollFrameAddWishlistButton",

		"AtlasLootAddEditWishList",
		"AtlasLootAddWishListNameAddWishlistIcons",

		}
		for _,button in ipairs(buttons) do
			button = _G[button]
					if button then
						S:HandleButton(button)
					end
		end

	local closebuttons = {
		"AtlasLootAddWishListNameCloseButton",

		}
		for _,closebutton in ipairs(closebuttons) do
			closebutton = _G[closebutton]
					if closebutton then
						S:HandleCloseButton(closebutton)
					end
		end

	local frames = {
		"AtlasLootWishList_AddFrame",

		}
		for _,frame in ipairs(frames) do
			frame = _G[frame]
			if frame then
				frame:StripTextures()
				frame:CreateBackdrop("Transparent")
			end
		end

	local editboxes = {
		"AtlasLootWishListNewName",
		}
		for _,editbox in ipairs(editboxes) do
			editbox = _G[editbox]
			if editbox then
				S:HandleEditBox(editbox)
				editbox:SetHeight(28)
			end
		end

	local function changelogatasloothook()
		local dropdowns = {
			"ChangelogDropDown",
			}
			for _,dropdown in ipairs(dropdowns) do
				dropdown = _G[dropdown]
				if dropdown then
					S:HandleDropDownBox(dropdown)
					local dropdownArrowColor = {1, 0.8, 0}
					S:HandleNextPrevButton(ChangelogDropDownButton, "down", dropdownArrowColor)
					ChangelogDropDown:Size(25)
				end
			end
			S:HandleScrollBar(_G["AtlasLootChangelog_ScrollFrameScrollBar"])
	end

	local function helpatasloothook()
		S:HandleScrollBar(_G["AtlasLootHelpFrame_HelpTextFrameScrollScrollBar"])
	end



	hooksecurefunc("AtlasLoot_DisplayChangelog",changelogatasloothook)
	hooksecurefunc("AtlasLoot_DisplayHelp",helpatasloothook)


	AtlasLootDefaultFrame:HookScript("OnShow", function()
		_G["AtlasLootDefaultFrameSearchButtonFilter"]:StripTextures()
		-- S:HandleButton(_G["AtlasLootDefaultFrameSearchButtonFilter"])
		_G["AtlasLootDefaultFrameSearchButtonFilter"]:ClearAllPoints()
		_G["AtlasLootDefaultFrameSearchButtonFilter"]:SetPoint("LEFT", AtlasLootDefaultFrameSearchBox, "RIGHT", -20, 0)
		-- local normtex = _G["AtlasLootDefaultFrameSearchButtonFilter"]:SetNormalTexture("Interface\\Buttons\\on")
		-- local pushtex =_G["AtlasLootDefaultFrameSearchButtonFilter"]:SetPushedTexture("Interface\\Buttons\\click")
		-- _G["AtlasLootDefaultFrameSearchButtonFilter"]:SetTexCoord(unpack(E.TexCoords))
		-- _G["AtlasLootDefaultFrameSearchButtonFilter"]:SetText("ф")
		_G["AtlasLootDefaultFrameSearchButtonFilter"]:HookScript("OnClick",function()
			_G["AtlasLootDefaultFrameFilter"]:StripTextures()
			_G["AtlasLootDefaultFrameFilter"]:CreateBackdrop("Transparent")

			local checkboxes = {
				"AtlasLootCheckButtonFilterEnable",
				"AtlasLootCheckButtonCloth",
				"AtlasLootCheckButtonLeather",
				"AtlasLootCheckButtonMail",
				"AtlasLootCheckButtonPlate",
				"AtlasLootCheckButtonWeapon",
				"AtlasLootCheckButton2Weapon",
				"AtlasLootCheckButtonMainHand",
				"AtlasLootCheckButtonOffHand",
				-- "AtlasLootCheckButtonFilterEnable",
				-- "AtlasLootCheckButtonFilterEnable",
				-- "AtlasLootCheckButtonFilterEnable",
				-- "AtlasLootCheckButtonFilterEnable",
			}
			for _,checkbox in ipairs(checkboxes) do
				checkbox = _G[checkbox]
				if checkbox then
					S:HandleCheckBox(checkbox)
				end
			end
			editboxes = {
				"AtlasLootDefaultFrameFilterBoxIlvlFrom",
				"AtlasLootDefaultFrameFilterBoxIlvlBefore",
				"AtlasLootDefaultFrameFilterBoxlvlFrom",
				"AtlasLootDefaultFrameFilterBoxlvlBefore",
				}
			for _,editbox in ipairs(editboxes) do
				editbox = _G[editbox]
				if editbox then
					S:HandleEditBox(editbox)
				end
			end
		end)
	end)
	AtlasLootDefaultFrame_LockButton:Point("BOTTOM", AtlasLootDefaultFrame_CloseButton, "BOTTOM", 0, -20)
	AtlasLootDefaultFrame_LockButton:SetHitRectInsets(6, 6, 6, 6)

	ALLockButtonTex:SetInside(AtlasLootDefaultFrame_LockButton, 10, 10)
	ALLockButtonTexP:SetInside(AtlasLootDefaultFrame_LockButton, 10, 10)
	ALLockButtonTex:SetTexCoord(.36, .65, .32, .73)
	ALLockButtonTexP:SetTexCoord(.36, .60, .38, .76)

	hooksecurefunc("AtlasLoot_UpdateLock", function()
		ALLockButtonTex:SetDesaturated(true)
		ALLockButtonTexP:SetDesaturated(true)
	end)
	AtlasLoot_UpdateLock()



end)

S:AddCallbackForAddon("AtlasLootFu", "AtlasLootFu", function()
	AS:SkinLibrary("AceAddon-2.0")
	AS:SkinLibrary("Tablet-2.0")
end)