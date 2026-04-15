sub init()
    m.pokeballsList = m.top.findNode("pokeballsList")
    m.backgroundPoster = m.top.findNode("background")

    m.backgroundPoster.observeField("loadStatus", "onBackgroundReady")

    populatePokeballsRowList()
end sub

sub onBackgroundReady()
    if m.backgroundPoster.loadStatus = "ready"
        m.pokeballsList.visible = true
        m.pokeballsList.setFocus(true)
    end if
end sub

sub populatePokeballsRowList()
    root = CreateObject("roSGNode", "ContentNode")
    pokeballsRow = CreateObject("roSGNode", "ContentNode")

    for pokeballIndex = 0 to 7
        pokeball = createPokeballNode(pokeballIndex)
        pokeballsRow.appendChild(pokeball)
    end for

    root.appendChild(pokeballsRow)
    m.pokeballsList.content = root
end sub

function createPokeballNode(pokeballIndex as integer) as object
    pokeball = CreateObject("roSGNode", "ContentNode")
    pokeball.id = pokeballIndex.toStr()
    pokeball.HDPosterUrl = "pkg:/images/pokeball" + pokeballIndex.toStr() + ".jpg"

    return pokeball
end function

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if press = true
        if key = "back"
            closeScreen()
            handled = true
        end if
    end if

    return handled
end function

sub closeScreen()
    parent = m.top.getParent()
    parent.removeChild(m.top)
    setFocusOnParentLastFocusedChild(parent)
end sub

sub setFocusOnParentLastFocusedChild(parent as object)
    if parent.lastFocusedChild <> invalid
        parent.lastFocusedChild.setFocus(true)

        if parent.lastFocusedChild.subtype() = "CustomButton" then parent.lastFocusedChild.isCustomButtonFocused = true
    end if
end sub
