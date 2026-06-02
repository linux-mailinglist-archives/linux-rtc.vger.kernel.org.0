Return-Path: <linux-rtc+bounces-6624-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mhohJq4uH2rXiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6624-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:27:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1D631653
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ld2Vlz3k;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6624-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6624-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1203009CEE
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B698E3DA5AC;
	Tue,  2 Jun 2026 19:26:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954A35504D
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428371; cv=none; b=ZSnnAT3pho0cuny+tgo+3TV31YQH1nKKFNEnSp/DzUyJplE94SjFi1opd8QgGwkDtV29yZnuQ5/kdikO8nssQZ8m66Wq7+dePYLk3yVUWB7i/Qee379DUVyQVU7mvmepoSTXX+Y2tkmUdpJ87wT/OlWNOLiM7sV5/sj/15zwaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428371; c=relaxed/simple;
	bh=Rr8JzWohT1tJsTGXm2ibqCRdqbA1on/DZn4rk+VclDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGsi9FpGyzgPjTc+iHsKwwDyUWqWl//V7U4svr9poDcskm+5zHDiUh2md+nokFVOZ8ZoLBSPj3MGpiIhoyy5H6UGp2AW13/x/F7oaDwlmbTgWcExentqZJ9miPYWo4SJDsrT8LgXp4rlzB3Sra9XfR1YHAfQvBg/1bdzgxhimsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ld2Vlz3k; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b613a17bso317085e9.3
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428369; x=1781033169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz9Gm1t+wb2XGdBfPNWvyntpJxCorkDCnuo7sD8+Tmc=;
        b=Ld2Vlz3kElhVFbe9t/6Bbc81i8nhWuwVt6NJGqBnRJITR98uaiikfHxJw4BTEqNp9A
         vxbETM2FcG3jzONh14FE8cRC8YgmqEtolIp76RQv5VLlsCjL5KsQuNiIbZfdY2WdkAn6
         1Yo6zZ+Kli4XhkI1W2ixLVut07uVWwqx4zuEb09GPsW0jsv9N/9tNY3TxlNQwEEnGhOS
         3XLgiNqypufgkdx3gFHZ5N9vp4x33hImUvmIzmrX73DU5fWNjPO3UOe9V0ahA1uibdtV
         Iz35smpoKktR4t4J2gTUx2Sd39Ng6hb1ivNtX1jrABYgppkueWyd6SKRD0Pd8ywxkYjR
         ojdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428369; x=1781033169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gz9Gm1t+wb2XGdBfPNWvyntpJxCorkDCnuo7sD8+Tmc=;
        b=B3P2MV2Ir3SLOtlIWoz75aX5Lsfa6FStNnAryGO6zlBB/dihMmfA6drrnx8uUXp+dA
         0ECr5kFBSKL71vmBF01SHind5VWoleThFwav+a4SQeJojwL1NmYy5X2fQWEaHlBDeO6a
         hV00ViWrqy86FuetiLfG+Uez/ebMXag5eEo4OL0qtcYadN+9Ygu3tWeqy4E2X3RKhLHa
         ZpeLZQDcSYTPh7anFmm/7thMa+JL66X04Woak/g17YyHzOe8JU9RJLa95aOoY8bVh6xH
         3yQHzV2d9VRti16nRqQRfFKscfXbcaDVBMmBdS2uBIowG1j3kQVAGjsoI9IWvqS3vY/C
         iNOA==
X-Forwarded-Encrypted: i=1; AFNElJ/EJHqrXjjzstHPD/6HRHfnT0X6uplF5/PPT29j79PCl5Np75JTLmfoMnGii5mYn09CxCQt6Boxums=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtkQlMFhMbGDKKIu74zaQVWt8AS4/2V/VwZD2DNxt+oPuasvo4
	vcFvOUwvmAeFbM/K78zurebGKbAvPE0Q2l+vClNxc+GWJKf201dlVmUY
X-Gm-Gg: Acq92OEoNX8W24OgE4XjayRu+OHiH04ZmTH4ctY+85LgfWYodzvvtK5RieTPGmOwmMx
	VEnf/tp5jew8tj/46ilNv73wFyaUqh6qhvVb9NY6PxTQ45jOE7TwCVbPW5onDKo3Ds2W0LxroHj
	ze3P+yCX1eP0D0oBL7CguriyfY5NG7yUQIOwdFAsWHbeigQnkNcHEkp6tMqBhgBxFXWhR1qfkX5
	sM6+7tAU4KWgO3qj/jo7mmnCu0YAk8m0p31NJHJhg/IEj13SRQxqBzWgLbZGzcAhbDe0Cvk+Fkz
	zY0v/T7vlY4X3/Qi+9sNdqKFDC47sDCrDN4/dKvvN5ScR+xOe/hhAEICUUXk0H4i8LSVWSW6KO2
	XnKVXWKqgtRm2Zeyq7BDeKvgRYZCyAF6X209aPMGzlbk+tQnJyhfGm6TuL19SO1r6AzIXbCRwhL
	74LlQ2fcowpY9gt4o//9vQaGCWl/ri1FsNXZcEw7H+89NrXMdghw0EK+o+tjFgX2RuzZd815K3x
	aWQxH7k8RhEFsd+HvjDCqBL072GXi+O9axSHx3iVXor0Qr9NcBDhqGX
X-Received: by 2002:a05:600c:8a0c:10b0:490:9d5c:a3e0 with SMTP id 5b1f17b1804b1-490b5e8982bmr2280875e9.9.1780428368805;
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
Date: Tue,  2 Jun 2026 20:25:55 +0100
Message-ID: <20260602192559.1791344-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6624-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9E1D631653

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_set_alarm(), the setup_failed path attempts to disable the
Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
However, the polling condition passed to readb_poll_timeout_atomic()
uses an incorrect expression:

    !(tmp & ~RTCA3_RCR1_PIE)

As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
condition effectively waits for all non-PIE bits to become zero, which
is unrelated to the intended operation and is unlikely to ever be true.
This causes the poll to time out unnecessarily.

Fix the condition to check for the PIE bit itself being cleared:

    !(tmp & RTCA3_RCR1_PIE)

This correctly waits until PIE is deasserted after being cleared.

Fixes: d4488377609e3 ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index cbabaa4dc96a..2dc080d0eb6c 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -455,7 +455,7 @@ static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		 * specified timeout for setup.
 		 */
 		writeb(rcr1 & ~RTCA3_RCR1_PIE, priv->base + RTCA3_RCR1);
-		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & ~RTCA3_RCR1_PIE),
+		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & RTCA3_RCR1_PIE),
 					  10, RTCA3_DEFAULT_TIMEOUT_US);
 		atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
 	}
-- 
2.54.0


