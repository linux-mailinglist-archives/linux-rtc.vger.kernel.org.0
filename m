Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06F140BB5D
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Sep 2021 00:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhINWXf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Sep 2021 18:23:35 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54931 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235455AbhINWXe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Sep 2021 18:23:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 89D4F200002;
        Tue, 14 Sep 2021 22:22:15 +0000 (UTC)
Date:   Wed, 15 Sep 2021 00:22:15 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC fixes for 5.15
Message-ID: <YUEgl3kjnTSJhbCD@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

This fix sat on my fixes branch and in linux-next for a while and is
probably the proper thing to do.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.15-fixes

for you to fetch changes up to 13be2efc390acd2a46a69a359f6efc00ca434599:

  rtc: cmos: Disable irq around direct invocation of cmos_interrupt() (2021-09-14 10:20:19 +0200)

----------------------------------------------------------------
RTC fixes for 5.15

Drivers:
 - cmos: fix a locking issue

----------------------------------------------------------------
Chris Wilson (1):
      rtc: cmos: Disable irq around direct invocation of cmos_interrupt()

 drivers/rtc/rtc-cmos.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
