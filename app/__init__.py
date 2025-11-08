
from flask import Flask
from app.routes.user_routes import user_blueprint
from app.routes.product_routes import product_blueprint
from prometheus_client import generate_latest, CONTENT_TYPE_LATEST

def create_app():
    app = Flask(__name__)

    # Register blueprints
    app.register_blueprint(user_blueprint)
    app.register_blueprint(product_blueprint)

    @app.route('/metrics')
    def metrics():
        """ Exposes application metrics in a Prometheus-compatible format. """
        return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}

    return app
