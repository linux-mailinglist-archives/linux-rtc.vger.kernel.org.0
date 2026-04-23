Return-Path: <linux-rtc+bounces-6401-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP9COcp46mnTzgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6401-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:53:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638C457034
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17E2A303852B
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3CD391E5F;
	Thu, 23 Apr 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TqEBPuSg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B138CFE5;
	Thu, 23 Apr 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973827; cv=none; b=jBPVZcZR+21ay0gYPC8iJE0l0++k2anyePb2rjWOQYkTS6i6P5Z28IioWl+DzB6k4m62nHx899JpD+gOwSS90pG1VQz2Mz1Xeqf78fK+VtXvKoXaJe9UWRdBAjzIG/TWpDi75mYEAeP08Q9BCW8z0FsBzei0Peh1iEhjfnpTJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973827; c=relaxed/simple;
	bh=IGWSMsR9l3YcM+vGFQnwqbuQBc1K81j9HFRpS0NQ6D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4SGxMfItVvDFV3Uq/UFRDRg0N97638S63JqagK2KcKl40bm0nWymAG4T087KFQk3kDumibXbL+YLiTJSRXpqgfh/KCpRKHVVukwBOno/Nej6rHwwBthxpopeztdnVKORU8wTMusZz01Wh/DlG3oi2E4WGIgYB0km9ouVSm+Yz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TqEBPuSg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B3AE52675F;
	Thu, 23 Apr 2026 21:50:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHcNEIrNhiGI; Thu, 23 Apr 2026 21:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776973824; bh=IGWSMsR9l3YcM+vGFQnwqbuQBc1K81j9HFRpS0NQ6D4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TqEBPuSgtKzfQ8hr0Xp64VvOwkGPTQYd0rEnJU9RTObZoYBtoS3vtnZGNuduCTsIS
	 J+XqrpfMYbX3yFJ9occHlsw44QYPZh44TkPlZuHypKbNxSS7skLNuvhh2Is7gfQGyR
	 DcGX8CUOXRnd6gvsEYJEhlpC7mdfVzDNQzS4+qy/uLA2/ehr8R6/NB85yObufmQOzQ
	 cQN6ODqw6oqwKy4kkmrcd+8h6mIPOAu6yNhxYna8+EXeQy3HkuvfPNZVdii8CX+06m
	 rvF6B2nWDDZmd9eel5/JCibUSf7hVAB1HfCO8UAt3mjbRZ4aRCswDO8X5EDEPsB1ES
	 hP/pcDQgVO7+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Apr 2026 01:09:04 +0530
Subject: [PATCH v5 05/11] mfd: sec: set DMA coherent mask
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-s2mu005-pmic-v5-5-fcbc9da5a004@disroot.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
In-Reply-To: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6401-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:dkim,disroot.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3638C457034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kernel logs are filled with "DMA mask not set" messages for every
sub-device. The device does not use DMA for communication, so these
messages are useless. Disable the coherent DMA mask for the PMIC device,
which is also propagated to sub-devices.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mfd/sec-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index ad1c7de83a620..afc9e691bb67c 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -215,6 +215,9 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	if (IS_ERR(irq_data))
 		return PTR_ERR(irq_data);
 
+	dev->coherent_dma_mask = 0;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
 	pm_runtime_set_active(sec_pmic->dev);
 
 	switch (sec_pmic->device_type) {

-- 
2.53.0


