-- ============================================================================
-- SMO Full System Seed Script
-- Purpose: Setup a complete working manufacturing workflow from scratch
-- Dependencies: Ensure you have dropped and recreated the 'smo' database first.
-- ============================================================================

SET FOREIGN_KEY_CHECKS = 0;

-- 1. SEED PRODUCTS
INSERT INTO product (product_id, name, category, status)
VALUES 
(501, 'Cotton Formal Shirt', 'Garments', 'ACTIVE'),
(502, 'Slim Fit Chinos', 'Garments', 'ACTIVE');

-- 2. SEED OPERATIONS
-- Defining a workflow for the Cotton Formal Shirt (Product 501)
INSERT INTO operation (operation_id, name, description, sequence, operation_type, stage_group, standard_time)
VALUES 
(1, 'Fabric Cutting', 'Main fabric cutting using laser cutter', 1, 'SEQUENTIAL', 1, 10),
(2, 'Front Panel Sewing', 'Sewing pockets and plackets', 2, 'PARALLEL_BRANCH', 2, 15),
(3, 'Back Panel Sewing', 'Sewing yokes and back pleats', 3, 'PARALLEL_BRANCH', 2, 12),
(4, 'Sleeve Preparation', 'Sewing cuffs and sleeve plackets', 4, 'PARALLEL_BRANCH', 2, 18),
(5, 'Main Assembly', 'Merging panels and attaching sleeves', 5, 'MERGE', 3, 25),
(6, 'Button Hole & Attaching', 'Creating button holes and attaching buttons', 6, 'SEQUENTIAL', 4, 10),
(7, 'Final Inspection', 'Quality check and trimming threads', 7, 'SEQUENTIAL', 5, 8),
(8, 'Ironing & Packaging', 'Final steam iron and box packaging', 8, 'SEQUENTIAL', 6, 12);

-- 3. SEED ROUTING (PROCESS PLAN)
-- Note: routing_id=3 is used in later test scripts
INSERT INTO routing (routing_id, product_id, version, status, approval_status, approved_by, approved_at)
VALUES 
(3, 501, 1, 'ACTIVE', 'APPROVED', 1003, NOW());

-- 4. SEED ROUTING STEPS (linking operations to routing)
INSERT INTO routingstep (routing_step_id, routing_id, operation_id, stage_group)
VALUES 
(1, 3, 1, 1),
(2, 3, 2, 2),
(3, 3, 3, 2),
(4, 3, 4, 2),
(5, 3, 5, 3),
(6, 3, 6, 4),
(7, 3, 7, 5),
(8, 3, 8, 6);

-- 5. SEED STYLE & VARIANTS
INSERT INTO style (style_id, style_no, concept, status, created_at)
VALUES (101, 'ST-2026-FML', 'Premium Formal', 'ACTIVE', NOW());

INSERT INTO style_variant (style_variant_id, style_id, size, sleeve_type, color, status)
VALUES 
(1001, 101, 'M', 'Full Sleeve', 'Sky Blue', 'ACTIVE'),
(1002, 101, 'L', 'Full Sleeve', 'Sky Blue', 'ACTIVE'),
(1003, 101, 'XL', 'Full Sleeve', 'Sky Blue', 'ACTIVE');

-- 6. SEED ORDERS
-- This matches your test_orders_seed.sql goals
INSERT INTO orders (order_id, order_number, product_id, routing_id, order_qty, expected_completion_date, customer_name, status, created_by, created_at, updated_at)
VALUES 
(1, 'ORD-2026-001', 501, 3, 500, '2026-05-15', 'ABC Garments Ltd', 'ACTIVE', 1003, NOW(), NOW()),
(2, 'ORD-2026-002', 501, 3, 300, '2026-05-20', 'XYZ Fashion House', 'ACTIVE', 1003, NOW(), NOW()),
(3, 'ORD-2026-003', 501, 3, 750, '2026-06-01', 'Global Retail Co', 'DRAFT', 1003, NOW(), NOW());

-- 7. SEED BINS (Work in Progress units)
-- We'll create some bins linked to the orders
INSERT INTO bin (bin_id, qr_code, style_id, style_variant_id, size, sleeve_type, qty, status, current_status, current_routing_id, order_id, created_at)
VALUES 
(1, 'QR-501-001', 101, 1001, 'M', 'Full Sleeve', 50, 'assigned', 'assigned', 3, 1, NOW()),
(2, 'QR-501-002', 101, 1002, 'L', 'Full Sleeve', 50, 'assigned', 'assigned', 3, 1, NOW()),
(3, 'QR-501-003', 101, 1001, 'M', 'Full Sleeve', 50, 'free', 'free', 3, 2, NOW());

SET FOREIGN_KEY_CHECKS = 1;

SELECT 'SMO System Seeded Successfully!' AS status;
