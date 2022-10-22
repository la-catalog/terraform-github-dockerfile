resource "github_repository_file" "python_cronjob" {
  for_each            = toset(data.github_repositories.python_cronjob.names)
  repository          = each.key
  branch              = "main"
  file                = "Dockerfile"
  content             = file("./res/python_cronjob.Dockerfile")
  commit_message      = "Update Dockerfile"
  commit_author       = "github-actions"
  commit_email        = "github-actions[bot]@users.noreply.github.com"
  overwrite_on_create = true
}

resource "github_repository_file" "python_deployment" {
  for_each            = toset(data.github_repositories.python_deployment.names)
  repository          = each.key
  branch              = "main"
  file                = "Dockerfile"
  content             = file("./res/python_deployment.Dockerfile")
  commit_message      = "Update Dockerfile"
  commit_author       = "github-actions"
  commit_email        = "github-actions[bot]@users.noreply.github.com"
  overwrite_on_create = true
}