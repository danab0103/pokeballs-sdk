sub init()
    m.mainGroup = m.top.findNode("mainGroup")
    m.getRandomDogButton = m.top.findNode("getRandomDogButton")

    m.top.lastFocusedChild = m.getRandomDogButton

    centerMainGroup()

    m.getRandomDogButton.observeField("buttonSelected", "onGetRandomDogButtonSelected")
end sub

sub centerMainGroup()
    mainGroupWidth = m.mainGroup.boundingRect().width
    mainGroupHeight = m.mainGroup.boundingRect().height
    m.mainGroup.translation = [(1280 - mainGroupWidth) / 2, (720 - mainGroupHeight) / 2]
end sub

sub onGetRandomDogButtonSelected()
    m.getDogDataTask = CreateObject("roSGNode", "GetDogDataTask")
    m.getDogDataTask.observeField("dogContent", "navigateToRandomDogScreen")
    m.getDogDataTask.control = "RUN"
end sub

sub navigateToRandomDogScreen()
    screen = CreateObject("roSGNode", "RandomDogScreen")
    
    if m.getDogDataTask.dogContent <> invalid then screen.itemContent = m.getDogDataTask.dogContent

    m.top.appendChild(screen)
    screen.setFocus(true)
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
