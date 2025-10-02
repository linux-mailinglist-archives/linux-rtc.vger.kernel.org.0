Return-Path: <linux-rtc+bounces-5039-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9ABB36EF
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 11:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25EE719C05A5
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 09:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B676430103B;
	Thu,  2 Oct 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QADZ54w+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5803009FC
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396807; cv=none; b=c/7yt78FjR8YS7ak4gHrTQlAUWkzVX0tm4xPC8FLaxFr7WbeDY/8QcwR9SCNQKvJWxGD968KAEBIIm4tADUkxTIIheWPJc5ePHY5CLzr8PCaPBmxJ/gHU8EY27uQBID2i7h72ouwgfr0J5rjPm68tDdbk5c9lKECeRKLCk+G20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396807; c=relaxed/simple;
	bh=vRt0dtCsdz8vwlJe3xmSExt4YZA46Y5SdTypQbnPYRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSxCkWnR+Ku9xUcDbQz6+DEMeGR3uNNZmoF7R5B96jK4h1dHAVRHmisPmzAoXTTCPHd9Q+HOI3DGiUtXJOlO6jYhtXCLwq3FSD6pGIrucF56/NPBzsQWaDpQp10i/ZoOQgiX/3sfBL0ajPfTfY7RLOLlO4JfIKmzZdq6FHeTvSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QADZ54w+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a604fecb4so958159e87.1
        for <linux-rtc@vger.kernel.org>; Thu, 02 Oct 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759396804; x=1760001604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNpNdQn+Mvusm2MT0LBZ46u1KJvuulNytepH41XAksw=;
        b=QADZ54w+r1e5wGmE2Gt5uFJV0UgWLb/7FxX4NkNUDteSEpwyI06gRhwClpCaX8Ry26
         v8l2dl8NSjMnjLn+Wse4BAdrOBPSKgZJY94coTJ0YvKtarWm5YF3Kbdp9QHgm8wCBUpz
         j3dpKYkkc9GTD64rBh8qliKMhGFiaelSzQBipvmW69kwp/L5x29JaYqeoVzj8HfZ49OC
         CABT3bAOfSkyrZrnsDS5DHaDvmGsA8v029I5pQuEW4bzKs8K25kxzq8zwKJjHkF7Zxku
         NotUP7Qq69eIdRfKchOPfKBVM/vFtX4ptp9tw5ZI8IzjY6SPxyuuctF4rISnrxQ0Z5hz
         vYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396804; x=1760001604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNpNdQn+Mvusm2MT0LBZ46u1KJvuulNytepH41XAksw=;
        b=pvveqzq/1chviHd+plwJRIwfoDDgRgCx3SjNQWuAkTWvwF0ZeFAuW7qrh9YJuQPTvQ
         WPQQ4557uj6pWzshuzW0UMQTmZkfjoG51nHUIv3EZ9fHUyHXL75rsVy/em7N2gKzsV2n
         iLtxPIYzTwRBAnn2kpmhJ2GgLZYMMbG62u8W7fFUzOoSshvrtX7Blax7fz5PBC2zTqY3
         9QuCPMz3NtiA5k9Vj+OZ31imKRnBf6EN1GxoqGVfIF0A7W9gR926skyszisvHheOPE3p
         cWx198Vg/NGK0ytmELV0ArVXpa+kymIWIxnr6g5qlRZj9v1FfwJqt0SgUeEOoQQxBt45
         UdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcc3GyX0Jwco7nzALRxhniP+fegX2yR/A/+uJWQQ8sqalzpvEhl/sHKym7N7MQ+OnKHgeaKWD3WGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywle1oO9f1aSZhi7/i7nNPd1e3UyMTrWKPB2d/l+hVsrPSlKCVk
	IOpNUvBW8LwCihtnHWioyiaiE2RdK2JxbeP3eannGU/6z0H829942+Wn
X-Gm-Gg: ASbGncvynoAMpdxwvqGA3J9T4PTRmYVT72iT1orldfdZgLrsKLnLQCnNJawM9REeKvd
	6K/wKp4SMzTHLvE8x3YYss9dNNYK8YltjMlQBd18OdQnD1oLOecfYOZ7Nai4YqtC2geAbi7PX2G
	ony5QDnNSkQTcQ1rHat6IjQ/HiYOwsjW9D9xImnV3ze59yoc/pzBxS2qSEsS9d7cEXzqB3oCCO6
	NcE86lW9nDdQ/vXBsrcggcCv9WVYMiBTo7NHdnQJz7CmE42+l391O5I21GCVffmYLQ9yNPwewF5
	RBGyR9KrP/hCAyYKRGDOvDHIy4TxMoZ/lBYb19jFlddF8Z9JKn+tBn91OetoAxUqzdp4VE82UOA
	UueLRQ/mVH2LPDU0Hu0F02zLbN3yPpAgjIK9BkfFsOxtJQsoRfNju6+0BpckISvRuUHQE79+iod
	EaBzBnV/SH1hN/WBhDzKNGNrPqKdRSbY77IrGX8viz
X-Google-Smtp-Source: AGHT+IFUIDciA5xZKbT9troHSKjJ/3ia1HG2h024hlGxFpBUK6g1cjjH2CDCxiHjTRESwliPBFXExw==
X-Received: by 2002:a05:6512:691:b0:57f:492:3263 with SMTP id 2adb3069b0e04-58af9efda86mr1777775e87.1.1759396804139;
        Thu, 02 Oct 2025 02:20:04 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01136e83sm668382e87.41.2025.10.02.02.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:03 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: fix error return in pm80x_rtc_set_time()
Date: Thu,  2 Oct 2025 12:19:59 +0300
Message-ID: <20251002092001.20-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

The regmap_raw_write() function may return an error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/rtc/rtc-88pm80x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index f40cc06b0979..71d4cc7e595c 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -136,9 +136,7 @@ static int pm80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[1] = (base >> 8) & 0xFF;
 	buf[2] = (base >> 16) & 0xFF;
 	buf[3] = (base >> 24) & 0xFF;
-	regmap_raw_write(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
-
-	return 0;
+	return regmap_raw_write(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
 }
 
 static int pm80x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-- 
2.43.0


