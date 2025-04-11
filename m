Return-Path: <linux-rtc+bounces-3931-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F8A85D3B
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 14:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D224A8DA8
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 12:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1222F29C336;
	Fri, 11 Apr 2025 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RArPY3MD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6629C324
	for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375006; cv=none; b=rYCQRqjKuNMiXCPMTEqJ71yUDe/MVHFu4r7K5RwCM9SH3G7IimU8qZFBWHLeVPg91VXIxdmjWpEfd8jHuyv1uR4E981krLvBr69EUV6ABjURC15FMSC6Y9PjTOkz/J/uT39nfNff84KnW32CR6SvORah219+GEapA9NJJwGpbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375006; c=relaxed/simple;
	bh=vGUfgBYd/nqdiWhakMrxzcEEIqB0t/sqp/diq7LMGlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCA3RParGuVDy8W/+svjUIGsYloGCh6Fzz6iSbAdKZPfsnWKg8CEt6REB4dcGF/2BolfLdMOKAGQWRv6g0rlAwatplxcYe1TK2+xYmEAQWwtVvqvd7+adzV4ymr6L7OGp8gsaPhCirgFy/BydMtS26DDzHQ2nmAS3MFguhl0XT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RArPY3MD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso2302493b3a.2
        for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375003; x=1744979803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWvOtZ2Ij96tOi1o1hUr0b9qGVWu80vcBedKzsseg9k=;
        b=RArPY3MDH2P26+1MurZ2G5433n6JbjHnVEzDtnNEeQYlFFlPXzDtA4R4c70CY0+hGg
         3X01IAK5Y97ijCubaueulHJk1a1SyMIgniFtJMeWdXq4pKx+NPCnMjyh/y2Do0DfTbYt
         6iaPBvF3yU4KPk1Pq1WzbZANLd1DszyioRPVpEPD4a03aU4R61OLyGeitY876utK2F/o
         XsDTsucntkTkWcGbE4TbKBFBcOQDFX1584oT/Ebb6EkdfbeudlQePbvC/lU7SknTJXXq
         jbQbOsMG8+MHnhIs4TiUrxv2SP+pROB3C3usccOHUdvIQDsBTNak9IFfmLsBi+zqY3Su
         3yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375003; x=1744979803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWvOtZ2Ij96tOi1o1hUr0b9qGVWu80vcBedKzsseg9k=;
        b=cXGZrqumWyrgn9thObXsr7VQ5sgYZ+jmpjLP1BKK2qkZ5M2Lnbk56k+wb3aWq6RUU6
         plz+KCillwVmfBVZEOJrk7TsxZ2jQPkj4WvOeKoMoJ6a6v1ri/Bakp8Qg4tOqw4wm9dD
         EDMzDOfYeNoWCBsOfd9FZHQTmYFgY9Fp4pdaLn8bu2LnauEw8Bt2ywySL5hiGr/VR3X0
         9j0AHZrV6mnZCsKPjX2o39gRPiTuXGeTpriD7zHqdThA/8VhLSRiW1uu5lbb4+SljCMF
         IvWO5EMFGrd9JrdthhTXTAOd4NTsvo6BjBpukDNLxUgOLHQQEsMaxreza9SjhLhJH8JQ
         2kdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwC2Ah6Wknp20tFG7+kfI2FCwmTBD70z+Hu1MPPsUByR5WH2ZoOqiectPgxcK5buWuOwqa4ytN3cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUorN2tSUP2wkB84pMz6PQ5eSklO/V0DJcoTR1U8Y/iuAO34XJ
	y1zGGH677jJ/nEonxhUAH2p+T23d0bgm4m8tKuO47okHc/aBDeKVt7M+5geX90o=
X-Gm-Gg: ASbGnctp1V9SQc8PXXYz0YbQTr+pj5v/p4HxMVWUk1thIKwAYTrTo1iUHDqRn0+sGXX
	SBgqyugTRDovEAsOIuh8rev5OpUvWbXV04j7XY0glbwcYPIa9gpTwxdF5DbAAjmkyiphw3vseyX
	/MwVSjHgY90JOOQEIgKVzgURsMTI/e8zEevMZAMiduJjfqIaHnT4J7prUkafK52KSGUKGtD5/zB
	42dVpQOwNOgeUIKUOOQop/MEUuj9Ox2ryiyEApPXoZlQ8jIoQtkwTyZWQtDkVJL/r5fIllNIdeR
	7YZo1JpHAfNAaj6SndhMrEIimSi664N31tDnGZZ6NwU=
X-Google-Smtp-Source: AGHT+IHHr6PfcniD19K70c7n3k5QYjLiwj66+qa8B+xXfSPCuWN5/YZWkukIqVWOva+qdLyKiB11mg==
X-Received: by 2002:a05:6a00:3908:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73bd129c6d1mr3275598b3a.21.1744375003638;
        Fri, 11 Apr 2025 05:36:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:56 +0200
Subject: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding cast
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3840; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vGUfgBYd/nqdiWhakMrxzcEEIqB0t/sqp/diq7LMGlc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+G925gTSnI2f/g5RRp1mmiZxGxczjO4K3kNYm
 9g+lrSyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURcl9D/
 wP0ww2kkK7+Wdz6lCWG8tR0wOKrrvr2qjTu4xuKN9SRbZGSWhA9QmDb/dWzu4/0eAm8sl3qJMEk5Yk
 72cNB66JOZpwVfgY4Xp+ppUa5CNpHWBGe3QOQegRAvq9iSOBZ0Befi0rR5kfl788zp72w+3x1VXO7E
 R1BFLx8c2FhBePEp0TmhPL/thzoVTQhUv/11ONiQwlSewTu3UTlymMfTRZ8D6pSsM3pfNhSLzDLCh1
 yybqickSMBVYd4qqOnp08M4WsDnTHYsFYb51RyUczq3CSXrZ7Tw3/8rnGoaMFfRoe+9a2GaVNfcena
 LCt1tD6kBkx31OUdTCgi2xU4TbUkN0KBgcGLu8G6MH2r4Zj/Ul3Dd8BAHPtQdYc1qL86ylvzmkLCT+
 XZ04Bh+xraV8u4h7iUkZAoDEn12HInoSfG5xk2AIlsUP6jWf5w1VGcBHbwuBvVfUQr4IF3WsZNJb5p
 +iS8HHZgWKGNJaC7hsERyf63bEwLaYX/v9yCj9JsPBJ8kN+CnJ9QvKUqS39GqOS0fNyH34jfvnBUSv
 eX9nVxrWHyd4x5cifMm5s4lhMt2iZinXa7klv9V8rXsvW5aXOUmt9iBd0RF3YBmxDj+xcv5XUVKG6H
 MPHZrxIA9oPg2KHF1+4pye8NG1q1tx7stersv89cat7tXtLmaMbi2Fs7UNbQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The RTC subsystem was experiencing comparison issues between signed and
unsigned time values. When comparing time64_t variables (signed) with
potentially unsigned range values, incorrect results could occur leading
to runtime errors.

Adds explicit type casts to time64_t for critical RTC time comparisons
in both class.c and interface.c files. The changes ensure proper
handling of negative time values during range validation and offset
calculations, particularly when dealing with timestamps before 1970.

The previous implementation might incorrectly interpret negative values
as extremely large positive values, causing unexpected behavior in the
RTC hardware abstraction logic.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/class.c     | 6 +++---
 drivers/rtc/interface.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e9..1ee3f609f92ea 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 * then we can not expand the RTC range by adding or subtracting one
 	 * offset.
 	 */
-	if (rtc->range_min == rtc->range_max)
+	if (rtc->range_min == (time64_t)rtc->range_max)
 		return;
 
 	ret = device_property_read_u32(rtc->dev.parent, "start-year",
@@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	if (!rtc->set_start_time)
 		return;
 
-	range_secs = rtc->range_max - rtc->range_min + 1;
+	range_secs = (time64_t)rtc->range_max - rtc->range_min + 1;
 
 	/*
 	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
@@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 *
 	 * Otherwise the offset seconds should be 0.
 	 */
-	if (rtc->start_secs > rtc->range_max ||
+	if (rtc->start_secs > (time64_t)rtc->range_max ||
 	    rtc->start_secs + range_secs - 1 < rtc->range_min)
 		rtc->offset_secs = rtc->start_secs - rtc->range_min;
 	else if (rtc->start_secs > rtc->range_min)
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d7..93bdf06807f23 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -37,7 +37,7 @@ static void rtc_add_offset(struct rtc_device *rtc, struct rtc_time *tm)
 	 */
 	if ((rtc->start_secs > rtc->range_min && secs >= rtc->start_secs) ||
 	    (rtc->start_secs < rtc->range_min &&
-	     secs <= (rtc->start_secs + rtc->range_max - rtc->range_min)))
+	     secs <= (time64_t)(rtc->start_secs + rtc->range_max - rtc->range_min)))
 		return;
 
 	rtc_time64_to_tm(secs + rtc->offset_secs, tm);
@@ -58,7 +58,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
 	 * device. Otherwise we need to subtract the offset to make the time
 	 * values are valid for RTC hardware device.
 	 */
-	if (secs >= rtc->range_min && secs <= rtc->range_max)
+	if (secs >= rtc->range_min && secs <= (time64_t)rtc->range_max)
 		return;
 
 	rtc_time64_to_tm(secs - rtc->offset_secs, tm);
@@ -66,7 +66,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
 
 static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
 {
-	if (rtc->range_min != rtc->range_max) {
+	if (rtc->range_min != (time64_t)rtc->range_max) {
 		time64_t time = rtc_tm_to_time64(tm);
 		time64_t range_min = rtc->set_start_time ? rtc->start_secs :
 			rtc->range_min;
@@ -74,7 +74,7 @@ static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
 			(rtc->start_secs + rtc->range_max - rtc->range_min) :
 			rtc->range_max;
 
-		if (time < range_min || time > range_max)
+		if (time < range_min || time > (time64_t)range_max)
 			return -ERANGE;
 	}
 

-- 
2.25.1


