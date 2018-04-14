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
import { HomeComponent } from './components/home/home.component';


@NgModule({
  declarations: [
    AppComponent,
    LandingComponent,
   LoginComponent,
   HomeComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot([
      { path: "", component: LandingComponent },
      { path: "login", component: LoginComponent},
      { path: "player/home", component: HomeComponent}

    ])
  ],
  providers: [AuthService],
  bootstrap: [AppComponent]
})
export class AppModule { }
