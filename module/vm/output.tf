/*output "nat_ip" {
  description = "List of private ip addresses created by this module"
  value       = google_compute_instance.vm_instance.nat_ip
}*/

output "public_key" {
  value     = tls_private_key.private_key_pair.public_key_openssh
  sensitive = true
}
output "private_key" {
  value     = tls_private_key.private_key_pair.private_key_pem
  sensitive = true
}


