folder('Deploy')
folder('Build')
folder('DevOps')

pipelineJob('Build/docker_build_pipeline') {

  def repo = 'https://github.com/path/to/your/repo.git'

  triggers {
    scm('H/5 * * * *')
  }
  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master', '**/feature*')
          scriptPath('misc/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

pipelineJob('deploy/docker_deploy_pipeline') {

  def repo = 'https://github.com/path/to/your/repo.git'

  triggers {
    scm('H/5 * * * *')
  }
  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master', '**/feature*')
          scriptPath('misc/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}
P

job("DevOps/parameter job") {
        scm {
                git {
                        remote {
                        url 'https://github.com/path/to/your/repo.git'
                }
                branch '$branch'
                }
        }
        publishers {
          downstream '2-Demo build job' , 'SUCCESS'
        }
   parameters {
     choiceParam('Branch', ['master (default)', 'test', 'efix'], 'Select Branch to build from')
     }
}

