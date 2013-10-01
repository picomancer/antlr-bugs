
import java.io.FileInputStream;
import java.io.InputStream;

import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.ANTLRInputStream;
import org.antlr.runtime.tree.CommonTree;
import org.antlr.runtime.tree.CommonTreeNodeStream;

public class Main
{
    public static void main(String arg[])
        throws Exception
    {
        ANTLRInputStream indata = new ANTLRInputStream(new FileInputStream("program.txt"));
        bugLexer lexer = new bugLexer(null);
        lexer.setCharStream(indata);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();

        for(Object t : tokens.getTokens())
            System.out.println(t);

        bugParser parser = new bugParser(tokens);
        CommonTree ast = (CommonTree) (parser.prgm().getTree());

        System.err.println("ast: "+ast.toStringTree());

        bugTreeRewriter rewriter = new bugTreeRewriter(new CommonTreeNodeStream(ast));
        CommonTree rewritten_ast = rewriter.prgm().getTree();

        System.err.println("rewritten_ast: "+rewritten_ast.toStringTree());

        return;
    }
}
