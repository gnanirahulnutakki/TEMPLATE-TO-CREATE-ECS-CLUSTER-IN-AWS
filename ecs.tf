resource "aws_ecs_cluster" "single-node-cluster" {
  name = "single-node-cluster"
}

data "template_file" "testapp" {
  template = file("./templates/image/image.json")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
    license        = var.license
  }
}

resource "aws_ecs_task_definition" "singlenode-task" {
  family                   = "singlenode-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.testapp.rendered
}


resource "aws_ecs_service" "test-service" {
  name            = "testapp-service"
  cluster         = aws_ecs_cluster.single-node-cluster.id
  task_definition = aws_ecs_task_definition.singlenode-task.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}" ]
    assign_public_ip = true
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role]
}
