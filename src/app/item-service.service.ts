import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, retry, throwError } from 'rxjs';
import { Box, Category, Item, Shelf } from './add-item/add-item.component';

@Injectable({
  providedIn: 'root'
})
export class ItemServiceService {
  
  baseurl = 'http://192.168.0.102:8080/itemorganizer';
  defBaseurl = 'http://192.168.0.102:8080';
  constructor(private http: HttpClient) {}
  // Http Headers
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  headerStr  = new HttpHeaders({
    'Content-Type': 'text',
  });
    
  getItems(): Observable<Item[]> {
    return this.http.get<Item[]>(this.baseurl + '/getAllItems/').pipe(retry(1), catchError(this.errorHandl));
  }

  getShelfs(): Observable<Shelf[]> {
    return this.http.get<Shelf[]>(this.defBaseurl + '/getAllShelfs/').pipe(retry(1), catchError(this.errorHandl));
  }

  getBoxes(shelfId: string): Observable<Box[]> {
    return this.http.get<Box[]>(this.baseurl + '/getAllBoxesForShelf/'+shelfId).pipe(retry(1), catchError(this.errorHandl));
  }

  getCategories(): Observable<string[]> {
    return this.http.get<string[]>(this.baseurl + '/category/').pipe(retry(1), catchError(this.errorHandl));
  }

  saveItem(model: Item) {
    return this.http.post(this.baseurl + '/addItem/'+model.shelfId+'/'+model.boxId+'/', model).pipe(retry(1), catchError(this.errorHandl));
  }

  deleteItem(itemId:any): Observable<Item> {
    return this.http.get<Item>(this.defBaseurl+'/deleteItem/'+itemId, {headers :this.headerStr}).pipe(catchError(this.errorHandl));
  }

  errorHandl(error:any) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Get client-side error
      errorMessage = error.error.message;
    } else {
      // Get server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.log(errorMessage);
    return throwError(() => {
      return errorMessage;
    });
  }
}
