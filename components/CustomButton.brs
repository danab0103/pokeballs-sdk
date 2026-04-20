sub init()
    m.poster = m.top.findNode("poster")
    m.label = m.top.findNode("label")
end sub

sub onWidthChanged()
    m.poster.width = m.top.width
    m.label.width = m.top.width
end sub

sub onHeightChanged()
    m.poster.height = m.top.height
    m.label.height = m.top.height
end sub

sub onTextChanged()
    m.label.text = m.top.text
end sub
