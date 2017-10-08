for i in range(15):
	print("fa"+str(i+1)+":fullAdder port map(a => a("+str(i+1)+"), b => b("+str(i+1)+"), c => c"+str(i+1)+", sum => o("+str(i+1)+"), carry => c" +str(i+2)+ ");\n")