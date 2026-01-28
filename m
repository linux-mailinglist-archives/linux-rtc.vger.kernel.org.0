Return-Path: <linux-rtc+bounces-5904-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEY+O+CReWmOxgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5904-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 05:34:40 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3F9D028
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 05:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2B130056EC
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 04:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2A029D27A;
	Wed, 28 Jan 2026 04:34:37 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187FC8CE;
	Wed, 28 Jan 2026 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769574877; cv=none; b=UYhsdfnvBzet0r98RVQcSJhndZZzTKiysmd2NeihJrdvKxB/XeFZEs8Q4qHHfE3t+UGHKEZggU9eVr7EUVZSum8EqUADPOY7t053QaR7C5HeJFX2uteqapXK3Bgioe5evf2VqgtDcDwpwPEAj/HLfLn66wkIMSPT3WGi+K+UtIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769574877; c=relaxed/simple;
	bh=EsdkgL7G1UGQ6GvONIln1YXWU9go0QNwrzHXpU1XMs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t9I2czdC/lwBU+Pxmz/SJYZPapG6+Kcleou4WV7hqPfWdKdk2ov+Gs4PA/VmTlNE1zDWGT1JGX1DOH7LqGDT3XkA0xj64kBrN0kNlwpVLb/PdKgHgwdgocaiRLKEd4NVD0ANaB0cV//S1FxOzRI26EOzs/pLWhZL3w9u1rpOm0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQzYkXlp7+3YBg--.22836S2;
	Wed, 28 Jan 2026 12:34:32 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] rtc: isl12022: Add missing check for device_property_read_u32_array
Date: Wed, 28 Jan 2026 12:34:30 +0800
Message-Id: <20260128043430.2260970-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3yQzYkXlp7+3YBg--.22836S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4DAw15AF43XFW5GFWkXrb_yoWDJFX_CF
	yxuas7Jw4DAF48tF13Xa4Sgryvv3Wv93yvqrnrtFZ3ZFW2y3srWFWxXr4Dur1FyrW2qF15
	Arn5JryxAFnYkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU80PfDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5904-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iscas.ac.cn];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49D3F9D028
X-Rspamd-Action: no action

Add check for the return value of device_property_read_u32_array() and
log a warning message if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/rtc/rtc-isl12022.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 5fc52dc64213..6f66ec4a9948 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -517,8 +517,10 @@ static void isl12022_set_trip_levels(struct device *dev)
 	int ret, i, j, x[2];
 	u8 val, mask;
 
-	device_property_read_u32_array(dev, "isil,battery-trip-levels-microvolt",
-				       levels, 2);
+	ret = device_property_read_u32_array(dev, "isil,battery-trip-levels-microvolt",
+					     levels, 2);
+	if (ret)
+		dev_warn(dev, "failed to read battery-trip-levels-microvolt: %d\n", ret);
 
 	for (i = 0; i < 2; i++) {
 		for (j = 0; j < ARRAY_SIZE(trip_levels[i]) - 1; j++) {
-- 
2.25.1


