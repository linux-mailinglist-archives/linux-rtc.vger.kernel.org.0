Return-Path: <linux-rtc+bounces-6730-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yoKzEWVyO2oBYAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6730-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 08:00:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC766BBA6E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 08:00:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6730-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6730-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 039713015E3E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 05:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B8329C7B;
	Wed, 24 Jun 2026 05:55:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEB3254A8;
	Wed, 24 Jun 2026 05:55:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280531; cv=none; b=leO96J0vSfP9GliwpBtcZLmsLmWVp20KxPOFau5UuprsesL8FFqoImK8k9QM2UONYz90hkEk1FKj9TXA9zM18T0RsgtJ+mLPuHhUsuCVIcShJBpEEfx2xAuHTnzzJmOEb0btsheXVICWljIxFTcNmmZ8YLjTAXlJy4wvsuBaIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280531; c=relaxed/simple;
	bh=c0owLB2GRH50WwiZ3CJ/wjSzXv/OYwdwWmH84N+Nm4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rk3OkvEOYV+/0K7k11F8JBFvj2txXL/L4HBLiaAEtOKm1xU9r1bRft5xY+j2oGjrlGge9keIor6kj17oLc7f+ApMz+15bQEoWC0u63YPGMcsIm8y5Y4FiqvmBHjJ3y/fnXojRaOP6awJBwkR3CZRg7QSKw5MJB0TvTU90zTQgKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACXaZBMcTtqhSCtFQ--.13594S2;
	Wed, 24 Jun 2026 13:55:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] rtc: zynqmp: Return optional clock lookup errors
Date: Wed, 24 Jun 2026 13:55:24 +0800
Message-ID: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXaZBMcTtqhSCtFQ--.13594S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1rKw4UWF4rtF4DZr13Jwb_yoW8Gr15pF
	Z5AFyYqFyjyrWxGas8Kry8uFyFk3Wfta1UGFy8Jw4v93W5tF1UGFZ3KFy8ZrykCFyvkw43
	Xry5t3y5CF1Uuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:michal.simek@amd.com,m:linux-rtc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6730-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-rtc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC766BBA6E

devm_clk_get_optional() returns NULL when the optional clock is absent,
but returns an ERR_PTR when the clock provider lookup fails.  Probe
currently keeps the ERR_PTR and then passes it to clk_get_rate().

Return the lookup error instead.  A truly absent optional clock still
reaches the existing calibration fallback through clk_get_rate(NULL).

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/rtc/rtc-zynqmp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 2ae54804b87a..5bcb7536e973 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -334,10 +334,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	/* Getting the rtc info */
 	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc");
-	if (IS_ERR(xrtcdev->rtc_clk)) {
-		if (PTR_ERR(xrtcdev->rtc_clk) != -EPROBE_DEFER)
-			dev_warn(&pdev->dev, "Device clock not found.\n");
-	}
+	if (IS_ERR(xrtcdev->rtc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(xrtcdev->rtc_clk),
+				     "Failed to get rtc clock\n");
 	xrtcdev->freq = clk_get_rate(xrtcdev->rtc_clk);
 	if (!xrtcdev->freq) {
 		ret = of_property_read_u32(pdev->dev.of_node, "calibration",
-- 
2.50.1 (Apple Git-155)


