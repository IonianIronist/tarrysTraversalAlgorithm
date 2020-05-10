#include "Node.h"
#include <vector>

Define_Module(Node);

/*
 *
 *
 * IF IT WORKS IT AIN'T STUPID !!!!1!!!1
 *
 *
 * */

using namespace std;

void Node::initialize()
{
    int id = par("id");
    int father = par("father");
    int i;
    for(i = 0; i < this->gateSize("g"); i++){
        cGate *gate = this->gate("g$o", i);
        cModule *nextGateOwner = gate->getNextGate()->getOwnerModule();
        used[i][0] = int(nextGateOwner->par("id"));
        used[i][1] = 0;
    }
    if(id == 0){
        cMessage* first = new cMessage("token");
        scheduleAt(simTime() + 100, first);
        this->par("father") = id;
    }
}

void Node::handleMessage(cMessage *msg)
{
    /*
     *
     * For p that recieves the token from q:
     * begin:
     * if father is -1 :
     *     let father be id(q)
     * if not 0 in used[neighbors]:
     *     decide
     * else if x in used and x is not father and used[x] is 0:
     *     choose r from used where r is not father to r and used[r] is 0
     *     let used[r] be 1
     *     send token to r
     * else :
     *     let used[father] be 1
     *     send token to father
     * end
     *
     */

    //intuniform(a,b)

    // if the node has no father, make the sender its father.
    if(int(this->par("father")) == -1){
        cModule *sender = msg->getSenderModule();
        this->par("father") = int(sender->par("id"));
    }
    EV<<"My father is: "<< int(this->par("father"))<<"\n";


    int i;
    int checker = 0;

    //check if there are nodes that have not been visited
    vector<int> notUsed;

    WATCH_VECTOR(notUsed);

    for(i = 0; i < this->gateSize("g"); i++){
        if(used[i][1] == 0){
            if(used[i][0] != int(this->par("father"))){
                notUsed.push_back(used[i][0]);
            }
            checker = 1;
        }
    }
    // if no, finish
    if(checker == 0){
        finish();
    }

    //if only the node can reply to the father, he replies to father
    else if (notUsed.size() == 0){
        EV<<notUsed.size()<<"\n";
        EV<<"I am replying to my father";
        for(i = 0; i < this->gateSize("g"); i++){
            if(used[i][0] == int(this->par("father"))){
                used[i][1] = 1;
                int j;
                for(j = 0; j < this->gateSize("g"); i++){
                    if(int(gate("g$o",i)->getPathEndGate()->getOwnerModule()->par("id")) == int(this->par("father"))){
                        send(msg->dup(), gate("g$o", i));
                        delete msg;
                        break;
                    }
                }
                notUsed.clear();
                finish();
            }
        }
    }
    //else the node chooses one of his neighbors that he did not send a message
    else{
        int chosenId = notUsed[intuniform(0, notUsed.size()-1)];
        EV<<"chosen id :"<<chosenId<<"\n"<<notUsed.size()<<"\n";
        for(i = 0; i < this->gateSize("g"); i++){
            if(int(gate("g$o",i)->getPathEndGate()->getOwnerModule()->par("id")) == chosenId){
                send(msg->dup(), gate("g$o", i));
                delete msg;
                int j;
                for(j = 0; j < this->gateSize("g"); j++){
                    if(used[j][0]==chosenId){
                        used[j][1] = 1;
                        break;
                    }
                }
                break;
            }
        }
        notUsed.clear();
    }
}
void Node::finish(){
    if(int(this->par("id"))==0){
        EV<<"I DECIDE NOW\n";
    }
    else{
        EV<<"I finish\n";
    }
}
