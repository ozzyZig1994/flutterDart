// To parse this JSON data, do
//
//     final cultivosResponse = cultivosResponseFromJson(jsonString);

import 'dart:convert';

CultivosResponse cultivosResponseFromJson(String str) => CultivosResponse.fromJson(json.decode(str));

String cultivosResponseToJson(CultivosResponse data) => json.encode(data.toJson());

class CultivosResponse {
    CultivosResponse({
        this.status,
        this.total,
        this.cultivos,
    });

    bool status;
    int total;
    List<Cultivo> cultivos;

    factory CultivosResponse.fromJson(Map<String, dynamic> json) => CultivosResponse(
        status: json["status"],
        total: json["total"],
        cultivos: List<Cultivo>.from(json["cultivos"].map((x) => Cultivo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "cultivos": List<dynamic>.from(cultivos.map((x) => x.toJson())),
    };
}

class Cultivo {
    Cultivo({
        this.nombre,
        this.icono,
    });

    String nombre;
    String icono;

    factory Cultivo.fromJson(Map<String, dynamic> json) => Cultivo(
        nombre: json["nombre"],
        icono: json["icono"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "icono": icono,
    };
}
