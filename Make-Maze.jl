using Random
function make_maze(n)
    H = trues(n, n-1)
    V = trues(n-1, n)
    visit = falses(n,n)
    
    function dig(x,y)
        visit[x,y] = true
        choices = ["left", "right", "down", "up"] 
        shuffle!(choices) #shuffles the list "choices"

        for direction in choices #for a random direction (from the shuffled list)
            if direction == "right"
                if (y < n) && (!visit[x, y+1]) #if the neighboring cell in that direction is "valid" 
                    H[x, y] = false # break down the wall
                    dig(x, y+1) #run command on the neighboring cell
                end
            elseif direction == "left"
                if (y > 1) && (!visit[x, y-1])
                    H[x, y-1] = false
                    dig(x, y-1)
                end
            elseif direction == "up"
                if (x < n) && (!visit[x+1, y])
                    V[x, y] = false
                    dig(x+1, y)
                end
            elseif direction == "down"
                if (x > 1) && (!visit[x-1, y])
                    V[x-1, y] = false
                    dig(x-1, y)
                end
            end
        end
    end
    dig(1,1)
    return H,V
end 
