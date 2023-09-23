import { Component, ViewChild } from '@angular/core';
import { ItemServiceService } from '../item-service.service';
import { HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
import { MatTable } from '@angular/material/table';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-item',
  templateUrl: './add-item.component.html',
  styleUrls: ['./add-item.component.css']
})
export class AddItemComponent {
  displayedColumns: string[] = ['itemName', 'boxName', 'shelfName', 'itemId', 'delete'];
  dataSource: Item[] = [
    { itemName: '1', boxName: 'Hydrogen', shelfName: '1.0079', itemId: 'H', itemCategory: '', box: undefined, shelf: undefined },
    { itemName: '2', boxName: '3', shelfName: '4', itemId: '5', itemCategory: '', box: undefined, shelf: undefined }];
  items!: Item[];
  @ViewChild(MatTable) table: MatTable<Item> | undefined;


  constructor(private itemService: ItemServiceService, private _router: Router) { }

  ngOnInit() {
    this.getItems();
  }

  delete(itemId: any) {
    console.log("Delete "+itemId);
    this.itemService.deleteItem(itemId).subscribe((resultStr:any) => {
      console.log(resultStr);
      
      this.items = this.items.filter(element => element.itemId != itemId);
      this.table?.renderRows();
      });
  }
  getItems() {
    this.items = [];
    this.itemService.getItems().subscribe((items: Item[]) => {

      items.forEach(item => {
        item.boxName = (item.box) ? item.box.boxName : "No Box";
        item.shelfName = (item.shelf) ? item.shelf.shelfName : "No Shelf";
        item.itemCategory = item.itemCategory;
        console.log(item.itemName + "");
        console.log((item.box) ? item.box.boxName : "No Box");
        console.log((item.shelf) ? item.shelf.shelfName : "No Shelf");
        this.items.push(item);
        this.dataSource.push(item);
      });
      console.log(this.items);
      this.table?.renderRows();
    });
  }

  openCreateItemComponent(){
    this._router.navigate
  }
}

export class Item {
  itemName: string | undefined;
  itemId: string | undefined;
  itemCategory: string | undefined;
  box?: Box | undefined;
  shelf?: Shelf | undefined;
  boxName: string | undefined;
  shelfName: string | undefined;
  boxId?:string;
  shelfId?:string;
}

export class Box {
  boxName: string | undefined;
  boxId: string | undefined;
  photoUrl: string | undefined;
}

export class Shelf {
  shelfName: string | undefined;
  shelfId: string | undefined;
}

export class Category {
  enumName: string | undefined;
  enumId: string | undefined;
}


export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  { position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H' },
  { position: 2, name: 'Helium', weight: 4.0026, symbol: 'He' },
  { position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li' },
  { position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be' },
  { position: 5, name: 'Boron', weight: 10.811, symbol: 'B' },
  { position: 6, name: 'Carbon', weight: 12.0107, symbol: 'C' },
  { position: 7, name: 'Nitrogen', weight: 14.0067, symbol: 'N' },
  { position: 8, name: 'Oxygen', weight: 15.9994, symbol: 'O' },
  { position: 9, name: 'Fluorine', weight: 18.9984, symbol: 'F' },
  { position: 10, name: 'Neon', weight: 20.1797, symbol: 'Ne' },
];



