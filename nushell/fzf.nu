def displayFZFFiles [] {
    echo (fzf --preview 'bat --theme=gruvbox-dark --color=always --style=header,grid --line-range :400 {}')
}

def nvimGoToFiles [] {
    let nvimExists = (which nvim)
    if $nvimExists == "" {
      return
    }

    let selection = displayFZFFiles
    if $selection == "" {
      return
    } else {
        nvim $selection
    }
}

def displayRgPipedFzf [] {
    echo (rg . -n --glob "!.git/" --glob "!vendor/" --glob "!node_modules/" | fzf)
}

def nvimGoToLine [] {
    let nvimExists = (which nvim)
    if $nvimExists == "" {
      return
    }
    let selection = displayRgPipedFzf
    if $selection == "" {
      return
    } else {
        let filename = ($selection | awk -F ':' '{print $1}')
        let line = ($selection | awk -F ':' '{print $2}')
        nvim $"+($line)" $filename +"normal zz"
    }
}

alias nvf = nvimGoToFiles
alias nvl = nvimGoToLine
