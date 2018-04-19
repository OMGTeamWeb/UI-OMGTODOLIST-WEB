import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule,Routes } from '@angular/router';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
//import { DataTablesModule } from 'angular-datatables';
//import { ModalModule } from 'ngx-modialog';

//import { BootstrapModalModule } from 'ngx-modialog/plugins/bootstrap';

import { LandingComponent } from './components/landing/landing.component';
import { LoginComponent } from './components/login/login.component';

import { AuthService } from './services/auth.service';
import { DatauserService } from './services/datauser.service';

import { HomeComponent } from './components/home/home.component';
<<<<<<< HEAD
import { TasksComponent } from './components/tasks/tasks.component';
import { CreatetaskComponent } from './components/createtask/createtask.component';
import { EdittaskComponent } from './components/edittask/edittask.component';
=======
import { RegistroComponent } from './components/registro/registro.component';
>>>>>>> 467f91773f79b6547dd8e9cebf8e24d00f576b1a


@NgModule({
  declarations: [
    AppComponent,
    LandingComponent,
   LoginComponent,
   HomeComponent,
   TasksComponent,
   CreatetaskComponent,
   EdittaskComponent,
   RegistroComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot([
      { path: "", component: LandingComponent },
      { path: "login", component: LoginComponent},
      { path: "player/home", component: HomeComponent},
      { path: "tasks", component:TasksComponent},
      { path:  "createtask", component: CreatetaskComponent},
      { path: "edittask", component: EdittaskComponent},
      { path: "user/home", component: HomeComponent},
      { path: "register", component: RegistroComponent}
    ])
  ],
  providers: [AuthService,DatauserService],
  bootstrap: [AppComponent]
})
export class AppModule { }
 