Return-Path: <linux-rtc+bounces-2118-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7C99442B
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 11:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C268A1C23D2F
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B5616EB76;
	Tue,  8 Oct 2024 09:25:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC5113B286;
	Tue,  8 Oct 2024 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379528; cv=none; b=rlERu2LwYtXsJYS97Xqx5KYaqCnDaUH9YMd/kRq0SUDyKMX7GdyOih+OrtkW16kIOA2li/cwWsUXjAkdEM85f4C3Q+VNgSlnZSXtoJn5ROgfMazlzugHV74HJU4I1meY1bhx5bMxiwD1hdigtlqZxIF+k51evzL5jJzOxR/QcWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379528; c=relaxed/simple;
	bh=RHE9RuDmlbe3fZW4kMc+n3WCpcCjMZwRZWIXHZpBmQg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=nGjlPitDFlrdUeNPgsNKPDpbGKaWS+hOBER3mRVbfRx6vVzSBrGtEHK08vderEyOj0Bz6eBsVTzG7b/4cpW+xkuPVWxBcMKv2Li1ZlewlGC2N0Z1XwwD/LeYDIqDvzwbCDIp3/SlKVKTbYMHlXt+WR6AtQsZKz6PmXZGlKI71T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66704fa8158f-b1e54;
	Tue, 08 Oct 2024 17:25:22 +0800 (CST)
X-RM-TRANSID:2ee66704fa8158f-b1e54
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96704fa7e8ca-9af16;
	Tue, 08 Oct 2024 17:25:22 +0800 (CST)
X-RM-TRANSID:2ee96704fa7e8ca-9af16
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	zhujun2@cmss.chinamobile.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/rtc:Fix the wrong format specifier
Date: Tue,  8 Oct 2024 02:25:17 -0700
Message-Id: <20241008092517.14123-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The format specifier of "int" in sprintf() should be "%d", not
"%u".

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/rtc/rtc-rv3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2f001c59c61d..c79fad316119 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -162,7 +162,7 @@ static ssize_t timestamp0_count_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%u\n", count);
+	return sprintf(buf, "%d\n", count);
 };
 
 static DEVICE_ATTR_RO(timestamp0_count);
-- 
2.17.1




