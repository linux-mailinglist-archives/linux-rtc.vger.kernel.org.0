Return-Path: <linux-rtc+bounces-4695-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BFB26DCD
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 19:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14DE1C26ABD
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 17:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6034130AAD1;
	Thu, 14 Aug 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mlpoCGnU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336E3009F1;
	Thu, 14 Aug 2025 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193015; cv=none; b=N1Dz2O/EDHElx5mpfGWWPL93d5T/X5pL0CNJBiYE6ZZ2I7FP3wIPOsoDMAAPIReUn3vY/BcLmGDh2W2flFMHOmcuEozoopH3DXxTPk4hKdUFLv7+iqOM9wjKBJsz6DxBTx03JLBb6GyA17eW3qTSgVWrSmcKAvxGMhvdJTCI3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193015; c=relaxed/simple;
	bh=/11uzt/FFWjr1NwvesafyM/XIaIc8ik0XtDtRwXLmYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIqxFmGWB2dk4LBCXqLM8XTKlv0NjxrcFg2GAFfGuATdlILia1os3tOc5TqfsCwzQpNaNe1X5u4VwYVUYg5v/MaOFT0Qu+ccoPEAt5rl/cgf2ljyB4djQMz/UQczlVbmhhjQJsoKmkjGFvNangTY8Wgv/w2FYFapp+H+aY+6g4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mlpoCGnU; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EHanRQ1982185;
	Thu, 14 Aug 2025 12:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755193009;
	bh=Ug8T8qzlCOSzQhJU+YW1s2gONgukBDelIGY9WMG4Vm8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mlpoCGnUWGmoS++TjZ4Gt3bfACAn2znTWdYATOoA+5J2nMnB6qZJj5KGuflVRG9NY
	 Uko5CvV9j6U+AYonkDBnjD0gfP3abmZBAV9iwFCwWfA3/vsuVxm8TOp1RhtsdTZnOq
	 gWirRRW0AzLi6n8BioSCUkanDyIEgViJX56ifgZM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EHanjt1006290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 12:36:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EHamWd075711;
	Thu, 14 Aug 2025 12:36:49 -0500
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 4/6] rtc: rs5c372: Remove use of i2c_match_id()
Date: Thu, 14 Aug 2025 12:36:45 -0500
Message-ID: <20250814173647.712768-4-afd@ti.com>
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
 drivers/rtc/rtc-rs5c372.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index f8fab0205f8cc..936f4f05c8c7a 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -825,12 +825,7 @@ static int rs5c372_probe(struct i2c_client *client)
 
 	rs5c372->client = client;
 	i2c_set_clientdata(client, rs5c372);
-	if (client->dev.of_node) {
-		rs5c372->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rs5c372_id, client);
-		rs5c372->type = id->driver_data;
-	}
+	rs5c372->type = (uintptr_t)i2c_get_match_data(client);
 
 	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
 	rs5c372->regs = &rs5c372->buf[1];
-- 
2.39.2


