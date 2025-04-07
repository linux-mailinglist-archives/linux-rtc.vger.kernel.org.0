Return-Path: <linux-rtc+bounces-3822-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52627A7ED89
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 21:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D011E7A46D1
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 19:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E2D21C19D;
	Mon,  7 Apr 2025 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TisXWwTs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A309215F43;
	Mon,  7 Apr 2025 19:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054587; cv=none; b=lshggLO6MWFctSD4vqmZSvDU9LCkULD5Qq/t3/BKYZzH5gZlmceYJuaQXsblfRXdzxXJQlsM+zsCiI84N0rk4jjWbFKBE79DU7eMo1tdo91aA2Yf/10a3MMAkWu6FA7WQpmib3HHXvTzNATTbu/6kgxaAAd1xF4Jg7/PKEv4gMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054587; c=relaxed/simple;
	bh=nStIjfSZeL0zt9W7+iaa9CoiY9nOZsfvqJhLH6Sl5g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pj+Y8ibsWZzO/4CePW1kFlgGiCIA5jezrzwPsZLcWVGgB05z8A3PxRN9ufrTieevevWgMfasgbkpn4pXQpB6OVjDrwqXb79s4O59tdA7aUiu7bqJz36kbFiElSXu8PASnflWiFWKx0OJvls9h7UnlJgwvF2uld5DVYKlpANSYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TisXWwTs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2729569f8f.1;
        Mon, 07 Apr 2025 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054584; x=1744659384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSPr9sZkytyi6HYm3brTb7NWt25n9J2i6nUGBqwMRe0=;
        b=TisXWwTsZER2+t3Fz0C3+MLh6b0gjcyVu1u/96LycHVavndkl9CLh+HLt4XrnCBpb1
         NCTQnl9dBQGKM2y++PR6Oeu1rBuxzYaGwwkekD6YohdzLg5LUjjzFNTy51tTz2DC1kBs
         7WV+8FkDv6zs7AUr7UDHy+9LSbX0ZIck0CfbCf1U7PhXvlwdi/FRFoqCeT1vAvCnxWew
         b3qxD1GwL0pYMQ+kQRm9Ijy3I8B04+P8JrPcmeMnR4u7FjGesBMXpWdebilxd1JUuDLa
         aaJbZFU5txVy5TBZj7AIwxE57QCM3mc9KvAEnolXo6GzOwEwVaFidSgpWRwd/Sl32nHm
         r2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054584; x=1744659384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSPr9sZkytyi6HYm3brTb7NWt25n9J2i6nUGBqwMRe0=;
        b=hcM+P1woM9hXC4BVcwe72owRwooIdrRWE0uN3AGoAr95WeVTA8btWNCJbHiZacEjpC
         IDr7QZIRHbREXtektv2HT8kX7hjYwmQYGD6lPAx/n5W3kj/TEn6tm6WGFEDzoGcTA7yb
         nH12xyKhc2hLsabrFsvSvpIUjwGEagkCAD0m6XOodIruq5t4r3uJ9YGsHRj+mvtPMX04
         aIJSpmqtm5sfDvqb8FWDktg2Oy6ffbRW149NQUnsOWi/Z3qbcKwT46qmPOGp11nr3QRs
         Z5kLnIaUmeYch5tr8Tj+rDCnfmgqds1MVneBme12SCgkaAarUubDtfW4oTjeOtpGsenS
         HQVA==
X-Forwarded-Encrypted: i=1; AJvYcCVTchuXNhmCl7ROzwWNPYGTVX+K/03aY/XihvR0Fc3JZ9u6jNjvjZRe6U9n+cUx0rvMzz2BEVhvBF209INT@vger.kernel.org, AJvYcCXOFnnsGJmp9E0DV0REhj7HWU+GqsshBrhdNyagJ1PGiAtx/9igyUiz1ajDInAbXoag2YRq0MlPb3PP@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXFqg8EqBtfmqTCT4qmKnPxV4v5CaFwERYOoi669BrTQNV1/P
	MQq+AFoNcvvQmmZT/9omlhgsNQi/UmJVSnLRgGnNKDDl2B9h9+Ef
X-Gm-Gg: ASbGncvStiRLRYeLVf9QXbw0gdZyfczOEqJw0CrqWtlCjOewkPdkWzCH0ffz7L5Geo+
	93mM0zTHZTWxP+NfdM0o+1VUN4uCvGMHvGVw6LFSKgHJPVPXBRXy2s+s8Uoa9H586jXXeuIZM0i
	0jmFkx93eKWaRo+UwhY8lrWPhHFfYjbhhnr4iic2PF2u8+kGCrKxNGM+z7zKr8K0IQ5qlNX8mmL
	Fj7YnoWNOzfd8izSB6NawE+tekOGo4N/78OroZexA4a17Nwt0F4XIMV0cx0zMrTsDrP+KlhWDah
	BeXIiPzHDtC1dBdCwEITe7U+k0UTYAiPRhgRBp7czelb45b3A86eakjPSh4sWD4=
X-Google-Smtp-Source: AGHT+IEUiomeOiUOHrr0DKhbBbz9XR6SWezAxykM7N11ouMT90URl7Xtcfm6e8GrZrN3ZF04M6mwbg==
X-Received: by 2002:a5d:584f:0:b0:391:65c:1b05 with SMTP id ffacd0b85a97d-39d820b0af5mr646908f8f.11.1744054584329;
        Mon, 07 Apr 2025 12:36:24 -0700 (PDT)
Received: from localhost.localdomain ([37.162.191.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d62fsm13122812f8f.79.2025.04.07.12.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:36:24 -0700 (PDT)
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
Subject: [PATCH 3/3] dt-bindings: rtc: add binding for RV8063
Date: Mon,  7 Apr 2025 21:35:21 +0200
Message-Id: <20250407193521.634807-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407193521.634807-1-apokusinski01@gmail.com>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
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


