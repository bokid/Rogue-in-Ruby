require 'io/console'                    #makes single char input work

def print_grid grid, height, width      #print grid function
    system ("cls")
     (0..height).each do |x|
        (0..width).each do |y|
            print grid[x][y]
        end
        puts
    end    
end

def score_check grid, player_y, player_x, score, value
    if grid[player_y][player_x] == "$ "
        score = score + value
    end
    puts score
    return
end

grid = []                               #sets up our grid
height = 10                              #sets height
width = 12

win = 0
score = 0
value = 200


again = true  


                                        # Setup Grid
(0..height).each do |x|
    grid[x] = []
    (0..width).each do |y|
        grid[x][y] = "· "
    end
end
 
count = 0
money = "$ "

while (count <= rand(0..10)) 
    moneyheight = rand(0..height)
    moneywidth = rand(0..width)
    grid[moneyheight][moneywidth] = money
    count +=1
end

controller = "■ "                       #character choice for player 
player_x = 1                               #setup grid position
player_y = 1
grid [player_y][player_x] = controller  #sets starting player position


win = value * count

                          #while loop variable
while (again == true)                   #loop to run through user choices

    print_grid grid, height, width          #prints first 'board'

  
    if score == win
        puts "Congratulations, you have won!"
        again=false
    end

    puts "What direction do you want to go? (w, a, s, d, or q)"
    puts "Your score is #{score}"

   

    direction = STDIN.getch
            if direction =="w"                  #up condition
                if player_y==0                  #edge case - when player hits edge, switches edge to other edge
                    grid[player_y][player_x]="· "   
                    player_y=height
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]=controller
                else
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]="· "    #moves player up one gridspace and resets prior position to empty
                    player_y=player_y-1
                    grid[player_y][player_x]=controller
                
                end
            elsif direction=="a"                #left condition
                if player_x==0
                    grid[player_y][player_x]="· "   
                    player_x=width
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]=controller
                else
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]="· " 
                    grid[player_y][player_x-1]=controller
                    player_x=player_x-1
                end

            elsif direction=="s"                #down condition
                if player_y==height
                    grid[player_y][player_x]="· "   
                    player_y=0
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]=controller
                else
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]="· " 
                    grid[player_y+1][player_x]=controller
                    player_y=player_y+1
                end

            elsif direction=="d"                #right condition
                if player_x==width
                    grid[player_y][player_x]="· "   
                    player_x=0
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]=controller
                else
                    score_check(grid, player_y, player_x, score, value)
                    grid[player_y][player_x]="· " 
                    grid[player_y][player_x+1]=controller
                    player_x=player_x+1
                end

            elsif direction=="q"            #quit condition
                again=false
            else      
                                          #any other user input does nothing
            end

            
            #dealing with edge cases based on border spots - done
            #do we want it to stop or loop around(pacman style)? - done
            #points system?
                #variable for current points that increments when user "hits"
                #set $ character for points - random?  hard coded?
            #stuff we come across - money, monsters
            #walls - maze?
            
end