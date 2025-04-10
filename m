Return-Path: <linux-rtc+bounces-3916-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD65A84E19
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1243A7AC9AF
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1327B290BB8;
	Thu, 10 Apr 2025 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHPWI8O2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A528FFD6;
	Thu, 10 Apr 2025 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316620; cv=none; b=YbOlQtVkf2tvttR86qxycKoaYR6ySKPcLCu3ReyROtXekav5YrSmNNS9gxunqa/X1SP8YNsVslMxZsHmvz8BWNduiSWifEaCwAZFZwZnu/SWpGvgvSdR3hQOjry6EdkbNZa2jBbQTHyxW5Hkb3K85yr7p+g1vQO3TJIfNAzVOj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316620; c=relaxed/simple;
	bh=EFcvE9OnnqxAq31Z+Vbsja4i2NAYZxzu4waUY0tYvPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dc5+Es+xh4yW+adjdjN8fgRE2K8JhCtP9rUIChmUD9B7qQ2ttdYGqr10ASnVKLhzKZOV9vEfyZmOyvanHYmmtc/Wjd45V0HxZdbXSkunnJQC5PBdyAakX9zfyoqH7wKvGugCBz2OKO0pJglGUQgAPLEh2c4x2zRUNm8DbkihJUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHPWI8O2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9643065e9.1;
        Thu, 10 Apr 2025 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744316616; x=1744921416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVkZqr5sfAAS0KFulfZirHfw18lNq9awB17Z0Rl5Qrc=;
        b=bHPWI8O2k1RgmLbWw9dhqkGZm0X/uGP/FvFHTKLZCpY5RnTBPJ1AVWjISp0cxDTKXD
         iZkg6m5oxn+RxE1FBZVB/RWnkY6xi+gwwiewl/37So04fkyAkKiui+Jqdn67XK2cmDlB
         0Y3xOmBeZhegDtq8IOo2/k6SUb+ZvJNVJUdD7XJGYH8F9PmhEMJN1f+Kvo6bPBtX6+gw
         NYZU0edxRj448GP3HJ4hLjj/8UWv+eWfrTUp/1KniO78cefyaKI6qRmLNj8AxhzLQzwq
         CNGfV+7yS6yrh+PNdJuOfJSLmrhbRzUOTUriEF0oNJf85iYYtDT17ww5NxmizhaCec9F
         QIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316616; x=1744921416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVkZqr5sfAAS0KFulfZirHfw18lNq9awB17Z0Rl5Qrc=;
        b=rIb9L8EzDfJLk2mCqjvZ96T8wWFqY/c26JRh2wwW19kpTM5ypTZztPO41u/hbAXUX1
         ebmBTbZfp+Vx3rEoKykDjjkkUiyqcBet2a4MYn1CCWbuDmzVpMBG2a2TQ8QLo5au9dn9
         E9Wy8UK9BCEACmSmAxcnNXhCnb5KRrHk0QEwSW99ioh+Xd8KLLfeLSEjd+GwDDeESyk6
         z3xjY6JHD+uvNMrYiuIiPTR7+SfWlbAJoJhW1z6ZMh4mii5NFCDz46yG0Jt630buRq4h
         GxaMmqRVXj1wdB82yFpKz37Y6mLMsVJzj63ON3c4BRS658n5EklCtIBl2P1JdLYFkRkv
         4dMA==
X-Forwarded-Encrypted: i=1; AJvYcCUwhf8f/2uUEj1KHQN/Kz2gAAGLnitmiFwvyoQd2PAXinpbWR98h8N64Pir6lSE65XUa6Prq1nx+bqz@vger.kernel.org, AJvYcCXSyO2ff+zGttHKPIMECvmOfcILaCbJj3F33L4Jzt6JEMWnBjk3o0r9D3CLnvLkQs1hnTNPgLE3VZHng282@vger.kernel.org
X-Gm-Message-State: AOJu0YwxMOl8F7pLQQLNeNYKT377JeD6qk/dpFMxahMPE/xa05XaaRXz
	6lblv1vYCRusPfXafVNsI9K6j6m7usUY1oDbCf12CbhvwxFze7bP
X-Gm-Gg: ASbGncvwkADjRaDprzS7m4wMZ7GmjIsDaTK1uMVm6V95fZJjD8IxqBWvQDHs5mCIROJ
	oKsm0gzlt+3tGbJmhL373NIeyWFaGHZWWMw0u0juwzfIyzQP5YceQNQnykUZ9XQgidyqp4lwi7e
	T8azC9L4JMkM6PWfi5/2M7GdaQj29ZaWcOYay286G10Dgp/nR64FLUFY1xRAmf1r4zbMF3P8dZD
	8fQmQ51y/0z0S+A+Ujav6LhUQXu8TG5mKDBUtS6QTQhU1rdrt83czbZW/Yq+ItX0rq7jkpxvKNo
	ztpgtKWW/gBCx4K7s/a5GhsTLFk5Gomypvoiba4JpFMY1VbDJKfT4IVB5Q==
X-Google-Smtp-Source: AGHT+IHABr63CqW3iOsNq+ClUsuI/qOHF/xCXmWEb443YmrfuT5UCxJw5AfiAVj/FQ3biykFVi6H9w==
X-Received: by 2002:a05:600c:34c1:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43f2d7cea60mr49467175e9.17.1744316616496;
        Thu, 10 Apr 2025 13:23:36 -0700 (PDT)
Received: from localhost.localdomain ([78.211.153.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm60998745e9.23.2025.04.10.13.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:23:35 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Date: Thu, 10 Apr 2025 22:23:15 +0200
Message-Id: <20250410202317.25873-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410202317.25873-1-apokusinski01@gmail.com>
References: <20250410202317.25873-1-apokusinski01@gmail.com>
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
index 2f892f8640d1..86ac9c626144 100644
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
+          compatible = "microcrystal,rv8063";
+          reg = <0>;
+          spi-cs-high;
+          spi-3wire;
+        };
+      };
-- 
2.25.1


