variable "k8sgpt_api_key" {
    description = "API key for the K8s GPT service"
    type        = string
    default     = "1234567890"
    sensitive   = true
}