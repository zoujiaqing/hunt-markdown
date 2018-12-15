module hunt.markdown.internal.BlockContent;

class BlockContent {

    private final StringBuilder sb;

    private int lineCount = 0;

    public this() {
        sb = new StringBuilder();
    }

    public this(string content) {
        sb = new StringBuilder(content);
    }

    public void add(CharSequence line) {
        if (lineCount != 0) {
            sb.append('\n');
        }
        sb.append(line);
        lineCount++;
    }

    public string getString() {
        return sb.toString();
    }

}
