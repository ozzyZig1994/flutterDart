// To parse this JSON data, do
//
//     final infoCultivo = infoCultivoFromJson(jsonString);

import 'dart:convert';

InfoCultivo infoCultivoFromJson(String str) => InfoCultivo.fromJson(json.decode(str));

String infoCultivoToJson(InfoCultivo data) => json.encode(data.toJson());

class InfoCultivo {
    InfoCultivo({
        this.status,
        this.info,
    });

    bool status;
    Info info;

    factory InfoCultivo.fromJson(Map<String, dynamic> json) => InfoCultivo(
        status: json["status"],
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "info": info.toJson(),
    };
}

class Info {
    Info({
        this.cultivo,
        this.aplicacion,
        this.etapa,
        this.informe,
    });

    String cultivo;
    String aplicacion;
    String etapa;
    dynamic informe;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        cultivo: json["cultivo"],
        aplicacion: json["aplicacion"],
        etapa: json["etapa"],
        informe: json["informe"],
    );

    Map<String, dynamic> toJson() => {
        "cultivo": cultivo,
        "aplicacion": aplicacion,
        "etapa": etapa,
        "informe": informe,
    };
}
