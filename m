Return-Path: <linux-rtc+bounces-6469-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jKvjCjNx+2kNbQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6469-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:49:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF0F4DE49D
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6024302DF71
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CD849553B;
	Wed,  6 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOVv0wAO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13371481224
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086160; cv=none; b=AlEzU2SgGAsoCUx81k/VBmUF//IM7CeqNkNmVU4ademu9fF+XgLAPhZ1pcWUG0sfOxF6nQIjWMZFf12LZMjQfB8FRKtGJr4hlTMkFrfmpRXOtVv6vfBlqSo6iV5PZD8XyT83LW66WvBTYbTUipjqqVO3eVUbQwPpOl3neGst9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086160; c=relaxed/simple;
	bh=2WmdsWgyNrqBDcYztbqF2FmZEYG0Du/8DGy0mnaFdXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjrd2Ocs4Zi5H/j49W2c1T+Y8Xu0c66c4zGJgxxx+tWvbM9MM12S78LF74CCA2pjShTwkSPcRpN90LwAnf0cv89B1NE4TH4R0EMh12CFlB3TLZmg60++33kkQWjqodsCBOZr78FV4hLATRHxjt2cH7E6UPbhA6cwpFF+Gax0pD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOVv0wAO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso50377305e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 06 May 2026 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086157; x=1778690957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5IQtUiTVmOMq1NI94r1G4wkYsaH8ZLtA9DARynNJv0=;
        b=WOVv0wAOkE+k//8w9T8Y/e3RagE3G6EifWtyQ8+d3Sqa/6KzeiCg0GxdPzDHMTroWH
         Q32kHKhBRFi4mXiyoO+Qtbu/VmBEw6AUGQOWumn3THTvgpMS2JB+qdilcMTuiABlMrtX
         RIBYltWFge9JKgyEJsEGX0qMKDCyi6AQJpMQWZ4rB/MZxjH0F8e0zfamobvhfOADx6ZP
         rzFy1QgFuHVDlJiKfMGZDLIDSqrT8x0A2dxsWuZvVOBFJ38AOUqmXLNq2Fgl0hL4uwFJ
         E1SjScHrLYCzRyFRrggdELRweVmLGM9Q695Po8pVdKOU9DCq0MIqKyzhD4HYVKrnNKEP
         lPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086157; x=1778690957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5IQtUiTVmOMq1NI94r1G4wkYsaH8ZLtA9DARynNJv0=;
        b=RxXmOTJp6bRl6UVDg77sqQrQ8otNGYyFib1LobbyReebwb3T8r1zXbPD9bhESTvvQS
         bG2Gd/6ZdR98AhI2fT2xS+rfPg1/UkU2HprostXLA1B15fOu/ZQ7ZKtbXxp1ny6hMJ6L
         /1NNawZ7kwX0IdxedzW/W3Gf1n1VVxil7McXULwvp/Wq4ybeYV4F+eYPmxpNNrLslPbQ
         SFihWL5hmcFSi7b+gOwaM0kBrRjyTMSQnVeTfxJADjbCrZ/bahwj32vafmrJo7/7CWHj
         uXoRwYQyrdXAxDu55oWQE52ek1aYEyfOTt7ICN9P9fyZuqpgDzVrSHc492NQkMBVd7xb
         SP9w==
X-Gm-Message-State: AOJu0Yxbrwfw31MytRbAX1fGtH7sA/GOPgv3vV28RLwiiCuYKdQxVbvr
	N6X+dQEAxNstTbLu2049PV2jqORxqGC4NmwGzn6Q4cGcISlTkrMKd86kYkAWdMGk
X-Gm-Gg: AeBDiev+JHNbMQ8IDeH9FGQD+yHy8jGw6OvalxwGOjOmj2tVEaJmSC1QHQ1QGKuicPv
	3Nc9oICslzgYZnJvtDiih3wcsZXP/BDIi0oiah2TTRmH6EcaWRrYbX/kMstgxc8kPPmYmT3YmiA
	3HVUe2sXCZnJmVLvR2YkLlkPGQsik4TMvYK/vxd5+bbkd/EQc6WR1QaJ2t/V5EvWdM+j29CDsaO
	rKUSb1Xn6t/7T4CZc/Qh1tqVwoLefad94X6V1Tp10gK1bft9BjHLcYb9xK/O4LFQfSTLuuUeb49
	DhKgifPvSL1PXutJESPOBNSFZzGVQPdV9QZQ8jXZv7TVPlJevH06mCDYleKKfIVtM8UhGtavMxn
	e7yxsBDjtlCQNWtude8WtszP4j50Mxv1kvVm6nqZU9WTQGkU+xDWaEbXhmI1qC+gjnXDwygwu5v
	O4XvoOzlNkR7Xh7MpDrriOhC7a3pZd+LrGsYY+tUz/vgEyoSUlgviW3slGp0FEeloqHI7cka3gP
	BcT9YXrLsx+4VWmPFjwYGVUbaVrAWBlbXmC7BOUvfGTEjJqanBoWMQImQ==
X-Received: by 2002:a05:600c:3b17:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48e51f18561mr71722345e9.6.1778086157412;
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] rtc: renesas-rtca3: Various fixes and improvements
Date: Wed,  6 May 2026 17:49:09 +0100
Message-ID: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7DF0F4DE49D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6469-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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


