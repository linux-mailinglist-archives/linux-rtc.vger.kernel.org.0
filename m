Return-Path: <linux-rtc+bounces-4698-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9420B26DD4
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 19:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D04B601A1A
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 17:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C230E0F2;
	Thu, 14 Aug 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q1mQMJcu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70730E0CA;
	Thu, 14 Aug 2025 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193019; cv=none; b=exQelbfjE4BFFqK1ofeo0pkoP0Rgf0RTn557ooA72q7FMLMRW5G2Qi5VROQ9ehMVwbrMIU2KEGf+GgHqmn8mSrPTJMKsvkjvfTALf4KFq61nEh5Jm0L2nEleB1a+RRPiRtnw45ucsJ0BHaUPw+Kh7+cGa2VGEHuvd1N4zqxHeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193019; c=relaxed/simple;
	bh=/aICm3XzYBjCfzdo5sT3jJKBlpUkoCXXo267zuhYiDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWdp0HnCYMRiRB8neuIAGW6mhuOK9HldFVmFjh4lYA4fMmVeUJOWz6wE/dw6jayadwNe5e/MPWpNSAWFzX/qiqlsYiLR7I93qZOZQNxpg6/kqAXYvkCtZ04ue0cR9nGPQphxrJwg6oAICNT7s3+61gZcbLA9M1tT4VFIAUCv+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q1mQMJcu; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EHansJ1928792;
	Thu, 14 Aug 2025 12:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755193009;
	bh=/n8RfiF8I5dRieB20BqZfXKHiWHvHVsQdG9yliPrCDE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q1mQMJcuBdYNuEwvv3CdHYVyqxEgwSiwatAQqxQax5KQtyKkgr8vAIWyLIoGuFott
	 Yc+noZG2ns4cRZ6pRSmUo5NNBDIVZMWLxXkWi94gcDe7/FgiwcIqPPkXlp4wDYTsGo
	 KgE5sFvwgFSNd9P1Z8QZrvHR6DNW+PziEYLRcq4I=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EHan8B1867969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 12:36:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 12:36:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 12:36:48 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EHamWb075711;
	Thu, 14 Aug 2025 12:36:48 -0500
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 2/6] rtc: m41t80: Remove use of i2c_match_id()
Date: Thu, 14 Aug 2025 12:36:43 -0500
Message-ID: <20250814173647.712768-2-afd@ti.com>
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
 drivers/rtc/rtc-m41t80.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 740cab013f590..b26afef37d9cf 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -924,13 +924,7 @@ static int m41t80_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	m41t80_data->client = client;
-	if (client->dev.of_node) {
-		m41t80_data->features = (unsigned long)
-			of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(m41t80_id, client);
-		m41t80_data->features = id->driver_data;
-	}
+	m41t80_data->features = (unsigned long)i2c_get_match_data(client);
 	i2c_set_clientdata(client, m41t80_data);
 
 	m41t80_data->rtc =  devm_rtc_allocate_device(&client->dev);
-- 
2.39.2


