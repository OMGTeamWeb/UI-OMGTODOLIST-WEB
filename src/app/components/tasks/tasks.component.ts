import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatataskService } from '../../services/datatask.service';
import { createTask } from '../../models/task';
import { AuthService } from '../../services/auth.service';
import { Http, Response } from '@angular/http';

@Component({
  selector: 'app-tasks',
  templateUrl: './tasks.component.html',
  styleUrls: ['./tasks.component.css']
})
export class TasksComponent implements OnInit {
  title = 'app';
  private apiURL ='https://cryptic-inlet-78225.herokuapp.com/api/';
  data: any = {};

  constructor(private http: Http) { 
    console.log('Hello fellow user');
    this.getContacts();
    this.getData();
  }

  getData(){
    return this.http.get(this.apiURL)
    .map((res: Response) => res.json())
  }

  getContacts(){
    this.getData().subscribe(data =>{
      console.log(data);
      this.data = data
    })
  }

  ngOnInit() {
  }

}
