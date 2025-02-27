Return-Path: <linux-rtc+bounces-3278-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEDA47FD3
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744EB1896D19
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDA8233D85;
	Thu, 27 Feb 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QIGi13bM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815E22FDF2
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663820; cv=none; b=QzH3kTV3ZnEdYqgMIxSTOILR9JSenFkQGIDPrbenWjvWc1vqtwDqqmDMpEw4qs+7/oBpqAvxIs2F0e4KcBWg5eGq11YBjPswc3mtfSCORJbhAbUcLOaXNW4RTZa1/WDU3DC1YKvDNxjZ+9eNrrByBn6r3QmxIyDveRpYi/lJxFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663820; c=relaxed/simple;
	bh=FWOYKrmh9MxuBWRdnRrRQ/11nvxWHePruSOWLjprIZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CovZKUObnaqtDU76xDTvh8CXBkANSFeGe1RWVidrg028XQqE/B46jq4XfL6PFVzttTR9LcVQ/BCoXzHNGic8btWraGrlm0HI/BtqTVG9FDgRvMI4tlOVzj8xQvmWy0XUlIWz580k2GaiTMRZNUjHr79BrerkSfXZYLLu7eYk86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QIGi13bM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=vgxXn5Vso/auod
	Ol1RyDdHR3r+vlf4RyaNLGO+CbRGE=; b=QIGi13bMVIFNYiuZCXS0lMsQYPHZ0K
	GHnYVFYDXAGjP7TLbbL8iOKm/kHorGXUSM8JDJVDUAbDSFEnn4WCqtTlYe6iq+cg
	q0Qph/zDM1xfTjDPJDtqFtbq2/pBs7erjcztwz4S21L/X7jAGsWSiI8emZsd4IzC
	CgqCoYWJHA8MNMBEIVC8RuBAqDkXFEP69dkk7quFNUJtXbGqVGLbKFLNeuJYYEi8
	qI38PwviR4qojTT0NSpvbCF3r4c375O6eI/7m2SaM8ZjB22OFNahfv5N/NDfhZvx
	Gb5O/EIBt5MyNbDgVXbkrACLta8WOcJkLGkUI0ZRsvyOap1RybvmVOnQ==
Received: (qmail 962265 invoked from network); 27 Feb 2025 14:43:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:28 +0100
X-UD-Smtp-Session: l3s3148p1@xMrq3x8voUttKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 0/8] rtc: sh: fight the bitrot
Date: Thu, 27 Feb 2025 14:42:55 +0100
Message-ID: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When looking for hardware that supports UIE via alarm irqs, I came
across the Renesas Genmai board and its rtc-sh driver. The driver
basically works but there is still a lot of cruft left which is not
needed since the RTC core now uses the timerqueue.

Patch 1 is actually a bugfix for DT systems. Without it, alarm
interrupts don't work. I suggest backporting it to stable.

The other patches are mostly removals. This is why the diffstat looks so
nice. More descriptions in the individual patches.

Looking forward to comments.


Wolfram Sang (8):
  rtc: sh: assign correct interrupts with DT
  rtc: sh: remove update interrupt handling
  rtc: sh: only disable carry interrupts in probe()
  rtc: sh: remove periodic interrupt handling
  rtc: sh: simplify irq setup after refactoring
  rtc: sh: remove useless wrapper function
  rtc: sh: use local variables in probe() for mapping IO
  rtc: sh: minor fixes to adhere to coding style

 drivers/rtc/rtc-sh.c | 285 ++++++++-----------------------------------
 1 file changed, 51 insertions(+), 234 deletions(-)

-- 
2.45.2


