Return-Path: <linux-rtc+bounces-4284-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD3AD5DEE
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 20:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 645877A85F3
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 18:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B372777F2;
	Wed, 11 Jun 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iMuCI+cl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3A8221567;
	Wed, 11 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665663; cv=none; b=Nkgrg2pulAZIfv2sJMyf3ECFBz1YTrjW+PvtlGBeqwXrsZflaXELCpimr2YdqWG++xDegV912z5uQBMTk4GM8vovggCb24H/PyUhA20UJ16j17Xlnfy/Kr92FuDHb018Urqh4rkp+Orzf8YOaWWjjzxyM1JMPhsPVeQGzBcdhwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665663; c=relaxed/simple;
	bh=JBerx9EjpL9rizCgP7LpIvBzrydqelSerGeMeSsliNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=R06NjpSzgtUeOP3bOfizTKFIm1mzPYYlmNNvE9LjTPZHOH3wz8pfsv2mOYUbGBF5bMFR+RybYZ6fr4DRRiTl5mOrlMOMz5zBnO1NBRjoiZRb+1GH5L/pUy9gJGdNEU30zhtUvTLNxLZgjyzixrUKFyLl8AGObJKgUeSzVnQ2WPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=iMuCI+cl; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 3CAAC21151A2; Wed, 11 Jun 2025 11:14:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3CAAC21151A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749665662;
	bh=BrBhtvBu2yogVkjzA/1F+oESS+O20nH8x0SOEbCXEYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMuCI+clmegvwgt2oX/8FhKpUazmkcTAwkZz67Ltv5foXOXw46/g48+wjF0+wS0km
	 +0uIVAzppOaNBZJesf1SlYwfscBwZMdPo6EGa61JiSP5ZxfkhNj+lo1RWkA7BgHT8q
	 hniEF6KpF6mwKDRZwzKP4BBGhcgLTIyuxe1W/srA=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	code@tyhicks.com,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: [PATCH 1/2] rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
Date: Wed, 11 Jun 2025 11:14:15 -0700
Message-Id: <1749665656-30108-2-git-send-email-meaganlloyd@linux.microsoft.com>
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

Some chip types in the ds1307 driver already have OSF handling to
determine whether .read_time provides valid RTC data or returns -EINVAL.

This change removes the clear of the OSF in .probe as the OSF needs to
be preserved to expand the OSF handling to the ds1341 chip type (note
that DS1341 and DS1342 share a datasheet).

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
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


