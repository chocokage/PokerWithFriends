-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--------------------------------------------


local defaultField
local passwordField

local backGroup 
local mainGroup 
local uiGroup 

local playersValue
local chipsValue
local bigBlindValue


local function textListenerTableName( event )

   if ( event.phase == "began" ) then
       -- User begins editing "defaultField"

   elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       -- Output resulting text from "defaultField"
       print( event.target.text )

   elseif ( event.phase == "editing" ) then
       print( event.newCharacters )
       print( event.oldText )
       print( event.startPosition )
       print( event.text )
   end
end

local function textListenerTablePassword( event )

   if ( event.phase == "began" ) then
       -- User begins editing "defaultField"

   elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       -- Output resulting text from "defaultField"
       print( event.target.text )

   elseif ( event.phase == "editing" ) then
       print( event.newCharacters )
       print( event.oldText )
       print( event.startPosition )
       print( event.text )
   end
end


local sliderNumOfPlayers
-- Slider listener
local function sliderListenerNumberOfPlayers( event )
	if (event.value < 25) then
		playersValue.text = 2
	else
		playersValue.text = math.round((event.value / 100) * 8)	
	end
end

local sliderNumOfChips
local sliderSetBlinds
local function sliderListenerNumberOfChips( event )
	if (event.value < 6) then
		chipsValue.text = 1500
	else
		chipsValue.text = math.round((event.value / 100) * 25000)	
	end
	bigBlindValue.text = math.round((5 / 100) * chipsValue.text * .15)
	sliderSetBlinds:setValue(0)
end

local function sliderListenerSetBlinds( event )
	if (event.value < 5) then
		bigBlindValue.text = math.round((5 / 100) * chipsValue.text * .15)	
	else
		bigBlindValue.text = math.round((event.value / 100) * chipsValue.text * .15)	
	end
end




-- Handle press events for the buttons
local function onSwitchPress( event )
   local switch = event.target
   print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Create the widget
local onOffSwitch

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
    
    -- go to level1.lua scene
    composer.gotoScene( "level1", "fade", 500 )
    
    return true    -- indicates successful touch
end



function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view


	backGroup = display.newGroup()
	sceneGroup:insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup:insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup:insert(uiGroup)

	-- Create text field
	defaultField = native.newTextField(uiGroup, 100, 200, 25, 500 )
	defaultField.x = display.contentCenterX
	defaultField:addEventListener( "userInput", textListenerTableName )

	


	local menuTitle = display.newText( uiGroup, "Create Table", 200, 80, native.systemFont, 36 )
		menuTitle:setFillColor(255,255,255)
		menuTitle.x = display.contentCenterX
		menuTitle.y = 25

	local privateLabel = display.newText( uiGroup, "Private", 200, 80, native.systemFont, 24 )
		privateLabel:setFillColor(255,255,255)
		privateLabel.x = 5
		privateLabel.y = 70

	onOffSwitch = widget.newSwitch(
	   {
	       -- left = display.contentCenterX,
	       -- top = 50,
	       style = "onOff",
	       id = "onOffSwitch",
	       onPress = onSwitchPress
	   }
	)
	onOffSwitch.x = display.contentCenterX
	onOffSwitch.y = 70

	local tableName = display.newText( uiGroup, "Name", 0, 0, native.systemFont, 24 )
		tableName:setFillColor(255,255,255)
		tableName.x = 0
		tableName.y = 100

	local password = display.newText( uiGroup, "Password", 0, 0, native.systemFont, 24 )
		password:setFillColor(255,255,255)
		password.x = 20
		password.y = 130

	passwordField = native.newTextField(uiGroup, 130, 200, 25, 500 )
	passwordField.x = display.contentCenterX
	passwordField:addEventListener( "userInput", textListenerTablePassword )

	local numOfPlayers = display.newText( uiGroup, "# Players", 0, 0, native.systemFont, 24 )
		numOfPlayers:setFillColor(255,255,255)
		numOfPlayers.x = 20
		numOfPlayers.y = 160

	playersValue = display.newText( uiGroup, "2", 0, 0, native.systemFont, 24 )
		playersValue:setFillColor(255,255,255)
		playersValue.x = 80
		playersValue.y = 160

		

	sliderNumOfPlayers = widget.newSlider(
	   {
	       -- top = 200,
	       -- left = 50,
	       width = 200,
	       value = 0,  -- Start slider at 10% (optional)
	       listener = sliderListenerNumberOfPlayers,

	   }
	)
	sliderNumOfPlayers.x = display.contentCenterX
	sliderNumOfPlayers.y = 160


	local chipCountLabel = display.newText( uiGroup, "Chips", 200, 80, native.systemFont, 24 )
		chipCountLabel:setFillColor(255,255,255)
		chipCountLabel.x = 0
		chipCountLabel.y = 190

	chipsValue = display.newText( uiGroup, "1500", 0, 0, native.systemFont, 24 )
		chipsValue:setFillColor(255,255,255)
		chipsValue.x = 75
		chipsValue.y = 190

	sliderNumOfChips = widget.newSlider(
	   {
	       -- top = 200,
	       -- left = 50,
	       width = 200,
	       value = 0,  -- Start slider at 10% (optional)
	       listener = sliderListenerNumberOfChips,

	   }
	)
	sliderNumOfChips.x = display.contentCenterX
	sliderNumOfChips.y = 190


	local setBlindsLabel = display.newText( uiGroup, "Big Blind", 0, 0, native.systemFont, 24 )
		setBlindsLabel:setFillColor(255,255,255)
		setBlindsLabel.x = 20
		setBlindsLabel.y = 220

	bigBlindValue = display.newText( uiGroup, "11", 0, 0, native.systemFont, 24 )
	bigBlindValue:setFillColor(255,255,255)
	bigBlindValue.x = 100
	bigBlindValue.y = 220

	sliderSetBlinds = widget.newSlider(
	   {
	       -- top = 200,
	       -- left = 50,
	       width = 200,
	       value = 0,  -- Start slider at 10% (optional)
	       listener = sliderListenerSetBlinds,

	   }
	)
	sliderSetBlinds.x = display.contentCenterX
	sliderSetBlinds.y = 220
		

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
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
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