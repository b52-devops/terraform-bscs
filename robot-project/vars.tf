#map variable 
variable "COMPONENTS" {
    default = {
        mongodb = {
            APP_VERSION = "null"
        },
        catalogue = {
            APP_VERSION = "0.0.8"
        },
        redis = {
            APP_VERSION = "null"
        },
        user = {
            APP_VERSION = "0.0.11"
        },
        cart = {
            APP_VERSION = "0.0.8"
        },
        rabbitmq = {
            APP_VERSION = "null"
        },
        payment = {
            APP_VERSION = "0.0.2"
        },
        shipping = {
            APP_VERSION = "0.0.4"
        },
        mysql = {
            APP_VERSION = "null"
        },
        frontend = {
            APP_VERSION = "0.0.1"
        },
    }
}
