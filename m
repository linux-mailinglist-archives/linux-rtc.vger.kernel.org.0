Return-Path: <linux-rtc+bounces-3855-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708EA82D4E
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 19:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FA94656A8
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E03270ED9;
	Wed,  9 Apr 2025 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC7VN3bz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4F276032;
	Wed,  9 Apr 2025 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218595; cv=none; b=svr/dVjE7M07i+z7xiLRaS4L8ydGNS0JJ21t6AxMwZ9aRAB60IO1rlcpfRj0qVvOJzTtgITdDYg94LkXde9FPBQU1Nu+FY3c8TTShyOvnUt0T8twh25GDRYcutVhgmYu6kCNOB0gYrGxA5a3f1usDEF89C4UJYKFblR65B2hM3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218595; c=relaxed/simple;
	bh=nStIjfSZeL0zt9W7+iaa9CoiY9nOZsfvqJhLH6Sl5g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZM8NHJQs/74mtJmVFe3E0BtyTJFWwnnJCE7f6G76ynI1TH+SedGrXOistWtMIgl26ySiFKTYewn/7OwQNLFh5C2mYuw/hV+ODlE5SbpEmUp1uFm9LwR70iZmJaycKsyEE2snMKuJ7om6p/HesulBdJmWoBZCHKFdiYw8oURvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC7VN3bz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso1891287a12.1;
        Wed, 09 Apr 2025 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218592; x=1744823392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSPr9sZkytyi6HYm3brTb7NWt25n9J2i6nUGBqwMRe0=;
        b=NC7VN3bzwAwEuapSebs+vi8FU4As75Mzqlww2K6XFsUrUV9nwF0MRdPALpHvLudX1l
         uV1tE8w0UHgmWrarbY0yiBJDe5G52NpuRN8TkRCu+utak232l0pdlF6L7J7zwhT8lF/q
         /k2yipMfMSOUsmyOLXxiFdyj3qRY2mGAp5JEgd/jWx1uhyRsem7XOl4tprbR/QkO6AfS
         zA+Crs+LQCCRtYMUrnTTFmD6Vb9njcz84REBR4al7l0qM1hxkXvYrnpdqPqlSShbhxfV
         ooPI2k8HHUWYvFP0gn1JkzOFCp4r3FtFgSbuZUko0wN8es9nnxdjaxd5T6z2iuEfIohl
         gASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218592; x=1744823392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSPr9sZkytyi6HYm3brTb7NWt25n9J2i6nUGBqwMRe0=;
        b=c9RYmW32/Du1/6FgLE4Ce/7Zj0CJVq1443+0qHa34inFZzROv3vpzOhrxpc2vLAbpT
         c1WfE/5zTUX7Gc97IsrzugxR3taMFGSBy0K2OLlY6QRNUWFdELHRy7HRjGSUlCEO94/u
         uA32lvnbBNWiE5/mDIuiKYvVUxTEf/BZNLu/dnu37I+53h6Nj74f7jNKtQMTuVtP0Glb
         CFITfwt4hpBDSnpY8dzT6DNO4FqPO9K5i83d34BXnB5Elay0/j0Xzd7ftsIXbnVM2GtV
         //+aAnyD+m6QfTR4c1UZPcqNdAsE2awLWVF51QmvBjmJFD647YUQ1BM170eiGSDU4caf
         FGAA==
X-Forwarded-Encrypted: i=1; AJvYcCVvAU2i0ckr/qvtfG8s3BljnrVWXTcnN7KxegbQxeEtRBWnoBH9PucDXpVgXD2SrTk+uMxWUTfLXZPcPcAM@vger.kernel.org, AJvYcCXXKiA9FRkTekthQ6mmKGIZtEJ/NvGuUo7igH6YVDjvwwH0tsCNkMRY9zTzqMlIRkpMw1pIXWhggCCh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywywo2Pe9DnaWwl0z1j7QBHog+G8Ms1wEiqHlegbiYKdtJ2oGNh
	yozpBhGpUgyTlc4jOrxZbsEuZ0LrNWArZPIrRcTgSV74Y5jTcXPX
X-Gm-Gg: ASbGncv6PLmPV6p6zIkrVwKFPSr5jwaot99xo9pKUg21Ira1YwJYS4TncDLtralgMe/
	V2p/kRo2UAVirUs4m+MyaTrOL3EN4Mln9ZwGSKTWmBfnDJ8L3V2VnkXOCQo7fnL+m+plrJ4s7uH
	cVyegabXIqk7lEwDQiCTulEv8rnBw/355hxGjOyNm3ZiyGa+ERIw8ogWXRdgig5X7Bl6Sa4iBQn
	GngUl0Z5kKz9SMW5cdDlUdoE8nwG9kueKR0lOPxk3rTZKarcvY7f1TtUgy+hBrTmaa+enkgxKSK
	6Uca44IFvHIQow+Zi4x5XivZTrkSxdvvDEh8YR0Cwr4ozQJPYLFZS+iLxw==
X-Google-Smtp-Source: AGHT+IH+YqAH5P1C3rfvoj+3ijZp9a9WOznX8fS4UF+0NYL6MxuzKlq1D64zrOEIFuEz9UbRr2NnoQ==
X-Received: by 2002:a17:907:94d1:b0:ac3:ed4d:c9a1 with SMTP id a640c23a62f3a-acab6322c91mr30685866b.17.1744218591828;
        Wed, 09 Apr 2025 10:09:51 -0700 (PDT)
Received: from localhost.localdomain ([78.209.27.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm122151166b.47.2025.04.09.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:09:50 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexander.stein@ew.tq-group.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 3/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Date: Wed,  9 Apr 2025 19:09:16 +0200
Message-Id: <20250409170916.47224-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409170916.47224-1-apokusinski01@gmail.com>
References: <20250409170916.47224-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microcrystal RV8063 is a real-time clock module with SPI interface.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
index 2f892f8640d1..cb31c7619d66 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - microcrystal,rv8063
       - microcrystal,rv8263
       - nxp,pcf85063
       - nxp,pcf85063a
@@ -44,7 +45,12 @@ properties:
 
   wakeup-source: true
 
+  spi-cs-high: true
+
+  spi-3wire: true
+
 allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
   - $ref: rtc.yaml#
   - if:
       properties:
@@ -52,6 +58,7 @@ allOf:
           contains:
             enum:
               - microcrystal,rv8263
+              - microcrystal,rv8063
     then:
       properties:
         quartz-load-femtofarads: false
@@ -65,12 +72,23 @@ allOf:
       properties:
         quartz-load-femtofarads:
           const: 7000
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - microcrystal,rv8063
+    then:
+      properties:
+        spi-cs-high: false
+        spi-3wire: false
 
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -90,3 +108,16 @@ examples:
           };
         };
       };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+          compatible = "microcrystal,rv8063";
+          reg = <0>;
+          spi-cs-high;
+          spi-3wire;
+        };
+    };
-- 
2.25.1


