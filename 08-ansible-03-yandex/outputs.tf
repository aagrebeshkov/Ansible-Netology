output "clickhouse" {
  value = [join(",", yandex_compute_instance.VM[*].clickhouse.network_interface.0.nat_ip_address)]
}
output "lighthouse" {
  value = [join(",", yandex_compute_instance.VM[*].lighthouse.network_interface.0.nat_ip_address)]
}
output "vector" {
  value = [join(",", yandex_compute_instance.VM[*].vector.network_interface.0.nat_ip_address)]
}
