Return-Path: <linux-rtc+bounces-6626-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1f9TB1kuH2rMiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6626-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:26:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE963162D
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:26:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qvni638g;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6626-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6626-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14B5C302B267
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50FC3F929E;
	Tue,  2 Jun 2026 19:26:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAD223E25B
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428372; cv=none; b=rhovDWYG2XY3Y11i6go5euouQAaawcG3oPTW34Lz4hc11/GOJDp/IV14d9RI348xC4JmRuSxkgQNbj73D7kLaUnyTU2rcD/qF+AgE8IcR59wG7gz9CNuW8lpQj69WEsy/EERRsf/mw0kJDFIVB/ZfuGEb18+8pCGVRgffDvFhkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428372; c=relaxed/simple;
	bh=DrREXUHSvfJv0dBT61+SCt6bwFO9WDLR+vHCiInyVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5OKwy8jNQd7dXTQDEonRqgE2UcJv+P9+yn581w+bMR85e7gvPsCAeL5d00xAkNrvWKlN5FROvCBmJpg6HnMcK2ZBuUFGW8JUI5ul7F3MIEnL+SDFjFG9/o0TUk0s56AnnCVqAZkvEsuYh7cHZUj3gfuRMd7sHizTYu5CxRmwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvni638g; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1675870f8f.3
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428368; x=1781033168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p9Ho03N9vRR2ohmpvgyy8QgtZ5OEC0NyhfwgSg9sXhg=;
        b=qvni638g9VHJTcmTvMTNY3upW7AbYkUj8qqxB/T2ZVJAYq75qoRaPLL6qBCYQnCaEc
         XUn9EKTdT56heN0PX8N0a5Je6VNmyVy1LrW01LGqSTWU6rSFMoN2yRSpJccYA2A6QgVx
         U/rS1tqmPaQcYzZhJ2vpLxNBh1mrwtvaf+EXgOdECzbxtUQOWJ4qF65cFB+pAxwi8m0J
         qqLqheHlbZXnqTnTpDZ934Lhygll5IlpOhnDRMSz1X4WpskYmujKWfpmZIHnKSbYnDqq
         uQltw7A8n7HXYZNxZ/TpZ9BQoXBZemEjJ6A9pUKEDCbhyh2p803dXKtAKz2nj7kteFAg
         2zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428368; x=1781033168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9Ho03N9vRR2ohmpvgyy8QgtZ5OEC0NyhfwgSg9sXhg=;
        b=TwROhsOL60FkV1HJUzcQ9Gh2Or7kZlOWBF98bBvB6RNgoLGqDV0k5FF0C8ib7Vhj2p
         hmF1KaG4tuuBSz4dM7rw1OB7ldnJNBv8Fn8345X7IWZIHWzybQ7XBehtyaRdm6FVk5WW
         i3v9tldF/E5B7Nw2KUFAwANf9I3jCWIQdMOuYcR5edjYYL7cBC2yK9dfGI5l7GVHTRuT
         BM9omG3NkXeYMIgA74tVleEG5tfcnDoaVB0MYJwXiAqDWYTMmaWE6lBvDsZjgTjoH5tS
         hwF+ZRb7GSL16cjm7ga0fnITf0tK6zqoIG6Zql78YkAF3hMQ0CIv3rzmBck12qjvbzd1
         knuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f6STP7FI1eye01drVU+U7QKcL15YsR4DGkiP1WiGkDuau25sEoDsI4sACMH6Gsacs11vwJNZKHzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKetprS2UgGSOCBilGxVJTNHOhn1Vk3T63unEfR8ChszDkxiVE
	9yc/oRrv6XmfE9ixZo7yZpWuvarvGU3Zfg3mJYunvcFw51ajpVwApUKT
X-Gm-Gg: Acq92OEvEb/TUDz45sLmSxpbmiPV+gp0TzcOg47FUDrKshlEAHn0g3mv0N/jht24lxu
	QApEEcRBz+DB/fsxhR1OznwogSTUQzf9H9P0mXdmLtY9hog1RSMNqZ9WFHK9NJRmOPfAXur5PAS
	oBC/37VovSFzNCvDGvpIGtKiGRaFU26fBMW1ZJNuLvBzzk5cKB+CfQqapCkm9WLdxBpOwoUGO0b
	yvs6WPinCkvxLfOEPXmOSp2YnE4pwLd6WE6zKt0KFMb7p1tl5THLDzeMsQxhefRGAKJLQfSbGmc
	ccIjABg+yEQ5IAVijCYaM2I3mzQN8auStY44ZpEB7pRVTflUDARA7NlLNupCNaixWP512NwncND
	3Gt9TBp3fZg9OJlyypIiV9AX0UT8IsjWzCSLUJCnMt53+zNAK6QwjKzk2fOSgbE6sPvOQTvo9lP
	9awU8mZkYizz1JW+vxyomP4xMVUEHJwePSI0E9hWmjO3Uo8fsvZEcCNhB4wggepkOwJCqtK+/Bp
	NN/Ccew3n6vsDCgPc3DmHWioXIbjCB8QDeuTF0BpheV6qmrYWMhtkAD
X-Received: by 2002:adf:e00f:0:20b0:45e:f3b1:52d1 with SMTP id ffacd0b85a97d-4601f504eadmr761615f8f.9.1780428368146;
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:07 -0700 (PDT)
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
Subject: [PATCH v2 0/5] rtc: renesas-rtca3: Various fixes and improvements
Date: Tue,  2 Jun 2026 20:25:54 +0100
Message-ID: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6626-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: AAFE963162D

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes various fixes and improvements for the
Renesas RTCA-3 RTC driver, including:
- Fixing the polling condition when clearing the PIE bit during alarm
  setup error handling.
- Checking the result of the RADJ polling during initial setup and
  propagating errors.
- Correcting an error message related to reset control.
- Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
- Refactoring year decoding logic into a helper function for better
  readability.

v1->v2:
- Added Fixes tag for patch #1
- Added RB/TB tags from Claudiu
- Rebased the patches on top of next-20260602

Cheers,
Prabhakar

Lad Prabhakar (5):
  rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup
    error path
  rtc: renesas-rtca3: Check RADJ poll result during initial setup
  rtc: renesas-rtca3: Fix incorrect error message for reset assert
  rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
  rtc: renesas-rtca3: Factor out year decoding helper

 drivers/rtc/rtc-renesas-rtca3.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.54.0


