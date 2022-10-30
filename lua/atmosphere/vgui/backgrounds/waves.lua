atmosphere.Module( 'cvars2' )

local PANEL = {}

PANEL.WaveCount = cvars2.Create( 'waves_count', 'Wave count on background.', '3', 'int', nil, 0, 25 )
cvars2.Callback('waves_count', function( _, new )
    PANEL.WaveCount = new
    if atmosphere.GetBackground() == 'waves' then
        atmosphere.RefreshBackground()
    end
end)

PANEL.WaveWidth = cvars2.Create( 'waves_width', 'Waves width.', '200', 'int', nil, 0, 512 )
cvars2.Callback('waves_width', function( _, new )
    PANEL.WaveWidth = new
    if atmosphere.GetBackground() == 'waves' then
        atmosphere.RefreshBackground()
    end
end)

function PANEL:Init()
    self:OpenURL( 'asset://garrysmod/html/backgrounds/waves/index.html' )
    self:RunJS( string.format( 'var waves = new Waves(document.body, {fps: false, waves: %s, width: %s});waves.animate();', self.WaveCount, self.WaveWidth ) )
end

vgui.Register( 'atmosphere.backgrounds.waves', PANEL, 'atmosphere.html' )