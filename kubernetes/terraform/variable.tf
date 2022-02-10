variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable subnet_id {
  description = "Subnet"
}
variable net_folder_id {
  description = "Net Folder"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable service_account_key_file {
  description = "key .json"
}
variable image_id {
  description = "Disk image"
  default = "fd8fq554fdj104vdf8ka"
}
variable res_cores {
  description = "CPU cores for the instance"
  default     = 4
}
variable res_core_fraction {
  description = "Baseline performance for a core as a percent"
  default     = 100
}
variable res_memory {
  description = "Memory size in GB"
  default     = 4
}
variable master_nodes_count {
  description = "Master instance count"
  default = "1"
}
variable worker_nodes_count {
  description = "Worker instance count"
  default = "1"
}
