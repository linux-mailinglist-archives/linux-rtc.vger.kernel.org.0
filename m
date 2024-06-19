Return-Path: <linux-rtc+bounces-1362-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70590EFA4
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 16:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6430282982
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE5D1482EE;
	Wed, 19 Jun 2024 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="H9mjke0j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA31DDD1;
	Wed, 19 Jun 2024 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718805980; cv=none; b=txWudITYL2kCZ2qsTmzZQ6efbqE/H0WjRBqeS8dW0g0iDEyjuN+3RA+XCrIO4H2+wjBZVvmR3jVEiv0k0sSbgMQHnTSKpuolV2XKXDJEXgtForkPB5V5oWsr9YOvOQJKwmqUcK4beq5DBKqGu6FXBU7PvSCKiZdw8ysO9HyWBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718805980; c=relaxed/simple;
	bh=ahSL1WyTl3cJXialu5fedyaGFKTnP0EwJfAW8b8qtDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A34PSYDU7M8kDDDB608B/ESBq+/u4ubOxj3fpriWNpdLuL1TrFVBwcZyJWbNjkhre5HdJx2NxXDiFHeb6QsmME1YMuwA650Ie+BZzy5AStJBXAvnUFTqhmngpKke1sktTC5YDXrYIJTj7zt4m74xiEpKrV1/3vG2FHQbiwHgJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=H9mjke0j; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 69379A00ED;
	Wed, 19 Jun 2024 16:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=8KCtIFk5Jn2HULoa1bshxqf0/aEGts2U2h/0kblk5Ug=; b=
	H9mjke0jaGcOwQkFUrqDivrKt18yWQ+RR5hNM1tApJ23cp9x+bmmVrbRnecHazlz
	ca8H5YiGDUTyNSV+DYvjihUGQDm1x1aU6k/ZuMKvMPAtnoayuheociC4jzVctOxk
	KOsU9yFrDIJtuz9iNoztZokSikWgNc+uXQwv+Qc6nqoBiGE8XQW1a7t3uGN6NYI0
	dx3ax9Nl5Spi4f/j9pvp8ovesDomDIt8I6gt1PS7TvGVKE9Pq+aWEM5hKb+D3njJ
	Ht0Rjhjcc8XEoE9nIQOQg5g2LdQpwd2FF83l1RP3HwXmjjOFahTve12+7AdIellq
	69Uvxf7Lm1fbKBfMmT+MFGXfgUVKjAlYhhtYKWeVBLSfsQPsRBdyaeeYZ9KgaP2X
	xa7GO/mubc3JhOel633jHHFbyxAPzVBwa5+kgs/HH3er3CJxfRLOPuk7CCUxl+Qw
	+dPBuMefs35baSI5u9M0VksWuM4twQD7RnFN4AABsAFuShvtZ1CQmdgWgIEYL+PU
	1mGm/N9k2GQqHVfo3cFCycokUgHoc+qWBz/+lhEKG4yLHM0oVuQWwV+YHWKS8pjO
	DGklf/rTjTsFakIME4DuH2uR0iRAStvqxi6J9dRRb+LQRex0dKpnDexZEAPhRkMA
	++k3KD+xUcqwY4ObGZcvcvAhdfax4DfAe7vkTbzplSo=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH v2] rtc: interface: Add RTC offset to alarm after fix-up
Date: Wed, 19 Jun 2024 16:04:52 +0200
Message-ID: <20240619140451.2800578-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718805974;VERSION=7972;MC=1526577659;ID=844469;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B546D7D67

`rtc_add_offset()` is called by `__rtc_read_time()`
and `__rtc_read_alarm()` to add the RTC's offset to
the raw read-outs from the device drivers. However,
in the latter case, a fix-up algorithm is run if
the RTC device does not report a full `struct rtc_time`
alarm value. In that case, the offset was forgot to be
added.

Fixes: fd6792bb022e ("rtc: fix alarm read and set offset")

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * don't try to add offset to an invalid tm

 drivers/rtc/interface.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1b63111cdda2..0b23706d9fd3 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -272,14 +272,13 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 		err = rtc_read_alarm_internal(rtc, alarm);
 		if (err)
 			return err;
 
 		/* full-function RTCs won't have such missing fields */
-		if (rtc_valid_tm(&alarm->time) == 0) {
-			rtc_add_offset(rtc, &alarm->time);
-			return 0;
-		}
+		err = rtc_valid_tm(&alarm->time);
+		if (!err)
+			goto done;
 
 		/* get the "after" timestamp, to detect wrapped fields */
 		err = rtc_read_time(rtc, &now);
 		if (err < 0)
 			return err;
@@ -377,10 +376,12 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 
 done:
 	if (err && alarm->enabled)
 		dev_warn(&rtc->dev, "invalid alarm value: %ptR\n",
 			 &alarm->time);
+	else
+		rtc_add_offset(rtc, &alarm->time);
 
 	return err;
 }
 
 int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
-- 
2.34.1



