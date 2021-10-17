Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC38430BC8
	for <lists+linux-rtc@lfdr.de>; Sun, 17 Oct 2021 21:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344498AbhJQTlr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 17 Oct 2021 15:41:47 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:39025 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230105AbhJQTlq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 17 Oct 2021 15:41:46 -0400
Received: (wp-smtpd smtp.tlen.pl 29485 invoked from network); 17 Oct 2021 21:39:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1634499575; bh=z9PklF1RvUY48l55YjivLfsHyzdKfcVQbelAs+9qcnI=;
          h=From:To:Cc:Subject;
          b=lKiGfMr9h9v2eYeF6b+d7c2cWTq9OLuE+FKqjXfZPJxoVVBAEXf02QjXPRkjtkVX3
           qnJl4F3/7ptWuBT4FAMwmgf//TFXSKsDKiQlil/n//pfe4BatMqaPm5dS7k6KifMxI
           ySpoq9vGObQuvDBqns/21ksmPXv1JJt6yHXKZb5w=
Received: from aaet142.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.123.142])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 17 Oct 2021 21:39:35 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RESEND v2 0/6] rtc,x86: CMOS RTC fixes
Date:   Sun, 17 Oct 2021 21:39:21 +0200
Message-Id: <20211017193927.277409-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: f0e1749d68850869e05a329d3c967e4c
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000003 [kUAk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This patch series fixes some issues in the RTC CMOS handling code.

First three patches fix bugs in drivers/rtc:
1. Fix rtc_lock usage in cmos_set_alarm() in rtc-cmos.c.
2. Do not touch RTC alarm registers when the RTC update is in progress. 
   (On some Intel chipsets, this causes bogus values being read or writes to
   fail silently.)
3. Fix presence check of the RTC CMOS: the clock was misdetected as broken on
   one of my systems.

Patches 1 and 2 are Cced stable. I'm going to  submit patch 3 manually
to stable after some regression testing in master.

Last three patches contain fixes for arch/x86/rtc.c: duplicate code removal
and a renaming of a function. I'd prefer that they be merged together
with patch nr 3.

I'm also considering whether function x86_wallclock_init() in
arch/x86/kernel/x86_init.c should call mc146818_does_rtc_work() to make sure
that the CMOS RTC is present and behaves itself. This might be useful.

Patch nr 7: 
        Revert "rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ"
was made obsolete by mainlining of 
commit 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")

so I've dropped it from this series.

This is my first patch series, so please review carefully.

Greetings,
Mateusz

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
