import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TrafficService } from '../../services/traffic.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-traffic',
  standalone: true,
  templateUrl: './traffic.component.html',
  styleUrls: ['./traffic.component.css'],
  imports: [CommonModule, FormsModule]
})
export class TrafficComponent implements OnInit {
  trafficData: any[] = [];
  trafficThreshold: number = 0;

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

  get filteredTrafficData() {
    return this.trafficData.filter(item => item.traffic > this.trafficThreshold);
  }
}
