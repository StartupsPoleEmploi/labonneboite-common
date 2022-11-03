help:
	poetry install --only help
	poetry run mkdocs serve --dev-addr '127.0.0.1:9999'

test:
	docker-compose -f docker-compose.testing.yml up --build --abort-on-container-exit --exit-code-from app; 

