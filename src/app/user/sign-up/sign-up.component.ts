import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr'
import { User } from '../../shared/user.model';
import { UserService } from '../../shared/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  user: User;
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
  erreur:string;
  isLoading=false;
  constructor(private userService: UserService, private toastr: ToastrService,private router : Router) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      UserName: '',
      Password: '',
      Email: '',
      FirstName: '',
      LastName: ''
    }
  }

  OnSubmit(form: NgForm) {
 this.isLoading=true;
    this.userService.registerUser(form.value)
      .subscribe(resData=>{
        this.router.navigate(['/login']);
        this.resetForm();
        this.isLoading=false;
      },
        errorRes=>{
            console.log(errorRes.error.error.message);
            this.isLoading=false;
          switch(errorRes.error.error.message)
          {
            case 'EMAIL_EXISTS':
              this.erreur="L'email existe déjà";
          }
          this.resetForm();
        }
        );
  }

}
