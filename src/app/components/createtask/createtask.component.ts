import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatataskService } from '../../services/datatask.service';
import { createTask } from '../../models/task';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-createtask',
  templateUrl: './createtask.component.html',
  styleUrls: ['./createtask.component.css']
})
export class CreatetaskComponent implements OnInit {

  task: createTask = new createTask();

  constructor(private dataTask: DatataskService,
    private auth: AuthService) { }

  ngOnInit(): void {
  }

  addTask(): void {
    this.dataTask.createTask(this.task)
      .then((task) => {
        //console.log(user.json());
        console.log(task.json());
          //this.router.navigateByUrl('user/home');

      })
      .catch((err) => {
        //this.router.navigateByUrl('register');
        
        console.log(err);
      })
  }

}
