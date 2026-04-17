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
    getDogDataTask = CreateObject("roSGNode", "GetDogDataTask")
    getDogDataTask.observeField("dogContent", "onDogContentLoaded")
    getDogDataTask.control = "RUN"
end sub

sub onDogContentLoaded()
    ? "done"
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if press = true
        if key = "back"
            closeScreen(m.top)
            handled = true
        else if key = "down"
            handled = true
        end if
    end if

    return handled
end function
