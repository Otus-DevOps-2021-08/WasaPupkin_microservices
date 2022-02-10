[master]
%{ for ip in master-external-ip ~}
${ip}
%{ endfor ~}

[worker]
%{ for ip in worker-external-ip ~}
${ip}
%{ endfor ~}
