Return-Path: <linux-rtc+bounces-5299-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B5C43498
	for <lists+linux-rtc@lfdr.de>; Sat, 08 Nov 2025 21:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5525F3AFDF2
	for <lists+linux-rtc@lfdr.de>; Sat,  8 Nov 2025 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E024DFF3;
	Sat,  8 Nov 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="swmKNo/A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516581514F7;
	Sat,  8 Nov 2025 20:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634366; cv=none; b=HqrR7e4AV5ygalh0LIZiWIbFwosn8ZoJ1t7xgHhLOyNnrPNjp6eyKSjSpHCedG7DXup7HpPjv8YlHBvGRRL2NDYrej4e/aLnwjF7Tbu1755W6dOlkrJBMMpajmD9z3NBi2scSZzLV2+jAoYmiL/aisDytYDWyj+8IJpvEy60Vsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634366; c=relaxed/simple;
	bh=y7lew189mMrCo3zurAmVHO826EpyEa0ICuaSbzxg61Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nz1qoy2MUCJdwKINyCtqNKQ0+pY3MtVT788bXWXGiez52i8yHPWRI0j34pLIg0h8pkRAFg4ArEoQNQz+v+fMPdae58o7250ydFQMZ1/sxRGtNT4SI0LExoLKm2AXoCo9OLXLIAcAF6faf7GdtTtsn5mEI2z/NQn7wUcm8kYrlSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=swmKNo/A; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B1B531A1953;
	Sat,  8 Nov 2025 20:39:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8883F60710;
	Sat,  8 Nov 2025 20:39:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3584011851F06;
	Sat,  8 Nov 2025 21:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762634350; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=TDKx9+DyHgrLIn9ZGzxo7YW4+E/XAOyJUJiTanr4xRI=;
	b=swmKNo/AOV4tRRKg2/hHxNS8t254QpgI6sjJo+1PN+khcjskFRtlDn63gWBoUIXMeptKWh
	W9r2/BSAWEKaR4QvJ0uYaS0O/FYeSbBg3zfTwniqKV+ld5T9tfL+WNvcapTIf9mbdl5Xq1
	qLWtau2bQJ9X7j9yJnA6ymCXbVrA1bOrEOQwoTIP7X1Qg9rzjahcHGJC3TtUre8u1in1gO
	KUpjpHj7XWEBifB+KORkKSV9WAjREVc0Z8fTxarIrlwhUBkq4ZwHr+Ic51/sAvJ4S17gOD
	b85fywl5GH7zmARK6wyetXdiW643nGW+WWZMpAB8zjlpTebJRlwPafA3jZoHMw==
Date: Sat, 8 Nov 2025 21:39:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC fixes for 6.18
Message-ID: <20251108203908b1400ce8@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3

Hello Linus,

Here are some fixes for 6.18. The two reverts are for patches that I
shouldn't have applied. The rx8025 patch fixes an issue present since
2022.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18-fixes

for you to fetch changes up to 162f24cbb0f6ec596e7e9f3e91610d79dc805229:

  rtc: rx8025: fix incorrect register reference (2025-11-08 20:56:12 +0100)

----------------------------------------------------------------
RTC fixes for 6.18

Drivers:
 - cpcap, tps6586x: revert incorrect irq enable/disable balance fix
 - rx8025: fix incorrect register reference

----------------------------------------------------------------
Jon Hunter (2):
      Revert "rtc: tps6586x: Fix initial enable_irq/disable_irq balance"
      Revert "rtc: cpcap: Fix initial enable_irq/disable_irq balance"

Yuta Hayama (1):
      rtc: rx8025: fix incorrect register reference

 drivers/rtc/rtc-cpcap.c    | 1 -
 drivers/rtc/rtc-rx8025.c   | 2 +-
 drivers/rtc/rtc-tps6586x.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

