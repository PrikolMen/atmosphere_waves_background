atmosphere.Require( 'convars' )

PANEL.ClassName = 'Waves'
PANEL.ABackground = true
PANEL.Base = 'AHTML'

local convars = atmosphere.convars

local count = convars.Create( 'waves_count', 3, TYPE_NUMBER, ' - Waves count on background.', true )
local width = convars.Create( 'waves_width', 200, TYPE_NUMBER, ' - Waves width on background.', true )

function PANEL:Init()
    self:Setup( count:GetValue(), width:GetValue() )

    convars.SetChangeCallback( count:GetName(), 'atmosphere.backgrounds.waves', function( int )
        if not IsValid( self ) then return end
        self:Setup( int, width:GetValue() )
    end )

    convars.SetChangeCallback( width:GetName(), 'atmosphere.backgrounds.waves', function( int )
        if not IsValid( self ) then return end
        self:Setup( count:GetValue(), int )
    end )
end

function PANEL:Setup( count, width )
    self:OpenURL( 'asset://garrysmod/html/atmosphere/backgrounds/waves/index.html' )
    self:QueueJavascript( string.format( 'var waves = new Waves(document.body, {fps: true, waves: %i, width: %i});waves.animate();', count, width ) )
end