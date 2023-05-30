all: run

clean:
	rm -f out/BellmanFord.jar out/OneStep.jar

out/BellmanFord.jar: out/parcs.jar src/BellmanFord.java src/Graph.java src/Distances.java
	@javac -cp out/parcs.jar src/BellmanFord.java src/Graph.java src/Distances.java
	@jar cf out/BellmanFord.jar -C src BellmanFord.class -C src Graph.class -C src Distances.class
	@rm -f src/BellmanFord.class src/Graph.class src/Distances.class

out/OneStep.jar: out/parcs.jar src/OneStep.java src/Graph.java src/Distances.java
	@javac -cp out/parcs.jar src/OneStep.java src/Graph.java src/Distances.java
	@jar cf out/OneStep.jar -C src OneStep.class -C src Graph.class -C src Distances.class
	@rm -f src/OneStep.class src/Graph.class src/Distances.class

build: out/BellmanFord.jar out/OneStep.jar

run: out/BellmanFord.jar out/OneStep.jar
	@cd out && java -cp 'parcs.jar:BellmanFord.jar' BellmanFord