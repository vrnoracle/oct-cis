output "vcns" {
  description = "The VCNs, indexed by display_name."
  value = {for v in oci_core_vcn.these : v.display_name => {id = v.id, cidr_block = v.cidr_block, dns_label = v.dns_label}}
}
output "subnets" {
  description = "The subnets, indexed by display_name."
  value = {for s in oci_core_subnet.these : s.display_name => s}
}
output "internet_gateways" {
  description = "The Internet gateways, indexed by display_name."
  value = {for g in oci_core_internet_gateway.these : g.vcn_id => g}
}
output "nat_gateways" {
  description = "The NAT gateways, indexed by display_name."
  value = {for g in oci_core_nat_gateway.these : g.vcn_id => g}
}
output "service_gateways" {
  description = "The Service gateways, indexed by display_name."
  value = {for g in oci_core_service_gateway.these : g.vcn_id => g}
}
output "drg" {
  description = "DRG information."
  value       = length(oci_core_drg.this) > 0 ? oci_core_drg.this[0] : null
}
output "all_services" {
  description = "All services"
  value       = data.oci_core_services.all_services
}