sub init()
    m.dogPoster = m.top.findNode("dogPoster")
    m.backButton = m.top.findNode("backButton")

    m.backButton.observeField("buttonSelected", "onBackButtonSelected")
end sub

sub onBackButtonSelected()
    closeScreen(m.top)
end sub

sub onItemContentChanged()
    dogContent = m.top.itemContent
    m.dogPoster.uri = dogContent.HDPosterUrl
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if press = true
        if key = "back"
            closeScreen(m.top)
            handled = true
        end if
    end if

    return handled
end function
