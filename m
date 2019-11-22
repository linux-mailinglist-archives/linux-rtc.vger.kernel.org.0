Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272621069D6
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKVKW3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:22:29 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37435 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfKVKW3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:22:29 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 546921BF214;
        Fri, 22 Nov 2019 10:22:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/8] rtc: fix W=1 warnings and errors
Date:   Fri, 22 Nov 2019 11:22:04 +0100
Message-Id: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This series fixes kerneldoc and unused variables issues detected when
using W=1.

Alexandre Belloni (8):
  rtc: sysfs: fix hctosys_show kerneldoc
  rtc: ds1374: remove unused variable
  rtc: ds1685: remove set but unused variables
  rtc: ds1685: fix build error with make W=1
  rtc: m41t80: remove excess kerneldoc
  rtc: pm8xxx: update kerneldoc for struct pm8xxx_rtc
  rtc: tegra: remove set but unused variable
  rtc: v3020: remove set but unused variable

 drivers/rtc/rtc-ds1374.c |  3 +--
 drivers/rtc/rtc-ds1685.c | 12 +++++-------
 drivers/rtc/rtc-m41t80.c |  1 -
 drivers/rtc/rtc-pm8xxx.c |  2 +-
 drivers/rtc/rtc-tegra.c  |  4 ++--
 drivers/rtc/rtc-v3020.c  |  3 +--
 drivers/rtc/sysfs.c      |  5 ++++-
 7 files changed, 14 insertions(+), 16 deletions(-)

-- 
2.23.0

