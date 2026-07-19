import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/home/data/datasources/pools_data_source.dart';
import 'package:co_buy/features/home/data/dtos/pool_category_dto.dart';
import 'package:co_buy/features/home/data/dtos/pool_dto.dart';
import 'package:co_buy/features/home/data/repositories/pools_repository_impl.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPoolsDataSource extends Mock implements PoolsDataSource {}

void main() {
  late MockPoolsDataSource remote;
  late PoolsRepositoryImpl repo;

  const poolDto = PoolDto(
    id: 'p1',
    name: 'Bazaar Arrangement',
    description: null,
    leader: PoolLeaderDto(
      id: 'u1',
      firstName: 'Mary',
      lastName: 'Supreme',
      email: 'okon@yopmail.com',
    ),
    category: PoolCategoryDto(
      id: 'c1',
      name: 'Fundraising',
      description: 'Fundraising — medical bills',
      isActive: true,
    ),
    targetAmount: 10000,
    amountRaised: 5000,
    amountPerSlot: 5000,
    maxMembers: 2,
    splitEven: true,
    beneficiaryAccountName: 'KINGSLEY NWABUEZE UGWUTA',
    beneficiaryBankName: 'Stanbic IBTC Bank Ltd.',
    shareLink: 'https://example.com/join/t1',
    deadlineAt: '2026-07-19T15:45:00.000Z',
    status: 'OPEN',
    slotsRemaining: 1,
  );

  setUp(() {
    remote = MockPoolsDataSource();
    repo = PoolsRepositoryImpl(remote);
  });

  test('getPools maps the response into pool entities', () async {
    when(() => remote.getPools(status: any(named: 'status'))).thenAnswer(
      (_) async => const PoolsResponseDto(
        success: true,
        data: [poolDto],
        message: 'Pools retrieved successfully',
      ),
    );

    final result = await repo.getPools();

    result.fold((f) => fail('expected Right, got $f'), (pools) {
      expect(pools, hasLength(1));
      final pool = pools.first;
      expect(pool.id, 'p1');
      expect(pool.status, PoolStatus.open);
      expect(pool.deadlineAt, DateTime.parse('2026-07-19T15:45:00.000Z'));
      expect(pool.filledSlots, 1);
      expect(pool.category?.name, 'Fundraising');
      expect(pool.targetAmount, 10000);
      expect(pool.amountRaised, 5000);
      expect(pool.amountPerSlot, 5000);
      expect(pool.progress, 0.5);
      expect(pool.leaderDisplayName, 'Mary S.');
      expect(pool.beneficiaryDisplayName, 'Kingsley Nwabueze Ugwuta');
    });
    // "All" sends no status query param.
    verify(() => remote.getPools(status: null)).called(1);
  });

  test('getPools translates the filled filter to the CLOSED wire status, and a '
      'CLOSED pool back to filled', () async {
    when(() => remote.getPools(status: any(named: 'status'))).thenAnswer(
      (_) async => PoolsResponseDto(
        success: true,
        data: [PoolDto.fromJson(poolDto.toJson()..['status'] = 'CLOSED')],
      ),
    );

    final result = await repo.getPools(status: PoolStatus.filled);

    result.fold(
      (f) => fail('expected Right, got $f'),
      (pools) => expect(pools.first.status, PoolStatus.filled),
    );
    verify(() => remote.getPools(status: 'CLOSED')).called(1);
  });

  test('getPools maps an unrecognised status to open and falls back to the '
      'beneficiary name when the leader is not expanded', () async {
    when(() => remote.getPools(status: any(named: 'status'))).thenAnswer(
      (_) async => const PoolsResponseDto(
        success: true,
        data: [
          PoolDto(
            id: 'p2',
            name: 'Birthday Contribution',
            targetAmount: 20000,
            amountRaised: 20,
            // splitEven false: the server reports no fixed slot price.
            amountPerSlot: 0,
            maxMembers: 10,
            splitEven: false,
            beneficiaryAccountName: 'Michael Chisom Ozor',
            beneficiaryBankName: 'OPAY 3',
            shareLink: 'https://example.com/join/t2',
            deadlineAt: '2026-08-19T12:36:06.652Z',
            status: 'SOMETHING_NEW',
            slotsRemaining: 9,
          ),
        ],
      ),
    );

    final result = await repo.getPools();

    result.fold((f) => fail('expected Right, got $f'), (pools) {
      final pool = pools.first;
      expect(pool.status, PoolStatus.open);
      expect(pool.leaderDisplayName, 'Michael Chisom Ozor');
    });
  });

  test('getPools maps a network DioException to a Failure', () async {
    final opts = RequestOptions(path: '/pools');
    when(() => remote.getPools(status: any(named: 'status'))).thenThrow(
      DioException(
        requestOptions: opts,
        type: DioExceptionType.connectionTimeout,
      ),
    );

    final result = await repo.getPools();

    expect(result.isLeft(), true);
    result.fold((f) => expect(f, isA<Failure>()), (_) => fail('expected Left'));
  });
}
