Return-Path: <linux-rtc+bounces-6039-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC+lOnyNnGmdJQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6039-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:25:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF617AC22
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3780231BF8CF
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE94330B2D;
	Mon, 23 Feb 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvOnwKlP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D13EBF20
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867103; cv=none; b=mpf53JIvyEHgcu3ijxKni7FwxbYzZRrN3tkhcbMQB0NCqgYsijVe8OH/V4tNwfm1eXfxGVFenRUMakzuv18YH+4A4P5ul9Y/ahNshSic9qJHEITxLRp5IxwT3ZcSh+E9zyCEAK8KnXJRcLRmE8NmyFgDRGNxem4t/0on4CTH900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867103; c=relaxed/simple;
	bh=af/yagtcX4I0+3jtdjbr6gdjXxsaceuEo/D9CvQnsQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlVaDQf7sMhYtJdZrtpPIFRNVhFPdU09Z875yMLFNU+lb36J9E19tpCiL4yr8pevSMyN8hQ1LTQULbKgE9weFJP74Ii4nVvni7McJhCZwiQQ2YzM5mnnnVX1PpFqSOnVjqd26PujDK9P+oUftd3BUP3cviUiagrtVRROEhQstMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvOnwKlP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436317c80f7so3762669f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867101; x=1772471901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=VvOnwKlPcTfODKE8OuLwU0SCRgptBaK1x9DFWHdKOxgOM5eohJPF3rxQqAiGMqh4XG
         ffK0IbGGWexEj2p9+bnW6EMwZeblXZZIx8UZRaVIEs0E9kCw+X0uJYZ7RUn4FPc6UxSo
         j0kytO7zGvas01hyQV/KHGry6Gk/3nzvYku3l4Cbi2pNylE6igGbooruV8exWgglaAnl
         uPi4ehAE3pVhrfH5So9vHKWQZaaOjYnFnSrjXJ1rbc7J4y4JbPQFYxqJ4q2FC/xtSbVz
         kATorzwNqg5VdAqRk2o8tvNorW1iRbyyMW055bI0ewHOKQHqG6ZIa16Mlj/kWTTAwRAu
         XtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867101; x=1772471901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=QYQO/GOeZb29PYmIIXUItO8u8i3txgE0kljgGDv11GYqhFsNNqLc/aCzk2hwW+hD6+
         if3tWpO1YsJbJMZ065VgROGp1P9+C3lA/CJU8FdagZ6biYNTff2BdB6LnANtJ6b5k2Oy
         vAIoj5yTb6Dy34bDJQHNI3hg0OZdl3IaC7XCnTPLMX8JVE+nD9/mXBxyIYHOkHm0WdU3
         oofcoRzO+aDLbPU/pNQtQeMEDxwU9KPM3etq3M8h/fVBClQ/ZvPeyOe1wN/ROM39XCQY
         M5kpo/RPzte04Ts4xE0sDgg521tsEzY0TT/2bRuWwq9AkH4ALD1h9DnIYWhVxMSGmNkP
         VP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWksBdyOr9IyJEmxNd8soSudaTGTaSQMwwOdWiiDzQhwCaxbaZwvAeN67Zzem1McxgazGnnUrzrBC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDiE89Q+DNta99wc5bdRac64J5p/2Y46ptLq+2jFTvTO4zvCK
	hPDGe65/Y3Hz70JTsmRZhhpJb/thzmqZWQQFDZOYmqWuaujSR+WhY65K
X-Gm-Gg: ATEYQzz6vklaghwBP1XkL70IKKS+sxN227zYlxgo6Hui3rzpXT1w7vHm7/HhDsQVWfX
	Um9NSN/gfEobnixPecLd5ZHz1M389pLIX7sGrc7hhcI/epbM0qOT2eTUB+RuZ6RV4WtBV1MOQRP
	0jiIyTnFrjlepA4GAst2eIEmEMJ3wNGN0FoHXyHDZepXzQZjWqGEt4A1iIHO6PQJ3h8UZ13K8hx
	UPyK03Zn8GONXZF3+sdEH9cUf3gTK6536sTMqcPEXmukmpUjxsesr3ueOM6rR19CXIneewXxNJK
	sfnnGrj27ce99ON+ycLI8n+EdSCEyVLHMfeMHEFl3eRg7W3WLaFTAAevjOsu/J5EwB+Vy5BsAQO
	dl7H3ZMqrrDTl/JXy2xdt8R6NJfnhSwu0b1bDgqNbyB0bNS3r/QL2HGNbkMTUKDw91V7eovmD0+
	paNhuKHCpsHZxBcyeXDxE=
X-Received: by 2002:a05:6000:22c5:b0:436:549:e15d with SMTP id ffacd0b85a97d-4396ffd6befmr18768227f8f.18.1771867100114;
        Mon, 23 Feb 2026 09:18:20 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:19 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Mon, 23 Feb 2026 17:12:46 +0000
Message-ID: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,bootlin.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6039-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FBF617AC22
X-Rspamd-Action: no action

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..3b9a5b6bc470 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,17 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x2, MT6392_INT_MISC_CON, 0x10, MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x4, MT6392_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +313,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


