sub init()
    m.poster = m.top.findNode("poster")
    m.focusPoster = m.top.findNode("focusPoster")
end sub

sub onItemContentChanged()
    pokeballContent = m.top.itemContent
    m.poster.uri = pokeballContent.HDPosterUrl
end sub

sub onFocusStateChanged()
    m.focusPoster.visible = m.top.focusPercent > 0.5 and m.top.rowListHasFocus = true
end sub
