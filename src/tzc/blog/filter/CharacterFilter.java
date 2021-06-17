package tzc.blog.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("/*")
public class CharacterFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String url = req.getRequestURI();
		if(url.indexOf(".css")>0||url.indexOf(".jq")>0||url.indexOf(".png")>0) {
			chain.doFilter(request, response);
		}
		else {
			response.setContentType("text/html;charset=utf-8");
			chain.doFilter(request, response);
		}
		
	}


	
	
}
