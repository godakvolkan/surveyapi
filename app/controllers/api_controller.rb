class ApiController < ApplicationController
  def info
    render json: {
      name: "Survey API",
      version: "1.0.0",
      description: "Ruby on Rails Survey API with 5 models",
      endpoints: {
        users: {
          index: "GET /api/v1/users",
          show: "GET /api/v1/users/:id",
          create: "POST /api/v1/users",
          update: "PUT /api/v1/users/:id",
          destroy: "DELETE /api/v1/users/:id"
        },
        surveys: {
          index: "GET /api/v1/surveys",
          show: "GET /api/v1/surveys/:id",
          create: "POST /api/v1/surveys",
          update: "PUT /api/v1/surveys/:id",
          destroy: "DELETE /api/v1/surveys/:id"
        },
        questions: {
          index: "GET /api/v1/questions",
          show: "GET /api/v1/questions/:id",
          create: "POST /api/v1/questions",
          update: "PUT /api/v1/questions/:id",
          destroy: "DELETE /api/v1/questions/:id"
        },
        answers: {
          index: "GET /api/v1/answers",
          show: "GET /api/v1/answers/:id",
          create: "POST /api/v1/answers",
          update: "PUT /api/v1/answers/:id",
          destroy: "DELETE /api/v1/answers/:id"
        },
        responses: {
          index: "GET /api/v1/responses",
          show: "GET /api/v1/responses/:id",
          create: "POST /api/v1/responses",
          update: "PUT /api/v1/responses/:id",
          destroy: "DELETE /api/v1/responses/:id"
        }
      },
      models: [
        "User - Kullanıcı yönetimi",
        "Survey - Anket yönetimi", 
        "Question - Soru yönetimi",
        "Answer - Cevap yönetimi",
        "Response - Yanıt yönetimi"
      ],
      database: "SQLite3",
      framework: "Ruby on Rails 7.1.5.2",
      github: "https://github.com/godakvolkan/surveyapi.git",
      status: "Active",
      created_at: "2025-10-22"
    }
  end
end
