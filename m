Return-Path: <linux-rtc+bounces-6733-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bzZvGceHO2o7ZQgAu9opvQ
	(envelope-from <linux-rtc+bounces-6733-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 09:31:19 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B436BC2D8
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 09:31:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=NeTVbvGF;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6733-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6733-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB801310784C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 07:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1774391E7C;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1D391E50;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285878; cv=none; b=JOQQHYfznK2lfJK1sp1kWeD7F4n87bj3x2mDdI7Ep95d0QllcO8nZ+dWUCRy9dlfzBeLZr6Iyv7OkzHa0JeS1b4dF1yPhD2mEpLmb9Ke94z7j5xIC8iVy7TxBNIqa7sfHyAjVe0UIakQKmgHhK2O3Q9Vp0i6zjLQ1EzqrHDcLnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285878; c=relaxed/simple;
	bh=QojzKA+AL9yufTBuhEvjrEAhb+khx3/xRIV8QBdLzG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YbffDg0DAeY2TM5k+9MI6WjQCa++/t8kIVfFX1ivTpT1U0IYRXA+5sMUtNJD8ZwpQhAEOoxInJPyYun+WOu9bTiRp/cKKDcSux58n2ufNUxu6b3dJ622fnheq6UyIl51OND1HsSVAK1s/RK7LWuTSpzzKWyPbfgs2NX0aC9Dm/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeTVbvGF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B638C2BCB4;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782285878;
	bh=QojzKA+AL9yufTBuhEvjrEAhb+khx3/xRIV8QBdLzG8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NeTVbvGFlvNeKvstEQtBfIyYGoJnm7ajizM/Lp9dOFDZ0h+vIgcWB3uDx7zEpMmfh
	 o6UAI4ESmvpaSiMJEUkI7Yr5WFr2K9LUVIKMsDRNN+XNuI2utxOKNutQi1Ye3Xi4nX
	 hVXYcQ5alfZz57dKEdgn0HT4ns1Az70rrsmli1u69iWmI2WtN0CovChJHeCoWVzWUo
	 8o1KPiS6SVvaRWGZAV0hUmvg2jHtk79nH8r3F+0zbYgKIMatz1BwWGiI+9cvC7HtU2
	 4oiMZXUexp5fIVFXd6p1wOMYKilSd5ChPQ+WTSKjYxCKx8IWWWtq8GRuq7oLNZtZVM
	 VTW+waKQ8eM7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026BCCDB47F;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 24 Jun 2026 07:24:34 +0000
Subject: [PATCH] rtc: amlogic-a4: clear unsupported update interrupt
 feature
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rtc-feature-v1-1-42dccd22c0ee@amlogic.com>
X-B4-Tracking: v=1; b=H4sIADKGO2oC/x3MQQqAIBBA0avIrBNMRaqrRAuxsWZjMVoE4d2Tl
 m/x/wsZmTDDJF5gvCnTkRr6TkDYfdpQ0toMWmmnnLaSS5ARfbkYpTIBTTSDNX6EVpyMkZ7/Ni+
 1fiM27XxdAAAA
X-Change-ID: 20260624-rtc-feature-03ce3f3843a9
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782285876; l=1071;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=pJ5eX/skfag9z0pkWfC/zXmkphBv9K7+CU5zNogQX00=;
 b=K8SW8U312kCtLZRTKBb2MmA6n7lo6AJUWoPjwyFhymEluNvfnNr7RierO1ahP2OjvK8nQydOZ
 6+CcbiIlZ2AAj4mU+kcubK5ai8aeDsJBtdjFjvMwX5V1IViaFKEHLN5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6733-lists,linux-rtc=lfdr.de,xianwei.zhao.amlogic.com];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amlogic.com:replyto,amlogic.com:email,amlogic.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yiting.deng@amlogic.com,m:alexandre.belloni@bootlin.com,m:linux-amlogic@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xianwei.zhao@amlogic.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B436BC2D8

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The Amlogic A4 RTC does not support update interrupt. Clear
RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device to
prevent userspace from enabling an unsupported RTC UIE function.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Clear RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device.
---
 drivers/rtc/rtc-amlogic-a4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 50938c35af36..116cf095a9e9 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -379,6 +379,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &aml_rtc_ops;
 	rtc->rtc_dev->range_min = 0;
 	rtc->rtc_dev->range_max = U32_MAX;
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }

---
base-commit: 851d961ff248218f681c53cf0f7f08cf8201a117
change-id: 20260624-rtc-feature-03ce3f3843a9

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



