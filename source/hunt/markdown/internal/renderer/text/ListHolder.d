module hunt.markdown.internal.renderer.text.ListHolder;

abstract class ListHolder {
    private static final string INDENT_DEFAULT = "   ";
    private static final string INDENT_EMPTY = "";

    private final ListHolder parent;
    private final string indent;

    this(ListHolder parent) {
        this.parent = parent;

        if (parent !is null) {
            indent = parent.indent + INDENT_DEFAULT;
        } else {
            indent = INDENT_EMPTY;
        }
    }

    public ListHolder getParent() {
        return parent;
    }

    public string getIndent() {
        return indent;
    }
}
