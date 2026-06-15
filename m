Return-Path: <linux-rtc+bounces-6659-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuSDGl4fMGoJOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6659-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:50:54 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A47687E5C
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:50:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dkSSk9kx;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6659-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6659-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 103BD30987C6
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D58407564;
	Mon, 15 Jun 2026 15:48:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949013FF893
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538501; cv=none; b=PqJ2Q6uCraYDlMuZ2oz52+LnoBeblLuMfILjDayQ6KcyWlx0E1AjSOBJ/p/cVqnt7zGGNW02JImPf6IB32oB4fqVqL4AODuyED5Pd7PXmyVdpMD6Ek5Jb8uz5sXFPRBkiPXrvY/7DcfTwxttyjAc8ht+zSflRUVgoMQhXOH1Ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538501; c=relaxed/simple;
	bh=9AQNjOJK5XErQabY8MlMHTqGBlzsAUQVv7/EoWhSEbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZybHmBsJdIELutRHnc7Lt5fG2eJqb178D3OkurcmKsuOAKDKKTvlQAMhe1ZgLUbDR70zQD+b8z1h26A3szT6GCMFLzHRFcqOsW4wKQcQqQc9+tjTK9TrMsOyto5heuhLlZZbUWwCbMCfzPYWDcLgmxG8QfGuiA3X8liTqVuxGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkSSk9kx; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46066e640easo2037092f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538498; x=1782143298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GlvO2NvI7uJOjmN8ub/e+ys3p07eKm6QxwA5qBV3O6I=;
        b=dkSSk9kxddAC94HcDJZX56QPB/0GDtEkqU+BWBivECIuJxe1xLnDBTx+GdRcvJnCT5
         SLaC4+6Qej10BS9zzGie48MWvCKaRf1h0w+1a0AGQMtT4dLpwAmudfakKGrRX5ZNpqj6
         8x604rDmcjAYPs8mw93RPahaBJKwhDy+QqiKZAQQ0KT3sEZMvL/AyQi0gJR2xnWl8jDL
         98/RFRmcY64roC95zj0W6CTadpEVPNmVlKWmBVPA7Ovc3cOAksUbaM/aV+Ct9r1HnSgz
         Pv/7htGKtmnKDrfnyJXDl5eZX5PUBYQR7l1/gB9MAi33PNIu3DK7kCxUEgh9ECQTS0JY
         2UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538498; x=1782143298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlvO2NvI7uJOjmN8ub/e+ys3p07eKm6QxwA5qBV3O6I=;
        b=paBWA38RlFu/Ei4b/0+8QpZ97BqHj9DbOFxVXCV8DmNgYD0RgHFGWEtJXB+ZPWZI/Z
         Aid6nLAvxiOUHL2mehbG1Ts7zZnR94VGqm7xhLtG86oN450yr/yQ3uhWoiRo0YEZD5Jb
         ZNb/yU2h/HahpPNNswT4KiXJBOp9ncMHu19j6CSWN5iYj3aTx2h+kE84/nG4r2QDt15R
         beZWB6jZPaOuivB6olGCKQokFKCBQ/Ww85kASTAPbiCKjQd+jQyintwb2pn5o/zJgP0b
         1t4Fq8jZfOjbUff0CrtBh79G82m3ewJf7MqTA+zGHK4o5v5N1f0mIZDO7e3nP5MUwMfu
         e43Q==
X-Gm-Message-State: AOJu0YyePwT8Qc91ZrLmu0H6fVZ4CJeBUzESfBpwAvOE2fLRCFjQqTFn
	TNsgiDkSycfiO3n17Gq81yulWu5MmOvlDiTYnnq9/6kEl8hxiXzWi99t
X-Gm-Gg: Acq92OFVs1iBMKwPIET8eFo9VorTA/MfSLSGcia0lu3YTMq0SgI023AWJL0qVyw1ooI
	5C/DGOeEbjRFgPK2KA06FE1ankvz59O97+awm0uD5seirq2Ll06vDM9iGPDrsmzFHsnBsvs81rr
	zim9MJESivCLe+JXF1Kv++qjmPqfRBsk+6RIoBEhkJIZBhTUe6SJ1KuZZ8PbOV3uUaZMzY1yo1f
	Ip1jeS5Y1MslLmx0S6JjzbG22FBCyJgTlxswAuBtCEJTYxbEdKXGtaVNlkrGgOTvzdPrXf02LDR
	QZOWyr/v+ooSeSxGcpISOFJGIeK7T6wh3jkmLjseu+q5vzM4CK4FyTtt6M+IxBL/u48BlG7wE8j
	2lLBCg9lda7eV8WL7ravy/6GDnBz9HIN9lSFTbCRn0heU0wsIZamrh7G9l1Z4HpBK8Sm7ZtRtuc
	oGTPJO0qZC4lu7l9r1oXs7fNeRnfaUluWPZI1cZsd+4LFCl2/7cnsnkl7u/KkYkJKerzx5XcAwN
	mFOgaYqvJ9jFpZdxJLnvgKiZTkVaITYYAIJ
X-Received: by 2002:a05:6000:4284:b0:460:e00:121c with SMTP id ffacd0b85a97d-4606dbc6792mr20607488f8f.28.1781538497778;
        Mon, 15 Jun 2026 08:48:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:17 -0700 (PDT)
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
Subject: [PATCH 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 16:47:53 +0100
Message-ID: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6659-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05A47687E5C

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU and
RTCA0TCR registers present on RZ/N1, those registers are not accessed by
the driver in SCMP mode, allowing support to be added with minimal
changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

The series consists of:
dt-bindings updates to describe the RZ/T2H and RZ/N2H RTC variants,
driver updates to recognize the new compatible string and enable
support for these SoCs.

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Add system suspend/resume support and wakeup capability
  rtc: rzn1: Sort headers alphabetically
  rtc: rzn1: fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 182 ++++++++++++++----
 3 files changed, 173 insertions(+), 49 deletions(-)

-- 
2.54.0


