module hunt.markdown.internal.util.Parsing;

class Parsing {

    private static final string TAGNAME = "[A-Za-z][A-Za-z0-9-]*";
    private static final string ATTRIBUTENAME = "[a-zA-Z_:][a-zA-Z0-9:._-]*";
    private static final string UNQUOTEDVALUE = "[^\"'=<>`\\x00-\\x20]+";
    private static final string SINGLEQUOTEDVALUE = "'[^']*'";
    private static final string DOUBLEQUOTEDVALUE = "\"[^\"]*\"";
    private static final string ATTRIBUTEVALUE = "(?:" + UNQUOTEDVALUE + "|" + SINGLEQUOTEDVALUE
            + "|" + DOUBLEQUOTEDVALUE + ")";
    private static final string ATTRIBUTEVALUESPEC = "(?:" + "\\s*=" + "\\s*" + ATTRIBUTEVALUE
            + ")";
    private static final string ATTRIBUTE = "(?:" + "\\s+" + ATTRIBUTENAME + ATTRIBUTEVALUESPEC
            + "?)";

    public static final string OPENTAG = "<" + TAGNAME + ATTRIBUTE + "*" + "\\s*/?>";
    public static final string CLOSETAG = "</" + TAGNAME + "\\s*[>]";

    public static int CODE_BLOCK_INDENT = 4;

    public static int columnsToNextTabStop(int column) {
        // Tab stop is 4
        return 4 - (column % 4);
    }

    public static int find(char c, CharSequence s, int startIndex) {
        int length = s.length();
        for (int i = startIndex; i < length; i++) {
            if (s[i] == c) {
                return i;
            }
        }
        return -1;
    }

    public static int findLineBreak(CharSequence s, int startIndex) {
        int length = s.length();
        for (int i = startIndex; i < length; i++) {
            switch (s[i]) {
                case '\n':
                case '\r':
                    return i;
            }
        }
        return -1;
    }

    public static bool isBlank(CharSequence s) {
        return findNonSpace(s, 0) == -1;
    }

    public static bool isLetter(CharSequence s, int index) {
        int codePoint = Character.codePointAt(s, index);
        return Character.isLetter(codePoint);
    }

    public static bool isSpaceOrTab(CharSequence s, int index) {
        if (index < s.length()) {
            switch (s[index]) {
                case ' ':
                case '\t':
                    return true;
            }
        }
        return false;
    }

    /**
     * Prepares the input line replacing {@code \0}
     */
    public static CharSequence prepareLine(CharSequence line) {
        // Avoid building a new string in the majority of cases (no \0)
        StringBuilder sb = null;
        int length = line.length();
        for (int i = 0; i < length; i++) {
            char c = line[i];
            switch (c) {
                case '\0':
                    if (sb is null) {
                        sb = new StringBuilder(length);
                        sb.append(line, 0, i);
                    }
                    sb.append('\uFFFD');
                    break;
                default:
                    if (sb !is null) {
                        sb.append(c);
                    }
            }
        }

        if (sb !is null) {
            return sb.toString();
        } else {
            return line;
        }
    }

    public static int skip(char skip, CharSequence s, int startIndex, int endIndex) {
        for (int i = startIndex; i < endIndex; i++) {
            if (s[i] != skip) {
                return i;
            }
        }
        return endIndex;
    }

    public static int skipBackwards(char skip, CharSequence s, int startIndex, int lastIndex) {
        for (int i = startIndex; i >= lastIndex; i--) {
            if (s[i] != skip) {
                return i;
            }
        }
        return lastIndex - 1;
    }

    public static int skipSpaceTab(CharSequence s, int startIndex, int endIndex) {
        for (int i = startIndex; i < endIndex; i++) {
            switch (s[i]) {
                case ' ':
                case '\t':
                    break;
                default:
                    return i;
            }
        }
        return endIndex;
    }

    public static int skipSpaceTabBackwards(CharSequence s, int startIndex, int lastIndex) {
        for (int i = startIndex; i >= lastIndex; i--) {
            switch (s[i]) {
                case ' ':
                case '\t':
                    break;
                default:
                    return i;
            }
        }
        return lastIndex - 1;
    }

    private static int findNonSpace(CharSequence s, int startIndex) {
        int length = s.length();
        for (int i = startIndex; i < length; i++) {
            switch (s[i]) {
                case ' ':
                case '\t':
                case '\n':
                case '\u000B':
                case '\f':
                case '\r':
                    break;
                default:
                    return i;
            }
        }
        return -1;
    }
}