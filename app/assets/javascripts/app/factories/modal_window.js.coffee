window.letspair.application.factory 'modalWindow', ->
  $("#contact-form").on('click', '.header .close', (event) -> $.modal.close(); event.preventDefault();)
  $("#contact-form").on('click', '.buttons .close', (event) -> $.modal.close(); event.preventDefault();)

  open = ->
    $('#contact-form').modal
      modal: true
      autoResize: true
      autoPosition: true
      overlayClose: true
      minHeight: 300
      
      onOpen: (dialog) ->
        dialog.overlay.fadeIn('fast', ->
          dialog.container.fadeIn('fast', ->
            dialog.data.fadeIn('fast')))

      onClose: (dialog) ->
        dialog.data.fadeOut('fast', ->
          dialog.container.slideUp('fast', ->
            dialog.overlay.fadeOut('fast', ->
              $.modal.close())))

  {  
    open: open
  }