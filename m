Return-Path: <linux-rtc+bounces-713-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8485EE7B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 02:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6531C21706
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 01:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC66D111AC;
	Thu, 22 Feb 2024 01:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="EMiKRZeI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC68111AA
	for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 01:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708564341; cv=none; b=onQRvTL681wdfYfso6r0at5IvelbqraWFibZY6qZAZKaCkV5DE8KLWmUrtnUYqTIIWYkKGRVcxJlEAuU9aDZPQRnQ8oisMyUljCyiIJI5xbZKgoTkEiCOq1S/7+uR0a9BYbYSaqwUlrDI0jRRuhM3onZuhIbQCFE1WF6bp3JNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708564341; c=relaxed/simple;
	bh=yvZJ9i3r4muzYv+bz1I1EEMzKe71DA29p9T+kSQKCrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BILlCaujuDDkmIcJAEpMpTewPl6er70265mL0STAetZ9urojV+nPgtOyb2tHJxLUsh82E/FuLxegXkkf+FRsh5w6eE5CqWTjxMmlbAuUKoPL38GDqCpjzlVxSJV4XeS9bP7ewPPnJqcXzhKFmZRbbR+H5HZXBHVPmj4umq+Tq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=EMiKRZeI; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41LNWLBP030270;
	Thu, 22 Feb 2024 01:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=Cin6M8gGvTX3smwrPA3bXamzLscrKQq0/zdkbr93GGA=;
 b=EMiKRZeIZph6ngXVO5p4AqpR/HFVFY0u+tXuRdZGY+yygxqL9hRJtkbjozu/Mw+MrbQY
 MT3Upk+Rh3lE0Cf8j3Nq5oC/Zso8K2eLg+ayIOc1T3qxMhvHvpD91ftDiU0zISqFK6m0
 mMNz39dy9QGq0hhLQLToYK8dyRDaaFyIE1Mx1eO7BrAHZvuMGxrRupmGW9frdidjE6Ps
 9AyCthVWNZFJ6mOTf+fncGgzyQ3rcsHQsi1XNgME/F1F7r0zDgnZ8cUnZ6cUEEM91MKh
 yb892/ays05WVR6WbIMLAlAK87ExaUvzKBOTbSIEr4BxVHvCZ7dUpwSmvwBMDV3SSvgK Tw== 
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3wd69552et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 01:12:07 +0000
Received: from hpnsw4746.rose.rdlabs.hpecorp.net (unknown [192.58.206.38])
	by p1lg14881.it.hpe.com (Postfix) with ESMTP id 541AA8059C4;
	Thu, 22 Feb 2024 01:12:06 +0000 (UTC)
From: Curtis Klein <curtis.klein@hpe.com>
To: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Cc: trivial@kernel.org, Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH] rtc: m41t80: Use the unified property API get the wakeup-source property
Date: Wed, 21 Feb 2024 17:11:29 -0800
Message-Id: <20240222011129.79241-1-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wLpD7qy7wB210n1CoKwHs7S8D3vQUAYe
X-Proofpoint-ORIG-GUID: wLpD7qy7wB210n1CoKwHs7S8D3vQUAYe
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_09,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 mlxlogscore=795 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402220008

This allows both ACPI and Device Tree systems to specify the m41t80 as a
wakeup-source.

Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
 drivers/rtc/rtc-m41t80.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 866489ad56d6..0013bff0447d 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -909,10 +909,7 @@ static int m41t80_probe(struct i2c_client *client)
 	if (IS_ERR(m41t80_data->rtc))
 		return PTR_ERR(m41t80_data->rtc);
 
-#ifdef CONFIG_OF
-	wakeup_source = of_property_read_bool(client->dev.of_node,
-					      "wakeup-source");
-#endif
+	wakeup_source = device_property_read_bool(&client->dev, "wakeup-source");
 	if (client->irq > 0) {
 		unsigned long irqflags = IRQF_TRIGGER_LOW;
 
-- 
2.31.1


