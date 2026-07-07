pipeline {
	agent any

	environment {
		RAILS_ENV = "test"
	}

	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}

		stage('Install Gems') {
			steps {
				sh 'bundle install'
			}
		}

		stage('Create Database') {
			steps {
				sh 'bundle exec rails db:create'
			}
		}

		stage('Run Migrations') {
			steps {
				sh 'bundle exec rails db:migrate'
			}
		}

		stage('Run Tests') {
			steps {
				sh 'bundle exec rails test'
			}
		}
	}
}