module hunt.markdown.node.CustomBlock;

abstract class CustomBlock : Block {

    override public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
