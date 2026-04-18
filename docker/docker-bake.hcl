target "ubuntu" {
  context = "."
  dockerfile = "ubuntu.dockerfile"
  tags = ["dotfiles-test:ubuntu"]
}

target "debian" {
  context = "."
  dockerfile = "debian.dockerfile"
  tags = ["dotfiles-test:debian"]
}

target "fedora" {
  context = "."
  dockerfile = "fedora.dockerfile"
  tags = ["dotfiles-test:fedora"]
}

target "arch" {
  context = "."
  dockerfile = "arch.dockerfile"
  tags = ["dotfiles-test:arch"]
}

group "default" {
  targets = ["ubuntu", "debian", "fedora", "arch"]
}
