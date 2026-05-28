package com.nwpu.healthsystem.backend.shiro;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockHttpServletResponse;

class JWTFilterTest {
    @Test
    void testResponseErrorReturns401Json() throws Exception {
        JWTFilter filter = new JWTFilter();
        MockHttpServletResponse resp = new MockHttpServletResponse();
        java.lang.reflect.Method m = JWTFilter.class.getDeclaredMethod("responseError", javax.servlet.ServletResponse.class, String.class);
        m.setAccessible(true);
        m.invoke(filter, resp, "Unauthorized");
        Assertions.assertEquals(HttpStatus.UNAUTHORIZED.value(), resp.getStatus());
        Assertions.assertEquals("application/json;charset=UTF-8", resp.getContentType());
        String body = resp.getContentAsString();
        ObjectMapper mapper = new ObjectMapper();
        Response r = mapper.readValue(body, Response.class);
        Assertions.assertEquals(401, r.getCode());
    }
}
