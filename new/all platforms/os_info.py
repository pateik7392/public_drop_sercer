import platform

# Získat informace o verzi operačního systému
os_info = platform.uname()

# Vytisknout verzi
print(f"Operační systém: {os_info.system}")
print(f"Verze: {os_info.release}")
print(f"Detaily: {os_info.version}")
print(f"Architektura: {os_info.machine}")
