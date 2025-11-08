from app.main import app
import os

if __name__ == "__main__":
    # Get port from environment variable or default to 5000
    port = int(os.environ.get('PORT', 5000))
    # Bind to all interfaces for container access
    app.run(host='0.0.0.0', port=port, debug=False)
