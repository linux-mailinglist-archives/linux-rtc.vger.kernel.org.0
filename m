Return-Path: <linux-rtc+bounces-6492-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMWHDtayAWppigEAu9opvQ
	(envelope-from <linux-rtc+bounces-6492-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2026 12:43:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9750C11E
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2026 12:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 654963011346
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2026 10:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9623DCD94;
	Mon, 11 May 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="si4g3Hkm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA93DA5AD
	for <linux-rtc@vger.kernel.org>; Mon, 11 May 2026 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496147; cv=none; b=mCbZ2DAAW9za+Hm97T47SZQH6cTiUBf8COLNbHNFArn0/+qhxVQxsDwH8zcPK4ZbiHUc6S+sbD++wmcDYkxrbhI0gQF1dtxTDXr0Gr57PnIJSpvlfnYEQFpp5QpUP+yAf3l4QexIqQrZk6jgBV+wcnYiOqZeDnWIWka6NCnC7W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496147; c=relaxed/simple;
	bh=VdJ5r2ElmHFPYRu6yd7Ju6FxYooHR/G/5UEPpRbDz04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z+tEC4pJp6F2Z+H+La89ZKlnXuTiq98nZzbBlJ8eD902QcVoSqleMHxkihuutpR4LLc0c9spwmGq1Kz9VeI9tnKWJE5GSOsdTvvcIJPL7mniZLfJn7Oz20sO0qWX5JsttRmGA26QtUe3gwqhK9Ws5/1xJypu5sWFW7d3UxYE2mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=si4g3Hkm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44c44af71f8so452411f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 11 May 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496145; x=1779100945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udHBpIJli3+EZkum4HEpk4t8YdfFn6QUTjZ7riwLiEg=;
        b=si4g3Hkmr4074ddDbokPNPA1QV3eLxqYvIXWzv6WAU5YTU2X6FNwcHWfQsa3KI7p9+
         lFRDXWMpN5ZACHr+e5gmEFKOCPc3GwyUN+ibVLnpCgIBdvR9dvc87jXnvsGyXirEASHl
         htg3dS93oWmsO9FioQVwqR9UwrrOu/Ahkfok1cWzMLlBDDJrP5QPZedjkmgCHcgCHZ/+
         1hI9k369P/ooMWXUBozAACSUQZFXatZqkke9uMp5LpYezTJVMKD/1PSja/g49g1ID3zg
         WsQ2WRWmpF6P4UDqr5ieQs0/MoARQ1Q1lcp9FTMGXD+PDrRAOezc8PCH8jPNkrzivMIE
         1YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496145; x=1779100945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udHBpIJli3+EZkum4HEpk4t8YdfFn6QUTjZ7riwLiEg=;
        b=f6UE0CGrmM8PR6IijE9cONkfR4/zzXej6EqUroNgtddcG2gKmUxMNyPmh0/ZkomU1x
         AQRC+PT1NmkqMopfB6ghIe4lHiHzeLeIPvVM4iivPkbJn5mN5C438eBLW6VWQGgIn1qL
         CtQPL4aI6yxHLUonVNmuxN41meuH2iXZvvJQF90olgRKX5je8LemjML9Tf3kDt/pddQp
         0tiMNKi5RajcRbnm4/mYFKABjf/LNjQFLwPixPylPVXDO6jBACsch0kkuPAy/N14r7dq
         9i2Zw7EdozD5QHMzePRa3xzsKZhgGEXQc874MsZv2hCgI8fvHfWAvYJ53UQq0+8gEzqb
         Vt+A==
X-Forwarded-Encrypted: i=1; AFNElJ9EW1K66iHNPIcsxY+x3C5E4FuMalLv5M8S64EnVlmi/s7mNDkBQ4Z/FwxrL9cTJmi5lGC+V+6RQ44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HoFc6FEd96GRPBY1g8pn8e4ZNkK09GeFrGKVe66WUKvGpKA+
	eXT+vAt4EYRjM4yNaBQZs89RfdfYmif7PiGNICEUL9Ti+6JVmzPB7vgB
X-Gm-Gg: Acq92OEV/P9J/EqemsepP8j9X6YDaBI5vKtUYJBnIaDNkFsoYOsqnKLeaOenOgVRBQz
	0kC9hywygeW6ltTCeyvNj7JPgyxYZLhTo2Yn9X8tqGnliyGabQmMTedw54SjNl9kkklDlfvMtc1
	3stLfMmpUkehAL42TbCnmI5EnjvOcz0puMm3jJaJnD4N1YcO+zxgY7X2TslzmJ2v5fJ/WdKo91o
	070VxAH6wJ21vB9tP9BmXXo8JDczvqKzqdora48diuWiUR5TsQ5lcqed1fbUM1tEovGqnziOptm
	OsEnChaicIEMjQMHinAAl3Nsc/lFqTbPLIx+R25QKodDjXDRv94EhkJkhmIIMz6IKKwsW1siMeX
	GmnAAOPKP/4YLZmX9s8txuadP5YPPlN1AE9nHbXdtaIqgorWmyYEvVAGg8lT7Q80NqAOeSOOl79
	P6VeUwM+5AKxhxZPfpbCVDqCmIenjVd6p81BA8MgQrI4kT
X-Received: by 2002:a05:6000:478a:b0:43e:a978:c25e with SMTP id ffacd0b85a97d-451a4c52575mr10340580f8f.1.1778496144582;
        Mon, 11 May 2026 03:42:24 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b00fsm26824651f8f.11.2026.05.11.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:24 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: daniel@thingy.jp,
	romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] rtc: msc313: fix NULL deref in shared IRQ handler at probe
Date: Mon, 11 May 2026 08:27:03 +0500
Message-Id: <20260511032703.48262-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DAE9750C11E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6492-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[thingy.jp,gmail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

msc313_rtc_probe() calls devm_request_irq() with IRQF_SHARED and
&pdev->dev as the cookie, but platform_set_drvdata() is only called
later after the clock setup. With a shared IRQ line, another device
on the same line can trigger the handler in that window. The
handler does dev_get_drvdata() on the cookie, gets NULL, and
dereferences priv->rtc_base in interrupt context.

Pass priv as the cookie directly so the handler reads it from
dev_id without the lookup, removing the dependency on probe order.

Fixes: be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/rtc/rtc-msc313.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index 8d7737e0e..6ef9c4efd 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -160,7 +160,7 @@ static const struct rtc_class_ops msc313_rtc_ops = {
 
 static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
 {
-	struct msc313_rtc *priv = dev_get_drvdata(dev_id);
+	struct msc313_rtc *priv = dev_id;
 	u16 reg;
 
 	reg = readw(priv->rtc_base + REG_RTC_STATUS_INT);
@@ -206,7 +206,7 @@ static int msc313_rtc_probe(struct platform_device *pdev)
 	priv->rtc_dev->range_max = U32_MAX;
 
 	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
-			       dev_name(&pdev->dev), &pdev->dev);
+			       dev_name(&pdev->dev), priv);
 	if (ret) {
 		dev_err(dev, "Could not request IRQ\n");
 		return ret;
-- 
2.43.0


