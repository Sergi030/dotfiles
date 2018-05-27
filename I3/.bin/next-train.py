#!/usr/bin/python3.6

import requests
import json
import datetime


today = datetime.datetime.now().strftime("%Y%m%d")
url = "http://horarios.renfe.com/cer/HorariosServlet"

payload = "{'nucleo':'50','origen':'71801','destino':'72303','fchaViaje':'%s','validaReglaNegocio':'true','tiempoReal':'true','servicioHorarios':'VTI','horaViajeOrigen':'00','horaViajeLlegada':'26','accesibilidadTrenes':'true'}" % today
headers = {
    'Content-Type': "application/javascript",
    'Cache-Control': "no-cache",
    'Postman-Token': "b398a94a-69b1-4c49-9710-ca423d8696b0"
    }

response = requests.request("POST", url, data=payload, headers=headers)
if response.status_code == 200 and response.text != "null":
    data = json.loads(response.text)

    now = datetime.datetime.now().strftime("%H:%M")
    for x in data["horario"]:
        if 'horaSalidaReal' in x:
            if now < x['horaSalidaReal']:
                toReturn = x['horaSalidaReal']
                print(toReturn + ' ')
                break


