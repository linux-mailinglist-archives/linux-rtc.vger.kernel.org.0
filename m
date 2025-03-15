Return-Path: <linux-rtc+bounces-3503-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0BA62CD2
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 13:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F45E3BD2A2
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 12:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADB11F790C;
	Sat, 15 Mar 2025 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhrUoOTb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FAC2E3377;
	Sat, 15 Mar 2025 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742042518; cv=none; b=XDnTKyoA/9feIymbDsDT9LGBKcMkwF2q7zxtlOiiLjYuwHcDQFenkqET6AvTDcPo2zKarOlmjzATAevC6sbctvp8m1j/MthDEkvsHtj8nzXnElVL8lCJm9Wftp6jBbcHth+L+ojZtnaPGVo5vWUbwvw2VwxsFQJcr84n4TpbmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742042518; c=relaxed/simple;
	bh=hurrHjnbGa8xSDif3oGaIIuRGx/S1rYY++3bgFtIcZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ue12CGVmXZfVuG5jDYykNB+wwx6kacDNlywmIE2voh2BLpZLQYEbmoYHhFzj4EBN2Z3RjZvyVOE52NhxeNqQ4UGEGNs8ELA01bQ1zNidthnR+92CddaxKwFGE1ZVi/wnVUoUgTQ7iPEwgzKWjBzUow1kL4o2QMHmF87eYEiEEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhrUoOTb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso56467235ad.2;
        Sat, 15 Mar 2025 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742042516; x=1742647316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ytGRlh8QsWpqMcQNWNHoiiZH1jiFNrnhidLGJ3qeWE=;
        b=RhrUoOTbFpxbvKwmvmMgVtIWn3VW3DN8buFOFdx9N9RVS12wNT5ion4gI7rOWUbcLe
         bzADrBDCq44HyxYyEJHbUtYkPVxpsnkedThnSL2uTw+ERaSIqM0g08XVApewZ64R+TYB
         2Nu/1aJsGxKU8Oln8m7L0u/16CHT01pkXIL62Q9YXk6oTNMtG19Gmwz+EmerXaAE9Z7l
         fZW31AjoliOZgRV8UVjDsmwMjIK4WZc9aqw1z+K77A5elKnqb1VSvEHKN/Yj38k08OMA
         Hwwzhm4gxJ3F0ECfmCmRpHxTKnnUr1DhCRNbVez58vv+XMCiaTNbiRwLEAu/ETEOFQi8
         y6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742042516; x=1742647316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ytGRlh8QsWpqMcQNWNHoiiZH1jiFNrnhidLGJ3qeWE=;
        b=Ic6zJBoYNwOko24vXpwm6LcWNUKdB4781+mektVk6dTPf4LwA2ZGBlztN+oPtu+Dt0
         z6Gp7cCY4K3PwiuE4aAde0zhSjDj2EX1PLxF+meP2/7l5DKdYtq0QBQEWaOImCRkwKjt
         LwciHJJWvxzs4zCvHR61K2T9pIO32TMPL2qZRVHRC/cbf7ApG1JWMZ5kN+CZxP4l4ejx
         8Ug2kxLrL82tIjZoWYa+oe72cNd1gIKmiKov00qWKshSbZlm3qd2972EgX0cLxuBDBXk
         haJNkPjoqPI2kvcIPklazjwU4OA9rrtRXzSiTcyCIBVZFHdUrI4XchsujPNfoCO/KX3f
         27/g==
X-Forwarded-Encrypted: i=1; AJvYcCV3zU8jD/ueOLpmmcqd4/s5OdhCihQXamsy6GfIUaoSKz53uQs37xIMekkcfq5fpqI/gGeYwoz4oWyQ@vger.kernel.org, AJvYcCV5eRkXgvhAzz2OoxmbZ+vhIShrtweiIY9Hwdn1cugrWVfoD/yrYIU+GplWIf9Ouy7l+wCf9rWJAfdu@vger.kernel.org
X-Gm-Message-State: AOJu0YxsF2fjjA4PMJzji27cg4+2wPr0+jdcw1f5a03JS/Gz8WB0XG2S
	QJqyuX2n0ky3LNLGyyZXYf63I88J4jFHokyLLgHsDpTwUIZb7a2t
X-Gm-Gg: ASbGncuJswe9ybXhQgi0mgVRnluM/SG9M4iFEyxAGGRn66Sd9B+qQFHdcZmbH/Ir/GT
	lmQGZsq+k6F2LNSbyvGl7Thw6aN544/u7qu5uRQP2+YssYe2Pg8sZZ+h3kNEsXFBrYTS2q33Szq
	JFgnxDYGwfNCsP9M9EanZHJzWF/TGGeQs42G7NGKheaBM4LEqxGlJYLojmCAMicXMlI0z+PGZIA
	iw5q6C/27UtMZ/t+k52bw3Mxxkta6k+MxVT3apc/9vULMXgdOeduqe/pE8nc9dns2H5Xqil4ukT
	3pKA7GBUI9ykTFAyDwHeGCw5uBIDNSa+BBARtEujRAsguqzG8hYtzre1PHQ=
X-Google-Smtp-Source: AGHT+IF+3kRKLT103j+mqMX1msg2HlX1nxAEer+j+xpXKZibf+l9A8k9V85xmOvqNwaWxgMQiHceDA==
X-Received: by 2002:a17:902:e844:b0:220:c813:dfd1 with SMTP id d9443c01a7336-225e0aeea45mr67401095ad.36.1742042516362;
        Sat, 15 Mar 2025 05:41:56 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bb6a:1a3e:36e4:cce7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5a61sm43609515ad.250.2025.03.15.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 05:41:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: rtc: pcf2127: Reference spi-peripheral-props.yaml
Date: Sat, 15 Mar 2025 09:41:50 -0300
Message-Id: <20250315124150.1853699-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Currently, when the 'spi-max-frequency' property is passed, the following
dt-schema warning is seen:

'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'

Fix it by adding a reference to spi-peripheral-props.yaml and change
it to use 'unevaluatedProperties: false'.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


