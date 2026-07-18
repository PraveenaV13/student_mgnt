pipeline {
	agent any

	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}

		stage('Build Image') {
			steps {
				sh 'docker compose build'
			}
		}

		stage('Start Database') {
			steps {
				sh 'docker compose up -d db'
			}
		}

		stage('Run Tests') {
			steps {
				sh '''
                    docker compose run --rm app bundle exec rails db:create RAILS_ENV=test
                    docker compose run --rm app bundle exec rails db:migrate RAILS_ENV=test
                    docker compose run --rm app bundle exec rails test
                '''
			}
		}
	}
}