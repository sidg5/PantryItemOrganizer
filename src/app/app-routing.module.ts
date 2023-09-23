import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddItemComponent } from './add-item/add-item.component';
import { CreateItemComponent } from './create-item/create-item.component';

const routes: Routes = [
  { path: '', component: AddItemComponent },
  { path: 'createItem', component: CreateItemComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
