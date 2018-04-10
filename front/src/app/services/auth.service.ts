import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { loginPlayer } from '../models/player';

@Injectable()
export class AuthService {
  private BASE_URL_PLAYER: string = 'http://localhost:3000/api/player';
  private headers: Headers = new Headers({ 'Content-Type': 'application/json' });

  constructor(private http: Http) { }

  login(player: loginPlayer): Promise<any> {
    let url: string = `${this.BASE_URL_PLAYER}/signin`;
    return this.http.post(url, player, { headers: this.headers }).toPromise();
  }


  ensureAuthenticated(token): Promise<any> {
    let url: string = `${this.BASE_URL_PLAYER}/status`;
    let headers: Headers = new Headers({
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    });
    return this.http.get(url, { headers: headers }).toPromise();
  }

}
