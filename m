Return-Path: <linux-rtc+bounces-6628-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nx8SHXEuH2rUiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6628-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:26:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE5631645
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LcNIGMvP;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6628-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6628-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C26E73018D55
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F203FD142;
	Tue,  2 Jun 2026 19:26:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A63FAE08
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428374; cv=none; b=t49lQb8w9r8uFKQ95Kp/5+EtO5Q2EkSPLrjiCsv28GkkYyyI9ZC85QpSCQoqVjxqEiV9gtL6atgEFQKYDE0JAwnp/hLp66RpLA1tgTY+4f1zRIEv39yrF22ulNLflK7AHeVCwlZg+hIeXB71W0Q55m/n1rXI1uc1PukAVhelrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428374; c=relaxed/simple;
	bh=Pq0svnGPa1u3UfwlKgWp463B8xAdVz9dn0+Hs3N2waU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZkjkGRWi/1d4Hdrq/Rh101A1hkH09cH5pYu7e/CsO6nr5BJC+ybVnTjt10G30tqN4VpWA5vTbtdkpA/FADzLwdAQ2OL3VNMAwpq9OOyDkQM6jdblsR9WtZJ/ZNvMdYRxvnayqwbyzIohkZv83htW4nXwWr0b6uXt73DIHrpdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcNIGMvP; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso3959557f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428371; x=1781033171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1C75smfFsRKbCTgs6OXcvR1GgVjxJ7f2dUMhEZaFrg=;
        b=LcNIGMvP8AsP5B46MFNPvJ3RepFhX7A60l2PuXzptSyCbTjEDvTVayGcl85E938Mkq
         pr5rDfODU042i3CwCXIgZUv1eOquY15T2I/qSIGYU3UqvMwN2083SXec7vw8v2IcDWkv
         w3L2AZFadWmU3qZsIRojAKwkpWexas8W5z81XUCf0gg/bjbUi3fcvYcqsEFs4mPXS/NP
         BYE2Z8tVP8hvlDZJleYhOdHlRUHX7mVKjzcLI9ZviNIrqC+17XpKHde+jgOK5Z3qC0Yz
         iv4GwG65OM1QBDgeXXiSTPhtUb8J6rbPyGiWhPT3uA7jvrs7Z59BJboTo858UBIS/0m5
         dHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428371; x=1781033171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1C75smfFsRKbCTgs6OXcvR1GgVjxJ7f2dUMhEZaFrg=;
        b=LHUfBKSmJ2OXdvQZBvy3DSp3lWsHLintr+mgCOKJune6/YsbzLlN6oSmET4xLzks39
         ouEFfFhgy40gJd8KNuYfFh3Yz0200UUnxJHvYpceXR5OtSARewW5z0kpFWlBm+BJW+eU
         +HOcLT3yMhH9ARlxNs9yOAHFPjeqdrMoQ+NYYiOqrlwBZVQf1iMU2CLj2VobBaQnP7Re
         M7FmPMUXZ3XQGZpwW6s22RxH/XzWlnpMpboA9kXOIkSDrPhAWSZtTtHgDuXuddp6gwvD
         +sHU+tV9ugTKfW9KHm8S4huMIm2Zqbvsn8nqYNc9AnlwzYiTbwqohod63hwF37OpFHXa
         p3UA==
X-Forwarded-Encrypted: i=1; AFNElJ9ftLSFcQhB4pfKbwH+0dG+y8UvDnSVI7O2ZrXhnxsMPIMxx9cley0958v0OsdFey2ZbDO8a9X2tU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+bVemtpLfDN19dmdb6St74yIWR/mQY3RdTEXpiNa4CCa/+gC
	HLXc1XkJDG/HxpSRhigpuQt+59BJ3fL1ojvwWZQC0hRcU1HsGaDkhM3X
X-Gm-Gg: Acq92OGil7bNJhU8+Qs05fiugIT5PmvsMGKbpjIQZE/OaN89z8UhpNBWw4PffXj8fFf
	ji7EGEEvb3MvxpbZ3FveGBHhk9aS0ZdPX6TK1lHlw7MBE8grnVpG/sH+5EwIxznaYbcZQ93Tvbo
	rZBlpUOh3tYFofiWWpV+rbBU6tHfjkh8QkOHVi6Elkt9xQUUriVlZF6uGCOuhNsDhNHiYcge3Z5
	QNbJ6SlL6y0jbM7l6RWoDqChZx537PyZx6WLz/Jdb05LgelNMprzfAiwmUQ/lANdRPHOu/1T60Q
	fGepsKiqFPd20YQAKL+BDImEbI9tOnH5zvHnJYmEzgYAWLF0n/eA3XMLVUET5pRBUKoXXcBPLjC
	ePkcUOqzj22jOS4cnjtOSzKGTNc5HrG73+/ZsjSb9h6IFo+SNRVCjEFuUVUjQxvFxEn1CIXjhII
	XLX5s7d+bPOlu6hMjI4NLpbSUfUX8SAFBfzcTEUZ9z7XYlyHWI1SmodLloWup4ChYss9s09be8u
	ZA6ku8VhxI3jZ5bl5fkp0qZIQB59Z4fA5lElBxJbRzJoJTOywNdC3Zr5k/JCDFs2nY=
X-Received: by 2002:a05:6000:1a86:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-4601f6216b4mr1021407f8f.23.1780428371405;
        Tue, 02 Jun 2026 12:26:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
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
Subject: [PATCH v2 4/5] rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
Date: Tue,  2 Jun 2026 20:25:58 +0100
Message-ID: <20260602192559.1791344-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6628-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76CE5631645

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct a typo in the kernel-doc comment for struct
rtca3_ppb_per_cycle by fixing "adjutment" to "adjustment".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 8763745b9172..97e7e65f59a5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -103,7 +103,7 @@ enum rtca3_alrm_set_step {
 
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
- * @ten_sec: PPB per cycle in 10 seconds adjutment mode
+ * @ten_sec: PPB per cycle in 10 seconds adjustment mode
  * @sixty_sec: PPB per cycle in 60 seconds adjustment mode
  */
 struct rtca3_ppb_per_cycle {
-- 
2.54.0


