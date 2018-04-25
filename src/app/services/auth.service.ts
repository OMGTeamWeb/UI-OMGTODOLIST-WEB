import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { loginUser } from '../models/user';

@Injectable()
export class AuthService {
  private BASE_URL_USER: string = 'https://desolate-taiga-56447.herokuapp.com/api/user';
  private headers: Headers = new Headers({ 'Content-Type': 'application/json' });

  constructor(private http: Http) { }

  login(user: loginUser): Promise<any> {
    let url: string = `${this.BASE_URL_USER}/signin`;
    return this.http.post(url, user, { headers: this.headers }).toPromise();
  }


  ensureAuthenticated(token): Promise<any> {
    let url: string = `${this.BASE_URL_USER}/status`;
    let headers: Headers = new Headers({
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    });
    return this.http.get(url, { headers: headers }).toPromise();
  }

}
