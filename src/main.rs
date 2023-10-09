use axum::http::StatusCode;
use axum::routing::get;
use axum::Router;

async fn hello_world() -> Result::<&'static str, StatusCode> {
    Ok("Hello world")
}

#[tokio::main]
async fn main() {
    let app = Router::new().route("/", get(hello_world));
    println!("listen on http://localhost:3000");

    // run it with hyper on localhost:3001
    axum::Server::bind(&"0.0.0.0:3000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}
