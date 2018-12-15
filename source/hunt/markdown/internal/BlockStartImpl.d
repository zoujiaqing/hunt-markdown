module hunt.markdown.internal.BlockStartImpl;

import hunt.markdown.parser.block.BlockParser;
import hunt.markdown.parser.block.BlockStart;

class BlockStartImpl : BlockStart {

    private final BlockParser[] blockParsers;
    private int newIndex = -1;
    private int newColumn = -1;
    private bool replaceActiveBlockParser = false;

    public this(BlockParser[] blockParsers) {
        this.blockParsers = blockParsers;
    }

    public BlockParser[] getBlockParsers() {
        return blockParsers;
    }

    public int getNewIndex() {
        return newIndex;
    }

    public int getNewColumn() {
        return newColumn;
    }

    public bool isReplaceActiveBlockParser() {
        return replaceActiveBlockParser;
    }

    override public BlockStart atIndex(int newIndex) {
        this.newIndex = newIndex;
        return this;
    }

    override public BlockStart atColumn(int newColumn) {
        this.newColumn = newColumn;
        return this;
    }

    override public BlockStart replaceActiveBlockParser() {
        this.replaceActiveBlockParser = true;
        return this;
    }

}