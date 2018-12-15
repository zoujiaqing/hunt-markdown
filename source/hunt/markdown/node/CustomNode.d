module hunt.markdown.node.CustomNode;

abstract class CustomNode : Node {
    override public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
