-- AlterTable
ALTER TABLE "patients" ALTER COLUMN "insurance" DROP NOT NULL,
ALTER COLUMN "medical_history" DROP NOT NULL,
ALTER COLUMN "allergies" DROP NOT NULL,
ALTER COLUMN "medications" DROP NOT NULL;

-- CreateTable
CREATE TABLE "professionals" (
    "id_professionals" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professionals_pkey" PRIMARY KEY ("id_professionals")
);

-- CreateTable
CREATE TABLE "psychological_records" (
    "id_psychological_records" TEXT NOT NULL,
    "date_consultation" TIMESTAMP(3) NOT NULL,
    "notes" TEXT NOT NULL,
    "diagnosis" TEXT NOT NULL,
    "treatment" TEXT NOT NULL,
    "progress" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "professionals_id" TEXT NOT NULL,
    "patients_id" TEXT NOT NULL,

    CONSTRAINT "psychological_records_pkey" PRIMARY KEY ("id_psychological_records")
);

-- CreateTable
CREATE TABLE "appointments" (
    "id_appointments" TEXT NOT NULL,
    "appointment_type" TIMESTAMP(3) NOT NULL,
    "date_appointment" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "patients_id" TEXT NOT NULL,
    "professionals_id" TEXT NOT NULL,

    CONSTRAINT "appointments_pkey" PRIMARY KEY ("id_appointments")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id_notifications" TEXT NOT NULL,
    "notification_type" TEXT NOT NULL,
    "sent_date_time" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "appointments_id" TEXT NOT NULL,

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id_notifications")
);

-- AddForeignKey
ALTER TABLE "psychological_records" ADD CONSTRAINT "psychological_records_patients_id_fkey" FOREIGN KEY ("patients_id") REFERENCES "patients"("id_patients") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "psychological_records" ADD CONSTRAINT "psychological_records_professionals_id_fkey" FOREIGN KEY ("professionals_id") REFERENCES "professionals"("id_professionals") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointments" ADD CONSTRAINT "appointments_patients_id_fkey" FOREIGN KEY ("patients_id") REFERENCES "patients"("id_patients") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointments" ADD CONSTRAINT "appointments_professionals_id_fkey" FOREIGN KEY ("professionals_id") REFERENCES "professionals"("id_professionals") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_appointments_id_fkey" FOREIGN KEY ("appointments_id") REFERENCES "appointments"("id_appointments") ON DELETE RESTRICT ON UPDATE CASCADE;
