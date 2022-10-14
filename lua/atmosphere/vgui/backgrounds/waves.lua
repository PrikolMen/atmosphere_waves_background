atmosphere.Module( 'cvars2' )

local PANEL = {}

PANEL.WaveCount = cvars2.Create( 'waves_count', 'Wave count on background.', '3', 'int', nil, 0, 25 )
cvars2.Callback('waves_count', function( old, new )
    PANEL.WaveCount = new
    atmosphere.RefreshBackground()
end)

PANEL.WaveWidth = cvars2.Create( 'waves_width', 'Waves width.', '200', 'int', nil, 0, 512 )
cvars2.Callback('waves_width', function( old, new )
    PANEL.WaveWidth = new
    atmosphere.RefreshBackground()
end)

function PANEL:Init()
    self:OpenURL( 'asset://garrysmod/html/background/bg.html' )
    self:RunJS( string.format( 'var waves = new Waves(document.body, {fps: false, waves: %s, width: %s});waves.animate();', self.WaveCount, self.WaveWidth ) )
end

vgui.Register( 'atmosphere.backgrounds.waves', PANEL, 'atmosphere.html' )