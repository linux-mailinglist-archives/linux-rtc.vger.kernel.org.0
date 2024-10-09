Return-Path: <linux-rtc+bounces-2121-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FE995FB6
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 08:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E69282178
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 06:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688221547DB;
	Wed,  9 Oct 2024 06:24:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4173328EF;
	Wed,  9 Oct 2024 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455062; cv=none; b=HgaaGilk1t14xTs/IzPHpcr+ll1wVK0GVF5+cCElRq563FE9AcEKaCfXenDHCSvwo67RDABzEtwU42pQVlU+M6Dwi6O3hjpbyEhp78OeYuDiaJY4UfzDlaO+0B9Z9XmyftCi9VjHtKmc8sgDdu2wrMtnYUmTWGeRb+wH/JYizcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455062; c=relaxed/simple;
	bh=HSzLRu4rlAzUXa822g0yZptvXKcn+fq2g6R4jxo3hjw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oHAbi3X0gDtkyRCN9ifHL/hPDUMX0ECqHO9eB0+1sDjsvII56IKBjjR6AWCkyQT//Dlq/RUXdatc0o3UIzimA9VV0USkk7Z6oyc9s+NID0dmKIFBA04Z2x2OPQLuuE6r0lBzHNtoX7MhHde8AY2i/2G3JqydwlEIf84nmL2Sii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96706219058d-f059a;
	Wed, 09 Oct 2024 14:24:17 +0800 (CST)
X-RM-TRANSID:2ee96706219058d-f059a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee967062190625-da049;
	Wed, 09 Oct 2024 14:24:16 +0800 (CST)
X-RM-TRANSID:2ee967062190625-da049
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH v1] rtc: rv3028: Fix wrong format specifier in timestamp0_count_show
Date: Tue,  8 Oct 2024 23:24:15 -0700
Message-Id: <20241009062415.5987-1-zhujun2@cmss.chinamobile.com>
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
Changes:
v1:fix the subject line, it has to be in the subsystem style

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




