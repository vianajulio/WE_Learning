// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Aula {
  int? id;
  String? titulo;
  String? descricao;
  String? url;
  int? tipo;
  String? dateCadastro;
  String? pierSitReg;
  bool? assistida;
  Aula({
    this.id,
    this.titulo,
    this.descricao,
    this.url,
    this.tipo,
    this.dateCadastro,
    this.pierSitReg,
    this.assistida,
  });

  Aula copyWith({
    int? id,
    String? titulo,
    String? descricao,
    String? url,
    int? tipo,
    String? dateCadastro,
    String? pierSitReg,
    bool? assistida,
  }) {
    return Aula(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      url: url ?? this.url,
      tipo: tipo ?? this.tipo,
      dateCadastro: dateCadastro ?? this.dateCadastro,
      pierSitReg: pierSitReg ?? this.pierSitReg,
      assistida: assistida ?? this.assistida,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'url': url,
      'tipo': tipo,
      'dateCadastro': dateCadastro,
      'pierSitReg': pierSitReg,
      'assistida': assistida,
    };
  }

  factory Aula.fromMap(Map<String, dynamic> map) {
    return Aula(
      id: map['id'] != null ? map['id'] as int : null,
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      tipo: map['tipo'] != null ? map['tipo'] as int : null,
      dateCadastro: map['dateCadastro'] != null ? map['dateCadastro'] as String : null,
      pierSitReg: map['pierSitReg'] != null ? map['pierSitReg'] as String : null,
      assistida: map['assistida'] != null ? map['assistida'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Aula.fromJson(String source) => Aula.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Aula(id: $id, titulo: $titulo, descricao: $descricao, url: $url, tipo: $tipo, dateCadastro: $dateCadastro, pierSitReg: $pierSitReg, assistida: $assistida)';
  }

  @override
  bool operator ==(covariant Aula other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.titulo == titulo &&
      other.descricao == descricao &&
      other.url == url &&
      other.tipo == tipo &&
      other.dateCadastro == dateCadastro &&
      other.pierSitReg == pierSitReg &&
      other.assistida == assistida;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      titulo.hashCode ^
      descricao.hashCode ^
      url.hashCode ^
      tipo.hashCode ^
      dateCadastro.hashCode ^
      pierSitReg.hashCode ^
      assistida.hashCode;
  }
}
