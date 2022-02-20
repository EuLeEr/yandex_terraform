terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "AQAAAAABTvMbAATuwREZcm9gIEicv1fj8OpIGio"
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
  zone      = local.zone
}

locals {
  cloud_id  = "b1gblpe03bo3533ciq5v"
  folder_id = "b1gqimpiaucopdph3f4h"
  zone      = "ru-central1-b"
}
resource "yandex_compute_instance" "default" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8uapmvr6nk6f3dpite"
    }
  }

  network_interface {
    subnet_id = "e9b9qmovnouifrbj67qv"
  }

  /* metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  } */
}

/* resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone       = "ru-central1-a"
  network_id = "${yandex_vpc_network.foo.id}"
}
*/

