void main() {
  final json = {
    "id": 84,
    "name": "caetano cesar",
    "cpf": "04177605662",
    "email": "caetanocesar35@gmail.com",
    "phone": "5531912893407",
    "password": "\$2b\$10\$yIlzz1lLHuENftO0pEpdW.kgl0ttyapn6M91PqS1NK6A53.HCmUYK",
    "role": "ADMIN",
    "authType": "CREDENTIAL",
    "imageId": 6,
    "refresh_token": "\$2b\$10\$sI5ah7El8MPYD76HSujLz.oq9dp2HutAyUSZ2lLWzsfvV8Dxv2IG2",
    "dt_criacao": "2026-05-18T19:56:49.763Z",
    "dt_alteracao": "2026-05-18T20:14:58.230Z",
    "operation": "UPDATE",
    "endpoint_modificador": "/users/84",
    "nu_versao": 4,
    "modified_by_id": 84,
    "modified_by_name": "caetano cesar"
  };

  try {
    final email = json['email'] as String;
    final cpf = json['cpf'] as String?;
    final phone = json['phone'] as String?;
    final role = json['role'] as String;
    final image = json['image'];
    final id = (json['id'] as num).toInt();
    final name = json['name'] as String;
    print("Success!");
  } catch (e, stack) {
    print("Error: \$e\\n\$stack");
  }
}
