import platform

os_info = platform.uname()

print("verze 1.1")
print(f"Operační systém: {os_info.system}")
print(f"Verze: {os_info.release}")
print(f"Detaily: {os_info.version}")
print(f"Architektura: {os_info.machine}")
