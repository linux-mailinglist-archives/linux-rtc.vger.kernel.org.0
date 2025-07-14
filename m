Return-Path: <linux-rtc+bounces-4509-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22BB0499D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 23:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53B514A5F23
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66462777F2;
	Mon, 14 Jul 2025 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Bb24q3VG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A2624169E;
	Mon, 14 Jul 2025 21:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529187; cv=none; b=f9BB+BumIIxpjM8MhUKMYkhwpY1XsjMSzKPLH912eDf8pLaGmLpwKsBnrrao5yf7jz0m2BAsQoMo5oTlMt26oYncFgq4oAUTFY4pTbbZ0Vf0h9Hl7wZilrt09KO6g4Rdaoz19dYBgKMjYKhpi2USPqNjcl2hgwjI4H/KpX9tAeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529187; c=relaxed/simple;
	bh=lQHiDRm3P3P3+F4qTi3UQxbsulVGbiDymJqk+dqb0GQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uNWdcEnaEI0Vcr3MZskSUe9NFVi6J97MaDBbT3BELyHor8+7XKGHLJHXiY8I1K97e54X9hZwOnaUOCHhhGYe8JS3w0y1YeSgWuSi3ZV2puVcm+KAZL7VHcBnxBFpb1JdXX4jcRXcUbhPyDs+80xDNcJSHELnNXCW1quFkmIfWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Bb24q3VG; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 24DFA201656C; Mon, 14 Jul 2025 14:39:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 24DFA201656C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752529185;
	bh=c8JzThbzDRuG5s5PT5aamV4xZ70pe8DGsXYZyspNS10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bb24q3VGYJ6Qj1UcOgnIUZz49DRqwEAMEU+KcmWUpKAtMIp7jgZgJWgT7VScPsTdh
	 za86tSifUOjW9oLXA1MEPbnYqEx1IIzI+x5hcb5woxM7MOjrAE3iCAKLgmvMzXXlD6
	 SM833h71YAlUJfRfYwzoWxr3Yj64Fazj/zjC7s88=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	code@tyhicks.com,
	giometti@enneenne.com,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: [PATCH RESEND 2/2] rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
Date: Mon, 14 Jul 2025 14:39:37 -0700
Message-Id: <1752529177-8154-3-git-send-email-meaganlloyd@linux.microsoft.com>
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

This change expands the oscillator stop flag (OSF) handling that has
already been implemented for some chips to the ds1341 chip (DS1341 and
DS1342 share a datasheet). This handling manages the validity of the RTC
data in .read_time and .set_time based on the OSF.

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Tyler Hicks <code@tyhicks.com>
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


