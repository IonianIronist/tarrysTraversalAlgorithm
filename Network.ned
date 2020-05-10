import Node;

channel Link extends ned.DatarateChannel {
    parameters:
        int cost = default(0);
}

//
// Generated network with random topology (20 nodes, 28 edges, seed=100).
//
network Network {
    submodules:
        node0 : Node {id = 0;}
        node1 : Node {id = 1;}
        node2 : Node {id = 2;}
        node3 : Node {id = 3;}
        node4 : Node {id = 4;}
        node5 : Node {id = 5;}
        node6 : Node {id = 6;}
        node7 : Node {id = 7;}
        node8 : Node {id = 8;}
        node9 : Node {id = 9;}
        node10 : Node {id = 10;}
        node11 : Node {id = 11;}
        node12 : Node {id = 12;}
        node13 : Node {id = 13;}
        node14 : Node {id = 14;}
        node15 : Node {id = 15;}
        node16 : Node {id = 16;}
        node17 : Node {id = 17;}
        node18 : Node {id = 18;}
        node19 : Node {id = 19;} 
    connections:
        node0.g++ <--> Link <--> node1.g++;
        node0.g++ <--> Link <--> node6.g++;
        node0.g++ <--> Link <--> node8.g++;
        node0.g++ <--> Link <--> node11.g++;
        node1.g++ <--> Link <--> node16.g++;
        node1.g++ <--> Link <--> node2.g++;
        node1.g++ <--> Link <--> node3.g++;
        node1.g++ <--> Link <--> node19.g++;
        node1.g++ <--> Link <--> node5.g++;
        node1.g++ <--> Link <--> node10.g++;
        node1.g++ <--> Link <--> node12.g++;
        node2.g++ <--> Link <--> node17.g++;
        node2.g++ <--> Link <--> node4.g++;
        node2.g++ <--> Link <--> node8.g++;
        node3.g++ <--> Link <--> node19.g++;
        node3.g++ <--> Link <--> node7.g++;
        node3.g++ <--> Link <--> node10.g++;
        node4.g++ <--> Link <--> node16.g++;
        node4.g++ <--> Link <--> node5.g++;
        node5.g++ <--> Link <--> node12.g++;
        node5.g++ <--> Link <--> node14.g++;
        node6.g++ <--> Link <--> node18.g++;
        node6.g++ <--> Link <--> node10.g++;
        node6.g++ <--> Link <--> node13.g++;
        node7.g++ <--> Link <--> node17.g++;
        node7.g++ <--> Link <--> node9.g++;
        node12.g++ <--> Link <--> node15.g++;
        node13.g++ <--> Link <--> node19.g++;
}
