import nigui

proc mainWindow() =
  var window = newWindow("JPad")

  window.width = 600.scaleToDpi
  window.height = 400.scaleToDpi

  var container = newLayoutContainer(Layout_Vertical)

  window.add(container)

  var openButton = newButton("Open file")

  container.add(openButton)

  var new_file_button = newButton("New file")

  container.add(openButton)

  var textArea = newTextArea()

  openButton.onClick = proc(event: ClickEvent) =
    var dialog = newOpenFileDialog()
    dialog.title = "Open file"
    dialog.multiple = true
    dialog.run()
    textArea.addLine($dialog.files.len & " files selected")
    if dialog.files.len > 0:
      for file in dialog.files:
        textArea.addLine(file)

  
  
  