for i in range(16):
	print("mux"+str(i)+":mux port map(a => a("+str(i)+"), b => b("+str(i)+"), sel => sel, o => o("+str(i)+"));\n")