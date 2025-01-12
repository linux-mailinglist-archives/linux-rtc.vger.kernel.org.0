Return-Path: <linux-rtc+bounces-2884-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039BA0A9C5
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 14:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 175D27A306D
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 13:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0651BBBFE;
	Sun, 12 Jan 2025 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyScSc+q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173A1B6D1F;
	Sun, 12 Jan 2025 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689242; cv=none; b=oggwqnu6UPYe42HROa9dpkUNZORKDfSCTeoRUuwpWVMAgN6v7ZtoGGY6pDlGLdmIUnPhA8Dzi7NQvg9GZcSynDtx9PC/BI/1OTBhchRYCw5mtwzw3CNh8xuG8YAbAYjEP66XtloVsQECuGVeaj1RRxW66FR8Eh+U3dmryefIyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689242; c=relaxed/simple;
	bh=yIHB0gIMvdYSSOiBf0D5YdppwSlkv9r4zi3nhWmUffE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LSKu/I4qUaYpbjAKS4TEiLS673zuVQkqCHZjhjvL+KP5GfOEILHA8p4IkKbZRNN25f1S98QOgH4sRasSvZMbyyBjdgl3EMSgoO2eC62IYEhB3yXnuuXHRZ78/h4edwVfP5U6jppFMIUlJp+Azxjz+W9M8tfC0P2LyleAbMlTNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyScSc+q; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e3f291ad6so2229722a34.0;
        Sun, 12 Jan 2025 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689240; x=1737294040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOL07lOWY81zH31m+9h/IVYwwC86e9SDz5dm3zJfWBI=;
        b=DyScSc+qq4KkCWvu/oMaLQVv8x1yGffKnAO/s7jrKdop4S36l5a8Bx3Y+yxmju+J0k
         QGqga/dc8TLpjYr5LAzz8Y1YhE3oMjY+eoU+o9DE6RMvmHIPv4oDCR8+FrpatpvHyTaY
         mK7oNpjWvtE5vecNP+HMm+NrPNff0UcFFWVbjemZd9OMvVig7LJ2ZbSrwA0DbfN4tm24
         23w5jlNm4VUbQDPpGZQasAeYswL0f7y8ye7TJrWUwLCBwya9cD7SLyBHleof7ml8waGo
         tr8dJI0EvkKI0JG2Y+YKDmP1erL5/0G1feXOoGhkFURUtA49vQrx7dVz7N3b7a/1IEg1
         H1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689240; x=1737294040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOL07lOWY81zH31m+9h/IVYwwC86e9SDz5dm3zJfWBI=;
        b=OP5Tl4ILrmW6MbCrzMf3ISQXB0Y71uzwBcXn/ymn4uRSt/pCKFTGhzwauusnreoBgP
         obXZfgV4kCTJjmTeJckyesiXao54OcDnrmKUUe29fv7YYnl5W7jm8wnH5RSrCtWUBWBl
         51Tq6J9ySdL9U5vUQYDKN59J2fcBgZPwqMWzsOfJEZuntJWdsNadT2+ZIxGzxoEcrYwy
         8AbNX720D363HStJx9jr4qsB+J9WAsA6c1m9EYlOpPOfZ8H3Fh5Ao1Cm3hUOwLInNcdC
         QXagv6cOGhqrGOTAk2qEQxIph0hb5EIfvBaXPBvFOHZ5gGhjNLxxlNL3GqJKfda93Dln
         1XEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPM6CQv09WhSXZ3VZOizhRj1nOkVaS/o65EpkqmkPbIznMiDssLFhNyjeHC+IziCgQqoQwpwxZM/Oh@vger.kernel.org, AJvYcCVDCaLCuWkujFY0ZlC6c/VXNZT42ccvig2Od8xlvG4LAgn+pQ7q4FGNVnmU9wq46Ig/8nMqJ0j4Uxox@vger.kernel.org
X-Gm-Message-State: AOJu0YzymFRJCIpJp7lZk7P9t0TECqZ9/wozstuIXJT3KCkq7v+TJSBv
	yjxZhfIxLAeEm7KypqDTcX4JkK7M5vSpZ7aITzIgiub/ERHc4Vpd
X-Gm-Gg: ASbGnct4twuhBrHUwGSxc+jK3SfTk5uZALS+2DSZMSN30QxjYRn1eIhkc8Yi96Lc9Tu
	QuS3InX+GY2gdYrE0Fihw5GRYTGKzKkjB88GMEBYM4CjaLfnE7D/JSmBpe97KWEZ9EN8MOxJiVl
	kdZeHSyUqX4otFesxzmkEwV/FXaimh0In0yrgHlN92NoKx0qvKdVu9TU6Gw1SnxM6/9cz+rdFWW
	/QGxdKcewRzTk4cqIA1upRLnehXNMk8P353m6yhH5o7/HUBEnbG32T63k3Ba+eP2ymFEw==
X-Google-Smtp-Source: AGHT+IHXcD2TgkDMU+glU0K4QWgjgoX6hOscu9pJSkDTRFsGC5ER1GF1tOtVhll7wfsdIMLRnAr+dg==
X-Received: by 2002:a05:6830:26df:b0:723:2959:fe5 with SMTP id 46e09a7af769-72329591233mr3823450a34.4.1736689239765;
        Sun, 12 Jan 2025 05:40:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-723185382adsm2579832a34.15.2025.01.12.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:40:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: rtc: mxc: Document fsl,imx31-rtc
Date: Sun, 12 Jan 2025 10:40:27 -0300
Message-Id: <20250112134027.1013213-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx31.dtsi uses the following RTC compatible:

compatible = "fsl,imx31-rtc", "fsl,imx21-rtc";

Document 'fsl,imx31-rtc' to fix the following dt-schema warning:

'fsl,imx31-rtc' is not one of ['fsl,imx1-rtc', 'fsl,imx21-rtc']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/rtc/rtc-mxc.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
index a14b52178c4b..2599b847f406 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
@@ -14,9 +14,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx1-rtc
-      - fsl,imx21-rtc
+    oneOf:
+      - const: fsl,imx1-rtc
+      - const: fsl,imx21-rtc
+      - items:
+          - enum:
+              - fsl,imx31-rtc
+          - const: fsl,imx21-rtc
 
   reg:
     maxItems: 1
-- 
2.34.1


