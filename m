Return-Path: <linux-rtc+bounces-1948-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE7975D5E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AEB2816AB
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3746E15442D;
	Wed, 11 Sep 2024 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hikR++6v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC32383B1;
	Wed, 11 Sep 2024 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726094927; cv=none; b=rRHSdhsJPC18GYhusBB/4aF1CVqjaTdJo0M4Yo3nrN7oLqK8cYaNcAPi8baBkC0bws1FCtLvkOIUegyDq4Zb1HJfPBmXOwmHHcFpF20yxyXvYRhj4tWup+cfUg+C8TApOIAzawCLGmyTjDozENF1Mg6tmA+5GbGGy4wu6ZLIYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726094927; c=relaxed/simple;
	bh=Tc5shuOMZzW+/88t+jVa/Nub4HUlcTbmsCipiki5lHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVGbvy5WO2+ENCvoRmjKcUCNUIJk/6VDAOLi3vVg7k3Cvg8AYfjkgfLMLdmpcLEiybyrdyaDJWXhzH3UyOBhkIPGPg93UsnIJ9/AmLZv65LZO6VO7OCI1PbiEDJkrfn11WcnqiFZxVTWUfqmHjAp8xXz43ZX10dRCTZia0Y/YYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hikR++6v; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6F0E60002;
	Wed, 11 Sep 2024 22:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726094923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MlI9ZRyINMGOiAAIe2LMITH3pB8V1yKOxVxs3JxK3Pw=;
	b=hikR++6vYCfe52Aw1uux0wyUlhKZJdiygOHYwJje8sY/t+6uzGRjFM+0c+hi9KOI6nKnl+
	NAQxmqd1VTPRr1PX8IIpiey3TvYzQ09pqmR86CJutBI/um5iECV6FM/cUcIRXYufT2Y4Jm
	nlNbZKNFBX+7QpT43dkdwHysFWvIY/QjvPtDU+BzYjCG8314K1gG9h4evirUgmiMrQkUMb
	uWfHBeFlR9TAzGQFaX+WhH4Uzi+q3TlqZWBBa+Sfzp+94Aci03+z3Iq5zq0m8nY5mitnKW
	KZCkbrNR8TuVWw5gZujSi1Sdk+2btKbOGhfAv775iHZxZYFHje+wcGctyKA/yw==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: m48t59: set range
Date: Thu, 12 Sep 2024 00:48:36 +0200
Message-ID: <20240911224836.1571831-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The m48t59 leap year calculation will fail in 2100

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m48t59.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index cd2ca49805d8..5d30ce8e13ca 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -458,6 +458,8 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, m48t59);
 
 	m48t59->rtc->ops = &m48t59_rtc_ops;
+	m48t59->rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	m48t59->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	nvmem_cfg.size = pdata->offset;
 	ret = devm_rtc_nvmem_register(m48t59->rtc, &nvmem_cfg);
-- 
2.46.0


