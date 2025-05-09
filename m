Return-Path: <linux-rtc+bounces-4081-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523BAB1C67
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 20:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73EF11C28474
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 18:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E3C23E33F;
	Fri,  9 May 2025 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL+4KNVr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0703647;
	Fri,  9 May 2025 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815910; cv=none; b=YWdKxXOt+jGjUi2hrmXlUY0E3IOGtkHQbt0NSB+8W9+Z8d6kjOqDZm4EIToj8i6fi00pAAWX0ZTX0ElYqJxUTI8Fdmq+KT4mZYe7bjdNU0X2jCnXLtYSZIwGphH2xrHIMcyfMcBn6ayOkZgz1vVk6h2K17jTtnw6D8gRXmnIuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815910; c=relaxed/simple;
	bh=T38POvXdmwP5IeF0I5QNBXmbnd6a1TH2LvmvvQGNew4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e2B3QYaX/jhiQCT784ppZovZ1WPagIiD0P2XKgTZCStml93KNHvi98AlRSj9J08EWCfiLFFISfv6Jh7lxNnFKxQzWodBnYb3g5SiZ9g+Ivw+/gF/JvGuECTYAG4o+QQUtkB9jE5EqfgMOcW2MBDMtbt+0X4KtmlYTs06fHfwUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL+4KNVr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso1462872f8f.0;
        Fri, 09 May 2025 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746815907; x=1747420707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3kRCscB1lWSNf3bzBV5o35758a8k7ZSMJBiYdyNer0=;
        b=lL+4KNVrvHUJH8axFVPVnhlqThTzZjMbiHonUhA1TmxNV+AtZik3/qst0q6d4q/KyV
         4IL5nTJaDyMTekX+oHRA2AJeAZB/bHVVRjrxGF32ztUkBlUT0zhw4/SDS0C+pxCYPe1x
         wx/pYz5aGsstx+he4BQOHPENxOvkbZE0mdOD1jAdUD4YhHtHo110j7stY7NyPoPMXBcE
         D1QpXdt2fH/eDmDSDTFmFBham5MpbGsWT3CDpJ0mJcGmQiCb4+JeR5RooyxW+0TPLW5i
         l6A17psfybEqQqpWwUSWEsD9IzpL6yYBjo8PVdzBQJa62tsk1ERH5agcZtb3tBCTx+H+
         Ge1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815907; x=1747420707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3kRCscB1lWSNf3bzBV5o35758a8k7ZSMJBiYdyNer0=;
        b=AcUIZ0JB+dw/wciXqbPYjAzBeCKU1M1TJpjz5Y4LkAFyx3GQ1YPpQbUOtzucprPESX
         oN9ZooOmtSO2w8h4AI9tyeRdUZhZth/D5rwxd/ee86RS/tK4xp2L/Z9RVTU+5v8XlKcF
         8hJaxURFyi1ZahVVHaRcqq0/AvPatdQjRov+zWcLAPKBeKCvUFNlVdv0SaAG00Kk96vJ
         8UR1TEvXR1sRq9KwFbODXxQ7nHUWR8y5aCGm7QoMGxP+MaPX8rPdUtvnMfDn2HKVSMZ4
         mbi80IG1VUejqkhmAs7fUBXh1Hnmkbp6wTK4BBYVSeP5OMJVnDuSjvy2cpFDWEpB8YNA
         kI8g==
X-Forwarded-Encrypted: i=1; AJvYcCVRqlUB6UK9jE3RFzgtlWRlAdx46pCfo+rP5WEhx73Fnkmb30F/1CFVrEmEsqWkJGy5QIAukTEV3hV8R559@vger.kernel.org, AJvYcCXGj581m2g9c4TWNTImpQJSlcABlsPRDAXzsRwxxE79vRdwZIgU18E8W4HSdkeYgu4ZPNYy8hHo0ZYj@vger.kernel.org
X-Gm-Message-State: AOJu0YwFjw/N4QS0xBsglHvCrjbyAQVc25w273hXH1Q7IKBEitKqzraa
	X/NFTePhaMYPtvLeaAKIheRGFp8Bb2apkFiyDACSg2+WNSMhbMGf
X-Gm-Gg: ASbGncsW33HWEqrQeNzSc/9v5WmHc9e+YybE4t+HVvu90ICFML8ST3LXlctxp1/G7nY
	/OgBRJtVELt7aZdhOCVjQVqDbPCjWIWgdZXazpDWQofYtQuFYJvxOCiL8bXHfll9RWoAOD3zzwN
	BIQK+uy3P9TfvQWvsEcdIZnAWWf4YNeRaADzBLtFrgQHvLXUVCpuPb+aqwOAqRSAqrohvH66dCg
	qYP4JY3Epas68gtRVF6cbMMAafCEA6n1xDbIf7p8DED4WU9m1y40Y4WZ2yKitPnuDV+nXEOEDHP
	C8GU78SOZY2pTlaOc69rL77OrqpRn8ryMQN43DqaT/OyFpgTt4+YEr09r/YkptfwAm3Lip7V4WT
	iiMpX
X-Google-Smtp-Source: AGHT+IEMrYhCvUL+ifZr1gX9sZG3l0AJSFqIhow5aL6C6aasvcsKdm1mIuMpwZ6f8XkHtHESIV9ltg==
X-Received: by 2002:a05:6000:2011:b0:3a0:b455:a1fd with SMTP id ffacd0b85a97d-3a1f643d7f2mr3775951f8f.32.1746815903039;
        Fri, 09 May 2025 11:38:23 -0700 (PDT)
Received: from localhost.localdomain ([78.210.112.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm3999878f8f.78.2025.05.09.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:38:22 -0700 (PDT)
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
Subject: [PATCH RESEND v4 1/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Date: Fri,  9 May 2025 20:37:48 +0200
Message-Id: <20250509183750.95836-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509183750.95836-1-apokusinski01@gmail.com>
References: <20250509183750.95836-1-apokusinski01@gmail.com>
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


