from django.contrib.auth import get_user_model
from django.test import TestCase


class CustomUserTests(TestCase):
    def test_create_user(self):
        User = get_user_model()
        user = User.objects.create_user(
            username="test_user",
            email="test@email.com",
            password="test_pass123",
        )
        self.assertEqual(user.username, "test_user")
        self.assertEqual(user.email, "test@email.com")
        self.assertTrue(user.is_active)
        self.assertFalse(user.is_staff)
        self.assertFalse(user.is_superuser)

    def create_superuser(self):
        User = get_user_model()
        user = User.objects.create_superuser(
            username="super_admin",
            email="superadmin@email.com",
            password="test_pass123",
        )
        self.assertEqual(user.username, "super_admin")
        self.assertEqual(user.email, "superadmin@email.com")
        self.assertTrue(user.is_active)
        self.assertTrue(user.is_staff)
        self.assertTrue(user.is_superuser)
