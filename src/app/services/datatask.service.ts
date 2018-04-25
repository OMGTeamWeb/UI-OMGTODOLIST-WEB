import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { createTask} from '../models/task';

import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';

@Injectable()
export class DatataskService {

  private BASE_URL: string = 'https://desolate-taiga-56447.herokuapp.com/api/user';
  private headers: Headers = new Headers({ 'Content-Type': 'application/json' });

  users:any;
  currentUser:any;

  constructor(private http: Http) { }

  createTask(createTask: createTask): Promise<any> {
    let url: string = `${this.BASE_URL}/create`;
    return this.http.post(url, createTask, { headers: this.headers }).toPromise();
  }

}