import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TrafficService } from '../../services/traffic.service';

@Component({
  selector: 'app-traffic',
  standalone: true,
  templateUrl: './traffic.component.html',
  styleUrls: ['./traffic.component.css'],
  imports: [CommonModule]
})

export class TrafficComponent implements OnInit {
  trafficData: any[] = [];

  constructor(private trafficService: TrafficService) {}

  ngOnInit(): void {
    this.trafficService.getTraffic().subscribe(
      (data) => {
        this.trafficData = data;
      },
      (error) => {
        console.error('Erreur lors de la récupération du trafic :', error);
      }
    );
  }
}
