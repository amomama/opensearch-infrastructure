data "aws_route53_zone" "this" {
  name         = "example.com"
  private_zone = false
}

resource "aws_route53_record" "data1-warm-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "data1-warm-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["data1-warm-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["data1-warm-node-elk"], aws_instance.this["data1-warm-node-elk"]]
}

resource "aws_route53_record" "data2-cold-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "data2-cold-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["data2-cold-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["data2-cold-node-elk"], aws_instance.this["data2-cold-node-elk"]]
}

resource "aws_route53_record" "data3-hot-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "data3-hot-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["data3-hot-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["data3-hot-node-elk"], aws_instance.this["data3-hot-node-elk"]]
}

resource "aws_route53_record" "data4-hot-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "data4-hot-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["data4-hot-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["data4-hot-node-elk"], aws_instance.this["data4-hot-node-elk"]]
}

resource "aws_route53_record" "master-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "master-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["master-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["master-node-elk"], aws_instance.this["master-node-elk"]]
}

resource "aws_route53_record" "coordinating-node-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "coordinating-node.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["coordinating-node-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["coordinating-node-elk"], aws_instance.this["coordinating-node-elk"]]
}

resource "aws_route53_record" "kibana-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "kibana.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["kibana-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["kibana-elk"], aws_instance.this["kibana-elk"]]
}

resource "aws_route53_record" "logstash-elk" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "logstash.example.com"
  type            = "CNAME"
  ttl             = "300"
  records         = flatten([aws_instance.this["logstash-elk"].public_dns])
  allow_overwrite = true
  depends_on      = [aws_eip.this["logstash-elk"], aws_instance.this["logstash-elk"]]
}
