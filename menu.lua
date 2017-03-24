-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onCreateTableBtn()
    
    -- go to level1.lua scene
    composer.gotoScene( "createTable", "fade", 500 )
    
    return true    -- indicates successful touch
end



local backGroup 
local mainGroup 
local uiGroup 



function scene:create( event )
	print('scene1 click detected')
	local sceneGroup = self.view

	backGroup = display.newGroup()
	sceneGroup:insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup:insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup:insert(uiGroup)
	

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local viewOpenTblsBtn = display.newImageRect( uiGroup, "ButtonViewOpenTbls.png", 150, 55 )
	viewOpenTblsBtn.x = display.contentCenterX
	viewOpenTblsBtn.y = display.contentCenterY - 75

	local viewCreateTblBtn = display.newImageRect( uiGroup, "ButtonCreateTbl.png", 150, 55 )
	viewCreateTblBtn.x = display.contentCenterX
	viewCreateTblBtn.y = display.contentCenterY
	viewCreateTblBtn:addEventListener( "tap", onCreateTableBtn )

	local viewSettingsBtn = display.newImageRect( uiGroup, "ButtonSettings.png", 150, 55 )
	viewSettingsBtn.x = display.contentCenterX
	viewSettingsBtn.y = display.contentCenterY + 75

	local menuTitle = display.newText( uiGroup, "Menu", 200, 80, native.systemFont, 36 )
		menuTitle:setFillColor(255,255,255)
		menuTitle.x = display.contentCenterX
		menuTitle.y = 25

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		composer.removeScene( "menu" )
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

return scene