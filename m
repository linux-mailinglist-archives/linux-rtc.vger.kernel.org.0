Return-Path: <linux-rtc+bounces-3941-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC435A87210
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 15:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8FF618953DB
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9CF1AF0CE;
	Sun, 13 Apr 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa4AO+Gq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F071A0BE1;
	Sun, 13 Apr 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744549733; cv=none; b=YFxmC2X27odbE5kjgpLnE+l8Mcf3duDq7lwowPsnP/sRIRRYrBIqH2AGxMkSWiDbN73XGBgMqkUTqrgjCJ5Dd1E9aWW69qQH3cBeACKaohQTi8N5OZwL3AeS7VBvYXf+xe0VB9BAJYir2dvhOBRPur5x2FgJ5LKKBr0nyiBmavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744549733; c=relaxed/simple;
	bh=T38POvXdmwP5IeF0I5QNBXmbnd6a1TH2LvmvvQGNew4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fL74/sQb9N/8KgHt2MriFpdfceXnNSxHbiw2eIrvCeaFMU9j7BQeHCqgO75K8VVMs7rKx9cvp4i+q7iVnzkqLxMZGizGi97M9VTkdEFoI9j3PZvX1CjZwdlxRgYD6e1pCOUouWLxgWtM3Pndvb2qvGjkHZ7u4DB5AXsaBF3GK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa4AO+Gq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so30185845e9.1;
        Sun, 13 Apr 2025 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744549729; x=1745154529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3kRCscB1lWSNf3bzBV5o35758a8k7ZSMJBiYdyNer0=;
        b=Pa4AO+Gqb/qToNBVMpSGfCniIyqseCQFrTDUYadGtOKANqPXxZSR7TYkGA7I6hPW/Z
         V8nrOXpwi1RnQSKsL0i253LjkhdRsXQSGBzJFjaJ4xXl7QSDWNXkqGtLVHSDi+tShRk6
         FgQXUWgudZUL5Df9aIYSsLn6/WeSqxA6KvsJRpWg7JwK8jJSDAIqtqgog7oDVfs7jAWX
         FRVrkpTAYQSMd2h+GZqnJWKsYMMelNrX+9hoi1Grajbl79zEcYqxGsX5P2rddLHtpKCR
         dicBQxWWoDldBY09IiB6uZxue7C7Echqr4/HZqI21GcRBh1XWv733XUVi4sj8ANjRBlc
         Uudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744549729; x=1745154529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3kRCscB1lWSNf3bzBV5o35758a8k7ZSMJBiYdyNer0=;
        b=BME7A73oinj3HlnDL/cUZPIeqieFQx1kjyOw+upKO1VxpXq7oXEdkEW9gg4Ae+42vM
         /rYuFjKpBK/bmBY+y2LYY9l7gD4E3MVgeMpZs3O8uIoRflhA/wyspaviNVQTTQlrdf1I
         CysXLbIGFRUNCQSzKUTuoR5oS5wdJE0hbF1YqDQILA2fuFLVbDuy76RoZN9/vl0R3rn6
         Ob5S3IXTHU+Gdhk1k/6nkDJbwqSlH5kaC+Hb+XaKrKznLaR7eP+HJuznEqwzRUL6JtrB
         smvoKTJXbFMMshVmso0XTOTqZpeBO1/RpmMaJgOkLghAjJYg0YAT2YOcZHcsrD4XFdww
         qrFg==
X-Forwarded-Encrypted: i=1; AJvYcCUQn8AURkGWMcrXZaTps8RkkgoT4V3mlqnjDoQcUtRAIWo36vrhNU0wBMPdjijwEO3FnDQStMELU8YnOxWs@vger.kernel.org, AJvYcCWKmHkyetV89mke4DgAWPqu+5aE39nW/5lvtdwBft1ydVSI575te9imOgzR2PXNGvI/DZ7V51LURfJ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8G5nuAKrOlvRA6t3v8WaerieTN+/x7ENB/XrQv+WbJ5EFYX68
	eFFCZcrEGNqke4976MkEiJR9a5I+Q9T09VXDooY0NxC3p5h2Fgjd
X-Gm-Gg: ASbGncsT2CVHdLvPDdtTtvKc+eIp1MazURasYjBsgqh5r4ZoZS5Bmt3wara4l6qESzG
	LtzzcI2DJWDUG/T44Yui9mIUitnv/VISwNWOo0k6eb1HFfqCS70IjQyV5Y2PoUGqHIgP7RHVtYJ
	PqIzHDYTDhNZAt0Y0gOQEZujJAGL7ihovZ02Tj2kPk8eGcFEND5Kj9LRjjpw75Dlg6YEnNdUM5S
	MClyR7UWVpn5CmIzu0gfDqDnspk73oS+2gn87jcjPstvisnoelVt1BeCUkve09CdI15aZbOG87Y
	pDIEIA4RvflOCQ0kwDBsBBWtIHoRwfna0+kveYx+FhFzanXsVaj2Svc5wOs=
X-Google-Smtp-Source: AGHT+IF/ewu4pQcn9Epp6CQ8knMHrrSxEZAzKQB4awP9aQHKdd1ff3J29lN0KJzBoIpon+BDS2FewA==
X-Received: by 2002:a05:600c:1d84:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43f3a9aedc7mr93782735e9.30.1744549729294;
        Sun, 13 Apr 2025 06:08:49 -0700 (PDT)
Received: from localhost.localdomain ([37.161.110.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm7739348f8f.88.2025.04.13.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:08:48 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Date: Sun, 13 Apr 2025 15:07:53 +0200
Message-Id: <20250413130755.159373-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250413130755.159373-1-apokusinski01@gmail.com>
References: <20250413130755.159373-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microcrystal RV8063 is a real-time clock module with SPI interface.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
index 2f892f8640d1..1e6277e524c2 100644
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
@@ -44,13 +45,19 @@ properties:
 
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
         compatible:
           contains:
             enum:
+              - microcrystal,rv8063
               - microcrystal,rv8263
     then:
       properties:
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
+            compatible = "microcrystal,rv8063";
+            reg = <0>;
+            spi-cs-high;
+            spi-3wire;
+        };
+    };
-- 
2.25.1


