Return-Path: <linux-rtc+bounces-6102-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMaWJLeap2ksigAAu9opvQ
	(envelope-from <linux-rtc+bounces-6102-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 03:36:39 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1E1F9EAA
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 03:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F9B3044A55
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Mar 2026 02:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70CD27FD52;
	Wed,  4 Mar 2026 02:36:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2F19CD0A
	for <linux-rtc@vger.kernel.org>; Wed,  4 Mar 2026 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591789; cv=none; b=RDynVbINHSaTX9t1Or5O7r7JcS3AF0qAEm0/bGFEF416UrK0swyHvrwr/5fsUu+cc2LNTI6XxOzqeK0kI+nlo189wOGi1AviFFADkzYocviO4LzUAslLkheWyMLXfoq8EgoliHcVUjHZtpIM1fcsj4fY/yBA2+iw1OUZC47ZUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591789; c=relaxed/simple;
	bh=dE18NARjHFoNjX4UkAsQzIp1Cjoq99h5u4zZptbJQtk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UCFuBcyG9IoHxCV06foFFyF2X9KCeZtfOjRiafz6Rs3kvbu4oFldcfcQW64uN/jguEhDj3hisP5fISdNATfDp8HMwt8A+j49eP0Qm+sV3L+sSumf/1Lu7LoZk+CrFkW9DdLUtA7wkzzTk8V6eGpKxILBBbI1CcZOuEGek0Qb/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADHWQ2hmqdpKx6dCQ--.30158S2;
	Wed, 04 Mar 2026 10:36:17 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] rtc: cmos: Remove redundant include of linux/acpi.h
Date: Wed,  4 Mar 2026 10:35:33 +0800
Message-Id: <20260304023533.503066-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHWQ2hmqdpKx6dCQ--.30158S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryfGrWkuFyDCw4fKFyfWFg_yoW3trg_C3
	4xCr17W3WkAr4vyw1aqFs3WrW5Ka4UZF48X3Wvga93Aa9rtw4YqayDZF47X3sxu34UJFnx
	Jay7Zryxur1jgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8JwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbYhF7UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Queue-Id: ADE1E1F9EAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6102-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iscas.ac.cn];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Action: no action

The header file <linux/acpi.h> is already included globally at the top
of the file. The second inclusion inside the #ifdef CONFIG_ACPI block is
redundant because the header uses include guards to prevent multiple
inclusions.

Remove the duplicate line to clean up the code and slightly reduce
preprocessing overhead.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/rtc/rtc-cmos.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 9ac5bab846c1..7c06b9d19273 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -743,8 +743,6 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 
 #ifdef	CONFIG_ACPI
 
-#include <linux/acpi.h>
-
 static u32 rtc_handler(void *context)
 {
 	struct device *dev = context;
-- 
2.25.1


