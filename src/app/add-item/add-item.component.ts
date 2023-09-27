import { Component, ViewChild } from '@angular/core';
import { ItemServiceService } from '../item-service.service';
import { HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { filter } from 'rxjs';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-add-item',
  templateUrl: './add-item.component.html',
  styleUrls: ['./add-item.component.css']
})
export class AddItemComponent {
  displayedColumns: string[] = ['itemName', 'boxName', 'shelfName', 'itemId','boxUrl', 'delete'];
  items!: Item[];
  dataSource = new MatTableDataSource(this.items);

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatTable) table: MatTable<Item>;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private itemService: ItemServiceService, private _router: Router) { }

  ngOnInit() {
    this.getItems();
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    
  }

  applyFilter(filterValueEvent: any) {

    var filterValue = filterValueEvent.target.value.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // MatTableDataSource defaults to lowercase matches
    console.log(filterValue);
    this.dataSource.filter = filterValue;
  }

   // datasource sort has to be updated with the 
   // template's sort.
   ngAfterViewInit() {
    //this.dataSource.sortData = this.sortData();
    
   }
   // custom sort function
   sortData() {
    let sortFunction = 
    (items: Item[], sort: MatSort): Item[] =>  {
      if (!sort.active || sort.direction === '') {
        return items;
      }
     return items.sort((a: Item, b: Item) => {
       let comparatorResult = 0;
       switch (sort.active) {
         case 'itemName':
          comparatorResult = a.itemName.localeCompare(b.itemName);
          break;
         default:
           comparatorResult = a.itemName.localeCompare(b.itemName);
           break;
       }
       return comparatorResult * (sort.direction == 'asc' ? 1 : -1);
      });
    };
    return sortFunction;
   }

  delete(itemId: any) {
    console.log("Delete "+itemId);
    this.itemService.deleteItem(itemId).subscribe((resultStr:any) => {
      console.log(resultStr);
      
      this.dataSource.data = this.dataSource.data.filter(element => element.itemId != itemId);
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
        item.boxUrl = (item.box) ? item.box.photoUrl : "";
        console.log(item.itemName + "");
        console.log((item.box) ? item.box.boxName : "No Box");
        console.log((item.shelf) ? item.shelf.shelfName : "No Shelf");
        this.items.push(item);
        this.dataSource.data.push(item);
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
  itemName: string;
  itemId: string;
  itemCategory: string;
  box?: Box;
  shelf?: Shelf | undefined;
  boxName: string | undefined;
  boxUrl?: string;
  shelfName: string | undefined;
  boxId?:string;
  shelfId?:string;
}

export class Box {
  boxName: string | undefined;
  boxId: string | undefined;
  photoUrl?: string;
}

export class Shelf {
  shelfName: string | undefined;
  shelfId: string | undefined;
}

export class Category {
  enumName: string = '';
  enumId: string = '';
}
