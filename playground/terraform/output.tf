#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

output "playground_registry_id" {
  value = module.infrastructure.playground_registry_id
}

output "playground_registry_location" {
  value = module.infrastructure.playground_registry_location
}

output "playground_registry_name" {
  value = module.infrastructure.playground_registry_name
}

output "playground_vpc_name" {
  value = module.infrastructure.playground_vpc_name
}

output "playground_redis_ip" {
  value = module.infrastructure.playground_redis_ip
}

output "docker-repository-root" {
  value = module.applications.docker-repository-root
}


output "go-server-url" {
  value = "https://${module.applications.go-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}

output "java-server-url" {
  value = "https://${module.applications.java-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}

output "python-server-url" {
  value = "https://${module.applications.python-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}

output "router-server-url" {
  value = "https://${module.applications.router-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}

output "scio-server-url" {
  value = "https://${module.applications.scio-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}

output "front-server-url" {
  //https://frontend-dev-dot-friendly-tower-340607.lm.r.appspot.com/
  value = "https://${module.applications.front-server-url}-dot-${var.project_id}.lm.r.appspot.com/"
}