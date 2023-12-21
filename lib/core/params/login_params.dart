//We are using params to make our code more scalable, we may change the data needed for login later
//(changing email to phoneNumber or userName, for instance)

class LoginParams{
  final String email;
  final String password;
  const LoginParams({required this.email,required this.password});
}