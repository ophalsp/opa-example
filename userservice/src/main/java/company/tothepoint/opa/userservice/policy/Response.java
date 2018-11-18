package company.tothepoint.opa.userservice.policy;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Response {

    public DecisionResult result;

    @Getter
    @Setter
    @NoArgsConstructor
    public static class DecisionResult {
        private boolean allow;
    }
}
