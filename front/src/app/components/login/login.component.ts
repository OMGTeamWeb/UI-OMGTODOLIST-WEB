import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { loginPlayer } from '../../models/player';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  loginError: boolean = false;
  player: loginPlayer = new loginPlayer();

  constructor(private router: Router, private auth: AuthService) { }

  onLogin(): void {
    this.auth.login(this.player)
      .then((player) => {
        localStorage.setItem('token', player.json().token);

        const token = localStorage.getItem('token');
        if (token) {
          this.auth.ensureAuthenticated(token)
            .then((user) => {
              console.log(user.json());
              if (user.json().status === 'success') {
                //console.log("holaaaaaaaaa");
                this.router.navigateByUrl('player/home');
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
