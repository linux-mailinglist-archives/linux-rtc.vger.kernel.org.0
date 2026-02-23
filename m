Return-Path: <linux-rtc+bounces-6038-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHucG2mNnGmdJQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6038-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:24:57 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43917AC05
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 820C031B9961
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE903321DE;
	Mon, 23 Feb 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mh7wPiLd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80EB331A4C
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867083; cv=none; b=jHi+wY7dOqOM85zODPj1rTB//3+IxKPn8l94ioxNssWI8WEgRu2NF54sNWepMMKkC7QhRSyCV+P76FZWHcGtC12MAnmxg+O/WNJytADarW/YI2IouSTUc/K0u30QMKU7FElN+BtxZrSBruT8RDiECTjlYECmY8XAcFP/JrzBhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867083; c=relaxed/simple;
	bh=QP+MHdRsjcnE2pWi/W15VjcyLY1tuybVhE/EH7k4Tzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAcpW0GmTTDlUreSAy5xA7FpC+58+CZk5yBN69tK3oj6PxSxbY2rSakeL45Bu7OU8mk6SGlX0nK5P5eZKgy8hZVifhrufigiC6qaOH5JulGzNf0DA25G8rN55BZTeYtI5mvaycOkiHO6BttO5ArqFdjNAJ+WRYi0r0cY8FXvM7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mh7wPiLd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3585465f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867080; x=1772471880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=Mh7wPiLd36/EA8CClo/pheL0hEyyLWkmt2T/yk7MTGgbU7ZsWwjgo4MyD464Mu5TN8
         l5hp/Pv9c/yibRZ6qIXX6Ho2Wy42HKL9cmx9TBHhPSdmYgTGiu7hKM0GQEw6CcWI5A8z
         1eO3Jo3mz9GOZrorUIKjXue64XrSfaDtXpyiIGeiWA3+bmiMjeKqQNYuIRWanmfedPd0
         Swe0aZOx0xxqVjQFmQx+AuBT7JF2kx3j8GGVi1ndT661GO0CjhmCpQm7wXCugJDzUXgC
         UxmRwUGmcjK1KtWPiEE1Ftl2BzST1qz39qLI3mHwhvP3hMtGBoO/Ueu5lgto+pXxyfbv
         d1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867080; x=1772471880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=b286jp9hHz64ZSpXlX5BHZOqHIDVDnp0cTylsWzp+ayfsw4G2MHH5lHOKXE2HLNfL5
         feEVBbCgNpsoj4BsSF1WDQ5Vo7HoBc0DeNNisZ7DZ9nMopAyldcaO6Sf/k+IVmS9fqKt
         rrlP4u1KEB05K9dGuGaINEU99dcaDplwsnkiLAU8qFALq+BJlWHcGwlIoYSh3jFDl0Az
         GznNWgV72boVkPJGq8/AhgjPyxotE+X+VlQSZz5QB9zSHyFefQMSjX3bmioOhUJEtuxl
         O3UVI1grrAPOAiy/vu300lc4Jxd2fTPxrIyPawWF7oR0TX/lqae/BYTbkkEYS73Ivy91
         DMcg==
X-Forwarded-Encrypted: i=1; AJvYcCUNT4Q4PgfTMt+j6nHKWbf/R42Zf0prgVEPz5BAUGZsNmFMaoDHEm+ivP7uP9s5ixzVOs+vhjti17E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJmOFFX4BYuLcdkz92gJLgZfhvH/dSrURV+Tzg8ahUkEXw+Bo
	KVUGJq/wrsmtkTsa4xwRV9eTKURFumV2ajop2vE4K3Bd3cQIsfpVekVt
X-Gm-Gg: ATEYQzw448XE86eX0kwfPirXAASLvt87L535tdft2nTwG2O+0oeQ9TiRI72jlBTR0t2
	slhvNqu6iaMrK7DannaoFSbFvLY4/S9CsWIChR7S9fF2wzSOTqJEGgKYoLqaptjWevhuHYzOvEB
	ptpFQbvMgC5gh/ZIUDp9AScMsB8bwS0SHtd3lIYr907SZXhuaUBzhOv6S/G7A0tUYbVHPj3bK5/
	GJ3HRBTEct+bx1R4btOh8ceH09JsVE1mE5tTwR9jLY7IoYzVTFwkM6IYGBwOFiODCOmwkCXIR0E
	ImNez3oNEP63/Di6yj4YDiBC1C0+eyxGhQo9UwE1lJu8+5j19hiPLNrLueGkS2z/A0DjzdJuqNX
	/jwLu+PiCce4rKkeHrOlLCjo32YCiI3yBjRCDvuoucC8QBQ1o7ePfjm1HLKB9i5LbRZ7G7VqZTz
	0P+9iEJvZYdoPTBQ890jc=
X-Received: by 2002:a05:6000:2583:b0:436:145a:e54f with SMTP id ffacd0b85a97d-4396f169c6amr15272283f8f.24.1771867080189;
        Mon, 23 Feb 2026 09:18:00 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:59 -0800 (PST)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5/9] soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:44 +0000
Message-ID: <06b45142f4e6a30f9f53aa561a99b936ff72c035.1771865015.git.l.scorcia@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6038-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: BD43917AC05
X-Rspamd-Action: no action

From: Val Packett <val@packett.cool>

The MT6392 PMIC is equivalent to the MT6323 in terms of pwrap.
Add the compatible to use the same configuration.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..4b8d49c6f34c 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2249,6 +2249,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6392", .data = &pmic_mt6323 },
 	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
-- 
2.43.0


