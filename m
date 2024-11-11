Return-Path: <linux-rtc+bounces-2491-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539B9C3C62
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 11:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D34D1F22426
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 10:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6C11547F2;
	Mon, 11 Nov 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c7TliuLp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639B13C81B;
	Mon, 11 Nov 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322047; cv=none; b=lZGMiKUJygFowHmy6Pi1kJFTBaU5upJmni3MgyGgn1qmqds3SF4C2woJjW1aiNntgx7CoqScLxbBxu4aFOkIH6j5GL6lFkdyRni+y7eoKqrvfifG4jO5n8a1sqlQ2f3UXiYPZdkwyRJ6n801fOto3E/KkxfHQSOhDQ0+Qd4vQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322047; c=relaxed/simple;
	bh=ntOCwD5dFfHb3xTTghdBN85493lOAl7fEhEjVHdd1iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXZwJjbcDpn4lVcRawkVTJ8k6JnwtWi/hpZ3jS3Hc6bL/BwseH/GNsqva2Ob0enn64YR7mUq552lXXiMTjB+UsMBbEFWMyqOoFaYnU7ONihHKF7Gr6/iEJK1wQCiAeUiHf74BDuDw6a434+s1tIme8MYqgL9fNIUAR7MwfRLI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c7TliuLp; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2EA3240006;
	Mon, 11 Nov 2024 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731322037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EAMqzlvv6NKyYQHMdh1mm9xNAgu7GJWQzaBQMeu6yR0=;
	b=c7TliuLpP+IGBzi5Xo3UCMZj6pz+gC1qZVqDBN/5bGzeZ3fGXkPuGp6t31Kq4NhTFy+pN1
	o8NlW2YMQ/3vZ537i6OiSfTw16410v8LGILWPg7qTu0fWKQPLRjP7bvvO4+CYADlieGC2y
	lHN+W1SY2wMkDyU7JsXFK244fUMIv9YAwcmi5JZH0bBoaLkw+ZMUcSOid4kc9eFK3B2TNi
	SE+DSHAOQ7ZudiyYT32xFJSYjTmp/JTjCrsBrH+AEhj5ptHbiPtNP2paMXTjNtRU3mT3ku
	TbG2/eLD4g9v72OcSf7w0kSRkZhZMMRp3fAptY1hmScXz7mYeWrt9BKkdTmJ1g==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Zhu Jun <zhujun2@cmss.chinamobile.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: rv3028: fix RV3028_TS_COUNT type
Date: Mon, 11 Nov 2024 11:47:10 +0100
Message-ID: <20241111104711.3170865-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Read RV3028_TS_COUNT in an unsigned int so static checkers stop reporting a
mismatch between the format specifier and the type.

Reported-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2f001c59c61d..868d1b1eb0f4 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -120,8 +120,9 @@ static ssize_t timestamp0_show(struct device *dev,
 {
 	struct rv3028_data *rv3028 = dev_get_drvdata(dev->parent);
 	struct rtc_time tm;
-	int ret, count;
+	unsigned int count;
 	u8 date[6];
+	int ret;
 
 	ret = regmap_read(rv3028->regmap, RV3028_TS_COUNT, &count);
 	if (ret)
@@ -156,7 +157,8 @@ static ssize_t timestamp0_count_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
 	struct rv3028_data *rv3028 = dev_get_drvdata(dev->parent);
-	int ret, count;
+	unsigned int count;
+	int ret;
 
 	ret = regmap_read(rv3028->regmap, RV3028_TS_COUNT, &count);
 	if (ret)
-- 
2.47.0


