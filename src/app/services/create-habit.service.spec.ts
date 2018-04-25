import { TestBed, inject } from '@angular/core/testing';

import { CreateHabitService } from './create-habit.service';

describe('CreateHabitService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CreateHabitService]
    });
  });

  it('should be created', inject([CreateHabitService], (service: CreateHabitService) => {
    expect(service).toBeTruthy();
  }));
});
