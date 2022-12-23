# Set up the grid and initial position of the worm
$grid = @(
    ('#', '#', '#', '#', '#', '#', '#', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '.', '.', '.', '.', '.', '.', '#'),
    ('#', '#', '#', '#', '#', '#', '#', '#')
)
$x = 1
$y = 1

# Set up the movement controls and game loop
while ($true) {
    # Display the grid
    for ($i = 0; $i -lt $grid.Count; $i++) {
        for ($j = 0; $j -lt $grid[$i].Count; $j++) {
            if ($i -eq $y -and $j -eq $x) {
                Write-Host 'O' -NoNewline
            }
            else {
                Write-Host $grid[$i][$j] -NoNewline
            }
        }
        Write-Host
    }
    Write-Host

    # Get the input from the player
    $input = Read-Host 'Move (w/a/s/d): '

    # Determine the direction of movement based on the input
    switch ($input) {
        'w' { $dy = -1; $dx = 0 }
        'a' { $dy = 0; $dx = -1 }
        's' { $dy = 1; $dx = 0 }
        'd' { $dy = 0; $dx = 1 }
    }

    # Update the position of the worm based on the direction of movement
    $y += $dy
    $x += $dx

    # Make sure the worm stays within the boundaries of the grid
    if ($y -lt 0 -or $y -ge $grid.Count -or $x -lt 0 -or $x -ge $grid[0].Count) {
        Write-Host 'You hit a wall! Game over.'
        break
    }
}
