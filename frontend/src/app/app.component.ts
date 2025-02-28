import { Component } from '@angular/core';
import { TrafficComponent } from './components/traffic/traffic.component'; // Corrige le chemin ici

@Component({
  selector: 'app-root',
  standalone: true,
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  imports: [TrafficComponent], // Ajoute TrafficComponent ici
})
export class AppComponent {
  title = 'Mon Application Angular';
}
