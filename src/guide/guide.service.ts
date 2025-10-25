import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class GuideService {
  constructor(private readonly prismaService: PrismaService) {}

  async getAllReferences() {
    const [
      services,
      typeServices,
      paymentTypes,
      segments,
      indicators,
      typeExpenses,
      expenses,
      stages,
      probabilities,
      statusRevenues,
      statusExpenses,
    ] = await Promise.all([
      this.prismaService.services.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.typeService.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.paymentType.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.segment.findMany({ select: { id: true, name: true } }),
      this.prismaService.indicator.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.typeExpenses.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.expenses.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.stage.findMany({ select: { id: true, name: true } }),
      this.prismaService.probability.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.statusRevenue.findMany({
        select: { id: true, name: true },
      }),
      this.prismaService.statusExpenses.findMany({
        select: { id: true, name: true },
      }),
    ]);

    return {
      Services: services.map((item) => ({ value: item.id, label: item.name })),
      TypeService: typeServices.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      PaymentType: paymentTypes.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      Segment: segments.map((item) => ({ value: item.id, label: item.name })),
      Indicator: indicators.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      TypeExpenses: typeExpenses.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      Expenses: expenses.map((item) => ({ value: item.id, label: item.name })),
      Stage: stages.map((item) => ({ value: item.id, label: item.name })),
      Probability: probabilities.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      StatusRevenue: statusRevenues.map((item) => ({
        value: item.id,
        label: item.name,
      })),
      StatusExpenses: statusExpenses.map((item) => ({
        value: item.id,
        label: item.name,
      })),
    };
  }
}
