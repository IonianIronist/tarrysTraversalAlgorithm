#ifndef __TARRYSALGORYTHM_NODE_H_
#define __TARRYSALGORYTHM_NODE_H_
#include <omnetpp.h>
#include <vector>

using namespace omnetpp;

/**
 * TODO - Generated class
 */
class Node : public cSimpleModule
{
  protected:
    int id;
    int used[100][2];
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    virtual void finish();
};

#endif
