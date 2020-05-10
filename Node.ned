simple Node
{
    parameters:
        int id = default(-1);
        volatile int father = default(-1);
        
    gates:
        inout g[];
}
