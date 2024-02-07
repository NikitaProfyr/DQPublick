from fastapi.testclient import TestClient

from main import app

from services.User import create_token

client = TestClient(app)


test_user = {"userName": "testUserName", "password": "testPassword"}
test_token = create_token(test_user)


def test_registration():
    response = client.post("/users/logup", json=test_user)
    assert response.status_code == 200  # Успешная регистрация
    response = client.post("/users/logup", json=test_user)
    assert response.status_code == 400  # Повторная регистрация


def test_authorization():
    response = client.post("/users/login", json=test_user)
    assert response.status_code == 200  # Успешная авторизация.
    response = client.post(
        "/users/login", json={"userName": "testUserName", "password": "fakePassword"}
    )
    assert (
        response.status_code == 401
    )  # Не существует пользователя с данным логином или некорректный пароль.
