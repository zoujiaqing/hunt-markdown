module hunt.markdown.internal.BlockContinueImpl;

import hunt.markdown.parser.block.BlockContinue;

class BlockContinueImpl : BlockContinue {

    private final int newIndex;
    private final int newColumn;
    private final bool finalize;

    public this(int newIndex, int newColumn, bool finalize) {
        this.newIndex = newIndex;
        this.newColumn = newColumn;
        this.finalize = finalize;
    }

    public int getNewIndex() {
        return newIndex;
    }

    public int getNewColumn() {
        return newColumn;
    }

    public bool isFinalize() {
        return finalize;
    }

}
