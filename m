Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E69F440BEA
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Oct 2021 23:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhJ3Vtd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 17:49:33 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:16602 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231531AbhJ3Vtc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 17:49:32 -0400
Received: (wp-smtpd smtp.tlen.pl 9507 invoked from network); 30 Oct 2021 23:46:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1635630417; bh=UpOdkkmedu+MT1j0qOKM0vMS+Pldrns6CkXNStQ3Jvo=;
          h=From:To:Cc:Subject;
          b=yQXxf5LBWVPU8mZVhPOegk6fDQ/G7I7MT9VUsz1b3QRIqqR7pQOIGU+CZ8RafjqZG
           Us8PxzaZkAR9wo9O+S4XBj5hyITbm6RO6CqyNzkymUJy+9lfDCi5IO8OYDYJJEGTnS
           e1eHNEQm468AhuawENmZgb94LRf1eDhN4tjnqjrY=
Received: from ablz112.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.7.219.112])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 30 Oct 2021 23:46:57 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/7] rtc-cmos,rtc-mc146818-lib: fixes
Date:   Sat, 30 Oct 2021 23:46:28 +0200
Message-Id: <20211030214636.49602-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: ff46f2686c595fe53ef6cf992f297bac
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [gXME]                               
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
