Return-Path: <linux-rtc+bounces-6040-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIwEIImNnGmdJQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6040-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:25:29 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B917AC4F
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38CB831C2F35
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3F33314BF;
	Mon, 23 Feb 2026 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TErMkM4w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808E33122A
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867113; cv=none; b=J4MoTo5IK/uz053SHelWSJ+FOQLV46HjwcF8LXsEWrX1TumCKNrLge0tv6tAO+ZRiCIJy19UqGSfm8VhjgXFzhtFNJGUeyO1WU9kGJLa61qs1OFdRUEU/cBtIMueH0iBFsv91w/5mAo+if+KbY6Squ2LU+AVIIxsyLaCpyVPu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867113; c=relaxed/simple;
	bh=uxYGaJ3P458lu3G0cMf5GUqhaAntuF9M6oJUdaMzBds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZ6SNFWQoiXInJvH/73mpGwUnfoKFW3ktLYWj92wfYSHZCO3eYXFC8vVQO2/TrbENdujyl4smmalZAvIv2RN9Xx0EfDhg8v3qhMjc3rS8W2Oivw8fNjvOgvLgnMGRj/hvvxtz7OUCF8okYbsUWsNORvTRvRhLGV74ipI0Kldx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TErMkM4w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359a316d89so4213590f8f.0
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867110; x=1772471910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=TErMkM4wRQpR1nFCnXHkQeJsWXpycU2gjujrVwJPNfyXYxgIHNJgSddm61znd4XdCg
         lTCJB7RSNvBJS/xR/97fXUT1+yr2jWQwS+1sglHjGCGDrQBYULluoJwyrf3U2X3tDWgU
         lYtbwAES+138DGCmF7bogZBLrE68B3uNa+IYRn5huREfbauMOATpDmnUrEoQ9+p4+WeD
         ZwMHlZMLqEN8ffGPeQaGo8OrltUPcbbRmLBcb7CK9LdK73pCgCvLLX8i/j8SlT7UhCjt
         mtKLp9xxOLyZ50EK8VmeImDuRKNiRhFs3A9Zsj1ol3noKJRCyIbT4c8TlApnH9IpDr70
         /uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867110; x=1772471910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=qsfL6MYiC6vNMa6B50xBu/QinOJFmSJ3sGkpocCnEUjlrsfpuUqAXr4v5rj+C54rTr
         btsLe06RHsAK9e6qx1KlFvVAa8zxyR1PhKU90vD4Bat7Fv/3MWdJ2g2CRD3Cnq6gb1H5
         elwmQj5GnhY1Ud3di99l4XE2Kc6q6Y7OM3DIkkJdJmy9T6xETlb7e3Rm8UNkDmWGNp9A
         tfZQ9T8KE1s1EHMslIM43DJqh+Y6NikV6iKpV9XEVrk9wzk7slGjYybke4QuqXTMYW6r
         KC/G2rvOEkkJdfzJrhW2Fo4RiNDK3YVt+x4Yl7xS4Xb52bHm+l5QJEa3OWTKbmAG3fBH
         2w1w==
X-Forwarded-Encrypted: i=1; AJvYcCUDZmbVzCZqDLsduVWdjcECESNDkgR753uAd/gvOO9nS089jVBXVTRr50qmkRnnI9l8fT20tJ4uP/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUPhys1bJUOSysmiRdLTKbUgFImeC5+yGkhx8WjsX55en0pq3
	Ts5lC7YEULEgLROU69/v7TrvYT6ZICNPgL1MCZpiTUCeZ+42ZYlk/qAR
X-Gm-Gg: ATEYQzz7K23GeNOIs4VMbQ+rVIBgao4+i2Trxn0Od7VeP9nq4yqmpt6f/0Iru49tRFS
	o9OniEELW9JfxiC/7xZareLEKB+oNY9N/dSWNQszdDyUVSRuOEbguVPv67zGJ5s2V8Xon7YAeDg
	VOjOrzyABl2Z8XkqNxqKkJxm86fBhrBtvtNxinqW4iHB1VKScFXmCDtxv7rJUc4GcGSLERTjFIt
	Mpntx0jmDMsTd/dPAsi5uR8iQNLtv0waV8pNmPz/Nbc1MWjtFHexc6MXQ/3GRR5okbFQc1X2A1p
	xQg2NvzuO4Ikph2TDAgqKYSIYE1RHHw3GG6h0ZcrpNfMdW5rMz7345+zIbtgVeK3RGGNJrAfyFA
	pdHmVpSHnKpuXOFqW6gDjSsQ/1S9nBeeMAZpWIKcVMZqnqBdksV2D6BDcWgjD+ZdD8TyMv7vHaP
	eE0HBe5f6Avtw9Hbhnyes=
X-Received: by 2002:a05:6000:2486:b0:437:81a2:46eb with SMTP id ffacd0b85a97d-4396f17b1b8mr18714978f8f.41.1771867110323;
        Mon, 23 Feb 2026 09:18:30 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:29 -0800 (PST)
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
Subject: [PATCH 8/9] rtc: mt6397: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:47 +0000
Message-ID: <1d7d0048eb2d51c7b5551deb765951d33dacfec6.1771865015.git.l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,bootlin.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6040-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 152B917AC4F
X-Rspamd-Action: no action

From: Val Packett <val@packett.cool>

Add a compatible, using the same data as the MT6397.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b..6b67d917f8d5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -334,6 +334,7 @@ static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
+	{ .compatible = "mediatek,mt6392-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }
 };
-- 
2.43.0


