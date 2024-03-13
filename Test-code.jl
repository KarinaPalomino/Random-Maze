n = 25
H,V = make_maze(n)
x, y = find_path2(H,V)
plot_maze(H,V)
plot(x .- 0.5, y .- 0.5, color="r", linewidth=4);
