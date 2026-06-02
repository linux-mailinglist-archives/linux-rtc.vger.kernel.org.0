Return-Path: <linux-rtc+bounces-6627-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oq5tKf8uH2rfiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6627-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:29:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ABD63166D
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o0YRtmGJ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6627-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6627-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C251304399A
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B433FBB7E;
	Tue,  2 Jun 2026 19:26:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C513ED3DC
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428373; cv=none; b=CpjF7NTB1EL6Y8vhIdKVZp8hnXmIfb18gPieLgs1pSgRRcLWrDgo3u2CRfrDCzz/pGEPKvsiqOOZr8JFmlG+s1pTw+Ly4cQlmmH8Ccrl2RKHzpIyu1xWeuRnD/AuukWr1zOrlklKFNptiNgq6e7i32ETuKwWSiikKXadyDYPRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428373; c=relaxed/simple;
	bh=KmqoBxF9Fq/rxvKf5KdwMsGgv5Iw4McuSBL71dPTzh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKXS8uUh3DnrCXThuMRug17fI0B+NqlYtbWy6UxCzbatVChyWMblN1G/4gPGd4uoxnBd+KAlcAhEoc5HflPC3Povl4f+lqyVj5sFU5MKrpKlHM5iwlu1f/7E74f3SUjuG0ag6qIhmQmUFc+wxlonrctWHSN1fe+NYjy+gzAanUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0YRtmGJ; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee6d32402so3156853f8f.1
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428370; x=1781033170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuHBcNAKhq2nFa40i0FpC1ftR1msEUqJgWkorTy+ZHQ=;
        b=o0YRtmGJHfNW25OhCdNYDB8gvIJdIQSYroRNnp8p9hndjEa5sFqIAeGEhu0y75j68Q
         krh8F6xRcNasVf4+xTd/OMFT+z3mla032qj6+XfjYNdEc0Xu0r5fFR5Qp/4FzPuEQC43
         SCjzRCWPamyCVEHghJhrTeNpZm6BBYQOtW5SObecX+Vk/S1mhdGy5tVC7T0KPCUBz2Yx
         8a5tMwZ+BVEGe9rb+A6BlWtEgF3ApULFL4vS0BCf2bBvhyiRNSN5sTKqlOkSDqvqdBfe
         COpWafOYQ3je3r+60wSl1wglkOH7HZ9Qcb1SIIgGAKkiffSUTrzrjkUx+DKLBoNt/jXk
         ozhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428370; x=1781033170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HuHBcNAKhq2nFa40i0FpC1ftR1msEUqJgWkorTy+ZHQ=;
        b=d2Hl0IpDVcxfORxqAkBFepnlPm6LdcXkzQTMiLTfVXcbwt+bOlXUEd3yjZMhXP0jKz
         hLykWq8UyJUjRV0AnEq9iKalsmXdDhCWIdrEocznPff74T1HD7vKNPrb4LF4fBQl/Fmw
         eIh2efgwiqspgncKTkibmQdkVCMHEj+qletGZ2XE/hTkz1qapA1KURZofMc46OCuB5Ce
         7lPWnulFepEQohNNqALBioTLrD/+MEdtL4d9mz1r+RtTcA3KvxYJjMrDFM0MOs9gTRl3
         9jr1PYp5TLaqnr3M2pzQvyy1uoOpD6HbbMSab6WLcPLpzJm9b3QmnynIBL8h4zl19u11
         aCUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9t4U3YYPindzZz5unRpnvvhtZMF2GMRPnoZXNANY1ZlCvC5uHIBn51WSSup94YqsFEuNsQYbApadY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxbA4rY8TwHofexEi5APNCVIk3oRJQ/cLHQ3xkx0P7UegAL3T
	NLkhstmI1e5PBNOlEWOcWSH5nw+d+JF+Rv6Eyn2mDTgpyMT+MEm9P61P
X-Gm-Gg: Acq92OFrRC9D9A0EUMvQQNm3EYeWNaLAtO3x8TL4SLuH446eNdSuwPyTjIIlCklhRiX
	h1AThaCdz/YExt2moWaiMWpAuUPkzmXqfrnbRKSV4Wki/5zF3DfRMRnxXGieqd2Gp7lo1CPF3la
	8M1ZAg1Rj7ogiyB3aNdIWLW1/MBS7VB0s96O8oOkTLgvOQPC6bgyNylBQx7g36+HWLy+AITAYpm
	5ltM6rVvVCSvoe0/no1J4TVCqCK0PhdVtprh4gXA0wa8mz/us/At7Zr2TWRt5zxZliCyHklWhmz
	OSz5UJRf+1gIdUOc8mxUBdafF+Lv7aOeDekKAdmu5ThIHJubIm5sv32/ohn4rWdScdynieL/LFv
	ioH7T8jBRoE5HQKfUDh5do7I07awhtro+i3evob7T2qVM0iN4cO1WbbmMX2tEuIPElisXdy9gn6
	LKIkywzjDRdnmPA0YsvOxxOhlGhes9WH8BXjDAy83dLJmpr6PaEcfWP4vEoPZAFppERMgT9i0uq
	VTtK2KOMiyCko7+rd242JMnzhQgpUyVhh2sAEw0PRcf9qWOFf9g0v8V
X-Received: by 2002:adf:f2c2:0:b0:460:1a36:deac with SMTP id ffacd0b85a97d-4601f6087c7mr745571f8f.24.1780428370407;
        Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] rtc: renesas-rtca3: Fix incorrect error message for reset assert
Date: Tue,  2 Jun 2026 20:25:57 +0100
Message-ID: <20260602192559.1791344-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6627-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19ABD63166D

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the message to "assert reset" to accurately reflect the
operation being performed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index af2a3878289e..8763745b9172 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -702,7 +702,7 @@ static void rtca3_action(void *data)
 
 	ret = reset_control_assert(priv->rstc);
 	if (ret)
-		dev_err(dev, "Failed to de-assert reset!");
+		dev_err(dev, "Failed to assert reset!");
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret < 0)
-- 
2.54.0


