import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ProjectService {
  constructor(private readonly prismaService: PrismaService) {}

  async getById(projectId: number) {
    const project = await this.prismaService.project.findUnique({
      where: { id: projectId },
      include: {
        details: true,
        revenues: {
          include: { status: true },
          orderBy: { id: 'asc' },
        },
        costs: {
          include: { type: true, status: true },
          orderBy: { id: 'asc' },
        },
      },
    });

    if (!project) {
      throw new NotFoundException(`Project with ID ${projectId} not found`);
    }

    const cleanedProject = {
      ...project,

      details: project.details
        ? {
            id: project.details.id,
            currentStatus: project.details.currentStatus,
            doneThisPeriod: project.details.doneThisPeriod,
            plansNextPeriod: project.details.plansNextPeriod,
          }
        : null,

      revenues: project.revenues.map((r) => ({
        id: r.id,
        year: r.year,
        month: r.month,
        amount: r.amount,
        statusId: r.statusId,
      })),

      costs: project.costs.map((c) => ({
        id: c.id,
        year: c.year,
        month: c.month,
        amount: c.amount,
        typeId: c.typeId,
        statusId: c.statusId,
      })),
    };

    return cleanedProject;
  }

  async getAllForTable() {
  const results = await this.prismaService.$queryRaw<
    {
      id: number;
      segment: string;
      inn: string;
      organization_name: string;
      project_name: string;
      stage: string;
      implementation_year: number;
      service: string;
      manager: string;
      amount: number;
    }[]
  >`
    SELECT
      p.id,
      s.name AS segment,
      p.inn,
      p.organization_name,
      p.project_name,
      st.name AS stage,
      p.implementation_year,
      serv.name AS service,
      p.manager,
      COALESCE(r_sum.total_revenue, 0) - COALESCE(c_sum.total_cost, 0) AS amount
    FROM "Project" p
    LEFT JOIN "Segment" s ON p."segmentId" = s.id
    LEFT JOIN "Stage" st ON p."stageId" = st.id
    LEFT JOIN "Services" serv ON p."serviceId" = serv.id
    LEFT JOIN (
      SELECT "projectId", SUM(amount) AS total_revenue
      FROM "Revenue"
      GROUP BY "projectId"
    ) r_sum ON p.id = r_sum."projectId"
    LEFT JOIN (
      SELECT "projectId", SUM(amount) AS total_cost
      FROM "Cost"
      GROUP BY "projectId"
    ) c_sum ON p.id = c_sum."projectId"
    ORDER BY p.id;
  `;

  return results.map(r => ({
    id: r.id,
    segment: r.segment,
    INN: r.inn,
    organization: r.organization_name,
    project: r.project_name,
    stage: r.stage,
    implementationYear: r.implementation_year,
    service: r.service,
    manager: r.manager,
    amount: parseFloat(r.amount.toFixed(2)),
  }));
}
}
