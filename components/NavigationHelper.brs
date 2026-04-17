sub closeScreen(screen as object)
    parent = screen.getParent()
    parent.removeChild(screen)
    setFocusOnParentLastFocusedChild(parent)
end sub

sub setFocusOnParentLastFocusedChild(parent as object)
    if parent.lastFocusedChild <> invalid then parent.lastFocusedChild.setFocus(true)
end sub
