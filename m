Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3015F407D4C
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Sep 2021 14:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbhILMnv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Sep 2021 08:43:51 -0400
Received: from mx-out.tlen.pl ([193.222.135.148]:5660 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235166AbhILMnv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 12 Sep 2021 08:43:51 -0400
Received: (wp-smtpd smtp.tlen.pl 10553 invoked from network); 12 Sep 2021 14:42:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1631450552; bh=TGU1vyGHSz5KGRlzz7YiYbVHIRcNC3phkI3/eiW1bew=;
          h=From:To:Cc:Subject;
          b=IU7u9oqZRTrK+D6j8oQv17EtPT539BGwfUTPCLbUcos77Cx8DtqjC+i01Fpse3Dxr
           kgaMm+VfKLkPBMxVeEFNAkNSp6Jgso57MyT1VIDFopLgM8FwYygGdW5z4MiL/KFVci
           5srqpRAeP44QZsCB0pEcKCzRCVy62zItfGCjdBhY=
Received: from aafh223.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.137.223])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 12 Sep 2021 14:42:31 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: rtc,x86: CMOS RTC fixes
Date:   Sun, 12 Sep 2021 14:42:07 +0200
Message-Id: <20210912124214.81853-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 38a79067d5c3a9a47b67eb1fce459178
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [kYPk]                               
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

Next three patches contain fixes for arch/x86/rtc.c: duplicate code removal
and a renaming of a function.

The final patch reverts a buggy commit - to prevent a possible deadlock at
resume from suspend.

I'm also considering whether function x86_wallclock_init() in
arch/x86/kernel/x86_init.c should call mc146818_does_rtc_work() to make sure
that the CMOS RTC is present and behaves itself. This might be useful.

Tested on top of v5.14.2, on two systems.

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
