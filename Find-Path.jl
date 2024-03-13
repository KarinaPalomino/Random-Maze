function find_path(H,V)
    n = size(H,1)
    visit = falses(n, n)
    pathx = Int[]
    pathy = Int[]

    function recur(x,y)
        if x == n && y == 1 #end point
            pushfirst!(pathx, x)
            pushfirst!(pathy, y)
            return true
        end
        visit[x,y] = true
        
        directions = [(x, y+1), (x, y-1), (x+1, y), (x-1, y)] #neighboring cells
        
        for (nx, ny) in directions
            if 1 ≤ nx ≤ n && 1 ≤ ny ≤ n && !visit[nx,ny] #neighboring cells are within bounds and not visited
                if nx == x && (ny > y && !H[x, y]) || (ny < y && !H[x,y-1]) #check if cells to the right and left are valid 
                                                                                #and have no walls
                    if recur(nx, ny)
                        pushfirst!(pathx, x)
                        pushfirst!(pathy, y)
                        return true
                    end
                elseif ny == y &&  (nx > x && !V[x, y]) || (nx < x && !V[x-1,y]) #check if cells above and below are valid 
                                                                                            #and have no walls
                    if recur(nx,ny)
                        pushfirst!(pathx, x)
                        pushfirst!(pathy, y)
                        return true
                    end
                end
            end
        end
        return false #if no moves are available
    end
    recur(1,n) #starting point
    return pathx, pathy
end
