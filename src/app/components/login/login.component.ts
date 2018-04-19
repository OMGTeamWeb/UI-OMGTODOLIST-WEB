import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { loginUser } from '../../models/user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  loginError: boolean = false;
  user: loginUser = new loginUser();

  constructor(private router: Router, private auth: AuthService) { }

  onLogin(): void {
    this.auth.login(this.user)
      .then((user) => {
        localStorage.setItem('token', user.json().token);

        const token = localStorage.getItem('token');
        if (token) {
          this.auth.ensureAuthenticated(token)
            .then((user) => {
              console.log(user.json());
              if (user.json().status === 'success') {
                //console.log("holaaaaaaaaa");
                this.router.navigateByUrl('user/home');
              } else {
                this.router.navigateByUrl('login');
              }
            })
            .catch((err) => {
              console.log(err);
            });
        }
      })
      .catch((err) => {
        console.log(err);
        this.loginError = err._body;
      });
  }

}
