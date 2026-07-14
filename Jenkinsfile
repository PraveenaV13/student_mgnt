pipeline {
	agent any

	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}

		stage('Start Containers') {
			steps {
				sh 'docker compose up -d --build'
			}
		}

		stage('Run Tests') {
			steps {
				sh '''
                    docker compose exec -T app bundle exec rails db:create RAILS_ENV=test
                    docker compose exec -T app bundle exec rails db:migrate RAILS_ENV=test
                    docker compose exec -T app bundle exec rails test
                '''
			}
		}
	}
}