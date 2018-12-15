module hunt.markdown.parser.block.AbstractBlockParser;

import hunt.markdown.node.Block;
import hunt.markdown.parser.InlineParser;

abstract class AbstractBlockParser : BlockParser {

    override public bool isContainer() {
        return false;
    }

    override public bool canContain(Block childBlock) {
        return false;
    }

    override public void addLine(CharSequence line) {
    }

    override public void closeBlock() {
    }

    override public void parseInlines(InlineParser inlineParser) {
    }

}
