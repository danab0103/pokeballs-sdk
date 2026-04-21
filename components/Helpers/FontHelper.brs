function getFontPath() as string
    customFontPath = m.global.customFontPath

    if customFontPath = invalid or customFontPath = "" then customFontPath = "pkg:/components/fonts/CabinetGroteskDefault.otf"

    return customFontPath
end function
