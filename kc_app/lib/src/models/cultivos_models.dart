// To parse this JSON data, do
//
//     final cultivos = cultivosFromJson(jsonString);

import 'dart:convert';

Cultivos cultivosFromJson(String str) => Cultivos.fromJson(json.decode(str));

String cultivosToJson(Cultivos data) => json.encode(data.toJson());

class Cultivos {
    Cultivos({
        this.status,
        this.total,
        this.cultivos,
    });

    bool status;
    int total;
    List<Cultivo> cultivos;

    factory Cultivos.fromJson(Map<String, dynamic> json) => Cultivos(
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
        this.etapa,
        this.aplicacion,
        this.informe,
    });

    String nombre;
    String icono;
    String etapa;
    String aplicacion;
    String informe;

    factory Cultivo.fromJson(Map<String, dynamic> json) => Cultivo(
        nombre: json["nombre"],
        icono: json["icono"],
        etapa: json["etapa"],
        aplicacion: json["aplicacion"],
        informe: json["informe"] == null ? null : json["informe"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "icono": icono,
        "etapa": etapa,
        "aplicacion": aplicacion,
        "informe": informe == null ? null : informe,
    };
}
