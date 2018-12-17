module hunt.markdown.internal.DocumentBlockParser;

import hunt.markdown.node.Block;
import hunt.markdown.node.Document;
import hunt.markdown.parser.block.AbstractBlockParser;
import hunt.markdown.parser.block.BlockContinue;
import hunt.markdown.parser.block.ParserState;

class DocumentBlockParser : AbstractBlockParser {

    private Document document = new Document();

    public bool isContainer() {
        return true;
    }

    override public bool canContain(Block block) {
        return true;
    }

    override public Document getBlock() {
        return document;
    }

    override public BlockContinue tryContinue(ParserState state) {
        return BlockContinue.atIndex(state.getIndex());
    }

    override public void addLine(CharSequence line) {
    }

}
