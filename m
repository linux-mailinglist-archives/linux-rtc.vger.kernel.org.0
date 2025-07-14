Return-Path: <linux-rtc+bounces-4508-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB39B0499B
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 23:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F7A4A5C49
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 21:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005CD269CE8;
	Mon, 14 Jul 2025 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="aoRmbDEq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B0B24729F;
	Mon, 14 Jul 2025 21:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529186; cv=none; b=MGLXpais1oeseINSnGQey4y9Xyx5AuDTynRzO24TJ9/TMHeNXoss/9huvR57+uxYQPHlb0nOA3B5NPbHn2LZXbP6werUyQYuGHFmZs7Qz3IRx59ZwEfrxmm9cYcSUxwTjElPs1TMg4vfbirDo6F+NTVttFMvuHNbpGpxKqO+MJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529186; c=relaxed/simple;
	bh=+79Edwp/qYLvCGVhl6Z3Em+GmrxKyS+U+fc1Np6rWIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cNuuLZj+l3/fVLvpL5U7gMtKJcLunEvs1+3fWEJmSbJ1t/E5nOP9ciIx4n0n5ycf8cDR/8RiFEhozw94OuBx0ssxfG16evflO9tbYP7tv1fkds9hvwaI6sw4SmcjFhDenMsAJwp6SSncb2wKslQWAIALk6qZ0A9wRylYPUI/QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=aoRmbDEq; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 184BB201656A; Mon, 14 Jul 2025 14:39:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 184BB201656A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752529185;
	bh=cgM3cNFp900zGPUD8KYNP/L/K+MPUgDC4h8lo07VzRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aoRmbDEqQeLiKW5RVvFLYJoqDr9AZWsfvxAOFI6dbiSQjGoKmVj4/73rPlJVup76I
	 le6nAJR+WGELysG7CJhghPe/LTmLFTgNO0iXZmvXEXIbNRAbF51tR1pavD6JzrSLW4
	 AYjAYGiofVbyK2DHUE4gcSvS9ipEktm81Qqv0jq0=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	code@tyhicks.com,
	giometti@enneenne.com,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: [PATCH RESEND 1/2] rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
Date: Mon, 14 Jul 2025 14:39:36 -0700
Message-Id: <1752529177-8154-2-git-send-email-meaganlloyd@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1752529177-8154-1-git-send-email-meaganlloyd@linux.microsoft.com>
References: <1752529177-8154-1-git-send-email-meaganlloyd@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

In using CONFIG_RTC_HCTOSYS, rtc_hctosys() will sync the RTC time to the
kernel time as long as rtc_read_time() succeeds. In some power loss
situations, our supercapacitor-backed DS1342 RTC comes up with either an
unpredictable future time or the default 01/01/00 from the datasheet.
The oscillator stop flag (OSF) is set in these scenarios due to the
power loss and can be used to determine the validity of the RTC data.

Some chip types in the ds1307 driver already have OSF handling to
determine whether .read_time provides valid RTC data or returns -EINVAL.

This change removes the clear of the OSF in .probe as the OSF needs to
be preserved to expand the OSF handling to the ds1341 chip type (note
that DS1341 and DS1342 share a datasheet).

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Tyler Hicks <code@tyhicks.com>
---
Compile tested on rtc-next. Tested on an older kernel with ds1342 which
has the same datasheet as ds1341.
---
 drivers/rtc/rtc-ds1307.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5efbe69bf5ca8..65beb7067e3f5 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1813,10 +1813,8 @@ static int ds1307_probe(struct i2c_client *client)
 		regmap_write(ds1307->regmap, DS1337_REG_CONTROL,
 			     regs[0]);
 
-		/* oscillator fault?  clear flag, and warn */
+		/* oscillator fault? warn */
 		if (regs[1] & DS1337_BIT_OSF) {
-			regmap_write(ds1307->regmap, DS1337_REG_STATUS,
-				     regs[1] & ~DS1337_BIT_OSF);
 			dev_warn(ds1307->dev, "SET TIME!\n");
 		}
 		break;
-- 
2.49.0


