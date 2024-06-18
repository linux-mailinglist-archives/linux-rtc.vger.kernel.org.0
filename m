Return-Path: <linux-rtc+bounces-1357-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DB90D73E
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 17:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C44A1C2443E
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 15:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD2322F1C;
	Tue, 18 Jun 2024 15:26:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBCD1E895;
	Tue, 18 Jun 2024 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724414; cv=none; b=ouHAmFwnqimqQA/URbO9wWnrnBX6H8tW39uSSyFz0MucUxPpE/V1T+SrJ1hmKhme8X+mUHExst7mW6Q6/iPFltm/wEFwqzTuCxn3zMkv41h+EsdFtp0yJuv/Hwgz4SdaBxw8UOt3tkRj8YuZxzPMq9+bkMuc8xDgCsGmC3LnhGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724414; c=relaxed/simple;
	bh=QFAInPUce4gQwzxkZrTMM7V/0YYUWyI2QbB1zcT0lNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CLFYuE3j1+EGg2i9Dw7+92bI0ahdI+ltI2HKNY5v67eW+xm3gMt8eV2ukqfZX/SdJqzuhNZXCkGqzRcrlxJxVuHWIG67ZOjKHYnYz/Yq8/EpH7Bwwgq12116+7EenwP7rsQhW4lviT/5b4zVX3V7ljaaxSegRz7LYcA5JjSk6zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,247,1712588400"; 
   d="scan'208";a="212384989"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jun 2024 00:26:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CA6414006A90;
	Wed, 19 Jun 2024 00:26:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] rtc: isl1208: Update correct procedure for clearing alarm
Date: Tue, 18 Jun 2024 16:26:31 +0100
Message-ID: <20240618152635.48956-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
References: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per the latest HW manual[1], there is an internal delay(~250 microsec)
from setting ALME = 0 to disabling the alarm function, so the user must
add a short delay of greater than 250µs between setting ALME = 0 and
clearing ALM.

Currently setting of ALME = 0 is done after clearing the ALM, so just
reverse the operation and add a delay of 275 microsec.

[1]https://www.renesas.com/us/en/document/dst/raa215300-datasheet?r=1506351

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index c58063d917d6..3df5605134fa 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -663,6 +663,13 @@ isl1208_rtc_interrupt(int irq, void *data)
 
 		rtc_update_irq(isl1208->rtc, 1, RTC_IRQF | RTC_AF);
 
+		/* Disable the alarm */
+		err = isl1208_rtc_toggle_alarm(client, 0);
+		if (err)
+			return err;
+
+		fsleep(275);
+
 		/* Clear the alarm */
 		sr &= ~ISL1208_REG_SR_ALM;
 		sr = i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr);
@@ -671,11 +678,6 @@ isl1208_rtc_interrupt(int irq, void *data)
 				__func__);
 		else
 			handled = 1;
-
-		/* Disable the alarm */
-		err = isl1208_rtc_toggle_alarm(client, 0);
-		if (err)
-			return err;
 	}
 
 	if (isl1208->config->has_tamper && (sr & ISL1208_REG_SR_EVT)) {
-- 
2.43.0


