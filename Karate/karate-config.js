function setup() {
    var env = karate.env;

    var config = {baseUrl: "https://lista-compras-api.herokuapp.com/api/v1"};

    if(env === "dev") 
    {
        karate.configure("logPrettyRequest", true);
        karate.configure("logPrettyResponse", true);
    } 

    karate.configure("readTimeout", 40000);

    return config;
}