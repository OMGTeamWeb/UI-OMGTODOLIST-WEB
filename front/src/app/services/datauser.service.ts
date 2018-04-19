import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { createUser } from '../models/user';

import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';

@Injectable()
export class DatauserService {

  private BASE_URL: string = 'https://desolate-taiga-56447.herokuapp.com/api/user';
  private headers: Headers = new Headers({ 'Content-Type': 'application/json' });

  users:any;
  currentUser:any;

  constructor(private http: Http) { }

  createUser(createUser: createUser): Promise<any> {
    let url: string = `${this.BASE_URL}/create`;
    return this.http.post(url, createUser, { headers: this.headers }).toPromise();
  }

}
