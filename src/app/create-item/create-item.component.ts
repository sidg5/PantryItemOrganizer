import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FloatLabelType, MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from '@angular/material/radio';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { Box, Category, Item, Shelf } from '../add-item/add-item.component';
import { ItemServiceService } from '../item-service.service';
import { ThemePalette } from '@angular/material/core';
import { ProgressSpinnerMode } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-create-item',
  templateUrl: './create-item.component.html',
  styleUrls: ['./create-item.component.css']
})
export class CreateItemComponent {
  hideRequiredControl = new FormControl(false);
  floatLabelControl = new FormControl('auto' as FloatLabelType);
  options = this._formBuilder.group({
    hideRequired: this.hideRequiredControl,
    floatLabel: this.floatLabelControl,
  });

itemName: string="ABCD";
color: ThemePalette = 'primary';
  mode: ProgressSpinnerMode = 'determinate';
  value = 50;
  model: Item = {itemName:'', itemCategory:'', itemId:'', boxName:'', shelfName:''};
  message: string|undefined;
  constructor(private _formBuilder: FormBuilder,private itemService: ItemServiceService) {}

  ngOnInit(){
    
    this.getAllShelfs();
    this.loadAllCategories();
  }

  getFloatLabelValue(): FloatLabelType {
    return this.floatLabelControl.value || 'auto';
  }

  shelfs: Shelf[]=[];


  boxes: Box[] = [];
  category: Category [] = [];

  getAllShelfs() {
    this.itemService.getShelfs().subscribe((shelfs: Shelf[]) => {
             shelfs.forEach(shelf => {
                this.shelfs.push(shelf);
              });
  });
}
onClickSubmit(){
  if(this.model.boxId==undefined)
  {
    this.model.boxId = '-1';
  }
  this.itemService.saveItem(this.model).subscribe(res => {
    this.message = "Save Successful";
    setTimeout(() => { this.message=undefined; }, 5000); return this.message;
    console.log(res);
  });
}

loadBoxes(shelfId: string){
  this.boxes = [];
  this.itemService.getBoxes(shelfId).subscribe((boxes: Box[]) => {
    boxes.forEach(box => {
       this.boxes.push(box);
     });
});
}

loadAllCategories() {
  this.itemService.getCategories().subscribe((cats: Category[]) => {
           cats.forEach(cat => {
              this.category.push(cat);
            });
});
}

saveItem(){
  shelfId: String;
  boxId:String;
  item: Item;
  //this.itemService.saveItem(shelfId, boxId, item).subscribe(() => {
    
//});
}
}


