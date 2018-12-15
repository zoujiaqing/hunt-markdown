module hunt.markdown.node.SoftLineBreak;

class SoftLineBreak : Node {

    override public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
