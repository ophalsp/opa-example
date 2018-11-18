package company.tothepoint.opa.userservice.policy;

import lombok.Builder;
import lombok.Value;

import java.util.Map;

@Value
@Builder
public class Request {

    Map<String, Object> input;
}
