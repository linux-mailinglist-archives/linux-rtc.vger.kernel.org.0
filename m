Return-Path: <linux-rtc+bounces-3525-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F049A64DDF
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 13:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56C918867FB
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AE322CBC9;
	Mon, 17 Mar 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gu4pFRjU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F819F133;
	Mon, 17 Mar 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213048; cv=none; b=E0u3lZfZGzsWsSJW/ypxcoQ+WQyOFV8fjEiKEnjM+0iE70ClKfwmA/8pRqdSTJ96Ok4bB6CVipC7r4Mhp5NjgYOl44k6fNNXx1P7/FWS6wYGmgMSMchi8Y0htQoofT2ifG/nixl3SLycUBIA22kjH+ukjHi9VVOZdD2IhtGdsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213048; c=relaxed/simple;
	bh=TczCRjc6Uj1fEIzA9Lzwz33dfKc+k7PWQRZSluuHEbY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d5TcZNqy++26PQ7aV24xa4JCf5ZvafAqGvgU/Nr/jSuhTlHsqvOhCNWGGEGy2W6PbnB7zpM06fcNlhZB4bPDsYyUi+hmUiwdaHu1NcF0m+zT6cmKJIodDnwY9Bh7DGDt5JeR+vLavgq+YXtX25OJOQwie7gCvKQr0K4zc0w0/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gu4pFRjU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a7065ff8so34745085ad.0;
        Mon, 17 Mar 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742213046; x=1742817846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9GmxhiqxKY3sOaDVbVY6MR+fSgsfX8u6hP/uX2i46Q=;
        b=Gu4pFRjUV2F5fkIQznq/SCed+wABtgN0gyf8IlN+hxc7kmeJEjRKpKjFRVBAtMtv/c
         YlDymRaQLW0RSI43GU1XTQpOEI1w/IS4tSwkuj6SOb5QIXrXdzHvuhbNlhlwNDk+K8Cv
         Ea9fbCFccLcoTdy+E3MtV4XlhB4faeJRiqkFhaGGBKFi/EedEIBFo1Fux6/WSf10uEuw
         Fk6STdjxv092h8MFcJJfycXc/ZErzqFpto4X/XZE5Tw5IQHhC0qi+gZzcgRxdvqX6SmB
         LKlep8BYF+fPX3icRlFybdrRdAsC+Y3IP2zLms9LSqxG8OzzoQ2tNTKquzHBbKiDnPEO
         hx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213046; x=1742817846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GmxhiqxKY3sOaDVbVY6MR+fSgsfX8u6hP/uX2i46Q=;
        b=gNdPXMC9cqiVveDlCPxBoWUixGOKGAhhzwRgBdGvYigXWpGPUI5abqXe99z5z4NkSK
         TAJ4o96fyVjW6bvbgHr6Ra5n6mB06ja++uJfOt6ufUPAs1kQ/eZd2jihOHz/f/lScA+p
         gApcwOZu/UPc2B0KjZJWBYOiXmknKhCH713X8/fl0Wol3BBkuT6T8K6FynvAGJxOv4lY
         /S6GK3u/cn1UaogNyMlkOKgQrz1Gbs+s8YZCjs9GmER6URI5lnMO8uice2mjrpXQfoCQ
         9ttMCggEs3rfBL9YabM7C2Ac1syFRvS3tcZocaq13513S0nHgCEwXxRo2z37zWDnlKKM
         KWiw==
X-Forwarded-Encrypted: i=1; AJvYcCWbYwmd+hIOZOZHvPQ2vPBjoHS7eKQs0V7oIl9Fo2lm4BnNp9yrGEmxxC9HgzxmKNq637eaHli0uVAK@vger.kernel.org, AJvYcCXFArzV0+KfXJtFHngUWi5Q/d0pLD+VFOjIXyojOK0qKwLV0ToRxyZzVNniS+r21BHkC1cH8WZL+mqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwDF1a3/tRmvjcFOypBPxJ67dxT7eT0sEd2Pdxy8UBqIPwBlTqH
	VoNg2dOuBKU0XgGwuw6ih6b+ObfG4GL8gDT6qB6BPtoWiDGPbVpjhWTbEQ==
X-Gm-Gg: ASbGncuJPy1pU7lImtI56WIaKtfLIlFHWab/b5gjLwRr/kfgtSLTiDDnzm95ZTepcKz
	OnL/oikSbEps0VPPYiNlFVZWWNA3FFdkMzbkJAr1cnKKFj5inKFXn0pddoM1411/TMFqflr0vwc
	+Xfjgpzxj12xZgI8da4C8xm4iPQAiCBscN9i/5KwM8yu4QbUCuitM1buzketIZzAvLw0n+YkvuO
	6yBZeGDVbywQiaUzyyzkzBnpaJ3W7q3jYnUoj+6lOZMIKVpqls0SniX/Ji6jzhKL9nXZe/jymYY
	hDnlQiCPfhmw1s6FgRMbcz0T8FhiQ14C+EreZQmo3SNHjR2d3P2Cp7jhpXM=
X-Google-Smtp-Source: AGHT+IHuV8yhToMYcmgerfmBiSVZJgN8pw64y82WSSMxLHL9nPNqcWOz6YNuNc2lqk+LSuPKbgxZVA==
X-Received: by 2002:a05:6a21:328e:b0:1f5:769a:a4c3 with SMTP id adf61e73a8af0-1f5c12c78f7mr14509366637.27.1742213046220;
        Mon, 17 Mar 2025 05:04:06 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:93b8:613c:dd7d:1b25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152931bsm7377389b3a.3.2025.03.17.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:04:05 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] dt-bindings: rtc: pcf2127: Reference spi-peripheral-props.yaml
Date: Mon, 17 Mar 2025 09:03:56 -0300
Message-Id: <20250317120356.2195670-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

PCF2127 is an SPI device, thus its binding should reference
spi-peripheral-props.yaml.

Add a reference to spi-peripheral-props.yaml to fix the following
dt-schema warning:

imx7d-flex-concentrator.dtb: rtc@0: 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Specify that the dt-schema error comes from imx7d-flex-concentrator.dtb.
- Write a more concise commit log.

 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 2d9fe5a75b06..11fcf0ca1ae0 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -8,6 +8,7 @@ title: NXP PCF2127 Real Time Clock
 
 allOf:
   - $ref: rtc.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
@@ -34,7 +35,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


