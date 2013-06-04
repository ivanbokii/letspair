window.ClientSideValidations.validators.local['email'] = (element, options) ->
  unless /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(element.val()) then options.message