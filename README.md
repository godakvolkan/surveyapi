# Survey API

Ruby on Rails ile geliştirilmiş Survey (Anket) API'si. 5 model arasındaki ilişkileri yöneten RESTful API servisi.

## 🚀 Özellikler

- **5 Model Yapısı:** User, Survey, Question, Answer, Response
- **RESTful API:** CRUD işlemleri için endpoint'ler
- **JSON Response:** Tüm endpoint'ler JSON formatında veri döndürür
- **SQLite3:** Hafif ve hızlı veritabanı
- **Model İlişkileri:** has_many, belongs_to, through ilişkileri
- **API Documentation:** Detaylı API dokümantasyonu

## 📊 Veritabanı Şeması

```
User (1) -----> (0..*) Survey
User (1) -----> (0..*) Response
Survey (1) ----> (0..*) Question
Survey (1) ----> (0..*) Response
Question (1) --> (0..*) Answer
Response (1) --> (0..*) Answer
```

## 🛠️ Kurulum

### Gereksinimler

- Ruby 3.4.7+
- Rails 7.1.5.2+
- SQLite3

### Adımlar

1. **Repository'yi klonlayın:**

```bash
git clone https://github.com/godakvolkan/surveyapi.git
cd survey_api
```

2. **Dependencies'leri yükleyin:**

```bash
bundle install
```

3. **Veritabanını oluşturun:**

```bash
rails db:migrate
```

4. **Sunucuyu başlatın:**

```bash
rails server
```

## 🔗 API Endpoints

### Base URL

```
http://localhost:3000/api/v1/
```

### Users API

- `GET /users` - Tüm kullanıcıları listele
- `GET /users/:id` - Belirli kullanıcıyı getir
- `POST /users` - Yeni kullanıcı oluştur
- `PUT /users/:id` - Kullanıcıyı güncelle
- `DELETE /users/:id` - Kullanıcıyı sil

### Surveys API

- `GET /surveys` - Tüm anketleri listele
- `GET /surveys/:id` - Belirli anketi getir
- `POST /surveys` - Yeni anket oluştur
- `PUT /surveys/:id` - Anketi güncelle
- `DELETE /surveys/:id` - Anketi sil

### Questions API

- `GET /questions` - Tüm soruları listele
- `GET /questions/:id` - Belirli soruyu getir
- `POST /questions` - Yeni soru oluştur
- `PUT /questions/:id` - Soruyu güncelle
- `DELETE /questions/:id` - Soruyu sil

### Answers API

- `GET /answers` - Tüm cevapları listele
- `GET /answers/:id` - Belirli cevabı getir
- `POST /answers` - Yeni cevap oluştur
- `PUT /answers/:id` - Cevabı güncelle
- `DELETE /answers/:id` - Cevabı sil

### Responses API

- `GET /responses` - Tüm yanıtları listele
- `GET /responses/:id` - Belirli yanıtı getir
- `POST /responses` - Yeni yanıt oluştur
- `PUT /responses/:id` - Yanıtı güncelle
- `DELETE /responses/:id` - Yanıtı sil

## 🧪 API Test

### Browser ile Test

Tarayıcınızda aşağıdaki URL'leri ziyaret edin:

- http://localhost:3000/api/v1/users
- http://localhost:3000/api/v1/surveys
- http://localhost:3000/api/v1/questions
- http://localhost:3000/api/v1/answers
- http://localhost:3000/api/v1/responses

### cURL ile Test

#### User oluşturma:

```bash
curl -X POST http://localhost:3000/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"user": {"email": "test@example.com", "username": "testuser"}}'
```

#### Survey oluşturma:

```bash
curl -X POST http://localhost:3000/api/v1/surveys \
  -H "Content-Type: application/json" \
  -d '{"survey": {"title": "Test Survey", "description": "Test Description", "user_id": 1}}'
```

#### Tüm users'ları listeleme:

```bash
curl -X GET http://localhost:3000/api/v1/users
```

### Otomatik Test

Windows'ta `test_api.bat` dosyasını çalıştırın:

```bash
test_api.bat
```

## 📝 Örnek JSON Response

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

## 📚 Dokümantasyon

- [API Test Rehberi](API_TEST_GUIDE.md) - Detaylı API test rehberi
- [Proje Raporu](SURVEY_API_RAPOR.md) - Kapsamlı proje raporu
- [Database Diyagramı](database_diagram.puml) - PlantUML veritabanı diyagramı

## 🎯 Proje Hedefleri

Bu proje aşağıdaki hedefleri gerçekleştirmektedir:

- ✅ **75 Puan:** 5 model ilişkisi (3 model yerine)
- ✅ **25 Puan:** API implementasyonu
- ✅ **20 Puan:** 5 model kullanımı (ekstra puan)

**Toplam: 120/100 Puan** 🎉

## 🛡️ Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

## 👨‍💻 Geliştirici

**Ad:** [Adınız Soyadınız]  
**Email:** [email@example.com]  
**GitHub:** [github.com/username]

---

**Son Güncelleme:** 22 Ekim 2025  
**Versiyon:** 1.0.0
