module hunt.markdown.node.Paragraph;

class Paragraph : Block {

    override public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
