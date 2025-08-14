Return-Path: <linux-rtc+bounces-4697-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D18B26DD0
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 19:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F2CE5879B4
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 17:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8AF30BF5E;
	Thu, 14 Aug 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jxM4JA7F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400A9212561;
	Thu, 14 Aug 2025 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193016; cv=none; b=VkB7XuOThv9PGoJDwzwtA0VQKEOBgq10JAJcw2e/pgAEKUUOn+xdY3D0IRdSsU74app/aaMIANvoCqj2H0l9Wp03AVpkdplm4GQdDmSC8q/YYzsQCEiiot1q1zdtLs2X4o7gMQmf/9+xyNfUftdYeX3e/BdNSkXANyw2e720Qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193016; c=relaxed/simple;
	bh=jS1gOZa6ApqbMJWfFq7gcaTf5sA1unmgxlahA120ZTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJ25Q4YBF4pdHm3L5AlUgzpVaI1v7Fy7LcKk87HiNmOrDQSV7XuyXrrgbYnkmMKtJxbveFiccA1E/Bfr0MqxQKVG0/3TtIMpcTfUgeAMcFsaiHAgl2D1vD4VomngEy8mM5oPh/FradZGhTYvA/tkd4iFR17ZcndeKeuOS9U+SdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jxM4JA7F; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EHao1p2354218;
	Thu, 14 Aug 2025 12:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755193010;
	bh=tu4W1iTqZjh9OuBPLiuUZicGOkCTX1JM20XSWzfs8i8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jxM4JA7Fz0kJ8s5hpbNxvAyM2CBoj8F1ffOnwigJqNx6r/3UjXh7I8n39vM2RpSzt
	 T+NT857ywW03r6cNTLb8rqcgdZ6/bWw5jZPIqilANvfAd0GdGQ4wnGFIX943zcjrD6
	 +VMm0D1T+lrmgCRObsPJYKRPxwPIpkaoRXw+v7IE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EHao3E1310465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 12:36:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EHamWf075711;
	Thu, 14 Aug 2025 12:36:49 -0500
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 6/6] rtc: rx8025: Remove use of i2c_match_id()
Date: Thu, 14 Aug 2025 12:36:47 -0500
Message-ID: <20250814173647.712768-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814173647.712768-1-afd@ti.com>
References: <20250814173647.712768-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/rtc/rtc-rx8025.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index aabe62c283a15..397c647a95375 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -522,7 +522,6 @@ static const struct attribute_group rx8025_attr_group = {
 
 static int rx8025_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_match_id(rx8025_id, client);
 	struct i2c_adapter *adapter = client->adapter;
 	struct rx8025_data *rx8025;
 	int err = 0;
@@ -540,8 +539,7 @@ static int rx8025_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, rx8025);
 
-	if (id)
-		rx8025->model = id->driver_data;
+	rx8025->model = (uintptr_t)i2c_get_match_data(client);
 
 	err = rx8025_init_client(client);
 	if (err)
-- 
2.39.2


