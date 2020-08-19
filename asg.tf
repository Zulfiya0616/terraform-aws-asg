resource "aws_autoscaling_group" "Zulya" {
  availability_zones = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c",
  ]

  desired_capacity = 1
  max_size         = 1
  min_size         = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.Zulya.id}"
      }

      override {
        instance_type     = "t2.small"
        weighted_capacity = "3"
      }

      override {
        instance_type     = "t2.micro"
        weighted_capacity = "2"
      }
    }
  }
}
