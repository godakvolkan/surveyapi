# Survey API Test Rehberi

## API Endpoints

### 1. Users API

- **GET** `/api/v1/users` - Tüm kullanıcıları listele
- **GET** `/api/v1/users/:id` - Belirli kullanıcıyı getir
- **POST** `/api/v1/users` - Yeni kullanıcı oluştur
- **PUT** `/api/v1/users/:id` - Kullanıcıyı güncelle
- **DELETE** `/api/v1/users/:id` - Kullanıcıyı sil

### 2. Surveys API

- **GET** `/api/v1/surveys` - Tüm anketleri listele
- **GET** `/api/v1/surveys/:id` - Belirli anketi getir
- **POST** `/api/v1/surveys` - Yeni anket oluştur
- **PUT** `/api/v1/surveys/:id` - Anketi güncelle
- **DELETE** `/api/v1/surveys/:id` - Anketi sil

### 3. Questions API

- **GET** `/api/v1/questions` - Tüm soruları listele
- **GET** `/api/v1/questions/:id` - Belirli soruyu getir
- **POST** `/api/v1/questions` - Yeni soru oluştur
- **PUT** `/api/v1/questions/:id` - Soruyu güncelle
- **DELETE** `/api/v1/questions/:id` - Soruyu sil

### 4. Answers API

- **GET** `/api/v1/answers` - Tüm cevapları listele
- **GET** `/api/v1/answers/:id` - Belirli cevabı getir
- **POST** `/api/v1/answers` - Yeni cevap oluştur
- **PUT** `/api/v1/answers/:id` - Cevabı güncelle
- **DELETE** `/api/v1/answers/:id` - Cevabı sil

### 5. Responses API

- **GET** `/api/v1/responses` - Tüm yanıtları listele
- **GET** `/api/v1/responses/:id` - Belirli yanıtı getir
- **POST** `/api/v1/responses` - Yeni yanıt oluştur
- **PUT** `/api/v1/responses/:id` - Yanıtı güncelle
- **DELETE** `/api/v1/responses/:id` - Yanıtı sil

## Test Yöntemleri

### 1. Postman ile Test

1. Postman'i açın
2. Yeni bir Collection oluşturun: "Survey API Tests"
3. Her endpoint için request'ler oluşturun
4. JSON formatında test verileri gönderin

### 2. cURL ile Test

Terminal/Command Prompt'ta aşağıdaki komutları kullanabilirsiniz:

#### User Oluşturma

```bash
curl -X POST http://localhost:3000/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"user": {"email": "test@example.com", "username": "testuser"}}'
```

#### Survey Oluşturma

```bash
curl -X POST http://localhost:3000/api/v1/surveys \
  -H "Content-Type: application/json" \
  -d '{"survey": {"title": "Test Survey", "description": "Test Description", "user_id": 1}}'
```

#### Tüm Users'ları Listeleme

```bash
curl -X GET http://localhost:3000/api/v1/users
```

#### Tüm Surveys'leri Listeleme

```bash
curl -X GET http://localhost:3000/api/v1/surveys
```

### 3. Browser ile Test

GET istekleri için tarayıcıda direkt URL'leri ziyaret edebilirsiniz:

- http://localhost:3000/api/v1/users
- http://localhost:3000/api/v1/surveys
- http://localhost:3000/api/v1/questions
- http://localhost:3000/api/v1/answers
- http://localhost:3000/api/v1/responses

## Test Senaryoları

### Senaryo 1: Temel CRUD İşlemleri

1. User oluştur
2. Survey oluştur (user_id ile)
3. Question oluştur (survey_id ile)
4. Response oluştur (user_id ve survey_id ile)
5. Answer oluştur (question_id ve response_id ile)

### Senaryo 2: İlişkili Veri Testi

1. Bir user'ın tüm survey'lerini getir
2. Bir survey'in tüm question'larını getir
3. Bir response'un tüm answer'larını getir

### Senaryo 3: Hata Durumları

1. Geçersiz veri ile create işlemi
2. Olmayan ID ile show işlemi
3. Geçersiz parametrelerle update işlemi

## Beklenen JSON Formatları

### User JSON

```json
{
  "id": 1,
  "email": "test@example.com",
  "username": "testuser",
  "created_at": "2025-10-22T19:00:00.000Z",
  "updated_at": "2025-10-22T19:00:00.000Z"
}
```

### Survey JSON

```json
{
  "id": 1,
  "title": "Test Survey",
  "description": "Test Description",
  "user_id": 1,
  "created_at": "2025-10-22T19:00:00.000Z",
  "updated_at": "2025-10-22T19:00:00.000Z"
}
```

### Question JSON

```json
{
  "id": 1,
  "text": "What is your favorite color?",
  "type": "multiple_choice",
  "survey_id": 1,
  "created_at": "2025-10-22T19:00:00.000Z",
  "updated_at": "2025-10-22T19:00:00.000Z"
}
```

### Answer JSON

```json
{
  "id": 1,
  "text": "Blue",
  "is_correct": true,
  "question_id": 1,
  "response_id": 1,
  "created_at": "2025-10-22T19:00:00.000Z",
  "updated_at": "2025-10-22T19:00:00.000Z"
}
```

### Response JSON

```json
{
  "id": 1,
  "survey_id": 1,
  "user_id": 1,
  "created_at": "2025-10-22T19:00:00.000Z",
  "updated_at": "2025-10-22T19:00:00.000Z"
}
```

## Başarı Kriterleri

- ✅ Tüm CRUD işlemleri çalışıyor
- ✅ JSON formatında veri dönüyor
- ✅ HTTP status kodları doğru
- ✅ Model ilişkileri korunuyor
- ✅ Hata durumları uygun şekilde handle ediliyor
