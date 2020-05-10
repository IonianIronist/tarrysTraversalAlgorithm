//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import Node;

import Link;

//
// Generated network with random topology (5 nodes, 7 edges, seed=100).
//
network Network2 {
    submodules:
        node0 : Node {id = 0;}
        node1 : Node {id = 1;}
        node2 : Node {id = 2;}
        node3 : Node {id = 3;}
        node4 : Node {id = 4;}
    connections:
        node0.g++ <--> Link <--> node1.g++;
        node0.g++ <--> Link <--> node4.g++;
        node1.g++ <--> Link <--> node2.g++;
        node1.g++ <--> Link <--> node3.g++;
        node1.g++ <--> Link <--> node4.g++;
        node2.g++ <--> Link <--> node3.g++;
        node2.g++ <--> Link <--> node4.g++;
}
