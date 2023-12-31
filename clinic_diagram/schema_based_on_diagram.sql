-- Create the "clinic" schema
CREATE SCHEMA clinic;

SET search_path TO clinic;

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(50) NOT NULL
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(10, 2) NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);


CREATE INDEX idx_medical_histories_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);

-- Create the join table to manage the many-to-many relationship
CREATE TABLE clinic.medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INT REFERENCES clinic.medical_histories(id),
    treatment_id INT REFERENCES clinic.treatments(id)
);

-- Create indexes for the foreign keys
CREATE INDEX idx_medical_history_treatments_medical_history_id ON clinic.medical_history_treatments(medical_history_id);
CREATE INDEX idx_medical_history_treatments_treatment_id ON clinic.medical_history_treatments(treatment_id);
