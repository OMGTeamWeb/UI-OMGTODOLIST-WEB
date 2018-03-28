import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
//import { loginTeacher } from '../models/teacher';
import { loginStudent } from '../models/student';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class AuthService {
	private BASE_URL_TEACHER: string = 'http://localhost:3000/api/teacher';
	private BASE_URL_STUDENT: string = 'http://localhost:3000/api/student';
	private headers: Headers = new Headers({'Content-Type': 'application/json'});
	constructor(private http: Http) {}

/*	login(teacher: loginTeacher): Promise<any> {
		let url: string = `${this.BASE_URL_TEACHER}/signin`;
		return this.http.post(url, teacher, {headers: this.headers}).toPromise();
	}
*/
	ensureAuthenticated(token): Promise<any> {
		let url: string = `${this.BASE_URL_TEACHER}/status`;
		let headers: Headers = new Headers({
			'Content-Type': 'application/json',
			Authorization: `Bearer ${token}`
			});
		return this.http.get(url, {headers: headers}).toPromise();
	}

	loginStudent(student: loginStudent): Promise<any> {
		let url: string = `${this.BASE_URL_STUDENT}/signin`;
		return this.http.post(url, student, {headers: this.headers}).toPromise();
	}

	ensureAuthenticatedStudent(token): Promise<any> {
		let url: string = `${this.BASE_URL_STUDENT}/status`;
		let headers: Headers = new Headers({
			'Content-Type': 'application/json',
			Authorization: `Bearer ${token}`
			});
		return this.http.get(url, {headers: headers}).toPromise();
	}
}