import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatauserService } from '../../services/datauser.service';
import { createUser } from '../../models/user';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent {

  user: createUser = new createUser();

  constructor(private dataUser: DatauserService,
    private auth: AuthService,
    private router: Router) { }

  ngOnInit(): void {
  }

  addUser(): void {
    this.dataUser.createUser(this.user)
      .then((teacher) => {
        //console.log(user.json());
      })
      .catch((err) => {
        console.log(err);
      })
  }

}
