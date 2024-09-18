Return-Path: <linux-rtc+bounces-2032-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C597C158
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 23:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3019C282D60
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 21:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B6A178361;
	Wed, 18 Sep 2024 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IQC91YB1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9915853D;
	Wed, 18 Sep 2024 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694534; cv=none; b=eVeEpqZQLCEhXHgIZhnBVIYQE5q6bysBknZT93iswYK7GkZY9G3ao/M2VABk15z2mpvIBvwn20+QRSSMYuBynSZKy8NHRIPOo0i+awrtbJI+UjCl5lhzVTLkiXnhecardsg39vtHnNXQZ9E6vp9mWC6pjdAqG0zyCFHiScS9jig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694534; c=relaxed/simple;
	bh=iVycWfR4xJRkWVCjsEBSXiz6ESvrHs61SGDmRu1+Grw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k4Tsw056wbNzaMrYPHtmImHEfcdZEWrpBW7iTCEV4EdyR75XjFyvKq6x1twrerCD+oHMnPzqX7tai3C72ZkBhUqsa0oVJlqibFTbKc+J90jEni/0rejoHSEd23+UcX+SZTV38KnWw2Q6kLehIjJgskNzw3iy91BiBplZnOABvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IQC91YB1; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=mwc6ebWioCgeWz0QZ7Mw5ijqvCT+qQorOR7T1FVkDWk=; b=IQC91YB1sF4h/i+v5SCU5nLETM
	BJAbXSyOZzI4OMfw1GwTNrEaKsZZbzaX8iPOg9mmteN7FO8ubCEmEWGDmsAx5FJTqxfiiVHiGMQKT
	wqF9pTwNyyb4lkfd8q4UE5K2K27Xgpv+De0RmGXFYIk8JVWeJsBTg27WM5gkOh4kDKIFf+yPF7utY
	J/UGlSt0UTvAqxskj+MAoAI7o2Nn7rIyqpnwhX+LBv7Mr8zG18KVVWTO9DtL9526buLQrnUxQ1w7u
	grARnMpx/KUqyVb+q+Bf0fdgqbN8Zp2XQ98z4BqrBedwWlQnDMftn0T63FiUj0wNhqd8mw3cw3tAX
	jigEM8IQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] rtc: rc5t619: use proper module tables
Date: Wed, 18 Sep 2024 23:21:59 +0200
Message-Id: <20240918212159.1191637-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid requiring MODULE_ALIASES by declaring proper device id tables.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/rtc/rtc-rc5t619.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
index e73102a39f1b..711f62eecd79 100644
--- a/drivers/rtc/rtc-rc5t619.c
+++ b/drivers/rtc/rtc-rc5t619.c
@@ -429,14 +429,23 @@ static int rc5t619_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc);
 }
 
+static const struct platform_device_id rc5t619_rtc_id[] = {
+	{
+		.name = "rc5t619-rtc",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(platform, rc5t619_rtc_id);
+
 static struct platform_driver rc5t619_rtc_driver = {
 	.driver	= {
 		.name	= "rc5t619-rtc",
 	},
 	.probe	= rc5t619_rtc_probe,
+	.id_table = rc5t619_rtc_id,
 };
-
 module_platform_driver(rc5t619_rtc_driver);
-MODULE_ALIAS("platform:rc5t619-rtc");
+
 MODULE_DESCRIPTION("RICOH RC5T619 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.39.2


