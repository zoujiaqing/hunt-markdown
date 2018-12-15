module hunt.markdown.parser.InlineParserFactory;

/**
 * Factory for custom inline parser.
 */
public interface InlineParserFactory {
    InlineParser create(InlineParserContext inlineParserContext);
}
