import { TestBed, inject } from '@angular/core/testing';

import { DatataskService } from './datatask.service';

describe('DatataskService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [DatataskService]
    });
  });

  it('should be created', inject([DatataskService], (service: DatataskService) => {
    expect(service).toBeTruthy();
  }));
});
