window.letspair.application.filter "startFrom", ->
  (input, start) ->
    start = +start    # parse to int
    input.slice start # remove ''start number of chars from input"
