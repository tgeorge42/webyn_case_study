import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TrafficService {
  private apiUrl = 'http://localhost:8000/api/traffic';

  constructor(private http: HttpClient) {}

  getTraffic(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }
}
