---
---

Math.randint = (min, max) -> Math.floor(Math.random()*(max+1-min))+min

size = 50
row = 10
col = 10
gap = 5 * Math.min(row, col)

make_matrix = (row=10, col=10) ->
    matrix = ((null for _ in [0...col]) for _ in [0...row])
    for y in [0...row]
        for x in [0...col]
            if x == 0 and y == 0
                prev = 0
            else if x == 0
                prev = matrix[y-1][x]
            else if y == 0
                prev = matrix[y][x-1]
            else
                prev = Math.max(matrix[y-1][x], matrix[y][x-1])
            matrix[y][x] = prev + Math.randint(0, gap)
    find = matrix[Math.randint(0, row-1)][Math.randint(0, col-1)]
    return ((it-find for it in line) for line in matrix)

make_button = (matrix) ->
    $('#playground').empty()
    for y in [0...matrix.length]
        for x in [0...matrix[0].length]
            button = $('<button>').addClass('cell')
                                  .addClass('absolute')
                                  .attr('id', "#{x},#{y}")
                                  .css('top', size * y)
                                  .css('left', size * x)
            $(button).click ->
                [x, y] = @id.split(',')
                $(@).html(matrix[y][x])
            $('#playground').append(button)
        $('#playground').append('<br />')

$(document).ready ->
    $('#newgame').click ->
        matrix = make_matrix()
        make_button(matrix)

    $('#newgame').click()
