Return-Path: <linux-rtc+bounces-4694-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F08B26DC9
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 19:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 174D33BE23E
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 17:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603C030AAD8;
	Thu, 14 Aug 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uG1xGd8X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E92FCC1B;
	Thu, 14 Aug 2025 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193015; cv=none; b=Neu55MhjTGKKGZ/y24VZxWfxD61CM1PYUK0O/w/zQFXcvGLnIKUBxKVwUsSU1zEh91K5DgRBTjiBqgzzeEZc7UqULb3s6EhdJ/gLFv1NhMJtXQQoCPvCR46dAELFy3lqOvA4aaw5aVi7bm8pyFU66Ffzxg3qCju3XE1LDGTtClE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193015; c=relaxed/simple;
	bh=QBdjno0GtzNjHetaheVfnZlK9hUuaKqb0uLnA3bLZho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oiyXBXuvgGcp5SjLTYhAdtUoIQCip59ujjUANGqcVWsuqyTkHWqW7X0slvF9sV8/6BpDtYG9/wCIML2J8tpAcyedtaB9SpUnQr7bOAFiCZPtteX8LFGc7lFFMddBn5hqcHmLeQkB2Ob5SZfEAfpNEabYsF4iBMIf9ZXPdoXYXyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uG1xGd8X; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EHan6C2433920;
	Thu, 14 Aug 2025 12:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755193009;
	bh=sjf66ndTfofDQV3IwnOsO+ZoH0bk65LwMztr2ReDAoU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uG1xGd8Xw+o/WNLpr0W601WB+LoDl/14TznWgLJSaPgZva0i9hG36g1hvFBOuUYH/
	 kPOQEr54lVzYFn2ilM8lDsjmgpycss/m+0xyYnnTXjvWQcsHKs4SNGCC/Oy7gv0n39
	 83WOKRYZhDcIQdeHOouGx2P/VStRr5hju0gyYzz8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EHanxl1006294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 12:36:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EHamWe075711;
	Thu, 14 Aug 2025 12:36:49 -0500
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 5/6] rtc: rv8803: Remove use of i2c_match_id()
Date: Thu, 14 Aug 2025 12:36:46 -0500
Message-ID: <20250814173647.712768-5-afd@ti.com>
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
 drivers/rtc/rtc-rv8803.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251e527c2..fab0fc463ec03 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -667,13 +667,7 @@ static int rv8803_probe(struct i2c_client *client)
 
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
-	if (client->dev.of_node) {
-		rv8803->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rv8803_id, client);
-
-		rv8803->type = id->driver_data;
-	}
+	rv8803->type = (uintptr_t)i2c_get_match_data(client);
 	i2c_set_clientdata(client, rv8803);
 
 	flags = rv8803_read_reg(client, RV8803_FLAG);
-- 
2.39.2


