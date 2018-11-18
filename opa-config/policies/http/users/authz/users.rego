package http.users.authz

# HTTP API request
import input as http_api

default allow = false

allow {
 http_api.method = "GET"
 http_api.path = ["actuator"]
}

allow {
 http_api.method = "GET"
 http_api.path = ["actuator", _]
}

# Allow users to retrieve the list of users
allow {
 get_token(http_api.token)
 http_api.method = "GET"
 http_api.path = ["api", "users"]
}

allow {
 get_token(http_api.token)
 http_api.method = "GET"
 http_api.path = ["api", "users", _]
}

allow {
 http_api.method = "GET"
 http_api.path = ["api", "users", username, "sensitive"]
 jwt_token_ = get_token(http_api.token)
 username = jwt_token_.userid
}

allow {
 http_api.method = "POST"
 http_api.path = ["api", "users"]
 jwt_token = get_token(http_api.token)
 jwt_token.role = "ADMIN"
}

get_token(token) {
 is_null(token)
}

get_token(token) = payload {
 not is_null(token)
 io.jwt.decode(token, [_, payload, _])
}
