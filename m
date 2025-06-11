Return-Path: <linux-rtc+bounces-4285-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2BDAD5DEF
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 20:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C2C83A6D62
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C3E280CC8;
	Wed, 11 Jun 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="r0fbLwIO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1027D25E45A;
	Wed, 11 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665664; cv=none; b=Ty/TDpv21DJBss1Fhqg43lZR+f4h8aEugfwlQ/tereXJQsmxMlYlsLlyeBmP2kQTBinGKl4tQf7j6Z4E5Oh8KnlSdjHtudgTw+snjueHR0n5vvYFD45jHxr9BIPhrk2YVC1IyzxmEQbyj0CnFPfK6tz/zoiCDkQO8I0vQ0ADF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665664; c=relaxed/simple;
	bh=39OSO62+KgDDFi5a/EtOCYMaxrBeNZ4EMYx2dpC73Ik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SzgdzITSviGWd/7p3zx44nTc0NnCwNgeB9hrOIH0WabLlqWFMgtpknKROLElMIjg5gbfSzWEo31y/UyLY9gta6YRsvjzGoel4GML2ZgWKyy4SsDC2t5PaX8n9Tx/Iy0g0JYn4EDNBeqGKBsEHF8mPb133m+Ki18Qwt68HR7IJxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=r0fbLwIO; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id BDBD121151AA; Wed, 11 Jun 2025 11:14:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDBD121151AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749665662;
	bh=EMkdDtA91tsl1gvVusnCTDwxHY/U6R83WxT1qe9+6Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r0fbLwIOMVY6zh7dE89LuYZDD4LeQnf4Kurk06Iyc+TH1Qm1uLEG4e8lAeUuWNmMj
	 089jkujptIxF9W8Ht+8DaYfwSjI+H/CMlB7q2YH5boFTaAlFEWo6GgIqSR0VzbPnoE
	 HcRG47RZoPrVtsJzXioJW/Umm88EqwUKR0FJpROs=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	code@tyhicks.com,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: [PATCH 2/2] rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
Date: Wed, 11 Jun 2025 11:14:16 -0700
Message-Id: <1749665656-30108-3-git-send-email-meaganlloyd@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
References: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
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

This change expands the oscillator stop flag (OSF) handling that has
already been implemented for some chips to the ds1341 chip (DS1341 and
DS1342 share a datasheet). This handling manages the validity of the RTC
data in .read_time and .set_time based on the OSF.

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
---
Compile tested on rtc-next. Tested on an older kernel with ds1342 which
has the same datasheet as ds1341.
---
 drivers/rtc/rtc-ds1307.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 65beb7067e3f5..ce0994d9219a2 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -279,6 +279,13 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 		if (tmp & DS1340_BIT_OSF)
 			return -EINVAL;
 		break;
+	case ds_1341:
+		ret = regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
+		if (ret)
+			return ret;
+		if (tmp & DS1337_BIT_OSF)
+			return -EINVAL;
+		break;
 	case ds_1388:
 		ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
 		if (ret)
@@ -377,6 +384,10 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 		regmap_update_bits(ds1307->regmap, DS1340_REG_FLAG,
 				   DS1340_BIT_OSF, 0);
 		break;
+	case ds_1341:
+		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
+				   DS1337_BIT_OSF, 0);
+		break;
 	case ds_1388:
 		regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				   DS1388_BIT_OSF, 0);
-- 
2.49.0


