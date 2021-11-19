Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BFB4577DC
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 21:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbhKSUq0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 15:46:26 -0500
Received: from mx-out.tlen.pl ([193.222.135.142]:7726 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235628AbhKSUqP (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:46:15 -0500
Received: (wp-smtpd smtp.tlen.pl 28176 invoked from network); 19 Nov 2021 21:43:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637354586; bh=UpOdkkmedu+MT1j0qOKM0vMS+Pldrns6CkXNStQ3Jvo=;
          h=From:To:Cc:Subject;
          b=uO+H/lPnRuM9MfrYBTetya+am+eRDKc5b8ABvQDykUDfCgL5JAke0D6OJwtT0iJw6
           LmFtWgiD1soDQhJ+Qpa7cPBtkpktv8oDTBC3WsNbgqa5HHHg6Mv5daWukcDYWU3b9g
           rkX2jFQM0cgm3b+4vmn2R1IRl1Gfs9d2i7w/wo2E=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 19 Nov 2021 21:43:05 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 0/7] rtc-cmos,rtc-mc146818-lib: fixes
Date:   Fri, 19 Nov 2021 21:42:14 +0100
Message-Id: <20211119204221.66918-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: ba6981fa0d95eb383f96a6b9969a0623
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [sRNk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This patch series fixes some issues in the RTC CMOS handling code:

1. A missing spin_lock_irq() / spin_unlock_irq() pair in cmos_set_alarm().
2. A failing presence check of the RTC: the clock was misdetected as
   broken since Linux 5.11 on one of our home systems.
3. Do not touch the RTC alarm registers when the RTC update is in
   progress. (On some Intel chipsets, this causes bogus values being
   read or writes to fail silently.)

This is my first patch series, so please review carefully.

v2: Drop the last patch:
        Revert "rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ"
which was made obsolete by mainlining of 
commit 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")

v3: Rework solution to problem 3 (I'd like to thank Greg KH for comment),
drop x86 refactoring patches (I'll send them later).

Greetings,
Mateusz

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
