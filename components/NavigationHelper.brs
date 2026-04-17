sub closeScreen(screen as object)
    parent = screen.getParent()
    parent.removeChild(screen)
    setFocusOnParentLastFocusedChild(parent)
end sub

sub setFocusOnParentLastFocusedChild(parent as object)
    if parent.lastFocusedChild <> invalid
        parent.lastFocusedChild.setFocus(true)

        if parent.lastFocusedChild.subtype() = "CustomButton" then parent.lastFocusedChild.isCustomButtonFocused = true
    end if
end sub
