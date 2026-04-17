sub init()
    m.mainGroup = m.top.findNode("mainGroup")
    m.getRandomDogButton = m.top.findNode("getRandomDogButton")

    centerMainGroup()

    m.getRandomDogButton.observeField("buttonSelected", "onGetRandomDogButtonSelected")
end sub

sub centerMainGroup()
    mainGroupWidth = m.mainGroup.boundingRect().width
    mainGroupHeight = m.mainGroup.boundingRect().height
    m.mainGroup.translation = [(1280 - mainGroupWidth) / 2, (720 - mainGroupHeight) / 2]
end sub

sub onGetRandomDogButtonSelected()
    ? "DOG"
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if press = true
        if key = "back"
            closeScreen()
            handled = true
        else if key = "down"
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
