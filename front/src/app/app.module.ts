import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { DataTablesModule } from 'angular-datatables';
import { ModalModule } from 'ngx-modialog';
import { BootstrapModalModule } from 'ngx-modialog/plugins/bootstrap';

// import { AuthService } from './services/auth.service';
import { LandingComponent } from './components/landing/landing.component';

@NgModule({
  declarations: [
  AppComponent,
  LandingComponent
  ],
  imports: [
  BrowserModule,
  DataTablesModule,
  HttpModule,
  FormsModule,
  ModalModule.forRoot(),
  BootstrapModalModule,
  RouterModule.forRoot([
    { path: '', component: LandingComponent }
    ])
  ],
  providers: [/*DataBimestersService*/],
  bootstrap: [AppComponent]
  })

export class AppModule { }