import 'dart:convert';


StorageModel storageModelFromJson(String str) => StorageModel.fromJson(json.decode(str));

String storageModelToJson(StorageModel data) => json.encode(data.toJson());

class StorageModel {
    StorageModel({
        required this.data,
    });

    final bool data;

    factory StorageModel.fromJson(Map<String, dynamic> json) => StorageModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}

