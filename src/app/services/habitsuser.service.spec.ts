import { TestBed, inject } from '@angular/core/testing';

import { HabitsuserService } from './habitsuser.service';

describe('HabitsuserService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [HabitsuserService]
    });
  });

  it('should be created', inject([HabitsuserService], (service: HabitsuserService) => {
    expect(service).toBeTruthy();
  }));
});
