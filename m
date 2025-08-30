Return-Path: <linux-rtc+bounces-4790-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F6B3CAF9
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Aug 2025 15:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CECC582D0F
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Aug 2025 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC49F19DF9A;
	Sat, 30 Aug 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnIyg1L8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462072626
	for <linux-rtc@vger.kernel.org>; Sat, 30 Aug 2025 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756558836; cv=none; b=bur2WGkPt5Nw94FoybJwvp21k3iZCU7H4AwRc5AK0cj6TEBzYpZmRQBIZ4n15AInCHv1TCoyHG09GCgiijgAmqBhCCQT/J1RqpzuAbwewpMVj1GSMEI8hSqOOUpO6JFrVhcAALLzvd7FtYK8nvetNCX8Zwbb7C/TNfPyuDDBc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756558836; c=relaxed/simple;
	bh=DA4wgX3EYfgyQpikaGCN+15DTaZ1V7EHqQqn6vwCSL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXkM+nQ2+3zLBCDncP1qFSWoLbzaVQf7V4og8HT5xqySr4Uhee5+wbNvE0UKsx3Ojj01ysAoKf+R1VAAhJmE1dREHjIfP3i6Oxm2dhvnTUOt0AY2BnMnrjA8V2yYnXhoVA9XuFvLg8JxinBs8LcA7w49S/Bdltp7ImB2eid/KoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnIyg1L8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3cbb5e7f5aaso397434f8f.0
        for <linux-rtc@vger.kernel.org>; Sat, 30 Aug 2025 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558833; x=1757163633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfeLaGoTdP6BtGZILP4MDkJUxkRbtsAWUz1NmyjHx3s=;
        b=EnIyg1L8Pd+LsKB3O4E/CIn81jnfYb97xfE1bu1rKBQOyYKhA77ScL7+Da0Mi5L5Xk
         ccVcwt3zONB/ykwlmq6yW0Al8Lz7NWgSRIVraiGE4td8dKTbXfSSuCkT3ILLPFuzZduG
         PeAhk7/IG8ZynZE+zWeh3vK0TdufaOQsBny3DoKG7WZBZl2lChZTuOulZlrVjP34sEQX
         FEhu6NvH2+exFqnbnGAekEB7GGTDMn2dbPwLe3iMrMWMOCOsZvD9EBD6SYkUEcjeRk99
         QvBDzuwJ8hNOcNs/uQ2wgVATtPYGvoRmDg7nvrzeuUIX+AG5/8PkYrPrfA2a5EBfwi/4
         Z49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558833; x=1757163633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfeLaGoTdP6BtGZILP4MDkJUxkRbtsAWUz1NmyjHx3s=;
        b=P1sPNTO+IloyUUJAvT/S3a3zUu2K6HSdswPidKTJUTDBpz4fRG4+ta0blQbdNVeDWb
         ps6/K6s8MkqQHrR3GG463aj+4oGyW+M6Mwr4b7miN7+WW2WVji/c5GKH1HIm6H5rkKWi
         I/PzUli1qe+vkoMVf56X++x/96vlKGOH8wW10w/N/drhrLNMPc3nAdY+CNRKPfJtTrgP
         6yIbk4A6VHTZZgtx0i62dMCpIGqGvDRKcOxODIVnOM22PRPEKCnnZm3PFYRqHGqcFLbF
         4L7GRsfScw8/t7HiivXdvj7Gb3+5cunc72lBBVRJPreV3CWo/YSjex0q+Y1k4tzCtVvz
         lAag==
X-Forwarded-Encrypted: i=1; AJvYcCUpeot2NdQi235gzOZI5uGwcR0iz70cChjxAAARLBFVE2JX32x2hhmx+nFuxE7RxBHbvD1aDrfSBtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yH9oQtlhD09jPX2vPdEsKl8YjxDJ/I2WMuN17KyMFpy7ue0d
	E7aZmJ2P5Lw4WcWWf6DY2776S8nrNmmFuz0xDDbnhRABtMekqi4BBx9ZoH86D3fJH2I=
X-Gm-Gg: ASbGncuXonDQgwF6Z603HthNuFYQmgJBtpz1JhlRfgwgGaqA87sRffW/ZB7CSNUNpuE
	Oy7s6CtB/KRWuJCT1Srz/IXY/VRAIBb+Lfcga2jViyhBM4VuKtf5z6zdq1Q/4bRjg9QffToC754
	A4Th2DXjbzvBx7WLzsDsz4ZNVMuOkEWr9et+5Y3KZeCxiCBabJ+9FuWVJNxs94fmaoxTRpMTHdu
	IuNzqaeAdfKGR5KLNKlssKBgTkGzKyd3VncIXF89H6zEsTbw+Nuxvw4uIaji/rlnqFh28x5EZPx
	AEj5fNAKrrsx91i/VEMxMuNQQY6YiTncv3F4Y5TMwg2G4wYA9z8lAUHmDVkrjdQKL5fRUBWqmrS
	vBPonRzkouWCaYk+e3GPF25cjA7GROWM+XA==
X-Google-Smtp-Source: AGHT+IE5p98Ghu584MKvUJatgiilSAZu0f5rVgHs6pyZV2Dfwz2KFYkierPbjEVer9WHd3/Q/XjObg==
X-Received: by 2002:a05:6000:2dc7:b0:3c8:118:c1f9 with SMTP id ffacd0b85a97d-3d0f9f4dbb6mr1839559f8f.4.1756558832542;
        Sat, 30 Aug 2025 06:00:32 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34491a5asm7077534f8f.55.2025.08.30.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:00:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] rtc: s3c: Drop unused defines
Date: Sat, 30 Aug 2025 15:00:25 +0200
Message-ID: <20250830130024.142815-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=DA4wgX3EYfgyQpikaGCN+15DTaZ1V7EHqQqn6vwCSL8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvXoefRStvfAYbB9xsDKP5gkBK048JVecwDBE
 pLDkLbYqb+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL16AAKCRDBN2bmhouD
 18qoD/9asV10l6/Rkbsxq0X0h3QKfp4eLxqbyyZ6U2AltxF2gujn8dVZDbmAqWO4xaTiuU/lZDB
 Qivqu7F7QIqstSNc1tOdpai5g9BET8CPNF58J3dMPeFfrI48Lo4QtpSR2T31joNlldepX6pxt94
 RCxjugvRRv0wYqyP4VLRv6ot36nkkxge+lvMm/J4Ucuk6u05l1JEhpWJ0u8QyZ06MYrY8PJInwC
 HYV83dgo4YWhPy0b+QSKt5zoDSjRkyKm8QlOu3gotS0fouyoY1lH4zBo1AWmUp7Kt9Z9l7GMyOj
 74t50wwTdJa2Ig4cnDejK3bKUkYWVpk9sItOYReVwWrXZP60BoPdlPvzSlP+LANBauZjp9oFKVw
 BSweqKTIwA2SPkqRzQsTQsyIPWOUk2K/FMUQgfvjgvBfYLyzni9IKG6e+VmWiRhIb6626zJ+yqS
 tf3Oe5K9ZlonPpz2XJJGyvSfybcrkyT0vB/hkbRqQZMcEyLZNE+Ruao+mSvfd707z8WDDHbnFP7
 9JQizv7lyGPGOdp4Ew6zYHiORX/M+I/6DM7a8Qly1jCUCQOmYOMzpLUy/KFEXB5Fahw3VnzSNCu
 U+fvVMns97dvVzha1VW1txOm2RzXzD1M8sfLx5/olGigxnRybWb9MbhZJY2C/+/vxUxmLZaUKyZ so6yz3wSKMlG46A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Drop defines for S3C2416 and S3C2443 SoCs which are not used anywhere.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-s3c.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.h b/drivers/rtc/rtc-s3c.h
index 3552914aa611..44e9d6c9428f 100644
--- a/drivers/rtc/rtc-s3c.h
+++ b/drivers/rtc/rtc-s3c.h
@@ -24,22 +24,6 @@
 #define S3C2410_TICNT		S3C2410_RTCREG(0x44)
 #define S3C2410_TICNT_ENABLE	(1 << 7)
 
-/* S3C2443: tick count is 15 bit wide
- * TICNT[6:0] contains upper 7 bits
- * TICNT1[7:0] contains lower 8 bits
- */
-#define S3C2443_TICNT_PART(x)	((x & 0x7f00) >> 8)
-#define S3C2443_TICNT1		S3C2410_RTCREG(0x4C)
-#define S3C2443_TICNT1_PART(x)	(x & 0xff)
-
-/* S3C2416: tick count is 32 bit wide
- * TICNT[6:0] contains bits [14:8]
- * TICNT1[7:0] contains lower 8 bits
- * TICNT2[16:0] contains upper 17 bits
- */
-#define S3C2416_TICNT2		S3C2410_RTCREG(0x48)
-#define S3C2416_TICNT2_PART(x)	((x & 0xffff8000) >> 15)
-
 #define S3C2410_RTCALM		S3C2410_RTCREG(0x50)
 #define S3C2410_RTCALM_ALMEN	(1 << 6)
 #define S3C2410_RTCALM_YEAREN	(1 << 5)
-- 
2.48.1


