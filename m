Return-Path: <linux-rtc+bounces-6665-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2fTZDVAfMGr+OAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6665-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:50:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F05687E4A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qRhQtzFL;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6665-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6665-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CACAE3004607
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CECE40910C;
	Mon, 15 Jun 2026 15:48:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39FE4071C0
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538511; cv=none; b=n300j/wBOhWUCW8PzO2Rm12UzS+oVhNSpzHYhOkAPiJW8U61maaCKdBPVHx8xpmCzkyH+z/4kAEQqmxqbH/mWGlW+nrWlBpBpJwKJCV/GbHeq7ynB1Sw1coaYLzxIOr4ehwcRk1VzYdGlMoD6DyPUDC/cSlnYokmCcwDs8tYjOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538511; c=relaxed/simple;
	bh=CiDfEf26POXCK6sG7bX8RsZVbR23ICwwiGimYQovRxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLTXu6GAjo0pYOv6QrVR7Jm2LIo1TRePdpRdzxkdFPDQigwVsNcXanteVFeuLkUUMkPmxgTBZOLaVYnAEGEPwlLX9wnFEQ59psbZE0oqkLqQN5d+9cqJTpzddWqZKealpNynSHuAatKWV4KYJqPo5OIxpfPWhRHZwGcCeu7lTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRhQtzFL; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso26268915e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538503; x=1782143303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=qRhQtzFLLgd+BfIxcPNvMKLplR4bfYk2iF0HFq9yHlFFfjLZMulTtIIJ1C9FWSHbxd
         9N6gXdMuuxfe6hV/QpTOBnLn/oeOQQkusM8EYloTSkISf+qGrZ5XorIiwC++mO5T5Mu3
         KCKTskt7D6mLpumwiPk3AQHGjWHGdHTprOgxkV8N/9LSiWEyLamO/Vf+yHVmU5+VRWP9
         PX15YLap8xCHEFXemcnEghG0zQf36gJnpgdH6chvOb6xEr9tK6b10FblMWP4I4R4lXmQ
         iQCD7CwifFmQiAWTLrjml1EYp0cvsyRI4q2bBMduepJiYlLrxH2RaIcWvxn4rJelDBp2
         66Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538503; x=1782143303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=aBqCsXP8RrnvswRwCZZPMgcl+0d0fTSoKD77XQOyPEveLZNbHpvDVu00zTcrQwEQKh
         Aus005ud2Jb9nQCG6Ad7TN9sk8XzY37p9r9OxJeg6Q+02dYevZe3p+K4Q7l0T3wnDB1m
         Uc4Ca528KMfx937c+wxmNFdkYASzKcx8dFqS47qnp31RWpq2GdAQuCMqN8wrTpkOR1f2
         orx8Nk1g9OSMEavJ4rsMmALVSAz4NX4pbXR1D1d3dCAN3w375XBm2uXbxbecfhp72Apu
         PXce1jAzAMtihg9r3/NvIL+CoHmwi+yheGfXdrupXU0EbN/h2UMk0HMQseYGCPBdbJNf
         Wcnw==
X-Gm-Message-State: AOJu0Yxx0RksFuDyFmV2Krb9048/m0xoSjH7IlkxOMKlfZ4dtTwUMear
	/H/ODCeoxztuIpwW9ONRrD0MHz9mO1mWI/OFUkjb98Q5pV0gv7kXslOU
X-Gm-Gg: Acq92OGI1BefvwDTZ7A7xlsK3RKAZh7cfrGWWptkOjVoKXqwZ8ZFJTovWsSXh8VulW1
	oQh6R7RzATqchIopdD8QDsbpQWZ6IaGdhXaNsYuT2p2n98VDV0erVV3Xe2Vz76pv6kAuq2Nw1VE
	TzvfEJeiWpFbeqp6YkgJwoIX8nlpNkByRrij16smzwKasPCeKU6RA1oA2SdZiUKWJ9W+x28eKs1
	6ydfNcnrur7uj3JC58m/QZQY3XI7eu5xlumAyjivAkJeRPCOTtWylMs8vNfuY/2TkpfCCpFpiRf
	FKCnwM0QoIMi03LDizJm9nIltGduesBJybM3j8Dy9urJBcI+6GoMxMtikHgjfMCJXfLcr7OZeYC
	9qcH2Z/CSGGHLhKo7b7t3Y+BxtQoVjhtQZaCbV2JALHN62D9A3hnB13GrrCeVbjJ4SnPk1C8YEp
	OzGJJADmBljrktcq8lPBqJF7NITIcAAd3rYoXQm8yFRdsJfSS4AcfNjLDNBfWQZpWe9YAlii5Hp
	PyNsrD4kd54C8DJ87RmvRlGlRMcjGZHLtmC
X-Received: by 2002:a05:600c:820c:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490ec4e75d9mr194107115e9.17.1781538503048;
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Mon, 15 Jun 2026 16:47:57 +0100
Message-ID: <20260615154805.1619693-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6665-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F05687E4A

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 364afc73f8ab..764f8b9ff742 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC found on Renesas RZ/N1,
+	  RZ/N2H, and RZ/T2H SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.54.0


