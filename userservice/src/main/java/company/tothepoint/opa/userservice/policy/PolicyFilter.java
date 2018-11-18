package company.tothepoint.opa.userservice.policy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Component
public class PolicyFilter extends OncePerRequestFilter {

    private final String opaUrl;
    private final RestTemplate restTemplate;

    public PolicyFilter(@Value("${company.tothepoint.opa.opa-url}") String opaUrl,
                        RestTemplate restTemplate) {
        this.opaUrl = opaUrl;
        this.restTemplate = restTemplate;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest,
                                    HttpServletResponse httpServletResponse,
                                    FilterChain filterChain) throws ServletException, IOException {

        Map<String, Object> input = new HashMap();
        input.put("token", httpServletRequest.getHeader("X-AUTH-TOKEN"));
        input.put("method", httpServletRequest.getMethod());
        input.put("path",
                httpServletRequest.getRequestURI()
                        .replaceAll("^/|/$", "")
                        .split("/"));

        Response response = restTemplate
                .postForObject(this.opaUrl,
                        new HttpEntity<>(new Request(input)),
                        Response.class);

        if (response.getResult() == null || !response.getResult().isAllow()) {
            httpServletResponse.sendError(401);
        } else {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
        }
    }
}
