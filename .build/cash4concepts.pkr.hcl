source "docker" "nginx" {
  image = "nginx"
  commit = true
  changes = [
    "ENV FOO bar",
    "ENTRYPOINT [\"nginx\", \"-g\", \"daemon off;\"]"
  ]
}

build {
  sources = ["source.docker.nginx"]

  provisioner "file" {
    source = "../"
    destination = "/usr/share/nginx/html"
  }

  provisioner "shell" {
    inline = ["rm -rf /usr/share/nginx/html/.build", "rm -rf /usr/share/nginx/html/.github", "rm -rf /usr/share/nginx/html/.git"]
  }

  post-processors {

    post-processor "docker-tag" {
      repository = "550661752655.dkr.ecr.eu-west-1.amazonaws.com/cash4concepts"
      tags       = ["latest"]
    }

    post-processor "docker-push" {
      ecr_login = true
      login_server = "https://550661752655.dkr.ecr.eu-west-1.amazonaws.com/mitlan"
    }
  }
}
